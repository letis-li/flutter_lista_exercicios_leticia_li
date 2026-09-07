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
      home: ControleEstoque(),
    );
  }
}

class ControleEstoque extends StatefulWidget {
  const ControleEstoque({super.key});

  @override
  State<ControleEstoque> createState() => _ControleEstoqueState();
}

class _ControleEstoqueState extends State<ControleEstoque> {
  final TextEditingController quantidade = TextEditingController();

  int estoque = 0;
  String mensagem = '';

  void entrada() {
    int valor = int.tryParse(quantidade.text) ?? 0;

    setState(() {
      estoque = estoque + valor;
      mensagem = 'Entrada realizada com sucesso.';
    });
  }

  void saida() {
    int valor = int.tryParse(quantidade.text) ?? 0;

    setState(() {
      if (valor <= estoque) {
        estoque = estoque - valor;
        mensagem = 'Saída realizada com sucesso.';
      } else {
        mensagem = 'Quantidade maior que o estoque disponível.';
      }
    });
  }

  void limpar() {
    setState(() {
      quantidade.clear();
      mensagem = '';
    });
  }

  @override
  void dispose() {
    quantidade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Estoque'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Quantidade atual em estoque: $estoque',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: quantidade,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: entrada,
                  child: const Text('Entrada'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: saida,
                  child: const Text('Saída'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: limpar,
                  child: const Text('Limpar campo'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              mensagem,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}