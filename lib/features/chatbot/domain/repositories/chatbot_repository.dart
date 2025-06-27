import 'package:either_dart/either.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/data/models/chat.dart';
import 'package:learning_chatbot/features/chatbot/data/models/group_chat.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';

abstract class ChatbotRepository {
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> 
    createChatOrWithGroupChat();
  Future<Either<Failure, Parsed<List<ChatModel>>>> 
    getChats(GetMessagesParams params);
  Future<Either<Failure, Parsed<List<GroupChatModel>>>> 
    getGroupChats(GetSessionsParams params);
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> 
    deleteGroupChatById();
  Future<Either<Failure, Parsed<Map<String, dynamic>>>> 
    updateGroupChatById();
}
