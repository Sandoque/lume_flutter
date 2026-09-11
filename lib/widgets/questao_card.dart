import 'package:flutter/material.dart';
import '../models/questao.dart';
import '../theme/app_theme.dart';

class QuestaoCard extends StatefulWidget {
  final Questao questao;
  final String? initialSelected;
  final bool? initialCorrect;
  final bool isStarred;
  final Function(String opcaoEscolhida, bool acertou)? onAnswered;
  final VoidCallback? onReset;
  final VoidCallback? onToggleStar;
  final bool isSimuladoMode;

  const QuestaoCard({
    super.key,
    required this.questao,
    this.initialSelected,
    this.initialCorrect,
    this.isStarred = false,
    this.onAnswered,
    this.onReset,
    this.onToggleStar,
    this.isSimuladoMode = false,
  });

  @override
  State<QuestaoCard> createState() => _QuestaoCardState();
}

class _QuestaoCardState extends State<QuestaoCard> {
  String? _selected;
  bool? _isCorrect;
  bool _showExplanation = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected;
    _isCorrect = widget.initialCorrect;
    if (_isCorrect != null && !widget.isSimuladoMode) {
      _showExplanation = true;
    }
  }

  @override
  void didUpdateWidget(covariant QuestaoCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelected != widget.initialSelected) {
      setState(() {
        _selected = widget.initialSelected;
        _isCorrect = widget.initialCorrect;
        _showExplanation = (_isCorrect != null && !widget.isSimuladoMode);
      });
    }
  }

  void _handleSelect(String letter) {
    if (_isCorrect != null && !widget.isSimuladoMode) return;
    setState(() {
      _selected = letter;
    });
    if (widget.isSimuladoMode) {
      widget.onAnswered?.call(letter, letter == widget.questao.correct);
    }
  }

  void _conferir() {
    if (_selected == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione uma alternativa antes de conferir!')),
      );
      return;
    }
    final acertou = _selected == widget.questao.correct;
    setState(() {
      _isCorrect = acertou;
      _showExplanation = true;
    });
    widget.onAnswered?.call(_selected!, acertou);
  }

  void _tentarNovamente() {
    setState(() {
      _selected = null;
      _isCorrect = null;
      _showExplanation = false;
    });
    widget.onReset?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAnswered = _isCorrect != null;

    Color? borderColor;
    if (isAnswered && !widget.isSimuladoMode) {
      borderColor = _isCorrect! ? AppTheme.successColor : AppTheme.errorColor;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: borderColor ?? theme.dividerColor.withValues(alpha: 0.2),
          width: borderColor != null ? 2 : 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Badge do Tema e Botão Favoritar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryLight,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    widget.questao.themeName.split(':').first.toUpperCase(),
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    widget.isStarred ? Icons.star : Icons.star_border,
                    color: widget.isStarred ? Colors.amber : Colors.grey,
                  ),
                  onPressed: widget.onToggleStar,
                  tooltip: 'Favoritar questão',
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Título
            Text(
              widget.questao.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Enunciado
            Text(
              widget.questao.statement,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),

            // Alternativas
            ...widget.questao.options.map((opt) {
              final isChosen = _selected == opt.letter;
              Color optBg = theme.colorScheme.surface;
              Color optBorder = theme.dividerColor.withValues(alpha: 0.3);

              if (isAnswered && !widget.isSimuladoMode) {
                if (opt.letter == widget.questao.correct) {
                  optBg = AppTheme.successColor.withValues(alpha: 0.12);
                  optBorder = AppTheme.successColor;
                } else if (isChosen && !_isCorrect!) {
                  optBg = AppTheme.errorColor.withValues(alpha: 0.12);
                  optBorder = AppTheme.errorColor;
                }
              } else if (isChosen) {
                optBg = AppTheme.primaryLight;
                optBorder = AppTheme.primaryColor;
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: () => _handleSelect(opt.letter),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: optBg,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: optBorder),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${opt.letter}) ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            opt.text,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

            // Botões de Ação no Modo Treino
            if (!widget.isSimuladoMode) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  if (!isAnswered)
                    ElevatedButton(
                      onPressed: _conferir,
                      child: const Text('Conferir Resposta'),
                    )
                  else
                    OutlinedButton(
                      onPressed: _tentarNovamente,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      child: const Text('Tentar Novamente'),
                    ),
                ],
              ),
            ],

            // Resolução Comentada e Alerta de Prova
            if (_showExplanation && !widget.isSimuladoMode) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: _isCorrect! ? AppTheme.successColor.withValues(alpha: 0.08) : AppTheme.errorColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _isCorrect! ? AppTheme.successColor.withValues(alpha: 0.3) : AppTheme.errorColor.withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          _isCorrect! ? Icons.check_circle : Icons.cancel,
                          color: _isCorrect! ? AppTheme.successColor : AppTheme.errorColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isCorrect! ? 'Resposta Correta!' : 'Resposta Incorreta',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _isCorrect! ? AppTheme.successColor : AppTheme.errorColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Gabarito: ${widget.questao.correct}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(height: 18),
                    Text(
                      widget.questao.explanation,
                      style: theme.textTheme.bodySmall?.copyWith(height: 1.5),
                    ),
                    if (widget.questao.examTip.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppTheme.warningColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border(left: BorderSide(color: AppTheme.warningColor, width: 3)),
                        ),
                        child: Text(
                          '⚠️ Atenção na Prova: ${widget.questao.examTip}',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
