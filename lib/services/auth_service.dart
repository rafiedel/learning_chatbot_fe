// lib/app/auth_gate.dart
import 'dart:convert';                           // base64 + json
import 'package:dio/dio.dart';
import 'package:learning_chatbot/core/environments/_environments.dart';
import 'package:learning_chatbot/services/logger_service.dart';

import '../services/pref_service.dart';


class AuthService {
  AuthService._();

  static Future<bool> checkAuth() async {
    await PrefService.init();

    final access  = PrefService.accessToken;
    final refresh = PrefService.refreshToken;

    if (access == null) return false; 

    if (isTokenExpired(access) && refresh != null) {
      try {
        final dio = Dio();
        final r = await dio.post(
          EndPoints.refresh,
          data: {'refresh': refresh},
          options: Options(headers: {'Content-Type': 'application/json'}),
        );

        await PrefService.saveAuthTokens(
          access:  r.data['access'],
          refresh: r.data['refresh'] ?? refresh,
        );
        LoggerService.i('Refreshed token: ${PrefService.accessToken}');
        return true;
      } catch (_) {
        return false;
      }
    }

    return !isTokenExpired(access);
  }

  static bool isTokenExpired(String token) {
    final parts = token.split('.');
    if (parts.length != 3) return true;

    try {
      final payload = utf8.decode(
        base64Url.decode(base64Url.normalize(parts[1])),
      );
      final data = jsonDecode(payload) as Map<String, dynamic>;
      final exp = data['exp'];
      if (exp is int) {
        final expiryUTC =
            DateTime.fromMillisecondsSinceEpoch(exp * 1000, isUtc: true);
        return expiryUTC.isBefore(DateTime.now().toUtc());
      }
    } catch (_) {
      // treat any error as expired
    }
    return true;
  }
}