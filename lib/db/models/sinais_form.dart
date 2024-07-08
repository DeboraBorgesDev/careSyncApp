import 'dart:convert';

import 'package:caresync/db/models/sinais_vitais.dart';

class SinaisForm {
  final String? id;
  final String? idPaciente;
  final String? idProfissional;
  final int? freqCardiaca;
  final int? freqRespiratoria;
  final String? pressaoArterial;
  final String? constipacao;
  final double? glicemia;
  final double? temperatura;
  final double? oxigenacao;
  final double? peso;
  final String? mobilidade;
  final String? observacoes;
  final String? dataHora;

  SinaisForm({
    this.id,
    this.idPaciente,
    this.idProfissional,
    this.freqCardiaca,
    this.freqRespiratoria,
    this.pressaoArterial,
    this.constipacao,
    this.glicemia,
    this.temperatura,
    this.oxigenacao,
    this.peso,
    this.mobilidade,
    this.observacoes,
    this.dataHora,
  });

  factory SinaisForm.fromMap(Map<String, dynamic> map) {
    return SinaisForm(
      id: map['id'],
      idPaciente: map['idPaciente'] ?? '',
      idProfissional: map['idProfissional'] ?? '',
      freqCardiaca: map['freqCardiaca'] ?? 0,
      freqRespiratoria: map['freqRespiratoria'] ?? 0,
      pressaoArterial: map['pressaoArterial'] ?? '',
      constipacao: map['constipacao'] ?? '',
      glicemia: map['glicemia'] ?? 0,
      temperatura: map['temperatura'],
      oxigenacao: map['oxigenacao'] ?? 0,
      peso: map['peso'] ?? 0,
      mobilidade: map['mobilidade'] ?? '',
      observacoes: map['observacoes'] ?? '',
      dataHora: map['dataHora'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idPaciente': idPaciente,
      'idProfissional': idProfissional,
      'freqCardiaca': freqCardiaca,
      'freqRespiratoria': freqRespiratoria,
      'pressaoArterial': pressaoArterial,
      'constipacao': constipacao,
      'glicemia': glicemia,
      'temperatura': temperatura,
      'oxigenacao': oxigenacao,
      'peso': peso,
      'mobilidade': mobilidade,
      'observacoes': observacoes,
      'dataHora': dataHora,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory SinaisForm.fromJsonString(String json) {
    return SinaisForm.fromJson(jsonDecode(json));
  }
  
  static SinaisForm fromJson(Map<String, dynamic> map) {
    return SinaisForm(
       id: map['id'],
      idPaciente: map['idPaciente'] ?? '',
      idProfissional: map['idProfissional'] ?? '',
      freqCardiaca: map['freqCardiaca'] ?? 0,
      freqRespiratoria: map['freqRespiratoria'] ?? 0,
      pressaoArterial: map['pressaoArterial'] ?? '',
      constipacao: map['constipacao'] ?? '',
      glicemia: map['glicemia'] ?? 0,
      temperatura: map['temperatura'],
      oxigenacao: map['oxigenacao'] ?? 0,
      peso: map['peso'] ?? 0,
      mobilidade: map['mobilidade'] ?? '',
      observacoes: map['observacoes'] ?? '',
    );
  }

    static SinaisForm fromSinaisVitais(SinaisVitais sinaisVitais) {
    return SinaisForm(
      idPaciente: sinaisVitais.idPaciente,
      idProfissional: sinaisVitais.idProfissional,
      freqCardiaca: sinaisVitais.freqCardiaca,
      freqRespiratoria: sinaisVitais.freqRespiratoria,
      pressaoArterial: sinaisVitais.pressaoArterial,
      constipacao: sinaisVitais.constipacao,
      glicemia: sinaisVitais.glicemia,
      temperatura: sinaisVitais.temperatura,
      oxigenacao: sinaisVitais.oxigenacao,
      peso: sinaisVitais.peso,
      observacoes: sinaisVitais.observacoes,
      dataHora: sinaisVitais.dataHora,
      mobilidade: sinaisVitais.mobilidade
    );
  }
}
