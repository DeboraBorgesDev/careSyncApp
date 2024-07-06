import 'dart:convert';

import 'package:caresync/db/models/paciente.dart';

class SinaisVitais {
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
  final Paciente? paciente;

  SinaisVitais({
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
    this.paciente,
  });

  Map<String, dynamic> toMap() {
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
      'paciente': paciente?.toMap(),
    };
  }

  factory SinaisVitais.fromMap(Map<String, dynamic> map) {
    return SinaisVitais(
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
      paciente: map['paciente'] != null ? Paciente.fromMap(map['paciente']) : null,
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
      'paciente': paciente?.toJson(),
    };
  }


  factory SinaisVitais.fromJson(Map<String, dynamic> map) {
    return SinaisVitais(
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
      paciente: map['paciente'] != null ? Paciente.fromJson(map['paciente']) : null,
    );
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  factory SinaisVitais.fromJsonString(String json) {
    return SinaisVitais.fromJson(jsonDecode(json));
  }
}

