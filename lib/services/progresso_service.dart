import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/questao.dart';

class ProgressoService {
  static const String _keyAnswers = 'user_answers';
  static const String _keyStarred = 'user_starred';
  static const String _keySimulados = 'user_simulados';
  static const String _keyMasteredFlashcards = 'user_mastered_flashcards';
  static const String _keyThemeMode = 'user_theme_mode';

  static Future<Map<String, dynamic>> obterRespostas() async {
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString(_keyAnswers);
    if (str == null) return {};
    return json.decode(str) as Map<String, dynamic>;
  }

  static Future<void> salvarResposta(String questaoId, String opcaoEscolhida, bool acertou) async {
    final prefs = await SharedPreferences.getInstance();
    final map = await obterRespostas();
    map[questaoId] = {
      'selected': opcaoEscolhida,
      'status': acertou ? 'correct' : 'incorrect',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    await prefs.setString(_keyAnswers, json.encode(map));
  }

  static Future<void> limparResposta(String questaoId) async {
    final prefs = await SharedPreferences.getInstance();
    final map = await obterRespostas();
    map.remove(questaoId);
    await prefs.setString(_keyAnswers, json.encode(map));
  }

  static Future<Set<String>> obterFavoritos() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_keyStarred) ?? [];
    return list.toSet();
  }

  static Future<void> alternarFavorito(String questaoId) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_keyStarred) ?? [];
    if (list.contains(questaoId)) {
      list.remove(questaoId);
    } else {
      list.add(questaoId);
    }
    await prefs.setStringList(_keyStarred, list);
  }

  // Flashcards com Repetição Ativa
  static Future<Set<String>> obterFlashcardsDominados() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_keyMasteredFlashcards) ?? [];
    return list.toSet();
  }

  static Future<void> alternarDominioFlashcard(String flashcardId, bool dominado) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_keyMasteredFlashcards) ?? [];
    if (dominado && !list.contains(flashcardId)) {
      list.add(flashcardId);
    } else if (!dominado) {
      list.remove(flashcardId);
    }
    await prefs.setStringList(_keyMasteredFlashcards, list);
  }

  // Caderno de Erros
  static Future<List<Questao>> filtrarQuestoesErradas(List<Questao> todasQuestoes) async {
    final answers = await obterRespostas();
    return todasQuestoes.where((q) {
      final ans = answers[q.id];
      return ans != null && ans['status'] == 'incorrect';
    }).toList();
  }

  static Future<int> contarQuestoesErradas() async {
    final answers = await obterRespostas();
    int count = 0;
    answers.forEach((_, v) {
      if (v['status'] == 'incorrect') count++;
    });
    return count;
  }

  static Future<void> registrarSimulado({
    required int scorePercent,
    required int total,
    required int correct,
    required int timeMinutes,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final historyStr = prefs.getString(_keySimulados);
    List<dynamic> list = historyStr != null ? json.decode(historyStr) : [];
    list.add({
      'date': DateTime.now().toIso8601String(),
      'score': scorePercent,
      'total': total,
      'correct': correct,
      'timeMin': timeMinutes,
    });
    await prefs.setString(_keySimulados, json.encode(list));
  }

  static Future<List<dynamic>> obterHistoricoSimulados() async {
    final prefs = await SharedPreferences.getInstance();
    final historyStr = prefs.getString(_keySimulados);
    if (historyStr == null) return [];
    return json.decode(historyStr) as List<dynamic>;
  }

  // Tema Escuro / Claro
  static Future<ThemeMode> obterThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final modeStr = prefs.getString(_keyThemeMode);
    if (modeStr == 'dark') return ThemeMode.dark;
    if (modeStr == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }

  static Future<void> salvarThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    String val = 'system';
    if (mode == ThemeMode.dark) val = 'dark';
    if (mode == ThemeMode.light) val = 'light';
    await prefs.setString(_keyThemeMode, val);
  }

  // Backup & Sincronização Local (JSON)
  static Future<String> exportarBackup() async {
    final prefs = await SharedPreferences.getInstance();
    final backup = {
      'app': 'Lume',
      'version': 1,
      'exported_at': DateTime.now().toIso8601String(),
      'user_answers': json.decode(prefs.getString(_keyAnswers) ?? '{}'),
      'user_starred': prefs.getStringList(_keyStarred) ?? [],
      'user_simulados': json.decode(prefs.getString(_keySimulados) ?? '[]'),
      'user_mastered_flashcards': prefs.getStringList(_keyMasteredFlashcards) ?? [],
    };
    return const JsonEncoder.withIndent('  ').convert(backup);
  }

  static Future<bool> importarBackup(String jsonStr) async {
    try {
      final Map<String, dynamic> data = json.decode(jsonStr);
      final prefs = await SharedPreferences.getInstance();

      if (data.containsKey('user_answers')) {
        await prefs.setString(_keyAnswers, json.encode(data['user_answers']));
      }
      if (data.containsKey('user_starred')) {
        final list = (data['user_starred'] as List).map((e) => e.toString()).toList();
        await prefs.setStringList(_keyStarred, list);
      }
      if (data.containsKey('user_simulados')) {
        await prefs.setString(_keySimulados, json.encode(data['user_simulados']));
      }
      if (data.containsKey('user_mastered_flashcards')) {
        final list = (data['user_mastered_flashcards'] as List).map((e) => e.toString()).toList();
        await prefs.setStringList(_keyMasteredFlashcards, list);
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<void> zerarTudo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyAnswers);
    await prefs.remove(_keyStarred);
    await prefs.remove(_keySimulados);
    await prefs.remove(_keyMasteredFlashcards);
  }
}
