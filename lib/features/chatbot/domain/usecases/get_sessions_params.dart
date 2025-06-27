import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_sessions_params.freezed.dart';
part 'get_sessions_params.g.dart';

@freezed
abstract class GetSessionsParams with _$GetSessionsParams {
  const factory GetSessionsParams({
    int? page,
    String? title,
  }) = _GetSessionsParams;

  factory GetSessionsParams.fromJson(Map<String, dynamic> json) =>
      _$GetSessionsParamsFromJson(json);
}