import 'package:flutter/material.dart';

class InformacoesPage extends StatelessWidget {
  const InformacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        title: const Text('Informações', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 450),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(blurRadius: 14, color: Colors.black12),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: Color(0xFF1565C0),
                    size: 36,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Sua região',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 14),

                Container(
                  width: 70,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const SizedBox(height: 24),

                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    'https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2023/06/recife-1.png?w=872',
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Recife - Pernambuco',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1565C0),
                  ),
                ),

                const SizedBox(height: 12),

                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.open_in_new, size: 18),
                  label: const Text('Fonte: IBGE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
