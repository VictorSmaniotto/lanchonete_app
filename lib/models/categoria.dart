class Categoria {
  final int id;
  final String titulo;
  final String icone;
  final String cor;

  Categoria({
    required this.id,
    required this.titulo,
    required this.icone,
    required this.cor,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
        id: json['id'],
        titulo: json['titulo'],
        icone: json['icone'],
        cor: json['cor']);
  }
}
