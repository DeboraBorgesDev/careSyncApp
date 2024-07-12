import 'package:caresync/db/database.dart';
import 'package:caresync/db/models/usuario.dart';
import 'package:caresync/db/persistence/usuario_persistence.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsuarioService {
  static const String _baseUrl = 'http://192.168.0.107:8080/api';
  static User? currentUser;

  static Future<User?> login(BuildContext context, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'senha': password,
        }),
      );

      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));

        final db = await getDatabase();
        await UsuarioPersistence().insertUser(db, user);

        currentUser = user;
        return user;
      } else {
        _showError(context, 'Falha no login: ${response.body}');
        return null;
      }
    } catch (e) {
      // Se a chamada à API falhar, tentar autenticação local
      final user = await _authenticateLocally(email, password);
      if (user != null) {
        currentUser = user;
        return user;
      } else {
        _showError(context, 'Usuário não encontrado localmente');
        return null;
      }
    }
  }

  static Future<User?> _authenticateLocally(String email, String password) async {
    final db = await getDatabase();
    final user = await UsuarioPersistence().getUserByEmail(db, email);

    if (user != null && user.senha == password) {
      return user;
    } else {
      return null;
    }
  }

  static void _showError(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
