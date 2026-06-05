import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CalcularConsumoPage extends StatefulWidget {
  // CORREÇÃO 1: Usando super parameter
  const CalcularConsumoPage({super.key});

  @override
  State<CalcularConsumoPage> createState() => _CalcularConsumoPageState();
}

class _CalcularConsumoPageState extends State<CalcularConsumoPage> {
  final TextEditingController _dataMedicaoController = TextEditingController();
  final TextEditingController _ultimaContaController = TextEditingController();
  final TextEditingController _valorAtualController = TextEditingController();

  // Cores do Tailwind traduzidas para o Flutter
  final Color brandBlue = const Color(0xFF1565C0);
  final Color lightGrayBg = const Color(0xFFF5F7F9);
  final Color infoBlue = const Color(0xFF42A5F5);

  Future<void> _calcularConsumo() async {
    final String dataMedicao = _dataMedicaoController.text;
    final double? ultimaConta = double.tryParse(_ultimaContaController.text);
    final double? valorAtual = double.tryParse(_valorAtualController.text);

    // Validação de campos vazios
    if (dataMedicao.isEmpty || ultimaConta == null || valorAtual == null) {
      _mostrarAlerta("Preencha todos os campos.");
      return;
    }

    // Validação lógica de negócio
    if (valorAtual < ultimaConta) {
      _mostrarAlerta("O valor atual não pode ser menor que o da última conta.");
      return;
    }

    // Cálculos
    final double consumo = valorAtual - ultimaConta;
    const double tarifa = 0.85;
    final double valorConta = consumo * tarifa;

    // Salvando no "localStorage" (SharedPreferences do Dart)
    final prefs = await SharedPreferences.getInstance();

    await prefs.setDouble('consumo', consumo);
    await prefs.setString('valorConta', valorConta.toStringAsFixed(2));
    await prefs.setString('dataMedicao', dataMedicao);

    // Lógica do Histórico
    List<String> historicoString =
        prefs.getStringList('historicoConsumo') ?? [];
    List<Map<String, dynamic>> historico = historicoString
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();

    historico.add({'data': dataMedicao, 'consumo': consumo});

    // Converte de volta para string para salvar
    List<String> novoHistoricoString = historico
        .map((item) => jsonEncode(item))
        .toList();
    await prefs.setStringList('historicoConsumo', novoHistoricoString);

    // Navegação para a próxima tela
    if (mounted) {
      // Substitua pelo nome da sua rota ou componente de resultado
      // Navigator.pushNamed(context, '/resultadoCalcular');
      _mostrarAlerta(
        "Cálculo realizado e salvo com sucesso!\nValor: R\$ ${valorConta.toStringAsFixed(2)}",
        isError: false,
      );
    }
  }

  void _mostrarAlerta(String mensagem, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: isError ? Colors.redAccent : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _navegarParaInformacoes() {
    // Substitua pela navegação da sua tela de informações
    // Navigator.pushNamed(context, '/informacoes');

    // CORREÇÃO 2: Substituído print por debugPrint
    debugPrint("Navegando para Informações...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrayBg,
      appBar: AppBar(
        backgroundColor: brandBlue,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Comportamento de voltar
          },
        ),
        title: const Text(
          'Calcular consumo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputField(
                label: "Dia da medição da última conta",
                controller: _dataMedicaoController,
                hintText: "00/00/0000",
                keyboardType: TextInputType.number,
                formatters: [_DateInputFormatter()],
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              const SizedBox(height: 24),
              _buildInputField(
                label: "Valor em kWh da última conta",
                controller: _ultimaContaController,
                hintText: "Ex: 1200",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              _buildInputField(
                label: "Valor atual de kWh",
                controller: _valorAtualController,
                hintText: "Ex: 1345",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _calcularConsumo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: brandBlue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget construtor de campos para evitar repetição de código
  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required TextInputType keyboardType,
    List<TextInputFormatter>? formatters,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 4),
            InkWell(
              onTap: _navegarParaInformacoes,
              child: Icon(Icons.info, color: infoBlue, size: 18),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: formatters,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black38),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: brandBlue, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

// Formatador personalizado para a máscara de data (DD/MM/YYYY) idêntica ao JS
class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (text.length > 8) text = text.substring(0, 8);

    String newText = '';
    for (int i = 0; i < text.length; i++) {
      newText += text[i];
      if ((i == 1 || i == 3) && i != text.length - 1) {
        newText += '/';
      }
    }

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
