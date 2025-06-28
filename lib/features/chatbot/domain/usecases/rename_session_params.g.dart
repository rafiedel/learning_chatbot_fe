// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rename_session_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RenameSessionParams _$RenameSessionParamsFromJson(Map<String, dynamic> json) =>
    _RenameSessionParams(
      sessionId: (json['sessionId'] as num).toInt(),
      newTitle: json['newTitle'] as String,
    );

Map<String, dynamic> _$RenameSessionParamsToJson(
  _RenameSessionParams instance,
) => <String, dynamic>{
  'sessionId': instance.sessionId,
  'newTitle': instance.newTitle,
};
