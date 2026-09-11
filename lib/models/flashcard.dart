class Flashcard {
  final String id;
  final String tema;
  final String titulo;
  final String frente;
  final String verso;
  final String dica;

  Flashcard({
    required this.id,
    required this.tema,
    required this.titulo,
    required this.frente,
    required this.verso,
    required this.dica,
  });

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      id: json['id'] as String,
      tema: json['tema'] as String,
      titulo: json['titulo'] as String,
      frente: json['frente'] as String,
      verso: json['verso'] as String,
      dica: json['dica'] as String? ?? '',
    );
  }
}
