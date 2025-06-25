import 'package:flutter/material.dart';
import 'package:learning_chatbot/app.dart';
import 'package:learning_chatbot/services/dependencies/di.dart';
import 'package:learning_chatbot/services/pref_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  PrefService.init();
  runApp(const App());
}
