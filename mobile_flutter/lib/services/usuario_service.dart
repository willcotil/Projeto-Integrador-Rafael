import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';
import 'api_service.dart';

class UsuarioService {

  Future<List<Usuario>> listarUsuarios() async {

    final response = await http.get(
      Uri.parse("${ApiService.baseUrl}/usuarios"),
    );

    if (response.statusCode == 200) {

      List jsonData = jsonDecode(response.body);

      return jsonData.map((e) => Usuario.fromJson(e)).toList();
    }

    throw Exception("Erro ao buscar usuários");
  }

  Future<Usuario> criarUsuario(Usuario usuario) async {

    final response = await http.post(
      Uri.parse("${ApiService.baseUrl}/usuarios"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {

      return Usuario.fromJson(jsonDecode(response.body));
    }

    throw Exception("Erro ao criar usuário");
  }

  Future<void> atualizarUsuario(Usuario usuario) async {

    await http.put(
      Uri.parse("${ApiService.baseUrl}/usuarios/${usuario.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario.toJson()),
    );
  }

  Future<void> deletarUsuario(int id) async {

    await http.delete(
      Uri.parse("${ApiService.baseUrl}/usuarios/$id"),
    );
  }
}