part of '_dataresources.dart';

@Injectable(as: ChatbotRemoteDataSource)
class ChatbotRemoteDataSourceImpl 
  implements ChatbotRemoteDataSource {

  @override
  Future<Parsed<Map<String, dynamic>>> completions(
    CompletionsParams params,
  ) async {
    final url = EndPoints.completions;

    // Build FormData for multipart request
    final formData = FormData.fromMap({
      if (params.sessionId != null) 'session_id': params.sessionId,
      'content': params.content,
      if (params.imageData != null)
        'image_data': await MultipartFile.fromFile(
          params.imageData!.path,
          filename: params.imageData!.path.split('/').last,
        ),
    });

    // Post the form data
    final resp = await postMultipart<Map<String, dynamic>>(
      url,
      formData: formData,
    );

    // Parse the response
    return resp.parse(resp.data!);
  }

  
  @override
  Future<Parsed<Map<String, dynamic>>> deleteSessionsById(
    DeleteSessionParams params
  ) async {
    final url = EndPoints.sessions;

    final resp = await deleteIt<Map<String,dynamic>>(
      '$url${params.sessionId}/',
    );
    return resp.parse(resp.data!);

    // final status = resp.statusCode;
    // if (status == 200) {
    //   isDeleted = true;
    // }

    // return resp.parse(isDeleted);
  }
  
  @override
  Future<Parsed<Map<String, dynamic>>> getMessages(
    GetMessagesParams params) async {

    final url = EndPoints.messages;

    final resp = await getIt<Map<String,dynamic>>(
      url,
      queryParameters: {
        "session_id" : params.sessionId,
        "before_id" : params.beforeId
      }
    );
    return resp.parse(resp.data!);
    // final data = resp.data;
    // if (data != null) {
    //   for (var json in data['results']) {
    //     chats.add(ChatModel.fromJson(json));
    //   }
    // }
    // return resp.parse(chats);
  }
  
  @override
  Future<Parsed<Map<String, dynamic>>> getSessions(
    GetSessionsParams params) async {

    final url = EndPoints.sessions;

    final resp = await getIt<Map<String,dynamic>>(
      url,
      queryParameters: {
        "title" : params.title,
        "before_id" : params.beforeId
      }
    );

    return resp.parse(resp.data!);

    // final data = resp.data;
    // if (data != null) {
    //   for (var json in data['results']) {
    //     groupChats.add(GroupChatModel.fromJson(json));
    //   }
    // }
    // return resp.parse(groupChats);
  }
  
  @override
  Future<Parsed<Map<String, dynamic>>> renameSessionsById(
    RenameSessionParams params
  ) async {
    final url = EndPoints.sessions;

    final resp = await patchIt<Map<String,dynamic>>(
      '$url${params.sessionId}/title/',
      model: {
        "title" : params.newTitle
      }
    );
    return resp.parse(resp.data!);

    // final status = resp.statusCode;
    // if (status == 200) {
    //   isRenamed = true;
    // }
    
    // return resp.parse(isRenamed);
  }

  
}
