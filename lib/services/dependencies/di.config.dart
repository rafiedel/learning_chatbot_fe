// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/chatbot/data/dataresources/_dataresources.dart' as _i96;
import '../../features/chatbot/data/repositories/chatbot_repository_impl.dart'
    as _i741;
import '../../features/chatbot/domain/repositories/chatbot_repository.dart'
    as _i719;
import '../../features/chatbot/domain/usecases/get_messages_usecase.dart'
    as _i342;
import '../../features/chatbot/domain/usecases/get_sessions_usecase.dart'
    as _i314;
import '../../features/chatbot/presentation/cubit/_cubit.dart' as _i384;
import '../token_interceptor.dart' as _i373;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i373.TokenInterceptor>(() => _i373.TokenInterceptor());
    gh.factory<_i96.ChatbotRemoteDataSource>(
      () => _i96.ChatbotRemoteDataSourceImpl(),
    );
    gh.factory<_i719.ChatbotRepository>(
      () => _i741.ChatbotRepositoryImpl(gh<_i96.ChatbotRemoteDataSource>()),
    );
    gh.factory<_i314.GetSessionsUsecase>(
      () => _i314.GetSessionsUsecase(gh<_i719.ChatbotRepository>()),
    );
    gh.factory<_i342.GetMessagesUsecase>(
      () => _i342.GetMessagesUsecase(gh<_i719.ChatbotRepository>()),
    );
    gh.factory<_i384.ChatbotCubit>(
      () => _i384.ChatbotCubit(
        gh<_i314.GetSessionsUsecase>(),
        gh<_i342.GetMessagesUsecase>(),
      ),
    );
    return this;
  }
}
