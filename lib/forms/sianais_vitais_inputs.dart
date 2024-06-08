import 'package:flutter/material.dart';

class SinaisVitaisInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Registros de Sinais Vitais',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(context, 'Frequência Cardíaca', 'bpm'),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(context, 'Pressão Arterial', 'mmHg'),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(context, 'Temperatura', '°C'),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(
                    context, 'Frequência Respiratória', 'rpm'),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(context, 'Oxigenação', '%'),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(context, 'Glicemia', 'mg/dL'),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(context, 'Peso', 'kg'),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(
                    context, 'Constipação ou Incontinência Fecal/Urinária', ''),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(context, 'Mobilidade', ''),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit(context, 'Observações', ''),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Ação para salvar o registro
                  },
                  child: const Text('Salvar Registro'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFormFieldWithUnit(BuildContext context, String labelText,
      String unit) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey, // Define a cor do rótulo
        ),
        focusedBorder: const OutlineInputBorder( // Define a borda quando o campo estiver em foco
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
        suffixStyle: Theme
            .of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.grey),
      ),
    );
  }

}