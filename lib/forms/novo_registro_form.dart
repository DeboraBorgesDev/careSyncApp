import 'package:caresync/forms/selecionar_paciente_form.dart';
import 'package:caresync/forms/sinais_vitais_inputs.dart';
import 'package:flutter/material.dart';

class NovoRegistroForm extends StatefulWidget {
  const NovoRegistroForm({super.key});

  @override
  _NovoRegistroFormState createState() => _NovoRegistroFormState();
}

class _NovoRegistroFormState extends State<NovoRegistroForm> {
  String? _selectedPaciente;
  bool _showSinaisVitaisInputs = false;

  final List<String> _pacientes = [
    'João Silva', 'Maria Oliveira', 'Carlos Souza', 'Ana Paula',
    'Pedro Henrique', 'Mariana Lima', 'José Santos', 'Luiza Almeida'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showSinaisVitaisInputs && _selectedPaciente != null
          ? SinaisVitaisInputs(
              selectedPaciente: _selectedPaciente!,
            )
          : SelecionarPaciente(
              pacientes: _pacientes,
              onPacienteSelected: (paciente) {
                setState(() {
                  _selectedPaciente = paciente;
                  _showSinaisVitaisInputs = true;
                });
              },
            ),
    );
  }
}
