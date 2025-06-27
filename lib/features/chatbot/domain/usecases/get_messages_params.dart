import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_messages_params.freezed.dart';
part 'get_messages_params.g.dart';

@freezed
abstract class GetMessagesParams with _$GetMessagesParams {
  const factory GetMessagesParams({
    int? beforeId,
    required int sessionId,
  }) = _GetMessagesParams;

  factory GetMessagesParams.fromJson(Map<String, dynamic> json) =>
      _$GetMessagesParamsFromJson(json);
}