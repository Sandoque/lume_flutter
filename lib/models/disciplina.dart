import 'tema.dart';

class Disciplina {
  final String id;
  final String nome;
  final String codigo;
  final String descricao;
  final String icone;
  final String corHex;
  final String dataPath;
  final List<Tema> temas;

  Disciplina({
    required this.id,
    required this.nome,
    required this.codigo,
    required this.descricao,
    required this.icone,
    required this.corHex,
    required this.dataPath,
    required this.temas,
  });

  factory Disciplina.fromJson(Map<String, dynamic> json) {
    return Disciplina(
      id: json['id'] as String,
      nome: json['nome'] as String,
      codigo: json['codigo'] as String? ?? '',
      descricao: json['descricao'] as String? ?? '',
      icone: json['icone'] as String? ?? 'book',
      corHex: json['corHex'] as String? ?? '#0F766E',
      dataPath: json['dataPath'] as String? ?? '',
      temas: (json['temas'] as List<dynamic>? ?? [])
          .map((t) => Tema.fromJson(t as Map<String, dynamic>))
          .toList(),
    );
  }
}
