part of '_environments.dart';

class EndPoints {
  static const String baseUrl = Conf.baseUrl;

  static const String login = '$baseUrl/auth/login/';
  static const String register = '$baseUrl/auth/register/';
  static const String refresh = '$baseUrl/auth/refresh/';
  static const String completions = '$baseUrl/chatbot/completions/';
  static const String messages = '$baseUrl/chatbot/messages/';
  static const String sessions = '$baseUrl/chatbot/sessions/';
}

