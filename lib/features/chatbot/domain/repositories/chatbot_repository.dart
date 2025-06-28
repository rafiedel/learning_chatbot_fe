import 'package:either_dart/either.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/completions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/delete_session_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/rename_session_params.dart';

abstract class ChatbotRepository {
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> 
    completions(CompletionsParams params);
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> 
    getChats(GetMessagesParams params);
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> 
    getGroupChats(GetSessionsParams params);
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> 
    deleteGroupChatById(DeleteSessionParams params);
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> 
    renameGroupChatById(RenameSessionParams params);
}
