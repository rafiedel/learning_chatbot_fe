part of '_dataresources.dart';

@Injectable(as: ChatbotRemoteDataSource)
class ChatbotRemoteDataSourceImpl 
  implements ChatbotRemoteDataSource {

  @override
  Future<Parsed<Map<String, dynamic>>> completions() {
    // TODO: implement completions
    throw UnimplementedError();
  }
  
  @override
  Future<Parsed<Map<String, dynamic>>> deleteSessionsById() {
    // TODO: implement deleteSessionsById
    throw UnimplementedError();
  }
  
  @override
  Future<Parsed<List<ChatModel>>> getMessages(
    GetMessagesParams params) async {
    List<ChatModel> chats = [];

    final url = EndPoints.getMessages;

    final resp = await getIt<Map<String,dynamic>>(
      url,
      queryParameters: {
        "session_id" : params.sessionId,
        "before_id" : params.beforeId
      }
    );

    final data = resp.data;
    if (data != null) {
      for (var json in data['results']) {
        chats.add(ChatModel.fromJson(json));
      }
    }
    return resp.parse(chats);
  }
  
  @override
  Future<Parsed<List<GroupChatModel>>> getSessions(
    GetSessionsParams params) async {
    List<GroupChatModel> groupChats = [];

    final url = EndPoints.getSessions;

    final resp = await getIt<Map<String,dynamic>>(
      url,
    );

    final data = resp.data;
    if (data != null) {
      for (var json in data['results']) {
        groupChats.add(GroupChatModel.fromJson(json));
      }
    }
    return resp.parse(groupChats);
  }
  
  @override
  Future<Parsed<Map<String, dynamic>>> updateSessionsById() {
    // TODO: implement updateSessionsById
    throw UnimplementedError();
  }

  
}
