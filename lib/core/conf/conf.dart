import 'package:envied/envied.dart';

part 'conf.g.dart';

@Envied(name: 'Conf', path: '.env')
abstract class Conf {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Conf.baseUrl;

  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _Conf.apiKey;
}
