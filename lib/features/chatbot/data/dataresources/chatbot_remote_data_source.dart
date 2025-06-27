part of '_dataresources.dart';

abstract class ChatbotRemoteDataSource {
  Future<Parsed<Map<String, dynamic>>> completions();
  Future<Parsed<List<ChatModel>>> getMessages(GetMessagesParams params);
  Future<Parsed<List<GroupChatModel>>> getSessions(GetSessionsParams params);
  Future<Parsed<Map<String, dynamic>>> deleteSessionsById();
  Future<Parsed<Map<String, dynamic>>> updateSessionsById();
}
