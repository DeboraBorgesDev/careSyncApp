import 'package:caresync/login/login.view.dart';
import 'package:caresync/home/home.view.dart';
import 'package:caresync/perfil/perfil.view.dart';
import 'package:caresync/registros/registros.view.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 25, 225, 175)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 25, 225, 175),
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const Home(),
        '/registros': (context) => const RegistrosContent(),
        '/perfil': (context) => const PerfilPage(),
      },
    );
  }
}


