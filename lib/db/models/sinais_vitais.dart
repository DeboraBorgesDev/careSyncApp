import 'dart:convert';

class SinaisVitais {
  final String? id;
  final String idPaciente;
  final String idProfissional;
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

  SinaisVitais({
    this.id,
    required this.idPaciente,
    required this.idProfissional,
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
    };
  }

  factory SinaisVitais.fromMap(Map<String, dynamic> map) {
    return SinaisVitais(
      id: map['id'],
      idPaciente: map['paciente']['id'],
      idProfissional: map['profissional']['id'],
      freqCardiaca: map['freqCardiaca'],
      freqRespiratoria: map['freqRespiratoria'],
      pressaoArterial: map['pressaoArterial'],
      constipacao: map['constipacao'],
      glicemia: map['glicemia'],
      temperatura: map['temperatura'],
      oxigenacao: map['oxigenacao'],
      peso: map['peso'],
      mobilidade: map['mobilidade'],
      observacoes: map['observacoes'],
    );
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  factory SinaisVitais.fromJson(String json) {
    return SinaisVitais.fromMap(jsonDecode(json));
  }
}
