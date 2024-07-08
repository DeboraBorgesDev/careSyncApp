import 'dart:convert';

import 'package:caresync/db/database.dart';
import 'package:caresync/db/models/paciente.dart';
import 'package:caresync/db/models/sinais_vitais.dart';
import 'package:caresync/db/persistence/sinais_vitais_persistence.dart';
import 'package:caresync/service/api_client.dart';
import 'package:flutter/material.dart';

class SinaisVitaisService {
  static const String _baseUrl = 'http://192.168.0.107:8080/api';
  static final ApiClient _apiClient = ApiClient();

static Future<void> salvarSinaisVitais(BuildContext context, SinaisVitais sinaisVitais) async {
  try {
    final response = await _apiClient.post(
      Uri.parse('$_baseUrl/sinais/registrar'),
      body: sinaisVitais.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    final sinaisVitaisSalvos = SinaisVitais.fromMap(responseData);

      final db = await getDatabase();
      final sinaisVitaisPersistence = SinaisVitaisPersistence();
      await sinaisVitaisPersistence.insertSinaisVitais(db, sinaisVitaisSalvos);
    } else {
      _showError(context, 'Erro ao salvar sinais vitais no servidor: ${response.body}');
    }
  } catch (e) {
    print('Erro ao salvar sinais vitais: $e');
    _showError(context, 'Erro ao salvar sinais vitais: $e');
  }
}

static Future<List<SinaisVitais>> listarSinaisVitais(BuildContext context) async {
  try {
    final response = await _apiClient.get(Uri.parse('$_baseUrl/sinais'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      print('Dados recebidos do servidor: $jsonList');

      List<SinaisVitais> sinaisVitais = jsonList.map((json) {
        return SinaisVitais(
          id: json['id'],
          idPaciente: json['idPaciente'],
          idProfissional: json['idProfissional'],
          freqCardiaca: json['freqCardiaca'],
          freqRespiratoria: json['freqRespiratoria'],
          pressaoArterial: json['pressaoArterial'],
          constipacao: json['constipacao'],
          glicemia: json['glicemia'],
          temperatura: json['temperatura'],
          oxigenacao: json['oxigenacao'],
          peso: json['peso'],
          mobilidade: json['mobilidade'],
          observacoes: json['observacoes'],
          dataHora: json['dataHora'],
          paciente: json['paciente'] != null ? Paciente.fromMap(json['paciente']) : null,
        );
      }).toList();

      return sinaisVitais;
    } else {
      print('Erro ao listar sinais vitais: ${response.statusCode} - ${response.body}');
      _showError(context, 'Erro ao listar sinais vitais no servidor: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Erro ao buscar sinais vitais: $e');
    _showError(context, 'Erro ao buscar sinais vitais: $e');
    return [];
  }
}

static Future<void> editarSinaisVitais(BuildContext context, SinaisVitais sinaisVitais) async {
    try {
      await _apiClient.put(
        Uri.parse('$_baseUrl/sinais/${sinaisVitais.id}'),
        body: sinaisVitais.toJson(),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      print('Erro ao editar sinais vitais: $e');
      _showError(context, 'Erro ao editar sinais vitais: $e');
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
