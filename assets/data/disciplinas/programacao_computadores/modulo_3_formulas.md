# Módulo 3: Fórmulas, Sintaxes de Laços e Matrizes de Xadrez

### 1. Comparação Sintática das Três Estruturas de Repetição
```c
// 1. Laço FOR (Compacto e Determinado)
for (int passo = 1; passo <= 5; passo++) {
 printf("Torre moveu para Direita (Casa %d)\n", passo);
}

// 2. Laço WHILE (Pré-teste Flexível)
int casas = 5;
while (casas > 0) {
 printf("Bispo moveu Diagonal Cima-Direita\n");
 casas--;
}

// 3. Laço DO-WHILE (Pós-teste - Garantia de 1 execução mínima)
int opcao;
do {
 printf("Digite 1 para Nova Partida ou 0 para Sair: ");
 scanf("%d", &opcao);
} while (opcao != 0 && opcao != 1);
```

### 2. Loops Aninhados para Tabuleiros Bidimensionais
Para percorrer um tabuleiro de xadrez 8 × 8:

> **Total de Casas = 8 × 8 = 64 iterações**

```c
for (int linha = 0; linha < 8; linha++) {
 for (int coluna = 0; coluna < 8; coluna++) {
 // Manipula a casa [linha][coluna]
 }
}
```

### 3. Prevenção de Loops Infinitos

> **Condição de Parada Válida ⇔ A variável de controle deve OBRIGATORIAMENTE convergir para FALSO**

*Se o incremento for esquecido (`i++`), a condição `i < 5` permanecerá eternamente verdadeira, travando a CPU em 100% de uso.*
