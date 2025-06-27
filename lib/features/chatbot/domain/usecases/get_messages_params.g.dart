// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_messages_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetMessagesParams _$GetMessagesParamsFromJson(Map<String, dynamic> json) =>
    _GetMessagesParams(
      beforeId: (json['beforeId'] as num?)?.toInt(),
      sessionId: (json['sessionId'] as num).toInt(),
    );

Map<String, dynamic> _$GetMessagesParamsToJson(_GetMessagesParams instance) =>
    <String, dynamic>{
      'beforeId': instance.beforeId,
      'sessionId': instance.sessionId,
    };
