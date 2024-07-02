import 'dart:convert';

import 'api_client.dart';

class PacienteService {
  static const String _baseUrl = 'http://192.168.0.107:8080/api';
  static final ApiClient _apiClient = ApiClient();

  static Future<List<dynamic>> fetchPacientes() async {
    final response = await _apiClient.get(
      Uri.parse('$_baseUrl/pacientes'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao buscar pacientes: ${response.body}');
    }
  }
}
