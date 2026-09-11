import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../models/disciplina.dart';
import '../models/tema.dart';
import '../models/questao.dart';
import '../models/flashcard.dart';
import '../services/catalogo_service.dart';
import '../services/progresso_service.dart';
import '../theme/app_theme.dart';
import '../widgets/questao_card.dart';
import '../widgets/flashcard_card.dart';
import '../widgets/timer_foco_dialog.dart';

enum ReadingTier { completo, resumo, formulas }

class TemaDetailScreen extends StatefulWidget {
  final Disciplina disciplina;
  final Tema tema;

  const TemaDetailScreen({
    super.key,
    required this.disciplina,
    required this.tema,
  });

  @override
  State<TemaDetailScreen> createState() => _TemaDetailScreenState();
}

class _TemaDetailScreenState extends State<TemaDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Reading Mode State
  ReadingTier _selectedTier = ReadingTier.resumo;
  String _resumoMarkdown = '';
  String _completoMarkdown = '';
  String _formulasMarkdown = '';
  double _fontSize = 15.5;

  // Practice & Flashcard State
  List<Questao> _questoes = [];
  List<Flashcard> _flashcards = [];
  Map<String, dynamic> _userAnswers = {};
  Set<String> _starred = {};
  Set<String> _masteredFlashcards = {};
  String _activeQuestionFilter = 'all'; // all, unanswered, incorrect, starred
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _carregarDados();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _carregarDados() async {
    setState(() => _loading = true);

    // Carregar os 3 níveis de conteúdo
    final resumo = await CatalogoService.carregarResumoMarkdown(
      widget.disciplina.dataPath,
      widget.tema.resumoFile,
    );
    final completo = await CatalogoService.carregarResumoMarkdown(
      widget.disciplina.dataPath,
      widget.tema.completoFile,
    );
    final formulas = await CatalogoService.carregarResumoMarkdown(
      widget.disciplina.dataPath,
      widget.tema.formulasFile,
    );

    final todasQuestoes = await CatalogoService.carregarQuestoes(widget.disciplina.dataPath);
    final questoesDoTema = todasQuestoes.where((q) => q.themeId == widget.tema.id).toList();

    final todosFlashcards = await CatalogoService.carregarFlashcards(widget.disciplina.dataPath);
    final flashcardsDoTema = todosFlashcards.where((f) =>
        f.tema == 'Módulo ${widget.tema.numero}' ||
        f.tema == 'Tema ${widget.tema.numero}' ||
        f.tema == '${widget.tema.numero}').toList();

    final answers = await ProgressoService.obterRespostas();
    final starred = await ProgressoService.obterFavoritos();
    final mastered = await ProgressoService.obterFlashcardsDominados();

    setState(() {
      _resumoMarkdown = resumo;
      _completoMarkdown = completo;
      _formulasMarkdown = formulas;
      _questoes = questoesDoTema;
      _flashcards = flashcardsDoTema;
      _userAnswers = answers;
      _starred = starred;
      _masteredFlashcards = mastered;
      _loading = false;
    });
  }

  String _cleanMathSymbols(String text) {
    if (text.isEmpty) return text;
    var res = text;
    res = res.replaceAll(r'\subseteq', '⊆');
    res = res.replaceAll(r'\supseteq', '⊇');
    res = res.replaceAll(r'\subset', '⊂');
    res = res.replaceAll(r'\supset', '⊃');
    res = res.replaceAll(r'⊂eq', '⊆');
    res = res.replaceAll(r'⊃eq', '⊇');
    res = res.replaceAll(r'\cup', '∪');
    res = res.replaceAll(r'\cap', '∩');
    res = res.replaceAll(r'\in', '∈');
    res = res.replaceAll(r'\notin', '∉');
    res = res.replaceAll(r'\emptyset', '∅');
    res = res.replaceAll(r'\varnothing', '∅');
    res = res.replaceAll(r'\mathcal{P}', 'P');
    res = res.replaceAll(r'\mathbb{R}', 'ℝ');
    res = res.replaceAll(r'\mathbb{N}', 'ℕ');
    res = res.replaceAll(r'\mathbb{Z}', 'ℤ');
    res = res.replaceAll(r'\mathbb{Q}', 'ℚ');
    res = res.replaceAll(r'\le', '≤');
    res = res.replaceAll(r'\leq', '≤');
    res = res.replaceAll(r'\ge', '≥');
    res = res.replaceAll(r'\geq', '≥');
    res = res.replaceAll(r'\neq', '≠');
    res = res.replaceAll(r'\approx', '≈');
    res = res.replaceAll(r'\equiv', '≡');
    res = res.replaceAll(r'\times', '×');
    res = res.replaceAll(r'\cdot', '·');
    res = res.replaceAll(r'\longrightarrow', '→');
    res = res.replaceAll(r'\rightarrow', '→');
    res = res.replaceAll(r'\to', '→');
    res = res.replaceAll(r'\leftrightarrow', '↔');
    res = res.replaceAll(r'\implies', '⇒');
    res = res.replaceAll(r'\iff', '⇔');
    res = res.replaceAll(r'\neg', '¬');
    res = res.replaceAll(r'\sim', '¬');
    res = res.replaceAll(r'\land', '∧');
    res = res.replaceAll(r'\lor', '∨');
    res = res.replaceAll(r'\forall', '∀');
    res = res.replaceAll(r'\exists', '∃');
    res = res.replaceAll(r'\sum', '∑');
    res = res.replaceAll(r'\prod', '∏');
    res = res.replaceAll(r'\{', '{');
    res = res.replaceAll(r'\}', '}');
    res = res.replaceAllMapped(RegExp(r'\$\$\s*([\s\S]*?)\s*\$\$'), (m) {
      final inner = (m.group(1) ?? '').replaceAll('\n', ' ').trim();
      return '\n> **$inner**\n';
    });
    res = res.replaceAllMapped(RegExp(r'\$([^$\n]+)\$'), (m) => m.group(1) ?? '');
    return res;
  }

  String _getActiveMarkdown() {
    String raw;
    switch (_selectedTier) {
      case ReadingTier.completo:
        raw = _completoMarkdown;
        break;
      case ReadingTier.formulas:
        raw = _formulasMarkdown;
        break;
      case ReadingTier.resumo:
        raw = _resumoMarkdown;
        break;
    }
    return _cleanMathSymbols(raw);
  }

  int _estimateReadTimeMinutes(String text) {
    final words = text.split(RegExp(r'\s+')).length;
    final mins = (words / 140).ceil();
    return mins < 1 ? 1 : mins;
  }

  List<Questao> _getFilteredQuestions() {
    return _questoes.where((q) {
      final ans = _userAnswers[q.id];
      if (_activeQuestionFilter == 'unanswered') return ans == null;
      if (_activeQuestionFilter == 'incorrect') return ans != null && ans['status'] == 'incorrect';
      if (_activeQuestionFilter == 'starred') return _starred.contains(q.id);
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeText = _getActiveMarkdown();
    final readTime = _estimateReadTimeMinutes(activeText);
    final filteredQuestoes = _getFilteredQuestions();

    // Contagem de flashcards dominados
    final temaMasteredCount = _flashcards.where((f) => _masteredFlashcards.contains(f.id)).length;
    final flashcardsPct = _flashcards.isNotEmpty
        ? ((temaMasteredCount / _flashcards.length) * 100).round()
        : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.tema.numero}. ${widget.tema.titulo}', overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: const Icon(Icons.timer_outlined),
            tooltip: 'Modo Foco / Pomodoro',
            onPressed: () => TimerFocoDialog.show(context),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(icon: Icon(Icons.menu_book_outlined), text: 'Revisão'),
            Tab(icon: const Icon(Icons.edit_note_outlined), text: 'Treino (${_questoes.length})'),
            Tab(icon: const Icon(Icons.flash_on_outlined), text: 'Fórmulas (${_flashcards.length})'),
          ],
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                // ==========================================
                // ABA 1: REVISÃO MULTINÍVEL (Completo, Resumo, Fórmulas)
                // ==========================================
                Column(
                  children: [
                    // Reading Toolbar (Seletor de Camadas + Zoom de Fonte + Tempo)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        border: Border(
                          bottom: BorderSide(color: theme.dividerColor.withValues(alpha: 0.2)),
                        ),
                      ),
                      child: Column(
                        children: [
                          // Seletor de Profundidade
                          Row(
                            children: [
                              Expanded(
                                child: SegmentedButton<ReadingTier>(
                                  segments: const [
                                    ButtonSegment(
                                      value: ReadingTier.resumo,
                                      label: Text('Resumo'),
                                      icon: Icon(Icons.bolt, size: 16),
                                    ),
                                    ButtonSegment(
                                      value: ReadingTier.completo,
                                      label: Text('Completo'),
                                      icon: Icon(Icons.auto_stories, size: 16),
                                    ),
                                    ButtonSegment(
                                      value: ReadingTier.formulas,
                                      label: Text('Fórmulas'),
                                      icon: Icon(Icons.functions, size: 16),
                                    ),
                                  ],
                                  selected: {_selectedTier},
                                  onSelectionChanged: (set) {
                                    setState(() => _selectedTier = set.first);
                                  },
                                  style: const ButtonStyle(
                                    visualDensity: VisualDensity.compact,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Barra de utilidades: Tempo estimado e Tamanho da Fonte
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.schedule, size: 14, color: theme.hintColor),
                                  const SizedBox(width: 4),
                                  Text(
                                    '⏱️ ~ $readTime min de leitura',
                                    style: TextStyle(fontSize: 12, color: theme.hintColor, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Tamanho:',
                                    style: TextStyle(fontSize: 12, color: theme.hintColor),
                                  ),
                                  const SizedBox(width: 6),
                                  InkWell(
                                    onTap: () {
                                      if (_fontSize > 12.0) setState(() => _fontSize -= 1.5);
                                    },
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.3)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text('A-', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  InkWell(
                                    onTap: () {
                                      if (_fontSize < 24.0) setState(() => _fontSize += 1.5);
                                    },
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.3)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: const Text('A+', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Conteúdo Markdown Renderizado
                    Expanded(
                      child: Markdown(
                        data: activeText,
                        padding: const EdgeInsets.all(20),
                        selectable: true,
                        styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
                          p: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: _fontSize,
                            height: 1.65,
                          ),
                          h1: theme.textTheme.titleLarge?.copyWith(
                            fontSize: _fontSize + 7,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                          h2: theme.textTheme.titleMedium?.copyWith(
                            fontSize: _fontSize + 4,
                            fontWeight: FontWeight.bold,
                          ),
                          h3: theme.textTheme.titleSmall?.copyWith(
                            fontSize: _fontSize + 2,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                          blockquote: TextStyle(
                            fontSize: _fontSize,
                            fontStyle: FontStyle.normal,
                            height: 1.5,
                            color: theme.textTheme.bodyMedium?.color,
                          ),
                          blockquoteDecoration: BoxDecoration(
                            color: AppTheme.primaryLight.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(8),
                            border: const Border(
                              left: BorderSide(color: AppTheme.primaryColor, width: 4),
                            ),
                          ),
                          code: TextStyle(
                            fontSize: _fontSize - 1,
                            backgroundColor: theme.colorScheme.surfaceContainerHighest,
                            fontFamily: 'monospace',
                          ),
                          codeblockDecoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: theme.dividerColor.withValues(alpha: 0.2)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // ==========================================
                // ABA 2: TREINO INTERATIVO COM FILTROS
                // ==========================================
                Column(
                  children: [
                    // Filtros de Questões (Todas, Pendentes, Erradas, Favoritas)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ChoiceChip(
                              label: Text('Todas (${_questoes.length})'),
                              selected: _activeQuestionFilter == 'all',
                              onSelected: (_) => setState(() => _activeQuestionFilter = 'all'),
                            ),
                            const SizedBox(width: 8),
                            ChoiceChip(
                              label: const Text('Pendentes'),
                              selected: _activeQuestionFilter == 'unanswered',
                              onSelected: (_) => setState(() => _activeQuestionFilter = 'unanswered'),
                            ),
                            const SizedBox(width: 8),
                            ChoiceChip(
                              label: const Text('❌ Erradas'),
                              selected: _activeQuestionFilter == 'incorrect',
                              onSelected: (_) => setState(() => _activeQuestionFilter = 'incorrect'),
                            ),
                            const SizedBox(width: 8),
                            ChoiceChip(
                              label: const Text('⭐ Favoritas'),
                              selected: _activeQuestionFilter == 'starred',
                              onSelected: (_) => setState(() => _activeQuestionFilter = 'starred'),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Lista de Questões
                    Expanded(
                      child: filteredQuestoes.isEmpty
                          ? Center(
                              child: Text(
                                'Nenhuma questão encontrada para este filtro.',
                                style: TextStyle(color: theme.hintColor),
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemCount: filteredQuestoes.length,
                              itemBuilder: (context, index) {
                                final q = filteredQuestoes[index];
                                final ans = _userAnswers[q.id];

                                return QuestaoCard(
                                  questao: q,
                                  initialSelected: ans?['selected'] as String?,
                                  initialCorrect: ans != null ? ans['status'] == 'correct' : null,
                                  isStarred: _starred.contains(q.id),
                                  onAnswered: (letra, acertou) async {
                                    await ProgressoService.salvarResposta(q.id, letra, acertou);
                                    final updated = await ProgressoService.obterRespostas();
                                    setState(() => _userAnswers = updated);
                                  },
                                  onReset: () async {
                                    await ProgressoService.limparResposta(q.id);
                                    final updated = await ProgressoService.obterRespostas();
                                    setState(() => _userAnswers = updated);
                                  },
                                  onToggleStar: () async {
                                    await ProgressoService.alternarFavorito(q.id);
                                    final updated = await ProgressoService.obterFavoritos();
                                    setState(() => _starred = updated);
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),

                // ==========================================
                // ABA 3: FLASHCARDS COM DOMÍNIO
                // ==========================================
                Column(
                  children: [
                    // Barra de Progresso de Fixação / Domínio
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fixação dos Flashcards',
                                style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '$temaMasteredCount de ${_flashcards.length} dominados ($flashcardsPct%)',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.successColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: _flashcards.isNotEmpty ? (temaMasteredCount / _flashcards.length) : 0,
                            backgroundColor: theme.dividerColor.withValues(alpha: 0.2),
                            color: AppTheme.successColor,
                            borderRadius: BorderRadius.circular(999),
                            minHeight: 6,
                          ),
                        ],
                      ),
                    ),

                    // Lista de Flashcards
                    Expanded(
                      child: _flashcards.isEmpty
                          ? const Center(child: Text('Nenhum flashcard cadastrado para este módulo ainda.'))
                          : ListView.builder(
                              padding: const EdgeInsets.only(bottom: 16),
                              itemCount: _flashcards.length,
                              itemBuilder: (context, index) {
                                final fc = _flashcards[index];
                                final isMastered = _masteredFlashcards.contains(fc.id);

                                return FlashcardCard(
                                  flashcard: fc,
                                  isMastered: isMastered,
                                  onMasteryChanged: (dominado) async {
                                    await ProgressoService.alternarDominioFlashcard(fc.id, dominado);
                                    final updated = await ProgressoService.obterFlashcardsDominados();
                                    setState(() => _masteredFlashcards = updated);
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
