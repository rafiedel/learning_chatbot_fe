// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completions_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompletionsParams _$CompletionsParamsFromJson(Map<String, dynamic> json) =>
    _CompletionsParams(
      sessionId: (json['sessionId'] as num?)?.toInt(),
      content: json['content'] as String,
      imageData: const FilePathConverter().fromJson(
        json['imageData'] as String?,
      ),
    );

Map<String, dynamic> _$CompletionsParamsToJson(_CompletionsParams instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'content': instance.content,
      'imageData': const FilePathConverter().toJson(instance.imageData),
    };
