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
      home: CalculadoraMedia(),
    );
  }
}

class CalculadoraMedia extends StatefulWidget {
  const CalculadoraMedia({super.key});

  @override
  State<CalculadoraMedia> createState() => _CalculadoraMedia();
}

class _CalculadoraMedia extends State<CalculadoraMedia> {
  final TextEditingController nota1 = TextEditingController();
  final TextEditingController nota2 = TextEditingController();
  final TextEditingController nota3 = TextEditingController();

  String resultado = '';

  void calcular() {
    double n1 = double.tryParse(nota1.text) ?? 0.0;
    double n2 = double.tryParse(nota2.text) ?? 0.0;
    double n3 = double.tryParse(nota3.text) ?? 0.0;

    double media = (n1 + n2 + n3) / 3;

    setState(() {
      if (media >= 6) {
        resultado =
            'Média: ${media.toStringAsFixed(1)}\nSituação: Aprovado';
      } else {
        resultado =
            'Média: ${media.toStringAsFixed(1)}\nSituação: Reprovado';
      }
    });
  }

  void limpar() {
    setState(() {
      nota1.clear();
      nota2.clear();
      nota3.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    nota1.dispose();
    nota2.dispose();
    nota3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Média'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nota1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 1',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: nota2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 2',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: nota3,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nota 3',
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