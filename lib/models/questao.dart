class Opcao {
  final String letter;
  final String text;

  Opcao({required this.letter, required this.text});

  factory Opcao.fromJson(Map<String, dynamic> json) {
    return Opcao(
      letter: json['letter'] as String,
      text: json['text'] as String,
    );
  }
}

class Questao {
  final String id;
  final String themeId;
  final String themeName;
  final String title;
  final String statement;
  final List<Opcao> options;
  final String correct;
  final String explanation;
  final String examTip;
  final String concept;

  Questao({
    required this.id,
    required this.themeId,
    required this.themeName,
    required this.title,
    required this.statement,
    required this.options,
    required this.correct,
    required this.explanation,
    required this.examTip,
    required this.concept,
  });

  factory Questao.fromJson(Map<String, dynamic> json) {
    return Questao(
      id: json['id'] as String,
      themeId: json['themeId'] as String,
      themeName: json['themeName'] as String,
      title: json['title'] as String,
      statement: json['statement'] as String,
      options: (json['options'] as List<dynamic>)
          .map((o) => Opcao.fromJson(o as Map<String, dynamic>))
          .toList(),
      correct: json['correct'] as String,
      explanation: json['explanation'] as String,
      examTip: json['examTip'] as String? ?? '',
      concept: json['concept'] as String? ?? '',
    );
  }
}
