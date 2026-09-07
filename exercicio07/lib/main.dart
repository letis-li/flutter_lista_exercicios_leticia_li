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
      home: ReajusteSalarial(),
    );
  }
}

class ReajusteSalarial extends StatefulWidget {
  const ReajusteSalarial({super.key});

  @override
  State<ReajusteSalarial> createState() => _ReajusteSalarialState();
}

class _ReajusteSalarialState extends State<ReajusteSalarial> {
  final TextEditingController nome = TextEditingController();
  final TextEditingController salario = TextEditingController();
  final TextEditingController percentual = TextEditingController();

  String resultado = '';

  void calcular() {
    double salarioAtual = double.tryParse(salario.text) ?? 0.0;
    double percentualReajuste = double.tryParse(percentual.text) ?? 0.0;

    double aumento = salarioAtual * percentualReajuste / 100;
    double novoSalario = salarioAtual + aumento;

    setState(() {
      resultado =
          'Funcionário: ${nome.text}\n'
          'Salário atual: R\$ ${salarioAtual.toStringAsFixed(2)}\n'
          'Aumento: R\$ ${aumento.toStringAsFixed(2)}\n'
          'Novo salário: R\$ ${novoSalario.toStringAsFixed(2)}';
    });
  }

  void limpar() {
    setState(() {
      nome.clear();
      salario.clear();
      percentual.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    nome.dispose();
    salario.dispose();
    percentual.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reajuste Salarial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nome,
              decoration: const InputDecoration(
                labelText: 'Nome do funcionário',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: salario,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Salário atual',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: percentual,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Percentual de reajuste',
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