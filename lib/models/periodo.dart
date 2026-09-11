import 'disciplina.dart';

class Periodo {
  final String id;
  final String nome;
  final String descricao;
  final List<Disciplina> disciplinas;

  Periodo({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.disciplinas,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      id: json['id'] as String,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String? ?? '',
      disciplinas: (json['disciplinas'] as List<dynamic>? ?? [])
          .map((d) => Disciplina.fromJson(d as Map<String, dynamic>))
          .toList(),
    );
  }
}
