import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_chatbot/services/file_path_converter.dart';

part 'completions_params.freezed.dart';
part 'completions_params.g.dart';

@freezed
abstract class CompletionsParams with _$CompletionsParams {
  const factory CompletionsParams({
    int? sessionId,
    required String content,
    @FilePathConverter() File? imageData,
  }) = _CompletionsParams;

  factory CompletionsParams.fromJson(Map<String, dynamic> json) =>
      _$CompletionsParamsFromJson(json);
}