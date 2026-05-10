import 'package:flutter/material.dart';

class HistoricooPage extends StatelessWidget {
  const HistoricooPage({super.key});

  void animarEIr(BuildContext context, String destino) {
    Future.delayed(const Duration(milliseconds: 400), () {
      Navigator.pushNamed(context, destino);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      // HEADER
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text(
          "Histórico de consumo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      // BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // BOTÕES TOGGLE
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  // Energia
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: const Text("Energia"),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Água
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        animarEIr(context, "historico.html");
                      },
                      child: const Text("Água"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // CARD GRAFICO SIMPLIFICADO
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Consumo por mês",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  // GRAFICO (barras simples)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _bar(80, "Jan"),
                      _bar(120, "Fev"),
                      _bar(160, "Mar"),
                      _bar(40, "Abr"),
                      _bar(80, "Mai"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // COMPARAÇÃO
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Últimos 3 meses"),
                        SizedBox(height: 5),
                        Text(
                          "44mil L",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("média"),
                      ],
                    ),
                  ),

                  VerticalDivider(),

                  Expanded(
                    child: Column(
                      children: [
                        Text("3 meses anteriores"),
                        SizedBox(height: 5),
                        Text(
                          "54mil L",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("média"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // HISTÓRICO LISTA
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _itemHistorico("Jan", "145mil L", "R\$ 148,90"),
                  _itemHistorico("Fev", "102mil L", "R\$ 108,80"),
                  _itemHistorico("Mar", "128mil L", "R\$ 125,00"),
                  _itemHistorico("Abr", "178mil L", "R\$ 256,60"),
                  _itemHistorico("Mai", "165mil L", "R\$ 170,90"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // RESUMO FINAL
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total do período:"),
                      Text(
                        "R\$ 619,90",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Média mensal:"),
                      Text(
                        "R\$ 124,80",
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

  // 🔵 BARRA DO GRÁFICO
  Widget _bar(double height, String label) {
    return Column(
      children: [
        Container(
          width: 30,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFF1565C0),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  // 🔵 ITEM DO HISTÓRICO
  Widget _itemHistorico(String mes, String consumo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(mes),
          Text(consumo),
          Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
