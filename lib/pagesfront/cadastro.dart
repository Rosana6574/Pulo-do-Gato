import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'formatters.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  static const Color brandBlue = Color(0xFF1A73E8);
  static const Color bgLight = Color(0xFFF7F9FC);
  static const Color textGray = Color(0xFF5E6C84);
  static const Color cardBg = Color(0xFFF1F5F9);
  static const Color textDark = Color(0xFF1E293B);
  static const Color textLight = Color(0xFF64748B);

  bool _obscureSenha = true;
  bool _obscureConfirmar = true;
  String _residenciaSelecionada = '';
  bool _tarifaSocial = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLight,
      appBar: AppBar(
        backgroundColor: brandBlue,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Criar conta',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Preencha seus dados para criar sua conta e começar a economizar.',
              style: TextStyle(color: textGray, fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 32),

            _buildLabel('Nome completo'),
            _buildTextField(hintText: 'Seu nome'),
            const SizedBox(height: 24),

            _buildLabel('CPF'),
            _buildTextField(
              hintText: '000.000.000-00',
              keyboardType: TextInputType.number,
              formatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
                CpfInputFormatter(),
              ],
            ),
            const SizedBox(height: 24),

            _buildLabel('E-mail'),
            _buildTextField(
              hintText: 'seu@email.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),

            _buildLabel('Senha'),
            _buildPasswordField(
              hintText: 'Até 6 caracteres',
              obscureText: _obscureSenha,
              onToggle: () {
                setState(() {
                  _obscureSenha = !_obscureSenha;
                });
              },
            ),
            const SizedBox(height: 24),

            _buildLabel('Confirmar Senha'),
            _buildPasswordField(
              hintText: 'Até 6 caracteres',
              obscureText: _obscureConfirmar,
              onToggle: () {
                setState(() {
                  _obscureConfirmar = !_obscureConfirmar;
                });
              },
            ),
            const SizedBox(height: 24),

            _buildLabel('CEP'),
            _buildTextField(
              hintText: '00000-000',
              keyboardType: TextInputType.number,
              formatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(8),
                CepInputFormatter(),
              ],
            ),
            const SizedBox(height: 32),

            const Text(
              'Tipo de residência',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildResidenciaButton('Apartamento')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildResidenciaButton('Casa')),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildResidenciaButton('Kitnet')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildResidenciaButton('Sobrado')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tarifa social (baixa renda)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textDark,
                          fontSize: 14,
                        ),
                      ),
                      Switch(
                        value: _tarifaSocial,
                        activeThumbColor: Colors.white,
                        activeTrackColor: Colors.blue[600],
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey[300],
                        onChanged: (bool value) {
                          setState(() {
                            _tarifaSocial = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(right: 48),
                    child: Text(
                      'Marque se sua residência é cadastrada no programa de tarifa social.',
                      style: TextStyle(
                        fontSize: 12,
                        color: textLight,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: brandBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Criar conta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    TextInputType? keyboardType,
    List<TextInputFormatter>? formatters,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        keyboardType: keyboardType,
        inputFormatters: formatters,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String hintText,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        maxLength: 6,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          contentPadding: const EdgeInsets.fromLTRB(16, 14, 0, 14),
          border: InputBorder.none,
          counterText: "",
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.black87,
            ),
            onPressed: onToggle,
          ),
        ),
      ),
    );
  }

  Widget _buildResidenciaButton(String tipo) {
    bool isSelected = _residenciaSelecionada == tipo;
    return GestureDetector(
      onTap: () {
        setState(() {
          _residenciaSelecionada = tipo;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[600] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          tipo,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
