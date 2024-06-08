import 'package:flutter/material.dart';
import 'package:caresync/components/AppScaffold/app_scaffould.dart';

import '../components/RegistroCard/registro_card.view.dart';


class RegistrosPage extends StatelessWidget {
  const RegistrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      selectedIndex: 1,
      body: RegistrosContent(),
    );
  }
}

class RegistrosContent extends StatelessWidget {
  const RegistrosContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> registros = [
      {
        'nomePaciente': 'João Silva',
        'dataHora': '2023-06-06 14:30',
        'sinaisVitais': [
          {'descricao': 'Pressão Arterial', 'resultado': '120/80 mmHg'},
          {'descricao': 'Frequência Cardíaca', 'resultado': '70 bpm'},
          {'descricao': 'Temperatura', 'resultado': '36.5 ºC'},
          {'descricao': 'Frequência Respiratória', 'resultado': '16 rpm'},
          {'descricao': 'Oxigenação', 'resultado': '98%'},
          {'descricao': 'Glicemia', 'resultado': '90 mg/dL'},
          {'descricao': 'Peso', 'resultado': '70 kg'},
          {'descricao': 'Constipação e/ou Incontinência Fecal/Urinária', 'resultado': 'Nenhuma'},
          {'descricao': 'Mobilidade', 'resultado': 'Independente'},
          {'descricao': 'Observações', 'resultado': 'Paciente estável'},
        ],
      },
      {
        'nomePaciente': 'Maria Oliveira',
        'dataHora': '2023-06-06 15:45',
        'sinaisVitais': [
          {'descricao': 'Pressão Arterial', 'resultado': '130/85 mmHg'},
          {'descricao': 'Frequência Cardíaca', 'resultado': '75 bpm'},
          {'descricao': 'Temperatura', 'resultado': '36.7 ºC'},
          {'descricao': 'Frequência Respiratória', 'resultado': '18 rpm'},
          {'descricao': 'Oxigenação', 'resultado': '97%'},
          {'descricao': 'Glicemia', 'resultado': '100 mg/dL'},
          {'descricao': 'Peso', 'resultado': '65 kg'},
          {'descricao': 'Constipação e/ou Incontinência Fecal/Urinária', 'resultado': 'Nenhuma'},
          {'descricao': 'Mobilidade', 'resultado': 'Auxílio para caminhar'},
          {'descricao': 'Observações', 'resultado': 'Paciente com leve dor nas pernas'},
        ],
      },
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: registros.length,
        itemBuilder: (context, index) {
          return RegistroCard(registro: registros[index]);
        },
      ),
    );
  }
}
