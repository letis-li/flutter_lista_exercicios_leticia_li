import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController numero1 = TextEditingController();
  final TextEditingController numero2 = TextEditingController();

  String resultado = '';

  double lerNumero1() {
    return double.tryParse(numero1.text) ?? 0;
  }

  double lerNumero2() {
    return double.tryParse(numero2.text) ?? 0;
  }

  void somar() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();

    setState(() {
      resultado = 'Resultado: ${n1 + n2}';
    });
  }

  void subtrair() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();

    setState(() {
      resultado = 'Resultado: ${n1 - n2}';
    });
  }

  void multiplicar() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();

    setState(() {
      resultado = 'Resultado: ${n1 * n2}';
    });
  }

  void dividir() {
    double n1 = lerNumero1();
    double n2 = lerNumero2();

    setState(() {
      if (n2 != 0) {
        resultado = 'Resultado: ${n1 / n2}';
      } else {
        resultado = 'Não é possível dividir por zero.';
      }
    });
  }

  void limpar() {
    setState(() {
      numero1.clear();
      numero2.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    numero1.dispose();
    numero2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numero1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: numero2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: somar,
                  child: const Text('+'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: subtrair,
                  child: const Text('-'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: multiplicar,
                  child: const Text('*'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: dividir,
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: limpar,
              child: const Text('Limpar'),
            ),
            const SizedBox(height: 30),
            Text(
              resultado,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}