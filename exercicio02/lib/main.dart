import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerificadorIdade(),
    );
  }
}

class VerificadorIdade extends StatefulWidget {
  const VerificadorIdade({super.key});

  @override
  State<VerificadorIdade> createState() => _VerificadorIdadeState();
}

class _VerificadorIdadeState extends State<VerificadorIdade> {
  final TextEditingController nome = TextEditingController();
  final TextEditingController idade = TextEditingController();

  String resultado = '';

  void verificar() {
    int idadeInformada = int.tryParse(idade.text) ?? 0;

    setState(() {
      if (idadeInformada >= 18) {
        resultado = '${nome.text} é maior de idade.';
      } else {
        resultado = '${nome.text} é menor de idade.';
      }
    });
  }

  void limpar() {
    setState(() {
      nome.clear();
      idade.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    nome.dispose();
    idade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificador de idade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: idade,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Idade',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: verificar,
                  child: const Text('Verificar'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: limpar,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              resultado,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}