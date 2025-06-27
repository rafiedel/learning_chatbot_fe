class GroupChatModel {
  final int id;
  final String title;
  final DateTime createdAt;

  GroupChatModel({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  factory GroupChatModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      GroupChatModel(
        id: json['id'] as int,
        title: json['title'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
      );
}