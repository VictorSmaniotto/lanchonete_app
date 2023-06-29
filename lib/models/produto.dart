class Produto {
  final String foto;
  final String nome;
  final String descricao;
  final double valor;

  Produto(
      {required this.foto,
      required this.nome,
      required this.descricao,
      required this.valor});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        foto: json['foto'],
        nome: json['nome'],
        descricao: json['descricao'],
        valor: json['valor']);
  }
}
