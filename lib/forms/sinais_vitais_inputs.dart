import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:caresync/db/models/paciente.dart';
import 'package:caresync/db/models/sinais_vitais.dart';
import 'package:caresync/service/sinais_vitais.dart';
import 'package:caresync/service/usuario.dart';

class SinaisVitaisInputs extends StatefulWidget {
  final Paciente selectedPaciente;

  const SinaisVitaisInputs({
    super.key,
    required this.selectedPaciente,
  });

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
    'mobilidade': TextEditingController(),
    'observacoes': TextEditingController(),
  };

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registros de Sinais Vitais'),
      ),
      body: SingleChildScrollView(
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
                _buildFormFieldWithUnit('Mobilidade', '', 'mobilidade'),
                const SizedBox(height: 16.0),
                _buildFormFieldWithUnit('Observações', '', 'observacoes'),
                const SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          SinaisVitais sinaisVitais = buildSinaisVitaisFromForm();
                          await SinaisVitaisService.salvarSinaisVitais(context, sinaisVitais);
                          Navigator.pushReplacementNamed(context, '/registros');
                        }
                      } catch (e) {
                        print('Erro ao salvar sinais vitais: $e');
                        _showError(context, 'Erro ao salvar sinais vitais: $e');
                      }
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
      ),
    );
  }

  Widget _buildFormFieldWithUnit(String labelText, String unit, String key) {
    return TextFormField(
      controller: _textEditingControllerMap[key],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira um valor válido para $labelText';
        }
        return null;
      },
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

  SinaisVitais buildSinaisVitaisFromForm() {
    return SinaisVitais(
      idPaciente: widget.selectedPaciente.id,
      idProfissional: UsuarioService.currentUser!.id,
      freqCardiaca: int.tryParse(_textEditingControllerMap['freqCardiaca']?.text ?? ''),
      freqRespiratoria: int.tryParse(_textEditingControllerMap['freqRespiratoria']?.text ?? ''),
      pressaoArterial: _textEditingControllerMap['pressaoArterial']?.text,
      constipacao: _textEditingControllerMap['constipacao']?.text,
      glicemia: double.tryParse(_textEditingControllerMap['glicemia']?.text ?? ''),
      temperatura: double.tryParse(_textEditingControllerMap['temperatura']?.text ?? ''),
      oxigenacao: double.tryParse(_textEditingControllerMap['oxigenacao']?.text ?? ''),
      peso: double.tryParse(_textEditingControllerMap['peso']?.text ?? ''),
      mobilidade: _textEditingControllerMap['mobilidade']?.text,
      observacoes: _textEditingControllerMap['observacoes']?.text,
    );
  }

  void _showError(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
