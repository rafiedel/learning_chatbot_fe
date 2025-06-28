import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/bases/use_case/use_case.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';

import 'package:learning_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/rename_session_params.dart';

@injectable
class RenameSessionUsecase implements UseCase<Parsed<Map<String, dynamic>>, RenameSessionParams> {
  final ChatbotRepository _repository;
  RenameSessionUsecase(this._repository);
  @override
  Future<Either<Failure, Parsed<Map<String, dynamic>>?>> execute([
    RenameSessionParams? args,
  ]) {
    if (args == null) throw Exception('Arguments required');
    return _repository.renameGroupChatById(args);
  }
}
