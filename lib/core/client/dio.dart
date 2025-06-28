part of '_client.dart';

final _options = Options(
  receiveTimeout: const Duration(seconds: 5000),
  sendTimeout: const Duration(seconds: 6000),
);

Response<T> _errorResponse<T>(RequestOptions options, String message, {int statusCode = 400}) {
  return Response<T>(
    requestOptions: options,
    statusCode: statusCode,
    data: message as T,
  );
}

Future<Response<T>> getIt<T>(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? queryParameters,
}) async {
  final Dio dio = get<Dio>();
  
  final getHeaders = headers ?? PrefService.getHeaders();
  if (kDebugMode) {
    LoggerService.i({
      'url': url,
      'headers': getHeaders,
      'query_parameters' : queryParameters
    });
  }

  try {
    final resp = await dio.get<T>(
      url,
      options: _options.copyWith(headers: getHeaders),
      queryParameters: queryParameters,
    );
    if (kDebugMode) {
      LoggerService.i({
        'response': resp.data,
        'statusCode': resp.statusCode,
      });
    }
    return resp;
  } on DioException catch (e) {
    // Handle 401 by attempting refresh-and-retry
    if (e.response?.statusCode == 401) {
      final refreshed = await AuthService.checkAuth();
      if (refreshed) {
        return getIt<T>(
          url,
          headers: headers,
          queryParameters: queryParameters,
        );
      }
      nav.navigateReplacementToHome();
    }
    return _errorResponse<T>(e.requestOptions, e.message ?? "", statusCode: e.response?.statusCode ?? 400);
  }
}

Future<Response<T>> postIt<T>(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Map<String, dynamic>? queryParameters,
}) async {
  final Dio dio = get<Dio>();
  final getHeaders = headers ?? PrefService.getHeaders();
  if (kDebugMode) {
    LoggerService.i({
      'url': url,
      'headers': getHeaders,
      'model': '$model',
    });
  }
  try {
    final resp = await dio.post<T>(
      url,
      data: json.encode(model),
      options: _options.copyWith(headers: getHeaders),
      queryParameters: queryParameters,
    );
    if (kDebugMode) {
      LoggerService.i({
        'response': resp.data,
        'statusCode': resp.statusCode,
      });
    }
    return resp;
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      final refreshed = await AuthService.checkAuth();
      if (refreshed) {
        return postIt<T>(
          url,
          headers: headers,
          model: model,
          queryParameters: queryParameters,
        );
      }
      nav.navigateReplacementToHome();
    }
    return _errorResponse<T>(e.requestOptions, e.message ?? "", statusCode: e.response?.statusCode ?? 400);
  }
}

Future<Response<T>> putIt<T>(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Map<String, dynamic>? queryParameters,
}) async {
  final Dio dio = get<Dio>();
  final getHeaders = headers ?? PrefService.getHeaders();
  if (kDebugMode) {
    LoggerService.i({
      'url': url,
      'headers': getHeaders,
      'model': '$model',
    });
  }
  try {
    final resp = await dio.put<T>(
      url,
      data: json.encode(model),
      options: _options.copyWith(headers: getHeaders),
      queryParameters: queryParameters,
    );
    if (kDebugMode) {
      LoggerService.i({
        'response': resp.data,
        'statusCode': resp.statusCode,
      });
    }
    return resp;
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      final refreshed = await AuthService.checkAuth();
      if (refreshed) {
        return putIt<T>(
          url,
          headers: headers,
          model: model,
          queryParameters: queryParameters,
        );
      }
      nav.navigateReplacementToHome();
    }
    return _errorResponse<T>(e.requestOptions, e.message ?? "", statusCode: e.response?.statusCode ?? 400);
  }
}

Future<Response<T>> deleteIt<T>(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? queryParameters,
}) async {
  final Dio dio = get<Dio>();
  final getHeaders = headers ?? PrefService.getHeaders();
  if (kDebugMode) {
    LoggerService.i({
      'url': url,
      'headers': getHeaders,
    });
  }
  try {
    final resp = await dio.delete<T>(
      url,
      options: _options.copyWith(headers: getHeaders),
      queryParameters: queryParameters,
    );
    if (kDebugMode) {
      LoggerService.i({
        'response': resp.data,
        'statusCode': resp.statusCode,
      });
    }
    return resp;
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      final refreshed = await AuthService.checkAuth();
      if (refreshed) {
        return deleteIt<T>(
          url,
          headers: headers,
          queryParameters: queryParameters,
        );
      }
      nav.navigateReplacementToHome();
    }
    return _errorResponse<T>(e.requestOptions, e.message ?? "", statusCode: e.response?.statusCode ?? 400);
  }
}

Future<Response<T>> patchIt<T>(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Map<String, dynamic>? queryParameters,
}) async {
  final Dio dio = get<Dio>();
  final getHeaders = headers ?? PrefService.getHeaders();
  if (kDebugMode) {
    LoggerService.i({
      'url': url,
      'headers': getHeaders,
      'model': '$model',
    });
  }
  try {
    final resp = await dio.patch<T>(
      url,
      data: json.encode(model),
      options: _options.copyWith(headers: getHeaders),
      queryParameters: queryParameters,
    );
    if (kDebugMode) {
      LoggerService.i({
        'response': resp.data,
        'statusCode': resp.statusCode,
      });
    }
    return resp;
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      final refreshed = await AuthService.checkAuth();
      if (refreshed) {
        return patchIt<T>(
          url,
          headers: headers,
          model: model,
          queryParameters: queryParameters,
        );
      }
      nav.navigateReplacementToHome();
    }
    return _errorResponse<T>(e.requestOptions, e.message ?? "", statusCode: e.response?.statusCode ?? 400);
  }
}

Future<Response<T>> postMultipart<T>(
  String url, {
  Map<String, String>? headers,
  required FormData formData,
  Map<String, dynamic>? queryParameters,
}) async {
  final Dio dio = get<Dio>();
  final getHeaders = headers ?? PrefService.getHeaders();

  // Remove content-type to let Dio set it to multipart automatically
  getHeaders.remove('Content-Type');

  if (kDebugMode) {
    LoggerService.i({
      'url': url,
      'headers': getHeaders,
      'multipart_fields': formData.fields.toString(),
      'multipart_files': formData.files
          .map((f) => f.value.filename)
          .toList(),
    });
  }

  try {
    final resp = await dio.post<T>(
      url,
      data: formData,
      options: _options.copyWith(headers: getHeaders, contentType: null),
      queryParameters: queryParameters,
    );
    if (kDebugMode) {
      LoggerService.i({
        'response': resp.data,
        'statusCode': resp.statusCode,
      });
    }
    return resp;
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      final refreshed = await AuthService.checkAuth();
      if (refreshed) {
        return postMultipart<T>(
          url,
          formData: formData,
        );
      }
      nav.navigateReplacementToHome();
    }
    return _errorResponse<T>(e.requestOptions, e.message ?? "", statusCode: e.response?.statusCode ?? 400);
  }
}
