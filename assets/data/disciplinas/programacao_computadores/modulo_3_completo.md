# Módulo 3: Movimentação de Peças de Xadrez e Repetições
## Conteúdo Completo e Aprofundado

---

### 1. O Papel das Estruturas de Repetição na Engenharia de Software

No desenvolvimento de sistemas e motores de jogos, a capacidade de automatizar tarefas repetitivas é fundamental. Sem laços de repetição, simular o avanço de uma peça por cinco casas no tabuleiro exigiria a escrita redundante de cinco comandos `printf` idênticos.

O projeto prático deste módulo aborda a modelagem em linguagem C da **movimentação das peças do Xadrez**, explorando as diferentes estruturas de controle e loops aninhados.

---

### 2. O Laço `for` e o Movimento da Torre

A **Torre** no xadrez movimenta-se em linha reta, avançando qualquer número de casas livres ao longo das fileiras (horizontal) ou colunas (vertical).

Como sabemos antecipadamente o número exato de casas que a peça deve se deslocar, o comando `for` é a escolha técnica ideal:

```c
#include <stdio.h>

int main() {
 int casasParaMover = 5;

 printf("--- MOVIMENTO DA TORRE ---\n");
 // Inicialização; Condição de Parada; Incremento
 for (int i = 1; i <= casasParaMover; i++) {
 printf("Passo %d: Torre moveu 1 casa para a DIREITA.\n", i);
 }

 return 0;
}
```

---

### 3. O Laço `while` e o Deslocamento Diagonal do Bispo

O **Bispo** movimenta-se exclusivamente pelas diagonais do tabuleiro. A cada passo que o bispo dá no tabuleiro, ele altera simultaneamente uma coordenada vertical e uma coordenada horizontal:

```c
#include <stdio.h>

int main() {
 int passosRestantes = 5;

 printf("--- MOVIMENTO DO BISPO ---\n");
 while (passosRestantes > 0) {
 printf("Bispo avançou: 1 casa para CIMA e 1 casa para a DIREITA (Diagonal).\n");
 passosRestantes--; // Decremento fundamental para evitar loop infinito!
 }

 return 0;
}
```

---

### 4. Loops Aninhados e a Movimentação Complexa do Cavalo

O **Cavalo** é a única peça do xadrez com movimentação não linear e capacidade de saltar sobre outras peças. O seu trajeto forma rigorosamente um **'L'**:
* Duas casas em uma direção (ex: para cima ou para baixo);
* Seguidas de uma casa na direção perpendicular (ex: para a direita ou esquerda).

Para simular computacionalmente essa dinâmica em C, recorremos aos **Loops Aninhados (*Nested Loops*)**: um laço externo que controla os movimentos primários e um laço interno que orquestra a perna perpendicular do 'L':

```c
#include <stdio.h>

int main() {
 printf("--- MOVIMENTO DO CAVALO EM 'L' ---\n");

 // Loop externo: comanda os dois passos para Cima
 for (int passoVertical = 1; passoVertical <= 2; passoVertical++) {
 printf("Passo %d: Cavalo avançou 1 casa para CIMA.\n", passoVertical);
 }

 // Loop interno: comanda o passo perpendicular para a DIREITA
 for (int passoHorizontal = 1; passoHorizontal <= 1; passoHorizontal++) {
 printf("Passo %d: Cavalo avançou 1 casa para a DIREITA (Completando o 'L').\n", passoHorizontal);
 }

 return 0;
}
```

---

### 5. Boas Práticas e Evitando Armadilhas de Laços

1. **Loop Infinito (*Infinite Loop*):** Ocorre quando a condição de parada nunca se torna falsa. Exemplo clássico: esquecer de incrementar a variável dentro do bloco `while (i < 10)`. O programa consumirá 100% da capacidade do núcleo do processador e travará o terminal.
2. **Off-by-One Error (Erro por Uma Unidade):** Confundir o operador menor estrito `<` com o operador menor ou igual `<=`. Se um vetor possui tamanho 5 (índices 0 a 4), um laço `for (int i = 0; i <= 5; i++)` tentará acessar o índice 5 inexistente na sexta iteração, causando invasão de memória ilegal (*Buffer Overflow / Segmentation Fault*).
3. **Uso Judicioso de `break` e `continue`:** Embora poderosos, o abuso de comandos `break` e `continue` torna o fluxo de execução difícil de depurar. Prefira condições de parada declarativas claras no próprio cabeçalho do laço.
