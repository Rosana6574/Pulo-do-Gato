import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultadoCalcularPage extends StatefulWidget {
  const ResultadoCalcularPage({super.key});

  @override
  State<ResultadoCalcularPage> createState() => _ResultadoCalcularPageState();
}

class _ResultadoCalcularPageState extends State<ResultadoCalcularPage> {
  String _consumo = "0";
  String _valorConta = "0,00";

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  // Recupera dados do dispositivo (Equivalente ao localStorage)
  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();

    // CORREÇÃO: Pegamos o consumo como 'Double' (pois foi salvo assim)
    // e depois convertemos para texto (String) para exibir na tela.
    final double consumoDouble = prefs.getDouble('consumo') ?? 0.0;

    setState(() {
      // toStringAsFixed(0) tira as casas decimais (ex: 120.0 vira 120)
      _consumo = consumoDouble.toStringAsFixed(0);
      _valorConta = prefs.getString('valorConta') ?? "0,00";
    });
  }

  @override
  Widget build(BuildContext context) {
    // Cores baseadas na sua paleta Tailwind
    const colorPrimary = Color(0xff1565C0);
    const colorBackground = Color(0xfff9f9ff);
    const colorSurface = Colors.white;
    const colorTextOnSurfaceVariant = Color(0xff424752);
    const colorTextOnBackground = Color(0xff191c21);

    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/telaprincipal');
          },
        ),
        title: const Text(
          'Resultado',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Seção: Consumo Estimado
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Consumo estimado',
                        style: TextStyle(
                          color: colorTextOnSurfaceVariant,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _consumo,
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                          color: colorTextOnBackground,
                          height: 1.1,
                        ),
                      ),
                      const Text(
                        'kWh',
                        style: TextStyle(
                          color: colorTextOnSurfaceVariant,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Seção: Estimativa da conta
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Estimativa da conta',
                        style: TextStyle(
                          color: colorTextOnSurfaceVariant,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'R\$ $_valorConta',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: colorPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Seção: Dica de Economia
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colorSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: colorPrimary,
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: colorTextOnBackground,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Desligue aparelhos da tomada quando não estiver usando. Isso pode reduzir até 10% da sua conta.',
                              style: TextStyle(
                                fontSize: 16,
                                color: colorTextOnSurfaceVariant,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Botões de Ação
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/historico');
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          'Ver histórico',
                          style: TextStyle(
                            color: colorTextOnSurfaceVariant,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/calcular');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: const StadiumBorder(),
                          elevation: 2,
                        ),
                        child: const Text(
                          'Novo cálculo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
