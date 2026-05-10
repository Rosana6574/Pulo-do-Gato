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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      body: SafeArea(
        child: Column(
          children: [
            _header(context),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _infoCard('Nome completo', 'João Oliveira'),
                    _infoCard('Nome de usuário (@)', '@joao'),
                    _infoCard('E-mail', 'joaooliveira@gmail.com'),
                    _infoCard('CPF', '953.526.861-34'),
                    _infoCard('CEP', '45324-567'),

                    Row(
                      children: [
                        Expanded(
                          child: _infoCard('ID do usuário', '#12070720'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: _planoCard()),
                      ],
                    ),

                    _infoCard('Data de criação da conta', '15 de Março, 2023'),

                    const SizedBox(height: 20),

                    _botaoEditar(),

                    const SizedBox(height: 30),

                    _configuracoes(),

                    const SizedBox(height: 30),

                    _seguranca(),

                    const SizedBox(height: 30),

                    _logout(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 25),
      decoration: const BoxDecoration(
        color: Color(0xFF1565C0),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),

              const Expanded(
                child: Center(
                  child: Text(
                    'Perfil',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
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
    );
  }

  Widget _infoCard(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.w600)),

          const SizedBox(height: 6),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(valor),
          ),
        ],
      ),
    );
  }

  Widget _planoCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Plano atual',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              'PREMIUM',
              style: TextStyle(
                color: Color(0xFF1565C0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoEditar() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1565C0),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text(
          'Editar perfil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _configuracoes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Configurações',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        SwitchListTile(
          title: const Text('Notificações'),
          value: notificacoes,
          activeColor: const Color(0xFF1565C0),
          onChanged: (v) => setState(() => notificacoes = v),
        ),

        SwitchListTile(
          title: const Text('Alerta de Consumo Alto'),
          value: alertaConsumo,
          activeColor: const Color(0xFF1565C0),
          onChanged: (v) => setState(() => alertaConsumo = v),
        ),

        SwitchListTile(
          title: const Text('Lembrete Mensal'),
          value: lembreteMensal,
          activeColor: const Color(0xFF1565C0),
          onChanged: (v) => setState(() => lembreteMensal = v),
        ),
      ],
    );
  }

  Widget _seguranca() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Segurança',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Alterar senha'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.devices),
            title: const Text('Dispositivos conectados'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('2 ativos'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _logout() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.logout, color: Colors.red),
        label: const Text(
          'Sair da conta',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.red.shade100, width: 2),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
