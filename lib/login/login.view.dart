import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 225, 175),
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Image.asset(
              'assets/image1.png',
              height: 100.0,
            ),
            Image.asset(
              'assets/logo.png',
              height: 100.0,
            ),
            const SizedBox(height: 24.0),
            // Título Login
            Text(
              'Login',
              style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 24.0),
            // Campo de Email
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            // Campo de Senha
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            // Botão de Entrar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica do botão de entrar
                },
                child: const Text('Entrar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}