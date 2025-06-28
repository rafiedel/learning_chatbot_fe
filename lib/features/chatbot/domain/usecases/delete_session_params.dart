import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_session_params.freezed.dart';
part 'delete_session_params.g.dart';

@freezed
abstract class DeleteSessionParams with _$DeleteSessionParams {
  const factory DeleteSessionParams({
  required int sessionId,
  }) = _DeleteSessionParams;

  factory DeleteSessionParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteSessionParamsFromJson(json);
}