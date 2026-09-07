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
      home: ConversorTemp(),
    );
  }
}

class ConversorTemp extends StatefulWidget {
  const ConversorTemp({super.key});

  @override
  State<ConversorTemp> createState() => _ConversorTempState();
}

class _ConversorTempState extends State<ConversorTemp> {
  final TextEditingController numeroGraus = TextEditingController();

  String resultado = '';

  double lerNumeroCelsius() {
    return double.tryParse(numeroGraus.text) ?? 0.0;
  }

  void converterParaFahrenheit() {
    double celsius = lerNumeroCelsius();
    double fahrenheit = (celsius * 9 / 5) + 32;

    setState(() {
      resultado = 'Temperatura em Fahrenheit = $fahrenheit °F';
    });
  }

void limpar(){
  setState((){
    numeroGraus.clear();
    resultado = '';
  });
}

@override
void dispose(){
  numeroGraus.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conversor de Temperatura')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numeroGraus,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Temperatura em Celsius',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: converterParaFahrenheit,
                  child: const Text('Converter'),
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
