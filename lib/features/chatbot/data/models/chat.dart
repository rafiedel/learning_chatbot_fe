import 'dart:io';

class ChatModel {
  final int id;
  final String role;
  final String content;
  final DateTime timestamp;
  final String imageUrl;
  final File? tempIF;

  ChatModel({
    required this.id,
    required this.role,
    required this.content,
    required this.timestamp,
    required this.imageUrl,
    this.tempIF,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json['id'] as int,
        role: json['role'] as String,
        content: json['content'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
        imageUrl: json['image_url'] as String,
      );
}
