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
      home: ConsumoCombustivel(),
    );
  }
}

class ConsumoCombustivel extends StatefulWidget {
  const ConsumoCombustivel({super.key});

  @override
  State<ConsumoCombustivel> createState() => _ConsumoCombustivelState();
}

class _ConsumoCombustivelState extends State<ConsumoCombustivel> {
  final TextEditingController distancia = TextEditingController();
  final TextEditingController litros = TextEditingController();

  String resultado = '';

  void calcular() {
    double distanciaPercorrida = double.tryParse(distancia.text) ?? 0.0;
    double litrosGastos = double.tryParse(litros.text) ?? 0.0;

    double consumo = distanciaPercorrida / litrosGastos;

    setState(() {
      if (consumo >= 12) {
        resultado =
            'Consumo médio: ${consumo.toStringAsFixed(1)} km/l\n'
            'Classificação: Econômico';
      } else {
        resultado =
            'Consumo médio: ${consumo.toStringAsFixed(1)} km/l\n'
            'Classificação: Consumo elevado';
      }
    });
  }

  void limpar() {
    setState(() {
      distancia.clear();
      litros.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    distancia.dispose();
    litros.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de Combustível'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: distancia,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Distância em quilômetros',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: litros,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Combustível em litros',
                border: OutlineInputBorder(),
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
            const SizedBox(height: 30),
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