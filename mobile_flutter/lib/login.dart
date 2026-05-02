import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String errorMessage = "";

  final String localIP = "192.168.0.1";

  String get baseUrl {
    if (kIsWeb) return "http://localhost:8080";
    if (Platform.isAndroid) return "http://10.0.2.2:8080";
    return "http://$localIP:8080";
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
      errorMessage = "";
    });

    try {
      final response = await http.post(
        Uri.parse("$baseUrl/usuarios/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text.trim(),
          "senha": passwordController.text.trim(),
        }),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final email = data['email'];

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Bem-vindo, $email")),
        );
      } else {
        setState(() {
          errorMessage = "Email ou senha inválidos";
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = "Erro ao conectar com o servidor";
      });
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.blueGrey.shade700;
    final backgroundColor = Colors.grey.shade100;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Bem-vindo",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),

                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),

                const SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: isLoading ? null : login,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Entrar",
                            style: TextStyle(fontSize: 16),
                          ),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "API: $baseUrl",
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}