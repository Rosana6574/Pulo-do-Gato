import 'package:flutter/material.dart';

class AlternativasPage extends StatefulWidget {
  const AlternativasPage({super.key});

  @override
  State<AlternativasPage> createState() => _AlternativasPageState();
}

class _AlternativasPageState extends State<AlternativasPage> {
  int expandedIndex = -1;

  final List<Map<String, dynamic>> alternativas = [
    {
      "nome": "Luxen",
      "logo":
          "https://i.ibb.co/2YLWv0Zz/Gemini-Generated-Image-hje0zuhje0zuhje0.png",
      "valor": "R\$ 150,50/mês"
    },
    {
      "nome": "Luvolt",
      "logo":
          "https://i.ibb.co/nqb0dMgQ/Gemini-Generated-Image-98w9c898w9c898w9.png",
      "valor": "R\$ 150,50/mês"
    },
    {
      "nome": "NexVolt",
      "logo":
          "https://i.ibb.co/yBQNNKBM/Gemini-Generated-Image-vglcfqvglcfqvglc.png",
      "valor": "R\$ 150,50/mês"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9ff),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        centerTitle: true,
        title: const Text(
          "Alternativas Econômicas",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: alternativas.length,
        itemBuilder: (context, index) {
          final item = alternativas[index];
          final expanded = expandedIndex == index;

          return _buildCard(item, index, expanded);
        },
      ),
    );
  }

  Widget _buildCard(
      Map<String, dynamic> item, int index, bool expanded) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                expandedIndex = expanded ? -1 : index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  _empresaCelpe(),
                  Icon(
                    expanded
                        ? Icons.expand_less
                        : Icons.expand_more,
                    color: Colors.grey,
                  ),
                  _empresaAlternativa(item),
                ],
              ),
            ),
          ),
          if (expanded) _detalhes(item),
        ],
      ),
    );
  }

  Widget _empresaCelpe() {
    return Column(
      children: const [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.white,
          child: Icon(Icons.bolt,
              color: Color(0xFF1565C0), size: 30),
        ),
        SizedBox(height: 8),
        Text("Celpe"),
        Text("178 kWh",
            style: TextStyle(fontSize: 12)),
        Text(
          "R\$ 356,80/mês",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _empresaAlternativa(Map<String, dynamic> item) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFF002B5B),
          backgroundImage: NetworkImage(item["logo"]),
        ),
        const SizedBox(height: 8),
        Text(item["nome"]),
        const Text("178 kWh",
            style: TextStyle(fontSize: 12)),
        Text(
          item["valor"],
          style: const TextStyle(
            color: Color(0xFF1565C0),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _detalhes(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          _grafico(item["nome"], Colors.blue.shade300),
          const SizedBox(height: 20),
          _grafico("Celpe", Colors.orange.shade300),
          const SizedBox(height: 20),
          _comparativo(item),
        ],
      ),
    );
  }

  Widget _grafico(String titulo, Color cor) {
    final alturas = [80.0, 65.0, 72.0, 85.0, 78.0];
    final meses = ["Jan", "Fev", "Mar", "Abr", "Mai"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Consumo por mês, $titulo",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 130,
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: List.generate(
              alturas.length,
              (i) => Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    children: [
                      Container(
                        height: alturas[i],
                        decoration: BoxDecoration(
                          color: cor,
                          borderRadius:
                              BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        meses[i],
                        style:
                            const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _comparativo(Map<String, dynamic> item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Consumo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),

        _barra(item["nome"], "R\$150,50", .2,
            const Color(0xFF1565C0)),

        const SizedBox(height: 18),

        _barra("Sua Celpe", "R\$356,80", .85,
            Colors.red),
      ],
    );
  }

  Widget _barra(
      String nome, String valor, double pos, Color cor) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(nome),
            Text(
              valor,
              style: TextStyle(
                color: cor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.yellow,
                    Colors.red
                  ],
                ),
              ),
            ),
            Positioned(
              left: 300 * pos,
              child: Container(
                width: 4,
                height: 10,
                color: Colors.black,
              ),
            )
          ],
        )
      ],
    );
  }
}