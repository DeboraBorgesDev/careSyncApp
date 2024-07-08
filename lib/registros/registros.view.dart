import 'package:flutter/material.dart';
import 'package:caresync/components/AppScaffold/app_scaffould.dart';
import 'package:caresync/components/RegistroCard/registro_card.view.dart';
import 'package:caresync/service/sinais_vitais.dart';
import 'package:caresync/db/models/sinais_vitais.dart';
import 'package:intl/intl.dart';


class RegistrosPage extends StatelessWidget {
  const RegistrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      selectedIndex: 1,
      body: RegistrosContent(),
    );
  }
}

class RegistrosContent extends StatefulWidget {
  const RegistrosContent({super.key});

  @override
  _RegistrosContentState createState() => _RegistrosContentState();
}

class _RegistrosContentState extends State<RegistrosContent> {
  SinaisVitaisService sinaisVitaisService = SinaisVitaisService();
  String formatDateTime(String dateTime) {
  final DateFormat originalFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
  final DateFormat desiredFormat = DateFormat('dd/MM/yyyy HH:mm');

  DateTime date = originalFormat.parse(dateTime);

  return desiredFormat.format(date);
}
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      selectedIndex: 1,
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder<List<SinaisVitais>>(
          future: SinaisVitaisService.listarSinaisVitais(context),
          builder: (context, snapshot) {
            final List<SinaisVitais>? sinaisVitais = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && sinaisVitais != null && sinaisVitais.isNotEmpty) {
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: sinaisVitais.length,
                itemBuilder: (context, index) {
                  final SinaisVitais registro = sinaisVitais[index];

                  return RegistroCard(
                    registro: {
                      'idPaciente': registro.paciente?.id,
                      'nomePaciente': registro.paciente?.nome ?? 'N/A',
                      'cpf': registro.paciente?.cpf ?? '',
                      'dataNascimento': registro.paciente?.dataNascimento ?? '',
                      'dataHora': registro.dataHora != null ? formatDateTime(registro.dataHora!) : 'N/A',                      
                      'sinaisVitais': [
                        {'key': 'pressaoArterial', 'descricao': 'Pressão Arterial', 'resultado': registro.pressaoArterial ?? 'N/A'},
                        {'key': 'freqCardiaca', 'descricao': 'Frequência Cardíaca', 'resultado': registro.freqCardiaca?.toString() ?? 'N/A'},
                        {'key': 'temperatura', 'descricao': 'Temperatura', 'resultado': registro.temperatura?.toString() ?? 'N/A'},
                        {'key': 'freqRespiratoria', 'descricao': 'Frequência Respiratória', 'resultado': registro.freqRespiratoria?.toString() ?? 'N/A'},
                        {'key': 'oxigenacao', 'descricao': 'Oxigenação', 'resultado': registro.oxigenacao?.toString() ?? 'N/A'},
                        {'key': 'glicemia', 'descricao': 'Glicemia', 'resultado': registro.glicemia?.toString() ?? 'N/A'},
                        {'key': 'peso', 'descricao': 'Peso', 'resultado': registro.peso?.toString() ?? 'N/A'},
                        {'key': 'constipacao', 'descricao': 'Constipação e/ou Incontinência Fecal/Urinária', 'resultado': registro.constipacao ?? 'N/A'},
                        {'key': 'mobilidade', 'descricao': 'Mobilidade', 'resultado': registro.mobilidade ?? 'N/A'},
                        {'key': 'observacoes', 'descricao': 'Observações', 'resultado': registro.observacoes ?? 'N/A'},
                      ]
                    },
                  );
                },
              );
            }

            return const Center(
              child: Text(
                'Não há registros de sinais vitais',
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
