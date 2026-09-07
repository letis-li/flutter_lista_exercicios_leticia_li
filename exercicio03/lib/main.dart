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
      home: AntecessorSucessor(),
    );
  }
}

class AntecessorSucessor extends StatefulWidget {
  const AntecessorSucessor({super.key});

  @override
  State<AntecessorSucessor> createState() => _AntecessorSucessor();
}

class _AntecessorSucessor extends State<AntecessorSucessor> {
  final TextEditingController num = TextEditingController();

  String resultado = '';

  void calcular() {
    int numero = int.tryParse(num.text) ?? 0;

    int antecessor = numero - 1;
    int sucessor = numero + 1;

    setState(() {
      resultado =
          'Número: $numero\nAntecessor: $antecessor\nSucessor: $sucessor';
    });
  }

  void limpar() {
    setState(() {
      num.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    num.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Antecessor e Sucessor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: num,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calcular,
                  child: const Text('Calcular'),
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