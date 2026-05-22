import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformacoesPage extends StatelessWidget {
  // CORRIGIDO: Sintaxe do construtor simplificada com super.key e com o nome correto da classe
  const InformacoesPage({super.key});

  // CORRIGIDO: Função ativada e usando a variável 'url' corretamente
  Future<void> _launchURL() async {
    final Uri url = Uri.parse('https://www.ibge.gov.br/');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff1565C0);
    const Color backgroundColor = Color(0xfff9f9ff);
    const Color onSurfaceColor = Color(0xff191c21);
    const Color outlineVariant = Color(0xffc2c6d4);
    const Color primaryFixed = Color(0xffd6e3ff);

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
            // CORRIGIDO: maxWidth movido para dentro de BoxConstraints
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: outlineVariant),
              boxShadow: [
                BoxShadow(
                  // CORRIGIDO: comOpacity alterado para comValues
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: primaryFixed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: primaryColor,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'sua região',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 64,
                  height: 4,
                  decoration: BoxDecoration(
                    // CORRIGIDO: comOpacity alterado para comValues
                    color: primaryColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                const SizedBox(height: 24),
                // CORRIGIDO: O BorderRadius que estava solto na linha 106 foi movido para dentro do BoxDecoration
                Container(
                  height: 192,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            // CORRIGIDO: comOpacity alterado para comValues
                            Colors.grey.withValues(alpha: 0.3),
                            BlendMode.saturation,
                          ),
                          child: Image.network(
                            'https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2023/06/recife-1.png?w=872',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  // CORRIGIDO: comOpacity alterado para comValues
                                  backgroundColor.withValues(alpha: 0.8),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: _launchURL,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Fonte: https://www.ibge.gov.br/',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.open_in_new, size: 18, color: primaryColor),
                    ],
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
