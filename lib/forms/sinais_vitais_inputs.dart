import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SinaisVitaisInputs extends StatelessWidget {
  final Map<String, dynamic> selectedPaciente;

  const SinaisVitaisInputs({
    super.key,
    required this.selectedPaciente,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime parsedDate = DateTime.parse(selectedPaciente['dataNascimento']);
    final String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros de Sinais Vitais'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Registros de Sinais Vitais',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      const Icon(Icons.account_circle),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedPaciente['nome'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Data de Nascimento: $formattedDate',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            'CPF: ${selectedPaciente['cpf']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Frequência Cardíaca', 'bpm'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Pressão Arterial', 'mmHg'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Temperatura', '°C'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Frequência Respiratória', 'rpm'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Oxigenação', '%'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Glicemia', 'mg/dL'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Peso', 'kg'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Constipação ou Incontinência Fecal/Urinária', ''),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Mobilidade', ''),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit(context, 'Observações', ''),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle save action
                    Navigator.pushReplacementNamed(context, '/registros');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 225, 175),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Salvar sinais',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFieldWithUnit(BuildContext context, String labelText, String unit) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        suffixText: unit,
        suffixStyle: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.grey),
      ),
    );
  }
}
