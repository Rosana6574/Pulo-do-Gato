import 'package:flutter/material.dart';

// Importação das telas de destino
// Certifique-se de que os nomes dos arquivos e das classes estão corretos no seu projeto.
import 'perfil.dart';
import 'calcular.dart';
import 'historico.dart';
import 'alternativas.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  // Cores personalizadas baseadas no seu CSS
  static const Color brandBlue = Color(0xFF1565C0);
  static const Color bgLight = Color(0xFFF8F9FA);
  static const Color textDark = Color(0xFF1F2937); // gray-800
  static const Color textGray = Color(0xFF374151); // gray-700
  static const Color iconBg = Color(0xFFEFF6FF); // blue-50
  static const Color iconColor = Color(0xFF2563EB); // blue-600

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLight,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // HEADER
          _buildHeader(context),

          // MAIN MENU
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // BOTÃO: Calcular Consumo
                  _buildMenuItem(
                    icon: Icons.calculate_outlined, // Ícone similar ao SVG
                    title: 'Calcular consumo',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // Substitua pelo nome exato da classe em calcular.dart
                          builder: (context) => const CalcularPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // BOTÃO: Histórico
                  _buildMenuItem(
                    icon: Icons.history, // Ícone similar ao SVG
                    title: 'Histórico',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // Substitua pelo nome exato da classe em historico.dart
                          builder: (context) => const HistoricoPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  // BOTÃO: Alternativas Econômicas
                  _buildMenuItem(
                    icon: Icons.bolt, // Ícone similar ao SVG
                    title: 'Alternativas econômicas',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // Substitua pelo nome exato da classe em alternativas.dart
                          builder: (context) => const AlternativasPage(),
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

  // --- Widgets Auxiliares ---

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 32),
      decoration: const BoxDecoration(
        color: brandBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // TOPO DO HEADER (Olá João + Avatar que leva ao perfil)
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // Substitua pelo nome exato da classe em perfil.dart
                  builder: (context) => const PerfilPage(),
                ),
              );
            },
            // Usando Colors.transparent para garantir que a área toda seja clicável
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá,',
                      style: TextStyle(
                        color: Color(0xFFDBEAFE), // blue-100
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'João',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 2,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0D000000), // shadow-sm
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://i1-e.pinimg.com/736x/5a/9c/cb/5a9ccb0f2f0e61d2c96a1a409402001a.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // CARDS DE RESUMO (Energia e Água)
          Row(
            children: [
              Expanded(
                child: _buildSummaryCard(
                  icon: '⚡',
                  title: 'Energia',
                  value: '145 kWh',
                  iconColor: Colors.yellow[400]!,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildSummaryCard(
                  icon: '💧',
                  title: 'Água',
                  value: '12 m³',
                  iconColor: Colors.blue[200]!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard({
    required String icon,
    required String title,
    required String value,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // Cor do background equivalente ao --card-bg-light-blue
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: TextStyle(color: iconColor, fontSize: 16)),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Este mês',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000), // shadow mix
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: textGray,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
