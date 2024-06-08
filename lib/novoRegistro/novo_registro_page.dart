
import 'package:flutter/material.dart';

import '../components/AppScaffold/app_scaffould.dart';
import '../forms/novo_registro_form.dart';

class NovoRegistroPage extends StatelessWidget {
  const NovoRegistroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      selectedIndex: 0,
      body: NovoRegistroForm(),
    );
  }
}
