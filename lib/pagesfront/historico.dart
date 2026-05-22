import 'package:flutter/material.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({super.key});

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xff1565C0);
    const colorBackground = Color(0xffF5F7FA);

    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/telaprincipal');
          },
        ),
        title: const Text(
          'Histórico de consumo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Alternador de Categoria (Energia / Água)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Energia',
                        textAlign: TextAlign.center,
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
                        Navigator.pushReplacementNamed(context, '/historicoo');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.transparent,
                        child: const Text(
                          'Água',
                          textAlign: TextAlign.center,
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
            ),
            const SizedBox(height: 16),

            // Card: Consumo por mês (Gráfico de Barras)
            _buildCard(
              title: 'Consumo por mês',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '180',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '135',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '90',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '45',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '0',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Color(0xfff3f4f6)),
                              bottom: BorderSide(color: Color(0xfff3f4f6)),
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
                            Expanded(
                              child: Text(
                                'Jan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Fev',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Mar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Abr',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Mai',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card: Comparação entre períodos
            _buildCard(
              title: 'Comparação entre períodos',
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Últimos 3 meses',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '157 kWh',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'MÉDIA',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[400],
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 50,
                    color: const Color(0xfff3f4f6),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '3 meses anteriores',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '125 kWh',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'MÉDIA',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[400],
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card: Histórico de Contas
            _buildCard(
              title: 'Histórico de Contas',
              child: Column(
                children: [
                  _buildBillRow('Jan', '145 kWh', 'R\$ 125,50'),
                  const Divider(height: 24, color: Color(0xfff3f4f6)),
                  _buildBillRow('Fev', '102 kWh', 'R\$ 142,80'),
                  const Divider(height: 24, color: Color(0xfff3f4f6)),
                  _buildBillRow('Mar', '128 kWh', 'R\$ 118,20'),
                  const Divider(height: 24, color: Color(0xfff3f4f6)),
                  _buildBillRow('Abr', '178 kWh', 'R\$ 156,40'),
                  const Divider(height: 24, color: Color(0xfff3f4f6)),
                  _buildBillRow('Mai', '165 kWh', 'R\$ 180,00'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card: Gráfico de Termômetro de Consumo Regional
            _buildCard(
              title: 'Consumo',
              titleAction: GestureDetector(
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/informacooeess'),
                child: const Icon(
                  Icons.help_outline,
                  color: Color(0xff2196F3),
                  size: 20,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double leftOffset = constraints.maxWidth * 0.30;
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff76FF03),
                                  Color(0xffFFEB3B),
                                  Color(0xffFF3D00),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -24,
                            left: 0,
                            right: 0,
                            child: const Text(
                              'Seu consumo',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -32,
                            left: leftOffset - 35,
                            child: Column(
                              children: [
                                const Text(
                                  // CORREÇÃO AQUI
                                  'R\$: 180,89',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 16,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 54),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double regionOffset = constraints.maxWidth * 0.75;
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff76FF03),
                                  Color(0xffFFEB3B),
                                  Color(0xffFF3D00),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -24,
                            left: 0,
                            right: 0,
                            child: const Text(
                              'Sua região',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -32,
                            left: regionOffset - 35,
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 16,
                                  color: Colors.black87,
                                ),
                                const Text(
                                  // CORREÇÃO AQUI
                                  'R\$: 560,49',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Card: Resumo do Período
            _buildCard(
              title: '',
              hideTitle: true,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total do período:',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const Text(
                        'R\$ 619,90',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1, color: Color(0xfff3f4f6)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Média mensal:',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const Text(
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

  Widget _buildCard({
    required String title,
    required Widget child,
    Widget? titleAction,
    bool hideTitle = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!hideTitle) ...[
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                if (titleAction != null) ...[
                  const SizedBox(width: 4),
                  titleAction,
                ],
              ],
            ),
            const SizedBox(height: 16),
          ],
          child,
        ],
      ),
    );
  }

  Widget _buildBar(double heightPercentage) {
    return Container(
      width: 32,
      height: 120 * heightPercentage,
      decoration: const BoxDecoration(
        color: Color(0xff1565C0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
      ),
    );
  }

  Widget _buildBillRow(String month, String kwh, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 16,
              color: Colors.black26,
            ),
            const SizedBox(width: 12),
            Text(
              month,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xff374151),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              kwh,
              style: const TextStyle(fontSize: 14, color: Colors.black38),
            ),
            const SizedBox(width: 24),
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff1f2937),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
