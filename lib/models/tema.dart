class Tema {
  final String id;
  final int numero;
  final String titulo;
  final String descricao;
  final String resumoFile;
  final String completoFile;
  final String formulasFile;
  final int questoesCount;

  Tema({
    required this.id,
    required this.numero,
    required this.titulo,
    required this.descricao,
    required this.resumoFile,
    required this.completoFile,
    required this.formulasFile,
    required this.questoesCount,
  });

  factory Tema.fromJson(Map<String, dynamic> json) {
    final num = json['numero'] as int? ?? 0;
    return Tema(
      id: json['id'] as String,
      numero: num,
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String? ?? '',
      resumoFile: json['resumoFile'] as String? ?? 'tema_${num}_resumo.md',
      completoFile: json['completoFile'] as String? ?? 'tema_${num}_completo.md',
      formulasFile: json['formulasFile'] as String? ?? 'tema_${num}_formulas.md',
      questoesCount: json['questoesCount'] as int? ?? 0,
    );
  }
}
