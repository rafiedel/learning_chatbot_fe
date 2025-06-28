import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

class FilePathConverter implements JsonConverter<File?, String?> {
  const FilePathConverter();

  @override
  File? fromJson(String? json) {
    if (json == null) return null;
    return File(json);
  }

  @override
  String? toJson(File? file) {
    return file?.path;
  }
}
