import 'package:flutter/material.dart';
import 'perfil.dart';
import 'calcular.dart';
import 'historico.dart';
import 'alternativas.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  Widget menuCard({
    required IconData icon,
    required String titulo,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: const Color(0xFF1565C0), size: 28),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                titulo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF444444),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget resumoCard({
    required String emoji,
    required String titulo,
    required String valor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.18),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$emoji $titulo',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              valor,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Este mês',
              style: TextStyle(color: Colors.white60, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 60,
              left: 24,
              right: 24,
              bottom: 30,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF1565C0),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá,',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'João',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PerfilPage()),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 42,
                        backgroundImage: NetworkImage(
                          'https://i1-e.pinimg.com/736x/5a/9c/cb/5a9ccb0f2f0e61d2c96a1a409402001a.jpg',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  children: [
                    resumoCard(emoji: '⚡', titulo: 'Energia', valor: '145 kWh'),
                    const SizedBox(width: 14),
                    resumoCard(emoji: '💧', titulo: 'Água', valor: '12 m³'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Menu',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),

                  menuCard(
                    icon: Icons.calculate_outlined,
                    titulo: 'Calcular consumo',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CalcularPage()),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  menuCard(
                    icon: Icons.history,
                    titulo: 'Histórico',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HistoricoPage(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  menuCard(
                    icon: Icons.bolt,
                    titulo: 'Alternativas econômicas',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AlternativasPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
