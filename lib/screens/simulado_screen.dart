import 'dart:async';
import 'package:flutter/material.dart';
import '../models/disciplina.dart';
import '../models/questao.dart';
import '../services/catalogo_service.dart';
import '../services/progresso_service.dart';
import '../theme/app_theme.dart';
import '../widgets/questao_card.dart';

class SimuladoScreen extends StatefulWidget {
  final Disciplina disciplina;

  const SimuladoScreen({super.key, required this.disciplina});

  @override
  State<SimuladoScreen> createState() => _SimuladoScreenState();
}

class _SimuladoScreenState extends State<SimuladoScreen> {
  List<Questao> _questoes = [];
  final Map<String, String> _userAnswers = {};
  bool _loading = true;
  bool _finished = false;

  Timer? _timer;
  int _timeRemainingSeconds = 0;
  int _totalTimeSeconds = 0;

  @override
  void initState() {
    super.initState();
    _iniciarSimulado();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _iniciarSimulado() async {
    setState(() => _loading = true);
    final todas = await CatalogoService.carregarQuestoes(widget.disciplina.dataPath);
    
    // Embaralhar e selecionar 18 questões balanceadas
    final shuffled = List<Questao>.from(todas)..shuffle();
    final selecionadas = shuffled.take(18).toList();

    _totalTimeSeconds = selecionadas.length * 2 * 60; // 2 min por questão
    _timeRemainingSeconds = _totalTimeSeconds;

    setState(() {
      _questoes = selecionadas;
      _loading = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemainingSeconds > 0) {
        setState(() => _timeRemainingSeconds--);
      } else {
        _timer?.cancel();
        _finalizarSimulado();
      }
    });
  }

  String _formatTimer() {
    final m = _timeRemainingSeconds ~/ 60;
    final s = _timeRemainingSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Future<void> _finalizarSimulado() async {
    _timer?.cancel();

    int correct = 0;
    for (final q in _questoes) {
      final chosen = _userAnswers[q.id];
      if (chosen == q.correct) correct++;
      if (chosen != null) {
        await ProgressoService.salvarResposta(q.id, chosen, chosen == q.correct);
      }
    }

    final scorePercent = (_questoes.isNotEmpty) ? ((correct / _questoes.length) * 100).round() : 0;
    final timeSpentMin = ((_totalTimeSeconds - _timeRemainingSeconds) / 60).round();

    await ProgressoService.registrarSimulado(
      scorePercent: scorePercent,
      total: _questoes.length,
      correct: correct,
      timeMinutes: timeSpentMin,
    );

    setState(() {
      _finished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_finished) {
      int correct = 0;
      for (final q in _questoes) {
        if (_userAnswers[q.id] == q.correct) correct++;
      }
      final scorePercent = ((correct / _questoes.length) * 100).round();

      return Scaffold(
        appBar: AppBar(title: const Text('Boletim do Simulado')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.primaryColor, width: 8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$scorePercent%',
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const Text('Aproveitamento', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                scorePercent >= 70 ? 'Excelente Resultado!' : 'Bom Treino! Continue praticando.',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                'Você acertou $correct de ${_questoes.length} questões.',
                style: const TextStyle(color: Colors.grey),
              ),
              const Divider(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Voltar para a Disciplina'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulado em Andamento'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.timer, size: 18, color: AppTheme.primaryColor),
                  const SizedBox(width: 4),
                  Text(
                    _formatTimer(),
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border(top: BorderSide(color: Theme.of(context).dividerColor.withValues(alpha: 0.2))),
        ),
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Entregar Prova?'),
                content: Text(
                  'Você respondeu ${_userAnswers.length} de ${_questoes.length} questões.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('Continuar Prova'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                      _finalizarSimulado();
                    },
                    child: const Text('Entregar Agora'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Entregar e Finalizar Simulado'),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: _questoes.length,
        itemBuilder: (context, index) {
          final q = _questoes[index];
          return QuestaoCard(
            questao: q,
            isSimuladoMode: true,
            initialSelected: _userAnswers[q.id],
            onAnswered: (letter, _) {
              setState(() {
                _userAnswers[q.id] = letter;
              });
            },
          );
        },
      ),
    );
  }
}
