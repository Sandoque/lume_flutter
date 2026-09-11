# Módulo 1: Fundamentos da Linguagem C & Super Trunfo
## Resumo Executivo & Pontos-Chave

A linguagem C é uma das linguagens compiladas mais rápidas, eficientes e influentes da história da computação, servindo de alicerce para sistemas operacionais modernos, compiladores e motores de jogos.

### 1. Estrutura Canônica de um Programa em C
* `#include <stdio.h>`: Diretiva de pré-processador que inclui a biblioteca de Entrada e Saída Padrão (*Standard Input/Output*).
* `int main()`: Função principal obrigatória; ponto de entrada (*entry point*) da execução do programa.
* `return 0;`: Retorna o código de saída ao sistema operacional (0 indica encerramento com sucesso).

### 2. Tipos Primitivos de Dados e Especificadores
* `int`: Números inteiros (geralmente 4 bytes, -2.147.483.648 a +2.147.483.647). Formato: `%d` ou `%i`.
* `float`: Ponto flutuante de precisão simples (4 bytes, ~6 a 7 dígitos de precisão). Formato: `%f` ou `%.2f`.
* `double`: Ponto flutuante de precisão dupla (8 bytes, ~15 dígitos de precisão). Formato: `%lf`.
* `char`: Um único caractere (1 byte, tabela ASCII). Formato: `%c`.
* Cadeias de caracteres (Strings): Arrays de `char` terminados com `\0` (ex: `char nome[50]`). Formato: `%s`.

### 3. Modificadores de Tipos
* `unsigned`: Permite apenas valores positivos, dobrando a capacidade positiva do tipo (ex: `unsigned int`: 0 a 4.294.967.295).
* `long` / `unsigned long int`: Utilizado para variáveis numéricas massivas (ex: população de países com bilhões de habitantes). Formato: `%lu`.

### 4. Entrada, Saída e Cálculos do Super Trunfo
* `printf()`: Exibição formatada no terminal.
* `scanf()`: Leitura do teclado. Requer o operador de endereço `&` para variáveis primitivas (`&populacao`), exceto para strings (`nome`).
* **Cálculo de Densidade Demográfica:** Densidade = (População) / (Área) (Habitantes por km²).
* **Cálculo de PIB per Capita:** PIB per Capita = (PIB) / (População).
* **Conversão de Tipos (Casting):** `(float) populacao / area` para evitar a divisão inteira truncada.
