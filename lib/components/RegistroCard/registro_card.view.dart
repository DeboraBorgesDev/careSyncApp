import 'package:flutter/material.dart';

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
                Expanded(
                  child: Text(
                    'Paciente: ${widget.registro['nomePaciente']}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
