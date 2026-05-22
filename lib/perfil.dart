import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool _notificacoes = true;
  bool _alertaConsumoAlto = true;
  bool _lembreteMensal = false;

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xff005EB8);
    const colorBackground = Colors.white;
    const colorFieldBg = Color(0xffF9FAFB);
    const colorBorder = Color(0xffE5E7EB);

    return Scaffold(
      backgroundColor: colorBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                top: 48,
                bottom: 24,
                left: 16,
                right: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/telaprincipal',
                          );
                        },
                      ),
                      const Text(
                        'Perfil',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.grey[200],
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://i1-e.pinimg.com/736x/5a/9c/cb/5a9ccb0f2f0e61d2c96a1a409402001a.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: colorPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Alterar foto',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProfileField(
                    'Nome completo',
                    'João Oliveira',
                    colorFieldBg,
                    colorBorder,
                  ),
                  _buildProfileField(
                    'Nome de usuário (@)',
                    '@joao',
                    colorFieldBg,
                    colorBorder,
                  ),
                  _buildProfileField(
                    'E-mail',
                    'joaooliveira@gmail.com',
                    colorFieldBg,
                    colorBorder,
                  ),
                  _buildProfileField(
                    'CPF',
                    '953.526.861-34',
                    colorFieldBg,
                    colorBorder,
                  ),
                  _buildProfileField(
                    'CEP',
                    '45324-567',
                    colorFieldBg,
                    colorBorder,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildProfileField(
                          'ID do usuário',
                          '#12070720',
                          colorFieldBg,
                          colorBorder,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Plano atual',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff374151),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xffeff6ff),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: colorPrimary.withValues(alpha: 0.2),
                                ),
                              ),
                              child: const Text(
                                'PREMIUM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: colorPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildProfileField(
                    'Data de criação da conta',
                    '15 de Março, 2023',
                    colorFieldBg,
                    colorBorder,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPrimary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Editar perfil',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Configurações',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSwitchTile('Notificações', _notificacoes, colorBorder, (
                    value,
                  ) {
                    setState(() => _notificacoes = value);
                  }),
                  _buildSwitchTile(
                    'Alerta de Consumo Alto',
                    _alertaConsumoAlto,
                    colorBorder,
                    (value) {
                      setState(() => _alertaConsumoAlto = value);
                    },
                  ),
                  _buildSwitchTile(
                    'Lembrete Mensal',
                    _lembreteMensal,
                    colorBorder,
                    (value) {
                      setState(() => _lembreteMensal = value);
                    },
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Segurança',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff111827),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildNavigationTile(
                    label: 'Alterar senha',
                    icon: Icons.lock_outline,
                    borderColor: colorBorder,
                    onTap: () {},
                  ),
                  _buildNavigationTile(
                    label: 'Dispositivos conectados',
                    icon: Icons.phone_android_outlined,
                    borderColor: colorBorder,
                    trailingText: '2 ativos',
                    onTap: () {},
                  ),
                  const SizedBox(height: 40),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.red[600],
                      side: BorderSide(color: Colors.red[100]!, width: 2),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.logout),
                    label: const Text(
                      'Sair da conta',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(
    String label,
    String value,
    Color bgColor,
    Color borderColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff374151),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Color(0xff1f2937), fontSize: 16),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSwitchTile(
    String label,
    bool state,
    Color borderColor,
    ValueChanged<bool> onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: SwitchListTile(
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff374151),
            fontSize: 16,
          ),
        ),
        value: state,
        activeThumbColor: const Color(0xff005EB8),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildNavigationTile({
    required String label,
    required IconData icon,
    required Color borderColor,
    required VoidCallback onTap,
    String? trailingText,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.grey[500]),
        title: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff374151),
            fontSize: 16,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  trailingText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(width: 4),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
