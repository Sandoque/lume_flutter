# 🌟 Lume — Luz e Clareza para seus Estudos

> **"Transformando o estudo acadêmico superior em uma jornada focada, estruturada e de alto rendimento."**

[![Flutter](https://img.shields.io/badge/Flutter-3.5%2B-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5%2B-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Material 3](https://img.shields.io/badge/Design-Material%203-7C3AED)](https://m3.material.io)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Web%20%7C%20Windows-green)](#)
[![Offline First](https://img.shields.io/badge/Architecture-100%25%20Offline%20First-success)](#)
[![License](https://img.shields.io/badge/License-Proprietary-blue)](#)

---

## 📖 Visão Geral do Produto

O **Lume** é um aplicativo móvel e multiplataforma de alto desempenho projetado especificamente para estudantes de graduação (Ciência da Computação, Engenharia de Software, Sistemas de Informação, Redes e áreas correlatas).

Desenvolvido com uma arquitetura **100% orientada a dados e offline-first**, o Lume reúne apostilas acadêmicas, resumos dinâmicos, questões interativas de fixação com justificativas pedagógicas, flashcards com repetição espaçada e simulados cronometrados — tudo em uma interface moderna, rápida e livre de distrações.

---

## ✨ Recursos & Diferenciais

### 🎯 1. Abordagem Pedagógica Tridimensional (por Módulo)
Cada módulo de estudo é estruturado em três dimensões complementares de aprendizagem:
* **Resumo Executivo & Fórmulas**: Síntese direta ao ponto para leitura rápida antes de provas e memorização de regras de ouro.
* **Conteúdo Teórico Aprofundado**: Fundamentação técnica completa, com tópicos conceituais, esquemas e exemplos práticos.
* **Treino Ativo & Flashcards**: Questões de múltipla escolha com correção instantânea e justificativas explicativas, além de cartões de memorização com animação 3D (Flip).

### ⏱️ 2. Modo Foco Pomodoro Embutido
* Temporizador de produtividade integrado diretamente na tela inicial.
* Ciclos de **25 minutos de foco** intercalados com **5 minutos de descanso**.
* Contador automático de ciclos concluídos para acompanhar sua dedicação diária sem sair do aplicativo.

### 📝 3. Simulador de Provas Cronometrado
* Modo simulado disponível por disciplina ou geral (multidisciplinar).
* Cronômetro regressivo com contagem de tempo real.
* Relatório final completo: nota alcançada, porcentagem de acertos, tempo decorrido e revisão questão por questão.

### 🌓 4. Design System Material 3 Refinado
* Suporte nativo completo a **Tema Claro (Light)** e **Tema Escuro (Dark Mode)**, projetado para máximo conforto visual em sessões noturnas de leitura.
* Identidade visual em azul ultramarino com acentos de luz dourada (*Lume*).
* Tipografia matemática nativa em caracteres Unicode universais (`∪`, `∩`, `∈`, `⊆`, `∅`, `¬`, `∧`, `∨`, `→`, `≡`, `∀`, `∃`, `≤`, `≥`, `≠`), garantindo leitura limpa sem códigos LaTeX crus na tela.
* Layout responsivo com quebra automática de linha, otimizado para celulares de qualquer proporção de tela.

### 💾 5. Soberania dos Dados & Privacidade Total
* **100% Offline**: Todos os resumos, questões e flashcards funcionam perfeitamente sem conexão com a internet.
* **Zero Cadastro**: Sem necessidade de login ou envio de telemetria para a nuvem.
* **Backup & Sincronização Local**: Ferramenta nativa para exportar e restaurar todo o seu histórico de acertos, questões favoritas e progresso em formato JSON limpo.

---

## 📚 Matriz de Conteúdo Curricular (1º Período)

O Lume já nasce com o conteúdo completo de **5 disciplinas fundamentais** do 1º período acadêmico, totalizando **28 módulos**, **124 questões comentadas** e **76 flashcards**:

| Disciplina | Código | Módulos | Questões | Flashcards | Eixos Principais |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **Matemática e Lógica** | `MAT-101` | 7 | 41 | 25 | Teoria dos Conjuntos, Funções, Lógica Proposicional, Predicados e Demonstrações |
| **Fundamentos de Redes** | `RED-101` | 6 | 35 | 19 | Modelo OSI, Pilha TCP/IP, Camadas de Aplicação à Física, Roteamento e Segurança |
| **Computação em Nuvem** | `CLD-101` | 6 | 24 | 14 | Modelos de Serviço (IaaS/PaaS/SaaS), Arquitetura Cloud, Segurança, AWS, Azure e GCP |
| **Introdução a Seg. da Informação** | `SEG-101` | 6 | 15 | 12 | Tríade CID, Ameaças e Malware, ISO/IEC 27001, LGPD, Gestão de Riscos e Continuidade (BCP/DRP) |
| **Introdução a Prog. de Computadores** | `PRG-101` | 3 | 9 | 6 | Fundamentos de Linguagem C, Estruturas de Decisão e Repetição, Vetores e Algoritmos de Jogos |
| **TOTAL CONSOLIDADO** | — | **28** | **124** | **76** | **Grade curricular completa do 1º semestre** |

---

## 🏛️ Arquitetura do Software

O projeto adota uma arquitetura em camadas desacoplada (**Data-Driven Dynamic Architecture**), onde a interface gráfica é totalmente independente do catálogo de disciplinas.

```
C:\webservice\dbA\poc_flutter\
├── apostilas/                     # Central de Apostilas originais (PDFs fontes por período)
│   ├── 1_periodo/                 # 5 pastas de matérias com 29 PDFs originais
│   ├── 2_periodo/                 # Estrutura pronta para os próximos semestres
│   └── LEIAME.txt                 # Instruções de padronização de apostilas
├── assets/
│   ├── data/
│   │   ├── catalogo.json          # Registro central de períodos, disciplinas e módulos
│   │   └── disciplinas/           # Arquivos de estudo por disciplina:
│   │       ├── matematica_logica/ #   ├── tema_X_resumo.md, tema_X_completo.md, tema_X_formulas.md
│   │       ├── redes_computadores/#   ├── questoes.json (questões com alternativas e gabarito)
│   │       ├── computacao_nuvem/  #   └── flashcards.json (frente, verso e categoria)
│   │       ├── seguranca_informacao/
│   │       └── programacao_computadores/
│   └── images/                    # Logotipos oficiais e ícones visuais do Lume
├── tools/                         # Pipeline de automação e ingestão de conteúdo
│   ├── parser_pdf.py              # Extrator de textos e detector de questões em PDFs
│   └── import_disciplina.py       # CLI para scaffolding e cadastro rápido de novas matérias
├── lib/
│   ├── main.dart                  # Ponto de entrada, inicialização de serviços e rotas
│   ├── models/                    # Modelos de domínio (Periodo, Disciplina, Tema, Questao, Flashcard)
│   ├── services/
│   │   ├── catalogo_service.dart  # Motor de carregamento e caching dos dados do app
│   │   └── progresso_service.dart # Persistência local (respostas, acertos, timer, backup/restore)
│   ├── theme/
│   │   └── app_theme.dart         # Design System Material 3 (paletas Claro e Escuro, tipografia)
│   ├── widgets/                   # Componentes modulares reutilizáveis
│   │   ├── questao_card.dart      # Card interativo de questão com correção e feedback
│   │   ├── flashcard_card.dart    # Cartão de memorização com rotação 3D animada
│   │   ├── estatistica_card.dart  # Cards de métricas de rendimento
│   │   ├── pomodoro_widget.dart   # Widget interativo do timer Pomodoro
│   │   └── backup_dialog.dart     # Modal de exportação e importação de progresso
│   └── screens/
│       ├── home_screen.dart           # Dashboard principal com seletor de períodos e matérias
│       ├── disciplina_hub_screen.dart # Hub da disciplina (visão de módulos e simulado específico)
│       ├── tema_detail_screen.dart    # Ambiente de estudo do módulo (Revisão, Treino e Flashcards)
│       └── simulado_screen.dart       # Execução do simulado cronometrado com relatório final
├── pubspec.yaml                   # Dependências e declaração de assets
└── README.md                      # Documentação oficial do projeto
```

---

## 🛠️ Pipeline de Ingestão de Conteúdo

Adicionar novas disciplinas ou avançar para os próximos períodos acadêmicos é um processo simples e automatizado:

### 1. Organização das Apostilas
Coloque os PDFs da matéria na pasta correspondente dentro da central:
`apostilas/<X_periodo>/<nome_da_materia>/Tema X - Titulo.pdf`

### 2. Inspeção e Extração Automatizada
Execute o script utilitário para analisar os PDFs e mapear questões:
```bash
python tools/parser_pdf.py
```

### 3. Cadastro no Aplicativo
Utilize o script de CLI para criar os esqueletos de dados e registrar no catálogo:
```bash
python tools/import_disciplina.py --id engenharia_software --nome "Engenharia de Software" --periodo periodo_2 --temas 6
```
O aplicativo carregará as novas matérias dinamicamente na inicialização, sem requerer nenhuma linha adicional de código de interface.

---

## 🚀 Como Executar o Projeto

### Pré-requisitos
* **Flutter SDK**: 3.5.0 ou superior ([Guia de Instalação](https://docs.flutter.dev/get-started/install))
* **Java JDK**: 17 ou superior
* **Android SDK / Studio** (para desenvolvimento Android) ou **VS Code** com extensão Flutter

### 1. Instalar Dependências
```bash
flutter pub get
```

### 2. Verificar Integridade do Código
```bash
flutter analyze
```
*(O projeto mantém padrão estrito de 0 avisos e 0 erros de análise estática).*

### 3. Executar em Modo de Desenvolvimento
Conecte seu celular Android via USB (com Depuração USB ativada) ou abra um emulador:
```bash
flutter run
```

---

## 📦 Compilação para Produção (Release APK)

Para gerar o pacote de instalação final para smartphones Android:

```bash
# Via Gradle (recomendado no Windows):
cmd.exe /c gradlew.bat assembleRelease

# Ou via Flutter CLI:
flutter build apk --release
```

O arquivo gerado estará pronto para distribuição em:
📂 `build/app/outputs/flutter-apk/app-release.apk`

---

## 💡 Filosofia da Identidade Lume

O nome **Lume** origina-se do latim *lumen* — luz, clareza, entendimento. 

No contexto acadêmico contemporâneo, onde estudantes são constantemente bombardeados por centenas de páginas de PDFs densos, interfaces dispersivas e conexões instáveis, o Lume surge para ser o ponto de foco: uma ferramenta que organiza, sintetiza e ilumina o conhecimento essencial com precisão técnica e elegância.
