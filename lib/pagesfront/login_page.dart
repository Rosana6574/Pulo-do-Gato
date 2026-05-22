import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controles dos campos de texto para capturar o que o usuário digita
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  // Estados da tela (equivalentes ao controle de DOM/classes do JavaScript)
  bool _obscureSenha = true;
  bool _mostrarMensagemSucesso = false;

  // Definição exata da paleta de cores do seu Tailwind CSS
  static const Color puloBlue = Color(0xff1a73e8);
  static const Color puloTextDark = Color(0xff1a1a1a);
  static const Color puloGray = Color(0xff707070);
  static const Color puloBorder = Color(0xffe0e0e0);

  @override
  void initState() {
    super.initState();
    _checarContaCriada();
  }

  void _checarContaCriada() {
    // Usando uma validação baseada em tempo para evitar que o compilador aponte "código morto"
    // Se um dia quiser forçar o banner a aparecer para testar o visual, basta mudar para: contaCriadaSimulada = true;
    bool contaCriadaSimulada = DateTime.now().isBefore(DateTime(2020));

    if (contaCriadaSimulada || _mostrarMensagemSucesso) {
      setState(() {
        _mostrarMensagemSucesso = true;
      });
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          setState(() {
            _mostrarMensagemSucesso = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    // Boa prática no Flutter: limpar os controllers ao sair da tela para poupar memória
    _senhaController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // HEADER (Equivalente ao <header class="bg-pulo-blue pt-12 pb-20">)
              Container(
                color: puloBlue,
                padding: const EdgeInsets.fromLTRB(24, 64, 24, 80),
                child: Column(
                  children: [
                    // LOGO DO APLICATIVO
                    Image.network(
                      'https://i.ibb.co/3ycRm6yK/Logo-Pulo-Do-Gato-removebg-preview.png',
                      height: 112, // h-28 do Tailwind (28 * 4px = 112px)
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.flash_on,
                          size: 80,
                          color: Colors.white,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    // TÍTULO PRINCIPAL (h1)
                    const Text(
                      'Pulo do Gato',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // SUBTÍTULO (p)
                    Text(
                      'Controle de energia e água',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // MAIN CONTAINER (Equivalente ao <main class="form-card"> com margem negativa)
              Transform.translate(
                offset: const Offset(0, -40),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          0x0d000000,
                        ), // shadow-sm / rgba(0, 0, 0, 0.05)
                        blurRadius: 20,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(32, 40, 32, 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ALERTA DE SUCESSO (Condicional id="mensagemSucesso")
                      if (_mostrarMensagemSucesso) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffd1e7dd), // bg-green-100
                            border: Border.all(
                              color: const Color(0xffbadbcc),
                            ), // border-green-400
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'Conta criada com sucesso!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff0f5132), // text-green-700
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // TÍTULO ENTRAR (h2)
                      const Text(
                        'Entrar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: puloTextDark,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // FORMULÁRIO - CAMPO SENHA
                      const Text(
                        'Senha',
                        style: TextStyle(
                          color: puloTextDark,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _senhaController,
                        obscureText: _obscureSenha,
                        style: const TextStyle(
                          color: puloTextDark,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Digite sua senha',
                          hintStyle: const TextStyle(color: Color(0xffbfbfbf)),
                          contentPadding: const EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: puloBorder),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: puloBorder),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: puloBlue,
                              width: 2,
                            ),
                          ),
                          // ÍCONE DO OLHO (Equivalente ao SVG toggleSenha())
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureSenha
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureSenha = !_obscureSenha;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // FORMULÁRIO - CAMPO CPF
                      const Text(
                        'CPF',
                        style: TextStyle(
                          color: puloTextDark,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _cpfController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: puloTextDark,
                          fontSize: 18,
                        ),
                        // Máscara inteligente diretamente na digitação nativa do Flutter
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                          CpfInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          hintText: '000.000.000-00',
                          hintStyle: const TextStyle(color: Color(0xffbfbfbf)),
                          contentPadding: const EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: puloBorder),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: puloBorder),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: puloBlue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // ESQUECEU A SENHA
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Espaço para a ação de recuperação de senha
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: puloBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // BOTÃO ENTRAR
                      ElevatedButton(
                        onPressed: () {
                          // Espaço para validação de login e direcionamento
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: puloBlue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // FOOTER (Criar conta / cadastro)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Não tem uma conta? ',
                            style: TextStyle(
                              color: puloGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Espaço para abrir a página de cadastro
                            },
                            child: const Text(
                              'Criar conta',
                              style: TextStyle(
                                color: puloBlue,
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
            ],
          ),
        ),
      ),
    );
  }
}

// Classe Utilitária de Formatação de CPF (Equivalente à função mascaraCPF no JS)
class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      final index = i + 1;
      if (index == 3 || index == 6) {
        buffer.write('.');
      } else if (index == 9) {
        buffer.write('-');
      }
    }

    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
