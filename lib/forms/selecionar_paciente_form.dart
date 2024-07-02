import 'package:caresync/db/models/paciente.dart';
import 'package:flutter/material.dart';

class SelecionarPaciente extends StatefulWidget {
  final List<Paciente> pacientes;
  final ValueChanged<Paciente?> onPacienteSelected;

  const SelecionarPaciente({
    super.key,
    required this.pacientes,
    required this.onPacienteSelected,
  });

  @override
  _SelecionarPacienteState createState() => _SelecionarPacienteState();
}

class _SelecionarPacienteState extends State<SelecionarPaciente> {
  Paciente? _selectedPaciente;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Novo Registro',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              Autocomplete<Paciente>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<Paciente>.empty();
                  }
                  return widget.pacientes.where((paciente) {
                    return paciente.nome
                        .toLowerCase()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                displayStringForOption: (paciente) => paciente.nome,
                onSelected: (Paciente? selection) {
                  setState(() {
                    _selectedPaciente = selection;
                  });
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      labelText: 'Selecionar Paciente',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onPacienteSelected(_selectedPaciente);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 225, 175),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Próximo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

