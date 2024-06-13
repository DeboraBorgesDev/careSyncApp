import 'package:flutter/material.dart';
import 'package:caresync/components/AppScaffold/app_scaffould.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      body: PerfilContent(),
      selectedIndex: 2,
    );
  }

  String routeForIndex(int index) {
    switch (index) {
      case 0:
        return '/home';
      case 1:
        return '/registros';
      case 2:
        return '/perfil';
      default:
        return '/';
    }
  }
}

class PerfilContent extends StatelessWidget {
  const PerfilContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: const Color.fromARGB(255, 25, 225, 175),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Usuário',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'CRM: 123456',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'medico@husm.com.br',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: ElevatedButton.icon(
            onPressed: () {
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            label: const  Text(
            'Sair',
            style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 25, 225, 175),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
      ],
    );
  }
}
