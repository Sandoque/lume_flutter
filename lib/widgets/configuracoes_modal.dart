import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../services/progresso_service.dart';
import '../theme/app_theme.dart';

class ConfiguracoesModal extends StatelessWidget {
  final VoidCallback onDataChanged;

  const ConfiguracoesModal({super.key, required this.onDataChanged});

  static void show(BuildContext context, {required VoidCallback onDataChanged}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => ConfiguracoesModal(onDataChanged: onDataChanged),
    );
  }

  void _exportarBackup(BuildContext context) async {
    final jsonStr = await ProgressoService.exportarBackup();
    await Clipboard.setData(ClipboardData(text: jsonStr));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Backup copiado para a área de transferência! Guarde ou envie para o celular.'),
          backgroundColor: AppTheme.successColor,
        ),
      );
    }
  }

  void _abrirImportarDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (dlgContext) => AlertDialog(
        title: const Text('Restaurar Progresso'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cole o texto JSON do seu backup abaixo:',
              style: TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              maxLines: 6,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Cole aqui o conteúdo do backup...',
              ),
              style: const TextStyle(fontSize: 11, fontFamily: 'monospace'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dlgContext),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              final texto = controller.text.trim();
              if (texto.isEmpty) return;
              final ok = await ProgressoService.importarBackup(texto);
              if (dlgContext.mounted) Navigator.pop(dlgContext);
              if (context.mounted) {
                if (ok) {
                  onDataChanged();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('🎉 Progresso restaurado com sucesso!'),
                      backgroundColor: AppTheme.successColor,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('❌ Formato de backup inválido.'),
                      backgroundColor: AppTheme.errorColor,
                    ),
                  );
                }
              }
            },
            child: const Text('Restaurar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentThemeMode = lumeThemeNotifier.value;

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.dividerColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header Lume
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/lume_logo.png',
                  width: 38,
                  height: 38,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lume',
                    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Luz e clareza para seus estudos • v1.0.0',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Tema Visual
          Text(
            'Tema Visual',
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SegmentedButton<ThemeMode>(
            segments: const [
              ButtonSegment(
                value: ThemeMode.light,
                label: Text('Claro'),
                icon: Icon(Icons.light_mode_outlined, size: 16),
              ),
              ButtonSegment(
                value: ThemeMode.dark,
                label: Text('Escuro'),
                icon: Icon(Icons.dark_mode_outlined, size: 16),
              ),
              ButtonSegment(
                value: ThemeMode.system,
                label: Text('Sistema'),
                icon: Icon(Icons.brightness_auto_outlined, size: 16),
              ),
            ],
            selected: {currentThemeMode},
            onSelectionChanged: (set) async {
              final newMode = set.first;
              lumeThemeNotifier.value = newMode;
              await ProgressoService.salvarThemeMode(newMode);
            },
          ),
          const SizedBox(height: 24),

          // Backup & Sincronização
          Text(
            'Backup & Sincronização Local',
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Transfira seu histórico de acertos, erros e favoritos entre o computador e o celular sem precisar de internet.',
            style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => _exportarBackup(context),
                  icon: const Icon(Icons.copy_rounded, size: 18),
                  label: const Text('Copiar Backup'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _abrirImportarDialog(context),
                  icon: const Icon(Icons.download_rounded, size: 18),
                  label: const Text('Restaurar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
