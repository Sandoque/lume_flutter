import 'package:flutter/material.dart';
import '../models/disciplina.dart';
import '../models/questao.dart';
import '../services/catalogo_service.dart';
import '../services/progresso_service.dart';
import '../theme/app_theme.dart';
import '../widgets/questao_card.dart';

class CadernoErrosScreen extends StatefulWidget {
  final Disciplina disciplina;

  const CadernoErrosScreen({super.key, required this.disciplina});

  @override
  State<CadernoErrosScreen> createState() => _CadernoErrosScreenState();
}

class _CadernoErrosScreenState extends State<CadernoErrosScreen> {
  List<Questao> _questoesErradas = [];
  Map<String, dynamic> _userAnswers = {};
  Set<String> _starred = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _carregarQuestoes();
  }

  Future<void> _carregarQuestoes() async {
    setState(() => _loading = true);
    final todas = await CatalogoService.carregarQuestoes(widget.disciplina.dataPath);
    final erradas = await ProgressoService.filtrarQuestoesErradas(todas);
    final answers = await ProgressoService.obterRespostas();
    final starred = await ProgressoService.obterFavoritos();

    setState(() {
      _questoesErradas = erradas;
      _userAnswers = answers;
      _starred = starred;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caderno de Erros'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _questoesErradas.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppTheme.successColor.withValues(alpha: 0.12),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.sentiment_very_satisfied,
                            size: 64,
                            color: AppTheme.successColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Zero Erros Pendentes!',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Você não tem nenhuma questão marcada como incorreta no momento. Excelente trabalho!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Voltar para os Estudos'),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.errorColor.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.errorColor.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline, color: AppTheme.errorColor),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Você possui ${_questoesErradas.length} questão(ões) para revisar. Ao acertar, a questão sairá desta lista automaticamente.',
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ..._questoesErradas.map((q) {
                      final ans = _userAnswers[q.id];
                      return QuestaoCard(
                        questao: q,
                        initialSelected: ans?['selected'] as String?,
                        initialCorrect: ans != null ? ans['status'] == 'correct' : null,
                        isStarred: _starred.contains(q.id),
                        onAnswered: (letra, acertou) async {
                          await ProgressoService.salvarResposta(q.id, letra, acertou);
                          await _carregarQuestoes();
                        },
                        onReset: () async {
                          await ProgressoService.limparResposta(q.id);
                          await _carregarQuestoes();
                        },
                        onToggleStar: () async {
                          await ProgressoService.alternarFavorito(q.id);
                          final updated = await ProgressoService.obterFavoritos();
                          setState(() => _starred = updated);
                        },
                      );
                    }),
                  ],
                ),
    );
  }
}
