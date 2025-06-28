import 'package:flutter/material.dart';
import 'package:learning_chatbot/features/auth/login/presentation/page/login_page.dart';
import 'package:learning_chatbot/features/chatbot/presentation/pages/_pages.dart';
import 'package:learning_chatbot/services/auth_service.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late final Future<bool> _ready;

  @override
  void initState() {
    super.initState();
    _ready = AuthService.checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _ready,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return snap.data! 
            ? const ChatBotPage() 
            : const LoginPage();
      },
    );
  }
}