import 'package:flutter/material.dart';

class SelecionarPaciente extends StatefulWidget {
  final List<String> pacientes;
  final ValueChanged<String?> onPacienteSelected;

  const SelecionarPaciente({
    super.key,
    required this.pacientes,
    required this.onPacienteSelected,
  });

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
                decoration: const InputDecoration(
                  labelText: 'Selecionar Paciente',
                  // Definir a cor da borda
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Cor da borda cinza

                  ),
                  // Definir a cor do texto do rótulo
                  labelStyle: TextStyle(color: Colors.grey),
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedPaciente != null) {
                      widget.onPacienteSelected(_selectedPaciente);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 225, 175), // Define a cor do botão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Define os cantos retangulares
                    ),
                  ),
                  child: const Text(
                    'Próximo',
                    style: TextStyle(color: Colors.white), // Define a cor do texto como branco
                  ),
                ),
              ),
            ],
          ),
        )
      ]
      ,
    );
  }
}
