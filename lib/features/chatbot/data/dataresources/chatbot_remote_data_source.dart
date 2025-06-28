part of '_dataresources.dart';

abstract class ChatbotRemoteDataSource {
  Future<Parsed<Map<String, dynamic>>> completions(CompletionsParams params);
  Future<Parsed<Map<String, dynamic>>> getMessages(GetMessagesParams params);
  Future<Parsed<Map<String, dynamic>>> getSessions(GetSessionsParams params);
  Future<Parsed<Map<String, dynamic>>> deleteSessionsById(DeleteSessionParams params);
  Future<Parsed<Map<String, dynamic>>> renameSessionsById(RenameSessionParams params);
}
