
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _baseUrl = 'http://192.168.0.111:8080/api';


   static Future<List<dynamic>> fetchPacientes() async {
    final response = await http.get(
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
