import 'package:app_lanchonete/pages/produto_page.dart';
import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../widgets/box_icon_categoria.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Produto> produtos = [
    Produto(
        foto:
            'https://static.ifood-static.com.br/image/upload/t_medium/pratos/493041ae-38ec-402c-a990-07fea00d99fe/202109291530_SWGE_i.jpg',
        nome: 'HOGWARTS (SALADA)',
        descricao:
            'Hambúrguer 150 gramas, Alface, Tomate, Molho Especial, Acompanha Maionese',
        valor: 23.00),
    Produto(
        foto:
            'https://static.ifood-static.com.br/image/upload/t_medium/pratos/493041ae-38ec-402c-a990-07fea00d99fe/202109291537_6NL8_i.jpg',
        nome: 'ENTERPRISE',
        descricao:
            'Hambúrguer Recheado Com Queijo Mussarela 200 gramas, Bacon, Alface, Tomate, Molho Especial, Acompanha Maionese',
        valor: 31.00),
    Produto(
        foto:
            'https://static.ifood-static.com.br/image/upload/t_medium/pratos/493041ae-38ec-402c-a990-07fea00d99fe/202206021214_0V1Y_i.jpg',
        nome: 'DUPLO SMASH BURGUER',
        descricao:
            '2 hambúrgueres de 90 gramas, Queijo, Bacon, Molho Especial, Acompanha Maionese Artesanal',
        valor: 27.00),
    Produto(
        foto:
            'https://static.ifood-static.com.br/image/upload/t_medium/pratos/493041ae-38ec-402c-a990-07fea00d99fe/202109291534_7R7S_i.jpg',
        nome: 'MULTIVERSE',
        descricao:
            'Hambúrguer 150 gramas, Bacon, Tomate, Alface, Molho Especial, Acompanha Maionese',
        valor: 26.00),
    Produto(
        foto:
            'https://static.ifood-static.com.br/image/upload/t_low/pratos/2bc00932-7d05-47e6-a253-610a708d7d7d/202206031135_Y18X_i.jpg',
        nome: 'Sampa Mignon',
        descricao:
            'Pão francês redondo, Molho de alho, Rúcula, Vinagrete, 130g de filé mignon em tiras e queijo tipo pão de alho',
        valor: 35.99),
    Produto(
        foto:
            'https://static.ifood-static.com.br/image/upload/t_low/pratos/2bc00932-7d05-47e6-a253-610a708d7d7d/202206031135_Y18X_i.jpg',
        nome: 'Sampa Mignon',
        descricao:
            'Pão francês redondo, Molho de alho, Rúcula, Vinagrete, 130g de filé mignon em tiras e queijo tipo pão de alho',
        valor: 35.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                //helperText: "Texto de ajuda...";
                //labelText: "Pesquisar",

                hintText: "Quer comer o que?",
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (texto) {
                debugPrint(texto);
              },
              onSubmitted: (texto) {
                debugPrint("Clicou em pesquisar");
                debugPrint(texto);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                //esta documentação vc pode ver em flutter view widght
                //o scroll funciona p deixar de forma vertical vc desativa, agora se quiser de forma horizontal vc ativa
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),

                children: const [
                  BoxIconCategoria(
                    asset: 'assets/hambuger.svg',
                    color: Colors.green,
                    label: "Lanche",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BoxIconCategoria(
                    asset: 'assets/porcao.svg',
                    color: Colors.purple,
                    label: "Porção",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BoxIconCategoria(
                    asset: 'assets/bebida.svg',
                    color: Colors.orange,
                    label: "Bebida",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BoxIconCategoria(
                    asset: 'assets/suco.svg',
                    color: Colors.blue,
                    label: "Suco",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BoxIconCategoria(
                    asset: 'assets/pizza.svg',
                    color: Colors.brown,
                    label: "Pizza",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  BoxIconCategoria(
                    asset: 'assets/pizza.svg',
                    color: Colors.brown,
                    label: "Pizza",
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: produtos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 10 / 15,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProdutoPage(
                            produto: produtos[index],
                          ),
                        ));
                  },
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 10 / 7,
                          child: Image.network(
                            produtos[index].foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                produtos[index].nome,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff707070),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                produtos[index].descricao,
                                style: const TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'R\$ ${produtos[index].valor.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        color: Color(0xFFF24405),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  // SizedBox(
                                  //   width: 30,
                                  //   child: FloatingActionButton.small(
                                  //     onPressed: () {},
                                  //     elevation: 0,
                                  //     child: const Icon(Icons.add),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   width: 30,
                                  //   child: ElevatedButton(
                                  //     onPressed: () {},
                                  //     style: ElevatedButton.styleFrom(
                                  //         shape: const CircleBorder(),
                                  //         padding: EdgeInsets.zero),
                                  //     child: const Icon(Icons.add),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}