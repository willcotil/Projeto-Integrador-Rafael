import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'feed_page.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

Future<void> login() async {

  bool sucesso = await ApiService.login(
    emailController.text,
    senhaController.text,
  );

  if (!mounted) return;

  if (sucesso) {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const FeedPage(),
      ),
    );

  } else {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login inválido")),
    );

  }

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Login"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Senha",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: const Text("Entrar"),
            ),

            const SizedBox(height: 10),

            TextButton(

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );

              },

              child: const Text("Criar conta"),
            ),

          ],
        ),
      ),
    );
  }
}