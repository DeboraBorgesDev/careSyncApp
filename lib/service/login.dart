import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _baseUrl = 'http://192.168.0.111:8080/api';

  // Função de login
  static Future<Map<String, dynamic>?> login(BuildContext context, String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'senha': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      _showError(context, 'Falha no login: ${response.body}');
      return null;
    }
  }

  static void _showError(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
