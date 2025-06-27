import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/bases/use_case/use_case.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';
import 'package:learning_chatbot/features/chatbot/data/models/group_chat.dart';
import 'package:learning_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/get_sessions_params.dart';

@injectable
class GetSessionsUsecase implements UseCase<Parsed<List<GroupChatModel>>, GetSessionsParams> {
  final ChatbotRepository _repository;
  GetSessionsUsecase(this._repository);
  @override
  Future<Either<Failure, Parsed<List<GroupChatModel>>?>> execute([
    GetSessionsParams? args,
  ]) {
    if (args == null) throw Exception('Arguments required');
    return _repository.getGroupChats(args);
  }
}
