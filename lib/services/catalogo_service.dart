import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/periodo.dart';
import '../models/questao.dart';
import '../models/flashcard.dart';

class CatalogoService {
  static Future<List<Periodo>> carregarPeriodos() async {
    final jsonStr = await rootBundle.loadString('assets/data/catalogo.json');
    final Map<String, dynamic> data = json.decode(jsonStr);
    final list = data['periodos'] as List<dynamic>;
    return list.map((p) => Periodo.fromJson(p as Map<String, dynamic>)).toList();
  }

  static Future<List<Questao>> carregarQuestoes(String dataPath) async {
    try {
      final jsonStr = await rootBundle.loadString('$dataPath/questoes.json');
      final list = json.decode(jsonStr) as List<dynamic>;
      return list.map((q) => Questao.fromJson(q as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<List<Flashcard>> carregarFlashcards(String dataPath) async {
    try {
      final jsonStr = await rootBundle.loadString('$dataPath/flashcards.json');
      final list = json.decode(jsonStr) as List<dynamic>;
      return list.map((f) => Flashcard.fromJson(f as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  static Future<String> carregarResumoMarkdown(String dataPath, String fileName) async {
    try {
      return await rootBundle.loadString('$dataPath/$fileName');
    } catch (e) {
      return '# Resumo em elaboração\n\nO conteúdo para este tema será disponibilizado em breve.';
    }
  }
}
