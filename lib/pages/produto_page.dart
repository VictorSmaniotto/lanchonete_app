import 'package:flutter/material.dart';

import '../models/produto.dart';

class ProdutoPage extends StatelessWidget {
  final Produto produto;
  const ProdutoPage({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logotipo.png',
          height: 40,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Image.network(produto.foto),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              produto.nome,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Text(
              produto.descricao,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              'R\$ ${produto.valor.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xfff24405),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
