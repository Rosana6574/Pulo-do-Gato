import 'package:flutter/material.dart';

// Importação de todas as páginas mapeadas na pasta pagesfront
import 'pagesfront/login_page.dart';
import 'pagesfront/cadastro.dart';
import 'pagesfront/telaprincipal.dart';
import 'pagesfront/calcular.dart';
import 'pagesfront/resultadocalcular.dart';
import 'pagesfront/alternativas.dart';
import 'pagesfront/historico.dart';
import 'pagesfront/historicoo.dart';
import 'pagesfront/perfil.dart';
import 'pagesfront/informacooeess.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulo do Gato',
      debugShowCheckedModeBanner: false,

      // Definição da identidade visual global baseada no azul primário
      theme: ThemeData(
        primaryColor: const Color(0xff1565C0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1565C0),
          primary: const Color(0xff1565C0),
        ),
        useMaterial3: true,
      ),

      // Rota inicial do aplicativo (Tela de Login)
      initialRoute: '/login',

      // Mapeamento de rotas nomeadas para navegação
      routes: {
        '/login': (context) => const LoginPage(),
        '/cadastro': (context) => const CadastroPage(),
        '/telaprincipal': (context) => const TelaPrincipal(),
        '/calcular': (context) => const CalcularPage(),
        '/resultadocalcular': (context) => const ResultadoCalcularPage(),
        '/alternativas': (context) => const AlternativasPage(),
        '/historico': (context) => const HistoricoPage(),
        '/historicoo': (context) => const HistoricooPage(),
        '/perfil': (context) => const PerfilPage(),
        '/informacoes': (context) => const InformacooeessPage(),
      },
    );
  }
}
