import 'package:flutter/material.dart';
import '../models/periodo.dart';
import '../services/catalogo_service.dart';
import '../services/progresso_service.dart';
import '../theme/app_theme.dart';
import '../widgets/estatistica_card.dart';
import '../widgets/timer_foco_dialog.dart';
import '../widgets/configuracoes_modal.dart';
import 'disciplina_hub_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Periodo> _periodos = [];
  bool _loading = true;
  int _selectedPeriodoIndex = 0;
  int _totalAnswered = 0;
  int _totalCorrect = 0;
  int _totalErrors = 0;
  int _starredCount = 0;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    setState(() => _loading = true);
    final periodos = await CatalogoService.carregarPeriodos();
    final answers = await ProgressoService.obterRespostas();
    final starred = await ProgressoService.obterFavoritos();

    int correct = 0;
    int errors = 0;
    answers.forEach((_, v) {
      if (v['status'] == 'correct') correct++;
      if (v['status'] == 'incorrect') errors++;
    });

    setState(() {
      _periodos = periodos;
      _totalAnswered = answers.length;
      _totalCorrect = correct;
      _totalErrors = errors;
      _starredCount = starred.length;
      _loading = false;
    });
  }

  IconData _obterIcone(String nomeIcone) {
    switch (nomeIcone) {
      case 'calculate':
        return Icons.calculate_outlined;
      case 'code':
        return Icons.code_rounded;
      case 'storage':
        return Icons.storage_rounded;
      case 'router':
      case 'network':
        return Icons.hub_outlined;
      case 'cloud':
        return Icons.cloud_outlined;
      case 'security':
        return Icons.shield_outlined;
      default:
        return Icons.book_outlined;
    }
  }

  Color _parseCor(String hex) {
    try {
      final buffer = StringBuffer();
      if (hex.length == 6 || hex.length == 7) buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return AppTheme.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final periodoAtual = _periodos.isNotEmpty ? _periodos[_selectedPeriodoIndex] : null;
    final accuracyPct = _totalAnswered > 0
        ? ((_totalCorrect / _totalAnswered) * 100).round()
        : 0;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/lume_logo.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lume',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Luz e clareza para seus estudos',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.timer_outlined),
            tooltip: 'Modo Foco / Pomodoro',
            onPressed: () => TimerFocoDialog.show(context),
          ),
          IconButton(
            icon: const Icon(Icons.tune_rounded),
            tooltip: 'Configurações e Backup',
            onPressed: () => ConfiguracoesModal.show(context, onDataChanged: _carregarDados),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _carregarDados,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dashboard de Estatísticas (2 Linhas elegantes)
              Row(
                children: [
                  Expanded(
                    child: EstatisticaCard(
                      label: 'Respondidas',
                      value: '$_totalAnswered',
                      icon: Icons.check_circle_outline,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: EstatisticaCard(
                      label: 'Acertos',
                      value: '$_totalCorrect ($accuracyPct%)',
                      icon: Icons.trending_up_rounded,
                      color: AppTheme.successColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: EstatisticaCard(
                      label: 'Erros a Revisar',
                      value: '$_totalErrors',
                      icon: Icons.error_outline,
                      color: _totalErrors > 0 ? AppTheme.errorColor : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: EstatisticaCard(
                      label: 'Favoritas',
                      value: '$_starredCount',
                      icon: Icons.star_border_rounded,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Seletor de Períodos
              Text(
                'Períodos Letivos',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _periodos.asMap().entries.map((entry) {
                    final idx = entry.key;
                    final p = entry.value;
                    final isSelected = idx == _selectedPeriodoIndex;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                        label: Text(p.nome),
                        selected: isSelected,
                        onSelected: (val) {
                          if (val) setState(() => _selectedPeriodoIndex = idx);
                        },
                        selectedColor: AppTheme.primaryColor,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : theme.textTheme.bodyMedium?.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),

              // Lista de Disciplinas do Período
              if (periodoAtual != null) ...[
                Text(
                  'Disciplinas do ${periodoAtual.nome}',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  periodoAtual.descricao,
                  style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                ),
                const SizedBox(height: 14),

                ...periodoAtual.disciplinas.map((disc) {
                  final cor = _parseCor(disc.corHex);
                  final isDisponivel = disc.temas.isNotEmpty;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: isDisponivel
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DisciplinaHubScreen(disciplina: disc),
                                ),
                              ).then((_) => _carregarDados());
                            }
                          : null,
                      borderRadius: BorderRadius.circular(14),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: cor.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(_obterIcone(disc.icone), color: cor, size: 28),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          disc.nome,
                                          style: theme.textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      if (!isDisponivel) ...[
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withValues(alpha: 0.2),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: const Text(
                                            'Em breve',
                                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    disc.descricao,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.hintColor,
                                      height: 1.3,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (isDisponivel) ...[
                                    const SizedBox(height: 8),
                                    Text(
                                      '${disc.temas.length} módulos disponíveis • Apostilas & Simulados',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: cor,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            if (isDisponivel)
                              const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
