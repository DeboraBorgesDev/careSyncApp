import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  final int selectedIndex;
  final Widget body;

  const AppScaffold({
    super.key,
    required this.selectedIndex,
    required this.body,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Navegação com base no índice selecionado
      // Por exemplo:
      Navigator.pushReplacementNamed(context, routeForIndex(index));
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 25, 225, 175),
        title: Center(
          child: Image.asset(
            'assets/logo.png',
            height: 20.0,
          ),
        ),
      ),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart_outlined),
            label: 'Últimos registros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 25, 225, 175),
        onTap: _onItemTapped,
      ),
    );
  }
  
  String routeForIndex(int index) {
  switch (index) {
    case 0:
      return '/home';
    case 1:
      return '/registros'; 
    case 2:
      return '/registros';
    default:
      return '/';
  }
}

}
