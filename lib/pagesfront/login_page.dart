import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'telaprincipal.dart';
import 'cadastro.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
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

class _LoginPageState extends State<LoginPage> {
  final senhaController = TextEditingController();
  final cpfController = TextEditingController();

  bool mostrarSenha = false;
  bool mostrarMensagem = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          mostrarMensagem = false;
        });
      }
    });
  }

  void entrar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TelaPrincipal()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 80),
            decoration: const BoxDecoration(color: Color(0xFF1A73E8)),
            child: Column(
              children: [
                Image.network(
                  'https://i.ibb.co/3ycRm6yK/Logo-Pulo-Do-Gato-removebg-preview.png',
                  height: 110,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Pulo do Gato',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Controle de energia e água',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -35),
              child: Container(
                padding: const EdgeInsets.all(28),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black12)],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (mostrarMensagem)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Center(
                            child: Text(
                              'Conta criada com sucesso!',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                      const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 35),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Senha',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: senhaController,
                        obscureText: !mostrarSenha,
                        maxLength: 6,
                        decoration: InputDecoration(
                          hintText: 'Digite sua senha',
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              mostrarSenha
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                mostrarSenha = !mostrarSenha;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'CPF',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: cpfController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          hintText: '000.000.000-00',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(color: Color(0xFF1A73E8)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: entrar,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1A73E8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não tem uma conta? '),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CadastroPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Criar conta',
                              style: TextStyle(
                                color: Color(0xFF1A73E8),
                                fontWeight: FontWeight.bold,
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
          ),
        ],
      ),
    );
  }
}
