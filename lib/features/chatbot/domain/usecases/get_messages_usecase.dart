import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/bases/use_case/use_case.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/data/models/chat.dart';
import 'package:learning_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_messages_params.dart';

@injectable
class GetMessagesUsecase implements UseCase<Parsed<List<ChatModel>>, GetMessagesParams> {
  final ChatbotRepository _repository;
  GetMessagesUsecase(this._repository);
  @override
  Future<Either<Failure, Parsed<List<ChatModel>>?>> execute([
    GetMessagesParams? args,
  ]) {
    if (args == null) throw Exception('Arguments required');
    return _repository.getChats(args);
  }
}
