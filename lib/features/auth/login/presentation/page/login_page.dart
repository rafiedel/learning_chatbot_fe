// lib/features/login/presentation/pages/login_page.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_chatbot/auth_gate.dart';
import 'package:learning_chatbot/core/client/_client.dart';
import 'package:learning_chatbot/services/pref_service.dart';

final get = GetIt.I;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userC = TextEditingController();
  final _passC = TextEditingController();
  bool _loading = false;

  Future<void> _login() async {
    setState(() => _loading = true);

    final resp = await apiCall<Response<Map<String, dynamic>>>(
      postIt<Map<String, dynamic>>(
        'http://10.0.2.2:8000/auth/login/',
        headers: {'Content-Type': 'application/json'},
        model: {
          'username': _userC.text.trim(),
          'password': _passC.text,
        },
      )
    );

    setState(() => _loading = false);

    resp.fold(
      (failure) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.message ?? 'Login failed')),
      ),
      (response) async {
        final data = response.data;
        if (data == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Empty response')),
          );
          return;
        }
        await PrefService.saveAuthTokens(
          access:  data['access']  as String,
          refresh: data['refresh'] as String,
        );
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const AuthGate()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userC,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passC,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _loading ? null : _login,
              child: _loading
                  ? const CircularProgressIndicator()
                  : const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userC.dispose();
    _passC.dispose();
    super.dispose();
  }
}
