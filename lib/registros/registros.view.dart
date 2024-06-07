import 'package:flutter/material.dart';
import 'package:caresync/components/AppScaffold/app_scaffould.dart';

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

class RegistrosContent extends StatelessWidget {
  const RegistrosContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemplo de dados
    final List<Map<String, dynamic>> registros = [
      {
        'nomePaciente': 'João Silva',
        'dataHora': '2023-06-06 14:30',
        'sinaisVitais': [
          {'descricao': 'Pressão Arterial', 'resultado': '120/80 mmHg'},
          {'descricao': 'Frequência Cardíaca', 'resultado': '70 bpm'},
          {'descricao': 'Temperatura', 'resultado': '36.5 ºC'},
        ],
      },
      {
        'nomePaciente': 'Maria Oliveira',
        'dataHora': '2023-06-06 15:45',
        'sinaisVitais': [
          {'descricao': 'Pressão Arterial', 'resultado': '130/85 mmHg'},
          {'descricao': 'Frequência Cardíaca', 'resultado': '75 bpm'},
          {'descricao': 'Temperatura', 'resultado': '36.7 ºC'},
        ],
      },
      // Adicione mais registros conforme necessário
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: registros.length,
        itemBuilder: (context, index) {
          return RegistroCard(registro: registros[index]);
        },
      ),
    );
  }
}

class RegistroCard extends StatefulWidget {
  final Map<String, dynamic> registro;

  const RegistroCard({super.key, required this.registro});

  @override
  // ignore: library_private_types_in_public_api
  _RegistroCardState createState() => _RegistroCardState();
}

class _RegistroCardState extends State<RegistroCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Paciente: ${widget.registro['nomePaciente']}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.registro['dataHora'],
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            if (_isExpanded)
              ...widget.registro['sinaisVitais'].map<Widget>((sinal) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sinal['descricao'],
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        sinal['resultado'],
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              }).toList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(
                    _isExpanded ? 'Ver menos' : 'Ver mais',
                    style: const TextStyle(color: Color.fromARGB(255, 25, 225, 175)),
                    ),
                  
                ),
                FloatingActionButton(
                  onPressed: () {
                    // Ação para editar o registro
                  },
                  backgroundColor: const Color.fromARGB(255, 25, 225, 175),
                  mini: true,
                  child: const Icon(Icons.edit, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
