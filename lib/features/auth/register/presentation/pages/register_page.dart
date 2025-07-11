// lib/features/register/presentation/pages/register_page.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_chatbot/app.dart';
import 'package:learning_chatbot/auth_gate.dart';
import 'package:learning_chatbot/core/client/_client.dart';
import 'package:learning_chatbot/core/environments/_environments.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _userC = TextEditingController();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  bool _loading = false;
  bool _obscurePassword = true;

  Future<void> _register() async {
    setState(() => _loading = true);

    final resp = await apiCall<Response<Map<String, dynamic>>>(
      postIt<Map<String, dynamic>>(
        EndPoints.register,
        headers: {
          'Content-Type': 'application/json',
        },
        model: {
          'username': _userC.text.trim(),
          'email': _emailC.text.trim(),
          'password': _passC.text,
        },
      ),
    );

    setState(() => _loading = false);

    resp.fold(
      (failure) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.message ?? 'Registration failed')),
      ),
      (response) async {
        final data = response.data;
        if (data == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Empty response')),
          );
          return;
        }

        // Optionally save tokens if your API returns them
        // await PrefService.saveAuthTokens(...);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful!')),
        );

        // Optionally navigate to login or authenticated area
        if (!mounted) return;
          nav.pushReplacement(AuthGate());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Register to get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _userC,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailC,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passC,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: _loading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            ),
                          )
                        : const Text(
                            'REGISTER',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white
                            ),
                          ),
                          
                  ),
                ),
                TextButton(
                  onPressed: () =>
                    nav.pop(),
                  child: Text(
                    "Don't have an account? Register",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.purple.shade600
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userC.dispose();
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }
}
