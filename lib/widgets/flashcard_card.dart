import 'package:flutter/material.dart';
import '../models/flashcard.dart';
import '../theme/app_theme.dart';

class FlashcardCard extends StatefulWidget {
  final Flashcard flashcard;
  final bool isMastered;
  final Function(bool isMastered)? onMasteryChanged;

  const FlashcardCard({
    super.key,
    required this.flashcard,
    this.isMastered = false,
    this.onMasteryChanged,
  });

  @override
  State<FlashcardCard> createState() => _FlashcardCardState();
}

class _FlashcardCardState extends State<FlashcardCard> {
  bool _flipped = false;

  void _toggleFlip() {
    setState(() {
      _flipped = !_flipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: _toggleFlip,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: widget.isMastered
                ? AppTheme.successColor
                : AppTheme.primaryColor.withValues(alpha: 0.3),
            width: widget.isMastered ? 2 : 1.5,
          ),
        ),
        child: Container(
          constraints: const BoxConstraints(minHeight: 220),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Header
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
                      widget.flashcard.tema,
                      style: const TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (widget.isMastered)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.successColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.check, size: 14, color: AppTheme.successColor),
                          SizedBox(width: 4),
                          Text(
                            'Dominado',
                            style: TextStyle(
                              color: AppTheme.successColor,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Text(
                      _flipped ? 'Verso (Resposta)' : 'Frente (Pergunta)',
                      style: TextStyle(color: theme.hintColor, fontSize: 12),
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Título
              Text(
                widget.flashcard.titulo,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 12),

              // Conteúdo (Frente ou Verso)
              if (!_flipped)
                Text(
                  widget.flashcard.frente,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                )
              else ...[
                Text(
                  widget.flashcard.verso,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                ),
                if (widget.flashcard.dica.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.warningColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                      border: const Border(left: BorderSide(color: AppTheme.warningColor, width: 3)),
                    ),
                    child: Text(
                      '💡 Dica: ${widget.flashcard.dica}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
                const SizedBox(height: 16),

                // Botões de Autoavaliação de Domínio (Leitner / Anki)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        widget.onMasteryChanged?.call(false);
                      },
                      icon: const Icon(Icons.refresh, size: 16, color: AppTheme.errorColor),
                      label: const Text('Revisar', style: TextStyle(color: AppTheme.errorColor)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppTheme.errorColor),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        widget.onMasteryChanged?.call(true);
                      },
                      icon: const Icon(Icons.check_circle_outline, size: 16),
                      label: const Text('Dominei!'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.successColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 12),
              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.flip, size: 16, color: theme.hintColor),
                  const SizedBox(width: 4),
                  Text(
                    'Toque no card para virar',
                    style: TextStyle(fontSize: 11, color: theme.hintColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
