import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CalcularPage extends StatefulWidget {
  const CalcularPage({super.key}); // Corrigido para super.key

  @override
  State<CalcularPage> createState() => _CalcularPageState();
}

class _CalcularPageState extends State<CalcularPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _ultimaContaController = TextEditingController();
  final TextEditingController _valorAtualController = TextEditingController();

  final Color brandBlue = const Color(0xFF1565C0);
  final Color lightGrayBg = const Color(0xFFF5F7F9);
  final Color infoBlue = const Color(0xFF42A5F5);

  @override
  void dispose() {
    _dataController.dispose();
    _ultimaContaController.dispose();
    _valorAtualController.dispose();
    super.dispose();
  }

  Future<void> _calcularConsumo() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String dataMedicao = _dataController.text;
    final double? ultimaConta = double.tryParse(_ultimaContaController.text);
    final double? valorAtual = double.tryParse(_valorAtualController.text);

    if (ultimaConta == null || valorAtual == null) {
      _mostrarAlerta("Preencha os campos com valores numéricos válidos.");
      return;
    }

    if (valorAtual < ultimaConta) {
      _mostrarAlerta("O valor atual não pode ser menor que o da última conta.");
      return;
    }

    final double consumo = valorAtual - ultimaConta;
    const double tarifa = 0.85;
    final double valorConta = consumo * tarifa;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setDouble('consumo', consumo);
    await prefs.setString('valorConta', valorConta.toStringAsFixed(2));
    await prefs.setString('dataMedicao', dataMedicao);

    List<String> historicoStringList =
        prefs.getStringList('historicoConsumo') ?? [];

    Map<String, dynamic> novoRegistro = {
      'data': dataMedicao,
      'consumo': consumo,
    };

    historicoStringList.add(jsonEncode(novoRegistro));
    await prefs.setStringList('historicoConsumo', historicoStringList);

    if (mounted) {
      Navigator.pushNamed(context, '/resultadocalcular');
    }
  }

  void _mostrarAlerta(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Aviso"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
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
            Navigator.pushNamed(context, '/telaprincipal');
          },
        ),
        title: const Text(
          "Calcular consumo",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(
                  0xFF000000,
                ).withValues(alpha: 0.08), // Corrigido withOpacity antigo
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabelWithInfo("Dia da medição da última conta"),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _dataController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    _DateInputFormatter(),
                  ],
                  decoration: _buildInputDecoration(
                    "00/00/0000",
                    Icons.calendar_today_outlined,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório"; // Corrigido chaves estruturais
                    }
                    if (value.length < 10) {
                      return "Insira uma data válida";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                _buildLabelWithInfo("Valor em kWh da última conta"),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _ultimaContaController,
                  keyboardType: TextInputType.number,
                  decoration: _buildInputDecoration("Ex: 1200", null),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Campo obrigatório"
                      : null,
                ),
                const SizedBox(height: 24),

                _buildLabelWithInfo("Valor atual de kWh"),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _valorAtualController,
                  keyboardType: TextInputType.number,
                  decoration: _buildInputDecoration("Ex: 1345", null),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Campo obrigatório"
                      : null,
                ),
                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _calcularConsumo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: brandBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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

  Widget _buildLabelWithInfo(String text) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/informacooeess');
          },
          child: Icon(Icons.info, color: infoBlue, size: 18),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData? suffixIcon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      suffixIcon: suffixIcon != null
          ? Icon(suffixIcon, color: const Color(0xFF9CA3AF))
          : null,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: brandBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}

class _DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex == 2 && text.length > 2) {
        buffer.write('/');
      } else if (nonZeroIndex == 4 && text.length > 4) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
