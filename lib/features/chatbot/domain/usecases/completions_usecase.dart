import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/core/bases/use_case/use_case.dart';
import 'package:learning_chatbot/core/errors/failure.dart';
import 'package:learning_chatbot/core/extenstions/_extensions.dart';

import 'package:learning_chatbot/features/chatbot/domain/repositories/chatbot_repository.dart';
import 'package:learning_chatbot/features/chatbot/domain/usecases/completions_params.dart';

@injectable
class CompletionsUsecase implements UseCase<Parsed<Map<String,dynamic>>, CompletionsParams> {
  final ChatbotRepository _repository;
  CompletionsUsecase(this._repository);
  @override
  Future<Either<Failure, Parsed<Map<String,dynamic>>?>> execute([
    CompletionsParams? args,
  ]) {
    if (args == null) throw Exception('Arguments required');
    return _repository.completions(args);
  }
}
