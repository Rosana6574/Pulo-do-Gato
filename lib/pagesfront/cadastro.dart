import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 11) text = text.substring(0, 11);

    String formatted = '';

    for (int i = 0; i < text.length; i++) {
      if (i == 3 || i == 6) formatted += '.';
      if (i == 9) formatted += '-';
      formatted += text[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 8) text = text.substring(0, 8);

    String formatted = '';

    for (int i = 0; i < text.length; i++) {
      if (i == 5) formatted += '-';
      formatted += text[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class _CadastroPageState extends State<CadastroPage> {
  bool mostrarSenha = false;
  bool mostrarConfirmar = false;
  bool tarifaSocial = false;

  String residenciaSelecionada = '';

  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarController = TextEditingController();
  final cepController = TextEditingController();

  void criarConta() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  Widget campo({
    required String label,
    required TextEditingController controller,
    bool senha = false,
    bool confirmar = false,
    List<TextInputFormatter>? formatters,
    TextInputType? teclado,
  }) {
    bool obscure = senha
        ? !mostrarSenha
        : confirmar
        ? !mostrarConfirmar
        : false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          keyboardType: teclado,
          maxLength: senha || confirmar ? 6 : null,
          inputFormatters: formatters,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            suffixIcon: senha || confirmar
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        if (senha) {
                          mostrarSenha = !mostrarSenha;
                        } else {
                          mostrarConfirmar = !mostrarConfirmar;
                        }
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget residencia(String tipo) {
    bool selecionado = residenciaSelecionada == tipo;

    return GestureDetector(
      onTap: () {
        setState(() {
          residenciaSelecionada = tipo;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: selecionado ? const Color(0xFF1A73E8) : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            tipo,
            style: TextStyle(
              color: selecionado ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1A73E8),
        title: const Text('Criar conta', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preencha seus dados para criar sua conta e começar a economizar.',
              style: TextStyle(color: Color(0xFF5E6C84), fontSize: 15),
            ),

            const SizedBox(height: 25),

            campo(label: 'Nome completo', controller: nomeController),

            const SizedBox(height: 18),

            campo(
              label: 'CPF',
              controller: cpfController,
              teclado: TextInputType.number,
              formatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),

            const SizedBox(height: 18),

            campo(label: 'E-mail', controller: emailController),

            const SizedBox(height: 18),

            campo(label: 'Senha', controller: senhaController, senha: true),

            const SizedBox(height: 18),

            campo(
              label: 'Confirmar Senha',
              controller: confirmarController,
              confirmar: true,
            ),

            const SizedBox(height: 18),

            campo(
              label: 'CEP',
              controller: cepController,
              teclado: TextInputType.number,
              formatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Tipo de residência',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 2.7,
              children: [
                residencia('Apartamento'),
                residencia('Casa'),
                residencia('Kitnet'),
                residencia('Sobrado'),
              ],
            ),

            const SizedBox(height: 28),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tarifa social',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Switch(
                        value: tarifaSocial,
                        onChanged: (value) {
                          setState(() {
                            tarifaSocial = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const Text(
                    'Marque se sua residência é cadastrada no programa de tarifa social.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: criarConta,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Criar conta',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
