import 'package:flutter/material.dart';
import '../models/disciplina.dart';
import '../models/tema.dart';
import '../services/catalogo_service.dart';
import '../services/progresso_service.dart';
import '../theme/app_theme.dart';
import 'tema_detail_screen.dart';
import 'simulado_screen.dart';
import 'caderno_erros_screen.dart';

class DisciplinaHubScreen extends StatefulWidget {
  final Disciplina disciplina;

  const DisciplinaHubScreen({super.key, required this.disciplina});

  @override
  State<DisciplinaHubScreen> createState() => _DisciplinaHubScreenState();
}

class _DisciplinaHubScreenState extends State<DisciplinaHubScreen> {
  int _errorCount = 0;
  bool _loadingErrors = true;

  @override
  void initState() {
    super.initState();
    _carregarErros();
  }

  Future<void> _carregarErros() async {
    final todas = await CatalogoService.carregarQuestoes(widget.disciplina.dataPath);
    final erradas = await ProgressoService.filtrarQuestoesErradas(todas);
    if (mounted) {
      setState(() {
        _errorCount = erradas.length;
        _loadingErrors = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disciplina = widget.disciplina;

    return Scaffold(
      appBar: AppBar(
        title: Text(disciplina.nome, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Buscar módulos',
            onPressed: () {
              showSearch(
                context: context,
                delegate: _TemaSearchDelegate(disciplina: disciplina),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _carregarErros,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Simulado Geral
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primaryColor, Color(0xFF134E4A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Simulado da Prova',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Teste seus conhecimentos com cronômetro em questões integradas.',
                            style: TextStyle(color: Colors.white70, fontSize: 13),
                          ),
                          const SizedBox(height: 14),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => SimuladoScreen(disciplina: disciplina),
                                ),
                              ).then((_) => _carregarErros());
                            },
                            icon: const Icon(Icons.timer_outlined, size: 18),
                            label: const Text('Iniciar Simulado'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.quiz_outlined, size: 56, color: Colors.white24),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Card Caderno de Erros (Acesso Rápido)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: _errorCount > 0
                        ? AppTheme.errorColor.withValues(alpha: 0.3)
                        : theme.dividerColor.withValues(alpha: 0.15),
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CadernoErrosScreen(disciplina: disciplina),
                      ),
                    ).then((_) => _carregarErros());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: (_errorCount > 0 ? AppTheme.errorColor : AppTheme.successColor)
                                .withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            _errorCount > 0 ? Icons.error_outline : Icons.task_alt_outlined,
                            color: _errorCount > 0 ? AppTheme.errorColor : AppTheme.successColor,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Caderno de Erros',
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _loadingErrors
                                    ? 'Verificando questões...'
                                    : _errorCount > 0
                                        ? '$_errorCount questão(ões) para revisar e dominar'
                                        : 'Nenhum erro pendente! Parabéns.',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: _errorCount > 0 ? AppTheme.errorColor : theme.hintColor,
                                  fontWeight: _errorCount > 0 ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Cabeçalho dos Módulos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Módulos de Estudo',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${disciplina.temas.length} módulos',
                    style: TextStyle(fontSize: 12, color: theme.hintColor),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Lista de Temas
              ...disciplina.temas.map((t) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor: AppTheme.primaryLight,
                      child: Text(
                        '${t.numero}',
                        style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      t.titulo,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        t.descricao,
                        style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor),
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TemaDetailScreen(
                            disciplina: disciplina,
                            tema: t,
                          ),
                        ),
                      ).then((_) => _carregarErros());
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _TemaSearchDelegate extends SearchDelegate<Tema?> {
  final Disciplina disciplina;

  _TemaSearchDelegate({required this.disciplina});

  @override
  String get searchFieldLabel => 'Buscar tópicos e conceitos...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _buildSearchResults(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildSearchResults(context);

  Widget _buildSearchResults(BuildContext context) {
    final lowerQuery = query.toLowerCase().trim();
    final matches = disciplina.temas.where((t) {
      return t.titulo.toLowerCase().contains(lowerQuery) ||
          t.descricao.toLowerCase().contains(lowerQuery);
    }).toList();

    if (matches.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Text('Nenhum módulo encontrado com este termo.'),
        ),
      );
    }

    return ListView.builder(
      itemCount: matches.length,
      itemBuilder: (context, index) {
        final t = matches[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.primaryLight,
            child: Text('${t.numero}', style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
          ),
          title: Text(t.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(t.descricao, maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            close(context, t);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TemaDetailScreen(disciplina: disciplina, tema: t),
              ),
            );
          },
        );
      },
    );
  }
}
