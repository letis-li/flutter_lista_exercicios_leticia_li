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
      home: SistemaVendas(),
    );
  }
}

class SistemaVendas extends StatefulWidget {
  const SistemaVendas({super.key});

  @override
  State<SistemaVendas> createState() => _SistemaVendasState();
}

class _SistemaVendasState extends State<SistemaVendas> {
  final TextEditingController produto = TextEditingController();
  final TextEditingController preco = TextEditingController();
  final TextEditingController quantidade = TextEditingController();

  String resultado = '';

  void calcular() {
    double precoUnitario = double.tryParse(preco.text) ?? 0.0;
    int quantidadeComprada = int.tryParse(quantidade.text) ?? 0;

    double subtotal = precoUnitario * quantidadeComprada;
    double desconto = 0.0;

    if (subtotal > 500) {
      desconto = subtotal * 0.10;
    }

    double total = subtotal - desconto;

    setState(() {
      resultado =
          'Produto: ${produto.text}\n'
          'Quantidade: $quantidadeComprada\n'
          'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}\n'
          'Desconto: R\$ ${desconto.toStringAsFixed(2)}\n'
          'Total: R\$ ${total.toStringAsFixed(2)}';
    });
  }

  void limpar() {
    setState(() {
      produto.clear();
      preco.clear();
      quantidade.clear();
      resultado = '';
    });
  }

  @override
  void dispose() {
    produto.dispose();
    preco.dispose();
    quantidade.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sistema de Vendas')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: produto,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: preco,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço unitário',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
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
                  onPressed: calcular,
                  child: const Text('Calcular'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: limpar, child: const Text('Limpar')),
              ],
            ),
            const SizedBox(height: 30),
            Text(resultado, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
