import 'dart:convert';

import 'package:caresync/db/database.dart';
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
      final response = await _apiClient.get('$_baseUrl/sinais' as Uri);

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<SinaisVitais> sinaisVitais = jsonList.map((json) => SinaisVitais.fromJson(json)).toList();

        final db = await getDatabase();
        final sinaisVitaisPersistence = SinaisVitaisPersistence();
        for (SinaisVitais sinais in sinaisVitais) {
          await sinaisVitaisPersistence.insertSinaisVitais(db, sinais);
        }

        return sinaisVitais;
      } else {
        _showError(context, 'Erro ao listar sinais vitais no servidor: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Erro ao buscar sinais vitais: $e');
      _showError(context, 'Erro ao buscar sinais vitais: $e');
      return [];
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
