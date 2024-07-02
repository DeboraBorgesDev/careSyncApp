import 'package:caresync/db/models/paciente.dart';
import 'package:caresync/forms/selecionar_paciente_form.dart';
import 'package:caresync/forms/sinais_vitais_inputs.dart';
import 'package:caresync/service/paciente.dart';
import 'package:flutter/material.dart';

class NovoRegistroForm extends StatefulWidget {
  const NovoRegistroForm({super.key});

  @override
  _NovoRegistroFormState createState() => _NovoRegistroFormState();
}

class _NovoRegistroFormState extends State<NovoRegistroForm> {
  Paciente? _selectedPaciente;
  bool _showSinaisVitaisInputs = false;
  List<Paciente> _pacientes = [];

  @override
  void initState() {
    super.initState();
    _fetchPacientes();
  }

  Future<void> _fetchPacientes() async {
  try {
    final pacientes = await PacienteService.fetchPacientes();
    setState(() {
      _pacientes = pacientes;
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao carregar pacientes: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showSinaisVitaisInputs && _selectedPaciente != null
          ? SinaisVitaisInputs(selectedPaciente: _selectedPaciente!)
          : SelecionarPaciente(
              pacientes: _pacientes,
              onPacienteSelected: (paciente) {
                setState(() {
                  _selectedPaciente = paciente as Paciente?;
                  _showSinaisVitaisInputs = true;
                });
              },
            ),
    );
  }
}
