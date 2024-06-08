import 'package:flutter/material.dart';

class SelecionarPaciente extends StatefulWidget {
  final List<String> pacientes;
  final ValueChanged<String?> onPacienteSelected;

  const SelecionarPaciente({
    Key? key,
    required this.pacientes,
    required this.onPacienteSelected,
  }) : super(key: key);

  @override
  _SelecionarPacienteState createState() => _SelecionarPacienteState();
}

class _SelecionarPacienteState extends State<SelecionarPaciente> {
  String? _selectedPaciente;

  @override
  Widget build(BuildContext context) {
    return  Column(
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
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Selecionar Paciente',
                  border: OutlineInputBorder(),
                ),
                value: _selectedPaciente,
                items: widget.pacientes.map((String paciente) {
                  return DropdownMenuItem<String>(
                    value: paciente,
                    child: Text(paciente),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPaciente = newValue;
                  });
                },
                validator: (value) => value == null ? 'Selecione um paciente' : null,
                onSaved: widget.onPacienteSelected,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_selectedPaciente != null) {
                    widget.onPacienteSelected(_selectedPaciente);
                  }
                },
                child: const Text('Próximo'),
              ),
            ],
          ),
        )
      ]
      ,
    );
  }
}
