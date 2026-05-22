import 'package:flutter/material.dart';

class InformacooeessPage extends StatelessWidget {
  const InformacooeessPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mantendo a paleta idêntica para consistência visual
    const Color primaryColor = Color(0xff1565C0);
    const Color backgroundColor = Color(0xfff9f9ff);
    const Color outlineVariant = Color(0xffc2c6d4);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Informações',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400), // Corrigido aqui
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: outlineVariant),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: 0.05,
                  ), // Atualizado aqui
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container da imagem arquitetônica / boleto CELPE
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(
                          alpha: 0.05,
                        ), // Atualizado aqui
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://celpe2via.net/wp-content/uploads/2018/02/celpe-2-via-conta-contrato.png',
                      width: double.infinity,
                      fit: BoxFit
                          .contain, // Garante que a conta apareça inteira sem cortes drásticos
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
