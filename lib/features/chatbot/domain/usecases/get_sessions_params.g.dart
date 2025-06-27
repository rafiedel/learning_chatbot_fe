// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sessions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetSessionsParams _$GetSessionsParamsFromJson(Map<String, dynamic> json) =>
    _GetSessionsParams(
      page: (json['page'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$GetSessionsParamsToJson(_GetSessionsParams instance) =>
    <String, dynamic>{'page': instance.page, 'title': instance.title};
