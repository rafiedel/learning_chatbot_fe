// lib/app/auth_gate.dart
import 'dart:convert';                           // base64 + json
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_chatbot/core/environments/_environments.dart';
import 'package:learning_chatbot/features/auth/login/presentation/page/login_page.dart';
import 'package:learning_chatbot/features/chatbot/presentation/pages/_pages.dart';
import 'package:learning_chatbot/services/logger_service.dart';

import '../services/pref_service.dart';
import 'services/dependencies/di.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late Future<bool> _ready;

  @override
  void initState() {
    super.initState();
    _ready = _bootstrap();
  }

  Future<bool> _bootstrap() async {
    // 1. Ensure SharedPreferences is ready
    await PrefService.init();

    final access  = PrefService.accessToken;
    final refresh = PrefService.refreshToken;

    if (access == null) return false; // never logged in

    final expired = _isTokenExpired(access);

    // 2. If access expired, attempt one silent refresh
    if (expired && refresh != null) {
      try {
        final dio = get<Dio>();
        final r = await dio.post(
          EndPoints.refresh,
          data: {'refresh': refresh},
          options: Options(headers: {'Content-Type': 'application/json'}),
        );
        await PrefService.saveAuthTokens(
          access:  r.data['access'],
          refresh: r.data['refresh'] ?? refresh,
        );
        LoggerService.i(PrefService.accessToken);
        return true; // refreshed successfully
      } catch (_) {
        return false; // refresh failed → force login
      }
    }

    // 3. Token still valid
    return !expired;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _ready,
      builder: (context, snap) {
        if (!snap.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return snap.data! ? const ChatBotPage() : const LoginPage();
      },
    );
  }
}

/// Decodes a JWT and returns `true` if it is **expired**.
bool _isTokenExpired(String token) {
  final parts = token.split('.');
  if (parts.length != 3) return true; // not a JWT
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
    // malformed or decode error
  }
  return true; // treat as expired on any failure
}