import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool notificacoes = true;
  bool alertaConsumo = true;
  bool lembreteMensal = false;

  Widget infoCard(String titulo, String valor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Text(valor, style: const TextStyle(fontSize: 15)),
        ),
      ],
    );
  }

  Widget switchItem(String titulo, bool valor, Function(bool) onChanged) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.w500)),
          Switch(
            value: valor,
            activeColor: const Color(0xFF005EB8),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget securityItem(IconData icon, String titulo, String? extra) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          if (extra != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(extra, style: const TextStyle(fontSize: 12)),
            ),
          if (extra == null) const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF005EB8),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            'Perfil',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      CircleAvatar(
                        radius: 34,
                        backgroundImage: const NetworkImage(
                          'https://i1-e.pinimg.com/736x/5a/9c/cb/5a9ccb0f2f0e61d2c96a1a409402001a.jpg',
                        ),
                      ),
                    ],
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Alterar foto',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    infoCard('Nome completo', 'João Oliveira'),
                    const SizedBox(height: 14),

                    infoCard('Nome de usuário (@)', '@joao'),
                    const SizedBox(height: 14),

                    infoCard('E-mail', 'joaooliveira@gmail.com'),
                    const SizedBox(height: 14),

                    infoCard('CPF', '953.526.861-34'),
                    const SizedBox(height: 14),

                    infoCard('CEP', '45324-567'),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(child: infoCard('ID do usuário', '#12070720')),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Plano atual',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'PREMIUM',
                                    style: TextStyle(
                                      color: Color(0xFF005EB8),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    infoCard('Data de criação da conta', '15 de Março, 2023'),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF005EB8),
                          padding: const EdgeInsets.all(16),
                        ),
                        child: const Text(
                          'Editar perfil',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Configurações',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    switchItem(
                      'Notificações',
                      notificacoes,
                      (v) => setState(() => notificacoes = v),
                    ),

                    const SizedBox(height: 10),

                    switchItem(
                      'Alerta de Consumo Alto',
                      alertaConsumo,
                      (v) => setState(() => alertaConsumo = v),
                    ),

                    const SizedBox(height: 10),

                    switchItem(
                      'Lembrete Mensal',
                      lembreteMensal,
                      (v) => setState(() => lembreteMensal = v),
                    ),

                    const SizedBox(height: 30),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Segurança',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    securityItem(Icons.lock_outline, 'Alterar senha', null),

                    const SizedBox(height: 10),

                    securityItem(
                      Icons.devices,
                      'Dispositivos conectados',
                      '2 ativos',
                    ),

                    const SizedBox(height: 30),

                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text(
                        'Sair da conta',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
