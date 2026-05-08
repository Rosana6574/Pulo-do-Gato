import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const SignupApp());
}

class SignupApp extends StatelessWidget {
  const SignupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Criar Conta',
      home: const SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool mostrarSenha = false;
  bool mostrarConfirmar = false;
  bool tarifaSocial = false;

  String residenciaSelecionada = '';

  final cpfController = TextEditingController();
  final cepController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarController = TextEditingController();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();

  String formatarCPF(String value) {
    value = value.replaceAll(RegExp(r'\D'), '');

    if (value.length > 11) value = value.substring(0, 11);

    if (value.length > 9) {
      return '${value.substring(0, 3)}.${value.substring(3, 6)}.${value.substring(6, 9)}-${value.substring(9)}';
    } else if (value.length > 6) {
      return '${value.substring(0, 3)}.${value.substring(3, 6)}.${value.substring(6)}';
    } else if (value.length > 3) {
      return '${value.substring(0, 3)}.${value.substring(3)}';
    }

    return value;
  }

  String formatarCEP(String value) {
    value = value.replaceAll(RegExp(r'\D'), '');

    if (value.length > 8) value = value.substring(0, 8);

    if (value.length > 5) {
      return '${value.substring(0, 5)}-${value.substring(5)}';
    }

    return value;
  }

  Widget campoTexto({
    required String label,
    required TextEditingController controller,
    bool senha = false,
    bool mostrar = false,
    VoidCallback? toggle,
    int? maxLength,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),

        TextField(
          controller: controller,
          obscureText: senha && !mostrar,
          maxLength: maxLength,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            suffixIcon: senha
                ? IconButton(
                    icon: Icon(
                      mostrar ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: toggle,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget botaoResidencia(String nome) {
    final selecionado = residenciaSelecionada == nome;

    return GestureDetector(
      onTap: () {
        setState(() {
          residenciaSelecionada = nome;
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
            nome,
            style: TextStyle(
              color: selecionado ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void criarConta() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1A73E8),
        title: const Text('Criar conta'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preencha seus dados para criar sua conta e começar a economizar.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            campoTexto(label: 'Nome completo', controller: nomeController),

            const SizedBox(height: 20),

            campoTexto(label: 'CPF', controller: cpfController),

            const SizedBox(height: 20),

            campoTexto(label: 'E-mail', controller: emailController),

            const SizedBox(height: 20),

            campoTexto(
              label: 'Senha',
              controller: senhaController,
              senha: true,
              mostrar: mostrarSenha,
              maxLength: 6,
              toggle: () {
                setState(() {
                  mostrarSenha = !mostrarSenha;
                });
              },
            ),

            const SizedBox(height: 20),

            campoTexto(
              label: 'Confirmar Senha',
              controller: confirmarController,
              senha: true,
              mostrar: mostrarConfirmar,
              maxLength: 6,
              toggle: () {
                setState(() {
                  mostrarConfirmar = !mostrarConfirmar;
                });
              },
            ),

            const SizedBox(height: 20),

            campoTexto(label: 'CEP', controller: cepController),

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
              children: [
                botaoResidencia('Apartamento'),
                botaoResidencia('Casa'),
                botaoResidencia('Kitnet'),
                botaoResidencia('Sobrado'),
              ],
            ),

            const SizedBox(height: 30),

            SwitchListTile(
              title: const Text('Tarifa social'),
              subtitle: const Text('Residência cadastrada no programa.'),
              value: tarifaSocial,
              onChanged: (value) {
                setState(() {
                  tarifaSocial = value;
                });
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: criarConta,
                child: const Text(
                  'Criar conta',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Conta criada com sucesso!',
          style: TextStyle(
            fontSize: 22,
            color: Colors.green[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
