# Módulo 2: Tabelas-Verdade e Sintaxe Condicional em C

### 1. Tabela-Verdade dos Operadores Lógicos em C
Em C, qualquer valor diferente de zero (!= 0) é considerado **Verdadeiro (1)**; zero ($0$) é **Falso (0)**.

| Expressão A | Expressão B | A \ \&\& \ B (E) | A \ \|\| \ B (OU) | !A (NÃO) |
| :---: | :---: | :---: | :---: | :---: |
| Falso (0) | Falso (0) | **0** | **0** | **1** |
| Falso (0) | Verdadeiro (1) | **0** | **1** | **1** |
| Verdadeiro (1) | Falso (0) | **0** | **1** | **0** |
| Verdadeiro (1) | Verdadeiro (1) | **1** | **1** | **0** |

### 2. Sintaxe do Operador Ternário

> **resultado = (condição) \ ? \ (expressão se verdadeiro) \ : \ (expressão se falso);**

*Exemplo:* `int vencedor = (populacao1 > populacao2) ? 1 : 2;`

### 3. Estrutura Canônica do `switch-case`
```c
switch (opcaoEscolhida) {
 case 1:
 // Comparação de População (Maior Vence)
 break;
 case 2:
 // Comparação de Densidade (Menor Vence!)
 break;
 default:
 printf("Opção inválida!\n");
 break;
}
```
