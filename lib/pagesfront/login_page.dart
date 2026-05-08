import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const PuloDoGatoApp());
}

class PuloDoGatoApp extends StatelessWidget {
  const PuloDoGatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pulo do Gato',
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool mostrarSenha = false;

  final senhaController = TextEditingController();
  final cpfController = TextEditingController();

  String formatarCPF(String value) {
    value = value.replaceAll(RegExp(r'\D'), '');

    if (value.length > 11) {
      value = value.substring(0, 11);
    }

    if (value.length > 9) {
      return '${value.substring(0, 3)}.${value.substring(3, 6)}.${value.substring(6, 9)}-${value.substring(9)}';
    } else if (value.length > 6) {
      return '${value.substring(0, 3)}.${value.substring(3, 6)}.${value.substring(6)}';
    } else if (value.length > 3) {
      return '${value.substring(0, 3)}.${value.substring(3)}';
    }

    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 80),
            color: const Color(0xFF1A73E8),
            child: Column(
              children: [
                Image.network(
                  'https://lh3.googleusercontent.com/aida/ADBb0ujXnM7fZWJcJQOMqP1rFgKjUaSuAZYAnsg8KlmdkyOJf9MbTw9w8wGvX5eTCvEYkNArhKJBw8ip7p1x8a64g5-dozlO_cB7UVSKjZPGsNLvTwnYned1mEryiKgJxgbmby13MaEBQiK6uw4jjwo4wGeSlKgKx-VSXqnbWkXZGVRoIxhmeqnhw7719rOvkQ2CBwpZ4JepTMVM7omIhYgBtnwcGh4O3O8EkNhKk1W-R5lRTc6ZjdSE9ZtK6ioave7hD6LdYX0pcghc',
                  height: 100,
                ),
                const SizedBox(height: 20),

                const Text(
                  'Pulo do Gato',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'Controle de energia e água',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),

              child: ListView(
                children: [
                  const Center(
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // SENHA
                  TextField(
                    controller: senhaController,
                    obscureText: !mostrarSenha,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          mostrarSenha
                              ? Icons.visibility_off
                              : Icons.visibility,
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

                  // CPF
                  TextField(
                    controller: cpfController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      final formatted = formatarCPF(value);

                      cpfController.value = TextEditingValue(
                        text: formatted,
                        selection: TextSelection.collapsed(
                          offset: formatted.length,
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A73E8),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TelaPrincipal(),
                        ),
                      );
                    },
                    child: const Text('Entrar', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Principal'),
        backgroundColor: const Color(0xFF1A73E8),
      ),
      body: const Center(child: Text('Bem-vindo ao Pulo do Gato')),
    );
  }
}
