
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/constants/_constants.dart';
import 'package:learning_chatbot/services/dependencies/di.dart';
import 'package:learning_chatbot/services/pref_service.dart';

@singleton
class TokenInterceptor extends Interceptor {
  bool _isRefreshing = false;
  final List<void Function(String)> _queue = [];

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // we only care about 401 or 403 from the API
    final status = err.response?.statusCode ?? 0;
    if ((status == 401 || status == 403) &&
        PrefService.refreshToken != null) {
      final dio = err.requestOptions.baseUrl.isNotEmpty
          ? get<Dio>()                  // use your registered instance
          : Dio();                      // fallback – shouldn't happen

      // ensure a single refresh in flight
      if (!_isRefreshing) {
        _isRefreshing = true;
        try {
          final r = await dio.post(
            '/api/auth/refresh/',
            data: {'refresh': PrefService.refreshToken},
            options: Options(
              headers: {'Content-Type': 'application/json'},
            ),
          );

          final newAccess = r.data['access'] as String;
          final newRefresh = r.data['refresh'] as String? ??
              PrefService.refreshToken!;

          await PrefService.saveAuthTokens(
            access: newAccess,
            refresh: newRefresh,
          );

          // wake up everyone in the queue
          for (final fn in _queue) fn(newAccess);
          _queue.clear();
        } catch (e) {
          // refresh failed → force logout
          await PrefService.removeKey(PreferencesKeys.authToken);
          await PrefService.removeKey(PreferencesKeys.refreshTokenKey);
          return handler.next(err); // give up
        } finally {
          _isRefreshing = false;
        }
      }

      // queue this request until the refresh above finishes
      return _retryAfterRefresh(err, handler);
    }

    // any other error → pass through
    return handler.next(err);
  }

  Future<void> _retryAfterRefresh(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final completer = Completer<void>();

    _queue.add((String newAccess) async {
      try {
        // clone the failing request
        final opts = Options(
          method: err.requestOptions.method,
          headers: {
            ...err.requestOptions.headers,
            'Authorization': 'Bearer $newAccess',
          },
        );
        final dio = get<Dio>();
        final res = await dio.request<dynamic>(
          err.requestOptions.path,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
          options: opts,
        );
        handler.resolve(res);
      } catch (e) {
        handler.next(err); // still fails
      } finally {
        completer.complete();
      }
    });

    await completer.future;
  }
}