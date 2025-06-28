import 'package:freezed_annotation/freezed_annotation.dart';

part 'rename_session_params.freezed.dart';
part 'rename_session_params.g.dart';

@freezed
abstract class RenameSessionParams with _$RenameSessionParams {
  const factory RenameSessionParams({
  required int sessionId,
  required String newTitle,
  }) = _RenameSessionParams;

  factory RenameSessionParams.fromJson(Map<String, dynamic> json) =>
      _$RenameSessionParamsFromJson(json);
}