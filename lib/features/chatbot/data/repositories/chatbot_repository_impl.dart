
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/client/_client.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/data/dataresources/_dataresources.dart';
import 'package:learning_chatbot/features/chatbot/data/models/chat.dart';
import 'package:learning_chatbot/features/chatbot/data/models/group_chat.dart';
import 'package:learning_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';

@Injectable(as: ChatbotRepository)
class ChatbotRepositoryImpl implements ChatbotRepository {
  final ChatbotRemoteDataSource _remoteDataSource;
  ChatbotRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> createChatOrWithGroupChat() {
    return apiCall(_remoteDataSource.completions(),);}
  @override
  Future<Either<Failure, Parsed<List<ChatModel>>>> getChats(
    GetMessagesParams params
  ) {
    return apiCall(_remoteDataSource.getMessages(params),);}
  @override
  Future<Either<Failure, Parsed<List<GroupChatModel>>>> getGroupChats(
    GetSessionsParams params
  ) {
    return apiCall(_remoteDataSource.getSessions(params));}
  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> deleteGroupChatById() {
    return apiCall(_remoteDataSource.deleteSessionsById(),);}
  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> updateGroupChatById() {
    return apiCall(_remoteDataSource.updateSessionsById(),);}
}
