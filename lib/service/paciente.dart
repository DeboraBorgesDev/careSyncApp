import 'dart:convert';

import 'package:caresync/db/database.dart';
import 'package:caresync/db/models/paciente.dart';
import 'package:caresync/db/persistence/paciente_persistence.dart';
import 'package:caresync/service/api_client.dart';


class PacienteService {
  static const String _baseUrl = 'http://192.168.0.107:8080/api';
  static final ApiClient _apiClient = ApiClient();

  static Future<List<Paciente>> fetchPacientes() async {
    final response = await _apiClient.get(
      Uri.parse('$_baseUrl/pacientes'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Paciente> pacientes = jsonList.map((json) => Paciente.fromJson(json)).toList();

      // Salvar os pacientes no banco de dados local
      final db = await getDatabase();
      final pacientePersistence = PacientePersistence();
      for (Paciente paciente in pacientes) {
        await pacientePersistence.insertPaciente(db, paciente);
      }

      return pacientes;
    } else {
      throw Exception('Erro ao buscar pacientes: ${response.body}');
    }
  }
}
