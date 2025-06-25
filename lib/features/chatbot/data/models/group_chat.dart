class GroupChatModel {
  final String title;

  GroupChatModel({
    required this.title
  });

  factory GroupChatModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      GroupChatModel(
        title: json['title'] as String,
      );
}