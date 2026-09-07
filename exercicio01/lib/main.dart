import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Identificação do Usuário',
      home: IdentificaUsuario(),
    );
  }
}

class IdentificaUsuario extends StatefulWidget {
  const new({super.key});

  @override
  State<IdentificaUsuario> createState() => _IdentificaUsuario();
}

class _IdentificaUsuario extends State<IdentificaUsuario> {
  final TextEditingController nome = TextEditingController();
  final TextEditingController cidade = TextEditingController();

  String resultado = '';

  void mostrarDados() {
    setState(() {
      resultado = 'Olá, ${nome.text}! Você mora em ${cidade.text}.';
    });
  }

  void limpar() {
    setState(() {
      nome.clear();
      cidade.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    nome.dispose();
    cidade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Identificação do Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: cidade,
              decoration: const InputDecoration(labelText: 'Cidade'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: mostrarDados,
                  child: const Text('Mostrar'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: limpar, child: const Text('Limpar')),
              ],
            ),
            const SizedBox(height: 20),
            Text(resultado, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
