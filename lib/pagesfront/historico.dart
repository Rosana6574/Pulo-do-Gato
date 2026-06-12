import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  double valorCalculado = 180.89; // Substitui o localStorage do JS
  List<FlSpot> spots = [];
  List<String> datas = [];

  @override
  void initState() {
    super.initState();
    _gerarDadosDoGrafico();
  }

  void _gerarDadosDoGrafico() {
    // Lógica traduzida do seu JavaScript para gerar os preços e datas
    double gerarPreco(double base) {
      return base + (Random().nextDouble() * 150 - 50);
    }

    DateTime hoje = DateTime.now();
    String dataAtual =
        "${hoje.day.toString().padLeft(2, '0')}/${hoje.month.toString().padLeft(2, '0')}/${hoje.year}";

    datas = [
      "09/05/2026", // dataCalculada
      dataAtual,
      "15/03/2026",
      "18/02/2026",
    ];

    spots = [
      FlSpot(0, valorCalculado),
      FlSpot(1, double.parse(gerarPreco(valorCalculado).toStringAsFixed(2))),
      FlSpot(2, double.parse(gerarPreco(valorCalculado).toStringAsFixed(2))),
      FlSpot(3, double.parse(gerarPreco(valorCalculado).toStringAsFixed(2))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // --bg-gray do seu CSS
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0), // --primary-blue
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Histórico de consumo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCategoryToggle(),
            const SizedBox(height: 16),
            _buildMonthlyChartCard(),
            const SizedBox(height: 16),
            _buildComparisonCard(),
            const SizedBox(height: 16),
            _buildLineChartCard(), // Aqui entra o fl_chart corrigido
            const SizedBox(height: 16),
            _buildBillsHistory(),
            const SizedBox(height: 16),
            _buildRegionalComparison(), // O termômetro de cores
            const SizedBox(height: 16),
            _buildPeriodSummary(),
          ],
        ),
      ),
    );
  }

  // 1. Toggle de Energia/Água
  Widget _buildCategoryToggle() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1565C0),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Energia',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/historicoo');
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Água',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. Gráfico de Barras Mensal (Feito com Containers em vez de bibliotecas)
  Widget _buildMonthlyChartCard() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Consumo por mês',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Eixo Y
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '180',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '135',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '90',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '45',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 12),
                  Text('0', style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 8),
              // Barras e Eixo X
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Colors.black12),
                          bottom: BorderSide(color: Colors.black12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildBar(0.85),
                          _buildBar(0.70),
                          _buildBar(0.85),
                          _buildBar(0.65),
                          _buildBar(0.55),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Jan',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          'Fev',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          'Mar',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          'Abr',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        Text(
                          'Mai',
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double heightFactor) {
    return FractionallySizedBox(
      heightFactor: heightFactor,
      child: Container(
        width: 24,
        decoration: const BoxDecoration(
          color: Color(0xFF1565C0),
          borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
        ),
      ),
    );
  }

  // 3. Comparação de Períodos
  Widget _buildComparisonCard() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Comparação entre períodos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Últimos 3 meses',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      '157 kWh',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'MÉDIA',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(width: 1, height: 50, color: Colors.grey.shade200),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3 meses anteriores',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      '125 kWh',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'MÉDIA',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 4. O Gráfico fl_chart Corrigido
  Widget _buildLineChartCard() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Consumo de energia",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1d2b4b),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ), // Omitido p/ visual clean igual ao HTML
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          'R\$ ${value.toInt()}',
                          style: const TextStyle(fontSize: 10),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: const Color(0xFF1565C0),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: true),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xFF1565C0).withValues(alpha: 0.15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 5. Histórico em Lista
  Widget _buildBillsHistory() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Histórico de Contas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildHistoryRow('Jan', '145 kWh', 'R\$ 125,50'),
          _buildHistoryRow('Fev', '102 kWh', 'R\$ 142,80'),
          _buildHistoryRow('Mar', '128 kWh', 'R\$ 118,20'),
          _buildHistoryRow('Abr', '178 kWh', 'R\$ 156,40'),
          _buildHistoryRow('Mai', '165 kWh', 'R\$ 180,00'),
        ],
      ),
    );
  }

  Widget _buildHistoryRow(String month, String kwh, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(month, style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
          Row(
            children: [
              Text(
                kwh,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(width: 16),
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  // 6. Termômetros (Gradients + Stack em vez de position absoluta no CSS)
  Widget _buildRegionalComparison() {
    // Calculando a posição no termômetro como no seu JS
    double maximo = 600.0;
    double porcentagem = (valorCalculado / maximo).clamp(0.05, 0.95);
    // Convertendo a porcentagem (0.0 a 1.0) para Alignment do Flutter (-1.0 a 1.0)
    double alignX = (porcentagem * 2) - 1;

    return _buildCard(
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
                  color: Color(0xFF1d2b4b),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.help_outline, color: Colors.blue),
                onPressed: () => Navigator.pushNamed(context, '/informacoes'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Termômetro 1: Seu consumo
          const Center(
            child: Text(
              'Seu consumo',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 30),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _buildGradientBar(),
              Align(
                alignment: Alignment(alignX, 0),
                child: FractionalTranslation(
                  translation: const Offset(0, -1.2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'R\$: ${valorCalculado.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Termômetro 2: Sua região
          const Center(
            child: Text(
              'Sua região',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 8),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _buildGradientBar(),
              const Align(
                alignment: Alignment(0.5, 0), // Equivale a left: 75% no HTML
                child: FractionalTranslation(
                  translation: Offset(0, 1.2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.keyboard_arrow_up, size: 16),
                      Text(
                        'R\$: 560,49',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildGradientBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF76FF03), Color(0xFFFFEB3B), Color(0xFFFF3D00)],
          stops: [0.0, 0.5, 1.0],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
          ), // Inner shadow simulado
        ],
      ),
    );
  }

  // 7. Resumo do Período
  Widget _buildPeriodSummary() {
    return _buildCard(
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total do período:', style: TextStyle(color: Colors.grey)),
              Text(
                'R\$ 619,90',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(height: 24, thickness: 1, color: Colors.black12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Média mensal:', style: TextStyle(color: Colors.grey)),
              Text(
                'R\$ 124,80',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Utilitário para padronizar os cartões brancos com sombra
  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
