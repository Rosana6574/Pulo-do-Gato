import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  // Paleta de Cores mapeada do HTML
  static const Color brandBlue = Color(0xff1565C0);
  static const Color bgGray = Color(0xffF8F9FA);

  // Widget utilitário para estruturar cada card clicável do menu inferior
  Widget _buildMenuItem({
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1a000000), // Soft shadow (menu-card-shadow)
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xffEBF3FE), // bg-blue-50
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: icon),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xff374151), // text-gray-700
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGray,
      body: SafeArea(
        top:
            false, // Permite que a cor azul se estenda até o topo da barra de status
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // HEADER AZUL ARREDONDADO
            Container(
              decoration: const BoxDecoration(
                color: brandBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(24, 64, 24, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Saudação e Avatar do Usuário
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // CORRIGIDO: de 'between' para 'spaceBetween'
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Rota para perfil.dart
                        },
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá,',
                              style: TextStyle(
                                color: Color(0xffE3F2FD),
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
                      ),
                      GestureDetector(
                        onTap: () {
                          // Rota para perfil.dart
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.5),
                              width: 2,
                            ),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 4),
                            ],
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://i1-e.pinimg.com/736x/5a/9c/cb/5a9ccb0f2f0e61d2c96a1a409402001a.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // CARDS DE CONSUMO (ENERGIA E ÁGUA)
                  Row(
                    children: [
                      // Card Energia
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(
                              alpha: 0.2,
                            ), // bg-summary-card com transparência
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Text('⚡ ', style: TextStyle(fontSize: 16)),
                                  // CORRIGIDO: de Colors.whiteEE para Color(0xffEEEEEE)
                                  Text(
                                    'Energia',
                                    style: TextStyle(
                                      color: Color(0xffEEEEEE),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '145 kWh',
                                style: TextStyle(
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
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Card Água
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Text('💧 ', style: TextStyle(fontSize: 16)),
                                  // CORRIGIDO: de Colors.whiteEE para Color(0xffEEEEEE)
                                  Text(
                                    'Água',
                                    style: TextStyle(
                                      color: Color(0xffEEEEEE),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '12 m³',
                                style: TextStyle(
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
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // CONTEÚDO PRINCIPAL (MENU)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Menu',
                      style: TextStyle(
                        color: Color(0xff1F2937),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Item Calculadora
                    _buildMenuItem(
                      icon: const Icon(
                        Icons.calculate_outlined,
                        color: Color(0xff2563EB),
                        size: 26,
                      ),
                      title: 'Calcular consumo',
                      onTap: () {
                        // Ir para calcular.dart
                      },
                    ),

                    // Item Histórico
                    _buildMenuItem(
                      icon: const Icon(
                        Icons.history,
                        color: Color(0xff2563EB),
                        size: 26,
                      ),
                      title: 'Histórico',
                      onTap: () {
                        // Ir para historico.dart
                      },
                    ),

                    // Item Alternativas Econômicas
                    _buildMenuItem(
                      icon: const Icon(
                        Icons.bolt,
                        color: Color(0xff2563EB),
                        size: 26,
                      ),
                      title: 'Alternativas econômicas',
                      onTap: () {
                        // Ir para alternativas.dart
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
