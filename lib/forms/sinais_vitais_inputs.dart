import 'package:caresync/db/models/paciente.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Registro {
  final String key;
  final String resultado;
  final String descricao;

  Registro({required this.key, required this.resultado, required this.descricao});

  factory Registro.fromMap(Map<String, String> map) {
    return Registro(
      key: map['key']!,
      resultado: map['resultado']!,
      descricao:  map['descricao']!
    );
  }
}


class SinaisVitaisInputs extends StatefulWidget {
  final List<Map<String, String>>? registro;
    final Paciente selectedPaciente;


  const SinaisVitaisInputs({super.key, this.registro, required this.selectedPaciente});

  @override
  _SinaisVitaisInputsState createState() => _SinaisVitaisInputsState();
}

class _SinaisVitaisInputsState extends State<SinaisVitaisInputs> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _textEditingControllerMap = {
    'freqCardiaca': TextEditingController(),
    'pressaoArterial': TextEditingController(),
    'temperatura': TextEditingController(),
    'freqRespiratoria': TextEditingController(),
    'oxigenacao': TextEditingController(),
    'glicemia': TextEditingController(),
    'peso': TextEditingController(),
    'constipacao': TextEditingController(),
    'observacoes': TextEditingController(), 
  };

@override
  void initState() {
    super.initState();

    // Preencher os campos com os valores iniciais
    if (widget.registro != null) {
      for (var item in widget.registro!) {
        // Assumindo que item é um mapa com chaves 'key', 'resultado', e 'descricao'
        if (item.containsKey('key') && item.containsKey('resultado')) {
          String key = item['key']!;
          String resultado = item['resultado']!;
          if (_textEditingControllerMap.containsKey(key)) {
            _textEditingControllerMap[key]?.text = resultado;
          }
        }
      }
    }
  }



  @override
  void dispose() {
    for (final controller in _textEditingControllerMap.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final DateTime parsedDate = DateTime.parse(widget.selectedPaciente.dataNascimento);
    final String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                            widget.selectedPaciente.nome,
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
                            'CPF: ${widget.selectedPaciente.cpf}',
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
              _buildFormFieldWithUnit('Frequência Cardíaca', 'bpm', 'freqCardiaca'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit('Pressão Arterial', 'mmHg', 'pressaoArterial'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit('Temperatura', '°C', 'temperatura'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit('Frequência Respiratória', 'rpm', 'freqRespiratoria'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit('Oxigenação', '%', 'oxigenacao'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit('Glicemia', 'mg/dL', 'glicemia'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit('Peso', 'kg', 'peso'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit('Constipação ou Incontinência Fecal/Urinária', '', 'constipacao'),
              const SizedBox(height: 16.0),
              _buildFormFieldWithUnit('Observações', '', 'observacoes'),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _saveSinaisVitais();
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormFieldWithUnit(String label, String unit, String key) {
    return TextFormField(
      controller: _textEditingControllerMap[key],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        suffixText: unit,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira $label';
        }
        return null;
      },
    );
  }

  Future<void> _saveSinaisVitais() async {
    // Lógica para salvar os sinais vitais
  }
}
