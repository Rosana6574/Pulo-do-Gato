import 'package:flutter/material.dart';

class HistoricooPage extends StatelessWidget {
  const HistoricooPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Cores baseadas no Tailwind do seu HTML
    const Color brandBlue = Color(0xFF1565C0);
    const Color bgGray = Color(0xFFF5F7FA);

    return Scaffold(
      backgroundColor: bgGray,
      appBar: AppBar(
        backgroundColor: brandBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Volta para a tela principal
            Navigator.pushReplacementNamed(context, '/telaprincipal');
          },
        ),
        title: const Text(
          'Histórico de consumo',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Alternador de Categoria (Energia / Água)
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey[200]!),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // Navega para o histórico de Energia (historico.dart)
                        Navigator.pushReplacementNamed(context, '/historico');
                      },
                      child: Text(
                        'Energia',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: brandBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Center(
                        child: Text(
                          'Água',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Gráfico: Consumo por mês
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Consumo por mês',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 150,
                    child: Row(
                      children: [
                        // Eixo Y
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '180',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '135',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '90',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '45',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        // Barras do Gráfico
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildBarChartItem('Jan', 80, brandBlue),
                              _buildBarChartItem('Fev', 120, brandBlue),
                              _buildBarChartItem('Mar', 140, brandBlue),
                              _buildBarChartItem('Abr', 40, brandBlue),
                              _buildBarChartItem('Mai', 80, brandBlue),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Comparação entre períodos
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Comparação entre períodos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Últimos 3 meses',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '44mil L',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'média',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(width: 1, height: 50, color: Colors.grey[200]),
                      const Expanded(
                        child: Column(
                          children: [
                            Text(
                              '3 meses anteriores',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '54mil L',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'média',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Histórico de Contas
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Histórico de Contas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildHistoryRow('Jan', '145mil L', 'R\$ 148,90'),
                      _buildHistoryRow('Fev', '102mil L', 'R\$ 108,80'),
                      _buildHistoryRow('Mar', '128mil L', 'R\$ 125,00'),
                      _buildHistoryRow('Abr', '178mil L', 'R\$ 256,60'),
                      _buildHistoryRow('Mai', '165mil L', 'R\$ 170,90'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Seção de Comparação Regional
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Consumo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D2B4B),
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/informacooeess');
                        },
                        child: const Icon(
                          Icons.help_outline,
                          color: Color(0xFF2196F3),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Indicador "Seu Consumo"
                  const Center(
                    child: Text(
                      'Seu consumo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildGradientBarWithIndicator(
                    indicatorValue: 0.15,
                    label: 'R\$: 180,89',
                    isTop: true,
                  ),

                  const SizedBox(height: 32),

                  // Indicador "Sua Região"
                  const Center(
                    child: Text(
                      'Sua região',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildGradientBarWithIndicator(
                    indicatorValue: 0.75,
                    label: 'R\$: 560,49',
                    isTop: false,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Resumo Total
            _buildCard(
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total do período:',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'R\$ 619,90',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Média mensal:',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        'R\$ 124,80',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper para criar os Cards brancos com sombra sutil
  Widget _buildCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  // Componente de barra individual do gráfico
  Widget _buildBarChartItem(
    String month,
    double heightPercentage,
    Color color,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: heightPercentage,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(month, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  // Linhas do histórico de contas
  Widget _buildHistoryRow(String month, String volume, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey[300]),
              const SizedBox(width: 12),
              Text(
                month,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Text(volume, style: TextStyle(fontSize: 14, color: Colors.grey[400])),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Barra de gradiente (Verde -> Amarelo -> Vermelho) com a setinha indicadora
  Widget _buildGradientBarWithIndicator({
    required double indicatorValue,
    required String label,
    required bool isTop,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double position = constraints.maxWidth * indicatorValue;
        return Column(
          children: [
            if (isTop) ...[
              Padding(
                padding: EdgeInsets.only(left: position - 25),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            Container(
              height: 12,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF76FF03),
                    Color(0xFFFFEB3B),
                    Color(0xFFFF3D00),
                  ],
                ),
              ),
            ),
            if (!isTop) ...[
              Padding(
                padding: EdgeInsets.only(left: position - 25),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.keyboard_arrow_up, size: 16),
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
