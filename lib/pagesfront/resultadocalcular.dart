import 'package:flutter/material.dart';
import 'calcular.dart';

class ResultadoCalcularPage extends StatelessWidget {
  final double consumo;
  final double valorConta;
  final String dataMedicao;

  const ResultadoCalcularPage({
    super.key,
    required this.consumo,
    required this.valorConta,
    required this.dataMedicao,
  });

  Widget resultadoCard({required String titulo, required Widget conteudo}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 14),
          conteudo,
        ],
      ),
    );
  }

  Widget botao({
    required String texto,
    required VoidCallback onTap,
    bool azul = false,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: azul ? const Color(0xFF1565C0) : Colors.white,
          foregroundColor: azul ? Colors.white : Colors.black87,
          elevation: azul ? 4 : 0,
          side: azul ? null : const BorderSide(color: Colors.black12),
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(texto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      appBar: AppBar(
        title: const Text('Resultado', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1565C0),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            resultadoCard(
              titulo: 'Consumo estimado',
              conteudo: Column(
                children: [
                  Text(
                    consumo.toStringAsFixed(0),
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('kWh'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            resultadoCard(
              titulo: 'Estimativa da conta',
              conteudo: Text(
                'R\$ ${valorConta.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 38,
                  color: Color(0xFF1565C0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.black12),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1565C0),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.lightbulb, color: Colors.white),
                  ),

                  const SizedBox(width: 16),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dica de economia',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Desligue aparelhos da tomada quando não estiver usando. Isso pode reduzir até 10% da sua conta.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            Row(
              children: [
                botao(texto: 'Ver histórico', onTap: () {}),

                const SizedBox(width: 14),

                botao(
                  texto: 'Novo cálculo',
                  azul: true,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const CalcularPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
