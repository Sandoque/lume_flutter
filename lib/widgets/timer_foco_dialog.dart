import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TimerFocoDialog extends StatefulWidget {
  const TimerFocoDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const TimerFocoDialog(),
    );
  }

  @override
  State<TimerFocoDialog> createState() => _TimerFocoDialogState();
}

class _TimerFocoDialogState extends State<TimerFocoDialog> {
  int _selectedMinutes = 25;
  int _secondsLeft = 25 * 60;
  bool _isRunning = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _secondsLeft = _selectedMinutes * 60;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
    } else {
      setState(() => _isRunning = true);
      _timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (_secondsLeft > 0) {
          setState(() => _secondsLeft--);
        } else {
          t.cancel();
          setState(() => _isRunning = false);
          _showFinishedDialog();
        }
      });
    }
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _secondsLeft = _selectedMinutes * 60;
    });
  }

  void _selectPreset(int minutes) {
    _timer?.cancel();
    setState(() {
      _selectedMinutes = minutes;
      _secondsLeft = minutes * 60;
      _isRunning = false;
    });
  }

  void _showFinishedDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🎉 Bloco de estudo concluído! Hora de uma pausa ou próximo módulo.'),
        backgroundColor: AppTheme.successColor,
        duration: Duration(seconds: 4),
      ),
    );
  }

  String _formatTime() {
    final m = _secondsLeft ~/ 60;
    final s = _secondsLeft % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = 1.0 - (_secondsLeft / (_selectedMinutes * 60));

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer_outlined, color: AppTheme.primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      'Modo Foco Lume',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Seletor de Ciclos
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceChip(
                    label: const Text('15 min'),
                    selected: _selectedMinutes == 15,
                    onSelected: (_) => _selectPreset(15),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('25 min (Foco)'),
                    selected: _selectedMinutes == 25,
                    onSelected: (_) => _selectPreset(25),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('45 min'),
                    selected: _selectedMinutes == 45,
                    onSelected: (_) => _selectPreset(45),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('5 min (Pausa)'),
                    selected: _selectedMinutes == 5,
                    onSelected: (_) => _selectPreset(5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Círculo com o Cronômetro
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 170,
                  height: 170,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 8,
                    backgroundColor: theme.dividerColor.withValues(alpha: 0.2),
                    color: _selectedMinutes == 5 ? Colors.amber : AppTheme.primaryColor,
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatTime(),
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontFeatures: const [FontFeature.tabularFigures()],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _isRunning ? 'Em andamento' : 'Pausado',
                      style: TextStyle(
                        fontSize: 12,
                        color: _isRunning ? AppTheme.successColor : theme.hintColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Controles (Play / Pause / Reset)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.outlined(
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Reiniciar',
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _toggleTimer,
                  icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                  label: Text(_isRunning ? 'Pausar' : 'Iniciar Foco'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
