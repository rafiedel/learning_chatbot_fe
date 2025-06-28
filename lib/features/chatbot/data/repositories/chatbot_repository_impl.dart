
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/client/_client.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/data/dataresources/_dataresources.dart';
import 'package:learning_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/completions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/delete_session_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/rename_session_params.dart';

@Injectable(as: ChatbotRepository)
class ChatbotRepositoryImpl implements ChatbotRepository {
  final ChatbotRemoteDataSource _remoteDataSource;
  ChatbotRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> completions(
    CompletionsParams params
  ) {
    return apiCall(_remoteDataSource.completions(params),);}
  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> getChats(
    GetMessagesParams params
  ) {
    return apiCall(_remoteDataSource.getMessages(params),);}
  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> getGroupChats(
    GetSessionsParams params
  ) {
    return apiCall(_remoteDataSource.getSessions(params));}
  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> deleteGroupChatById(
    DeleteSessionParams params
    ) {
    return apiCall(_remoteDataSource.deleteSessionsById(
      params
    ),);}
  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> renameGroupChatById(
    RenameSessionParams params
  ) {
    return apiCall(_remoteDataSource.renameSessionsById(
      params
    ),);}
}
