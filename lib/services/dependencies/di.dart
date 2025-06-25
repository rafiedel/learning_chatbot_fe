import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:learning_chatbot/services/token_interceptor.dart';
import 'di.config.dart';

final GetIt get = GetIt.I;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  get.init();
  get.registerSingleton<TokenInterceptor>(TokenInterceptor());

  get.registerSingleton<Dio>(
    Dio()..interceptors.add(get<TokenInterceptor>()),
  );
}
