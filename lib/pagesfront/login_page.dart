import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'formatters.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  bool _obscureSenha = true;
  bool _mostrarMensagemSucesso = false;

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
              Container(
                color: puloBlue,
                padding: const EdgeInsets.fromLTRB(24, 64, 24, 80),
                child: Column(
                  children: [
                    Image.network(
                      'https://i.ibb.co/3ycRm6yK/Logo-Pulo-Do-Gato-removebg-preview.png',
                      height: 112,
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
                        color: Color(0x0d000000),
                        blurRadius: 20,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(32, 40, 32, 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (_mostrarMensagemSucesso) ...[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffd1e7dd),
                            border: Border.all(color: const Color(0xffbadbcc)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            'Conta criada com sucesso!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff0f5132),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

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

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
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

                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/telaprincipal',
                          );
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
                              Navigator.pushNamed(context, '/cadastro');
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
