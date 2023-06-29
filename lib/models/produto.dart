class Produto {
  final int id;
  final String foto;
  final String titulo;
  final String descricao;
  final double valor;
  final int categoriaId;
  final String categoriaNome;

  Produto({
    required this.foto,
    required this.titulo,
    required this.descricao,
    required this.valor,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
        foto: json['foto'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        valor: json['valor']);
  }
}
