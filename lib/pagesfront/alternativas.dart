import 'package:flutter/material.dart';

class AlternativasPage extends StatefulWidget {
  const AlternativasPage({super.key});

  @override
  State<AlternativasPage> createState() => _AlternativasPageState();
}

class _AlternativasPageState extends State<AlternativasPage> {
  final double precoLuxen = 150.50;
  final double precoLuvolt = 170.80;
  final double precoNexvolt = 190.20;

  final double valorContaCelpe = 356.80;
  final int consumoKwh = 178;

  String calcularPorcentagem(double celpe, double empresa) {
    if (celpe <= 0) return "0.0";
    double diferenca = ((celpe - empresa) / celpe) * 100;
    return diferenca.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xff1565C0);
    const colorBackground = Color(0xfff9f9ff);

    String pLuxen = calcularPorcentagem(valorContaCelpe, precoLuxen);
    String pLuvolt = calcularPorcentagem(valorContaCelpe, precoLuvolt);
    String pNexvolt = calcularPorcentagem(valorContaCelpe, precoNexvolt);

    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        elevation: 4,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/telaprincipal');
          },
        ),
        title: const Text(
          'Alternativas Econômicas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildAccordionCard(
              logoUrlEmpresa:
                  'https://i.ibb.co/2YLWv0Zz/Gemini-Generated-Image-hje0zuhje0zuhje0.png',
              nomeEmpresa: 'Luxen',
              precoEmpresa: precoLuxen,
              porcentagemEconomia: pLuxen,
              barPosEmpresa: 0.20,
              barPosCelpe: 0.85,
              graficoColorsEmpresa: const [Colors.blue, Colors.blueAccent],
            ),
            const SizedBox(height: 16),
            _buildAccordionCard(
              logoUrlEmpresa:
                  'https://i.ibb.co/nqb0dMgQ/Gemini-Generated-Image-98w9c898w9c898w9.png',
              nomeEmpresa: 'Luvolt',
              precoEmpresa: precoLuvolt,
              porcentagemEconomia: pLuvolt,
              barPosEmpresa: 0.25,
              barPosCelpe: 0.85,
              graficoColorsEmpresa: const [Colors.blue, Colors.blueAccent],
            ),
            const SizedBox(height: 16),
            _buildAccordionCard(
              logoUrlEmpresa:
                  'https://i.ibb.co/yBQNNKBM/Gemini-Generated-Image-vglcfqvglcfqvglc.png',
              nomeEmpresa: 'NexVolt',
              precoEmpresa: precoNexvolt,
              porcentagemEconomia: pNexvolt,
              barPosEmpresa: 0.35,
              barPosCelpe: 0.85,
              graficoColorsEmpresa: const [Colors.blue, Colors.blueAccent],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccordionCard({
    required String logoUrlEmpresa,
    required String nomeEmpresa,
    required double precoEmpresa,
    required String porcentagemEconomia,
    required double barPosEmpresa,
    required double barPosCelpe,
    required List<Color> graficoColorsEmpresa,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffd1d5db)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/informacooeess');
              },
              child: const Icon(
                Icons.help_outline,
                color: Color(0xff2196F3),
                size: 20,
              ),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/8/8b/Celpe.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Celpe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$consumoKwh kWh',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '$porcentagemEconomia%',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'R\$ ${valorContaCelpe.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: const Color(0xff002B5B),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(logoUrlEmpresa, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        nomeEmpresa,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '$consumoKwh kWh',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const Text(
                        '0%',
                        style: TextStyle(
                          color: Color(0xff1565C0),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'R\$ ${precoEmpresa.toStringAsFixed(2)}/mês',
                        style: const TextStyle(
                          color: Color(0xff1565C0),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xffe5e7eb))),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMiniChart(
                        'Consumo por mês, $nomeEmpresa',
                        graficoColorsEmpresa,
                      ),
                      const SizedBox(height: 24),
                      _buildMiniChart('Consumo por mês, Celpe', [
                        Colors.orangeAccent,
                        Colors.orange,
                      ]),
                      const SizedBox(height: 24),
                      const Text(
                        'Consumo',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildGradientIndicator(
                        nomeEmpresa,
                        'R\$ ${precoEmpresa.toStringAsFixed(2)}',
                        barPosEmpresa,
                        const Color(0xff1565C0),
                      ),
                      const SizedBox(height: 16),
                      _buildGradientIndicator(
                        'Sua Celpe',
                        'R\$ ${valorContaCelpe.toStringAsFixed(2)}',
                        barPosCelpe,
                        Colors.red,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniChart(String title, List<Color> barColors) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _chartBar(80, barColors),
                _chartBar(80 * 0.90, barColors),
                _chartBar(80 * 0.95, barColors),
                _chartBar(80, barColors),
                _chartBar(80 * 0.98, barColors),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  'Jan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Expanded(
                child: Text(
                  'Fev',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Expanded(
                child: Text(
                  'Mar',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Expanded(
                child: Text(
                  'Abr',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              Expanded(
                child: Text(
                  'Mai',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chartBar(double height, List<Color> colors) {
    return Container(
      width: 24,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    );
  }

  Widget _buildGradientIndicator(
    String label,
    String valor,
    double percentOffset,
    Color textColor,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            Text(
              valor,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        LayoutBuilder(
          builder: (context, constraints) {
            double pointerLeftPosition = constraints.maxWidth * percentOffset;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff4ADE80),
                        Color(0xffFACC15),
                        Color(0xffEF4444),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: pointerLeftPosition,
                  top: -2,
                  child: Container(
                    width: 4,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
