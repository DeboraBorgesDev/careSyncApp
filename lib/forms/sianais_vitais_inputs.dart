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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Registros de Sinais Vitais',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Row(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          children: [
                            Icon(Icons.account_circle),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nome do Paciente',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '06/08/2001',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'xxx.xxx.xxx.-xx',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
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
          )
        ],
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
