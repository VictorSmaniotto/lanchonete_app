import 'package:flutter/material.dart';

class LanchonetePage extends StatefulWidget {
  const LanchonetePage({super.key});

  @override
  State<LanchonetePage> createState() => _LanchonetePageState();
}

class _LanchonetePageState extends State<LanchonetePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Burguer's Lanchonete"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  child: Image.network(
                      'https://static.portaldacidade.com/unsafe/610x407/https://s3.amazonaws.com/sumare.portaldacidade.com/img/news/2022-08/chegou-em-sumare-uma-das-maiores-redes-de-hamburgueria-delivery-do-pais-62fd44b6c9375.jpeg'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "A especialidade da Burguer's são os hambúrgueres artesanais preparados com ingredientes frescos e selecionados. Cada hambúrguer é cuidadosamente montado com carne suculenta, queijo derretido e uma variedade de acompanhamentos deliciosos. Os clientes podem escolher entre uma ampla seleção de opções, desde clássicos como o \"Burguer's Cheese\" até criações especiais, como o \"Burguer's BBQ Bacon\" ou o \"Veggie Supreme\" para os vegetarianos.\n\n Além dos hambúrgueres saborosos, a Burguer's oferece uma variedade de acompanhamentos e complementos irresistíveis, como batatas fritas crocantes, onion rings douradas e milkshakes cremosos. A equipe dedicada e amigável está sempre pronta para receber os clientes com um sorriso, garantindo um serviço excepcional e uma experiência gastronômica memorável.\n\nSeja para um almoço rápido, um jantar descontraído com amigos ou até mesmo para celebrar uma ocasião especial, a Burguer's é o lugar perfeito para satisfazer os desejos por hambúrgueres de alta qualidade, oferecendo um ambiente acolhedor e pratos deliciosos que agradam a todos os paladares.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Burger's Hamburgueria\nEndereço: Rua Principal, 123\nBairro: Centro\nCidade: Qualquer Cidade\nCEP: 12345-678",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    "Horário de Funcionamento: Segunda a sexta-feira: 11h às 22h\nSábado e domingo: 12h às 23h",
                    style: TextStyle(fontSize: 14)),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    "Formas de Pagamento:\nDinheiro em espécie\nCartões de crédito e débito (Visa, Mastercard, American Express)\nVale-refeição (Ticket Restaurante, Sodexo, Alelo, VR)",
                    style: TextStyle(fontSize: 14)),
              ),
            ],
          ),
        ));
  }
}
