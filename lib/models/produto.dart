class Produto {
  final int id;
  final String foto;
  final String titulo;
  final String descricao;
  final double valor;
  final int categoriaId;
  final String categoriaNome;

  Produto(
      {required this.id,
      required this.foto,
      required this.titulo,
      required this.descricao,
      required this.valor,
      required this.categoriaId,
      required this.categoriaNome});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        id: json['id'],
        foto: json['foto'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        valor: double.tryParse(json['valor']) ?? 0.0,
        categoriaId: json['categoria_id'],
        categoriaNome: json['categoria_nome']);
  }
}
