// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sessions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetSessionsParams _$GetSessionsParamsFromJson(Map<String, dynamic> json) =>
    _GetSessionsParams(
      beforeId: (json['beforeId'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$GetSessionsParamsToJson(_GetSessionsParams instance) =>
    <String, dynamic>{'beforeId': instance.beforeId, 'title': instance.title};
