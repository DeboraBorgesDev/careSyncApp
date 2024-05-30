import 'package:caresync/login/login.view.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 25, 225, 175)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 25, 225, 175), // Define a cor do AppBar explicitamente
          foregroundColor: Colors.white, // Define a cor do texto e dos ícones do AppBar
        ),
      ),
      home: const Login(),
    );
  }
}

