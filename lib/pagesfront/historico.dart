import 'dart:math';
import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({super.key});

  Widget card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
      ),
      child: child,
    );
  }

  Widget barra(double altura) {
    return Container(
      width: 24,
      height: altura,
      decoration: BoxDecoration(
        color: const Color(0xFF1565C0),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget conta(String mes, String consumo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.calendar_month, color: Colors.grey),
          const SizedBox(width: 12),

          Expanded(
            child: Text(
              mes,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          Text(consumo, style: const TextStyle(color: Colors.grey)),

          const SizedBox(width: 20),

          Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget gradiente({
    required String titulo,
    required double posicao,
    required String valor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titulo, style: const TextStyle(fontWeight: FontWeight.w500)),

        const SizedBox(height: 16),

        Stack(
          children: [
            Container(
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Colors.green, Colors.yellow, Colors.red],
                ),
              ),
            ),

            Positioned(
              left: posicao,
              top: -24,
              child: Column(
                children: [
                  Text(
                    valor,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, size: 18),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        title: const Text(
          'Histórico de consumo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1565C0),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            // Toggle
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1565C0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Energia',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text('Água', style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Gráfico barras
            card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Consumo por mês',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      barra(110),
                      barra(90),
                      barra(115),
                      barra(80),
                      barra(70),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Comparação',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 14),
                  Text('Últimos 3 meses: 157 kWh'),
                  Text('3 meses anteriores: 125 kWh'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            card(
              child: Column(
                children: [
                  const Text(
                    'Histórico de contas',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  conta('Jan', '145 kWh', 'R\$ 125,50'),
                  conta('Fev', '102 kWh', 'R\$ 142,80'),
                  conta('Mar', '128 kWh', 'R\$ 118,20'),
                  conta('Abr', '178 kWh', 'R\$ 156,40'),
                  conta('Mai', '165 kWh', 'R\$ 180,00'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            card(
              child: Column(
                children: [
                  gradiente(
                    titulo: 'Seu consumo',
                    posicao: 70,
                    valor:
                        'R\$ ${(180 + random.nextInt(100)).toStringAsFixed(2)}',
                  ),

                  const SizedBox(height: 40),

                  gradiente(
                    titulo: 'Sua região',
                    posicao: 230,
                    valor: 'R\$ 560,49',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            card(
              child: Column(
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total do período'),
                      Text(
                        'R\$ 619,90',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Média mensal'),
                      Text(
                        'R\$ 124,80',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
