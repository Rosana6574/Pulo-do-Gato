import 'package:flutter/material.dart';
import 'informacoes.dart';
import 'resultadocalcular.dart';

class CalcularPage extends StatefulWidget {
  const CalcularPage({super.key});

  @override
  State<CalcularPage> createState() => _CalcularPageState();
}

class _CalcularPageState extends State<CalcularPage> {
  final TextEditingController dataController = TextEditingController();
  final TextEditingController ultimaContaController = TextEditingController();
  final TextEditingController valorAtualController = TextEditingController();

  void mostrarMensagem(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(texto)));
  }

  void formatarData(String value) {
    value = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (value.length > 8) {
      value = value.substring(0, 8);
    }

    String formatado = '';

    for (int i = 0; i < value.length; i++) {
      if (i == 2 || i == 4) {
        formatado += '/';
      }
      formatado += value[i];
    }

    dataController.value = TextEditingValue(
      text: formatado,
      selection: TextSelection.collapsed(offset: formatado.length),
    );
  }

  void calcularConsumo() {
    final String data = dataController.text;
    final double? ultimaConta = double.tryParse(ultimaContaController.text);
    final double? valorAtual = double.tryParse(valorAtualController.text);

    if (data.isEmpty || ultimaConta == null || valorAtual == null) {
      mostrarMensagem('Preencha todos os campos');
      return;
    }

    if (valorAtual < ultimaConta) {
      mostrarMensagem('O valor atual não pode ser menor que o da última conta');
      return;
    }

    final double consumo = valorAtual - ultimaConta;
    final double valorConta = consumo * 0.85;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultadoCalcularPage(
          consumo: consumo,
          valorConta: valorConta,
          dataMedicao: data,
        ),
      ),
    );
  }

  Widget campo({
    required String titulo,
    required TextEditingController controller,
    required String hint,
    bool numero = false,
    Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),

            IconButton(
              icon: const Icon(Icons.info, color: Color(0xFF42A5F5)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InformacoesPage()),
                );
              },
            ),
          ],
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          keyboardType: numero ? TextInputType.number : TextInputType.datetime,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.black12),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),

      appBar: AppBar(
        title: const Text(
          'Calcular consumo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1565C0),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12)],
          ),
          child: Column(
            children: [
              campo(
                titulo: 'Dia da medição da última conta',
                controller: dataController,
                hint: '00/00/0000',
                onChanged: formatarData,
              ),

              const SizedBox(height: 20),

              campo(
                titulo: 'Valor em kWh da última conta',
                controller: ultimaContaController,
                hint: '1200',
                numero: true,
              ),

              const SizedBox(height: 20),

              campo(
                titulo: 'Valor atual de kWh',
                controller: valorAtualController,
                hint: '1345',
                numero: true,
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: calcularConsumo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
