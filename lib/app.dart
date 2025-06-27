import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_chatbot/auth_gate.dart';
import 'package:learning_chatbot/core/themes/_themes.dart';
import 'package:learning_chatbot/services/navigations/_navigations.dart';

final nav = NavigationService();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Learning Chatbot App',
      theme: AppTheme.darkTheme(),
      navigatorKey: nav.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}
