# Módulo 3: Estruturas de Repetição & Simulação de Xadrez em C
## Resumo Executivo & Pontos-Chave

Estruturas de repetição (laços ou *loops*) executam um conjunto de comandos repetidas vezes enquanto uma determinada condição for verdadeira.

### 1. As Três Estruturas de Repetição em C
* `while (condição)`: **Laço de pré-teste**. Avalia a condição antes de executar o bloco. Se a condição for falsa logo no início, o corpo do laço nunca é executado.
* `do { ... } while (condição);`: **Laço de pós-teste**. Executa o bloco de instruções pelo menos uma vez antes de testar a condição. Ideal para validação de entradas de teclado e menus de repetição de jogos.
* `for (inicialização; condição; incremento)`: **Laço de controle compacto**. Centraliza a inicialização do contador, o teste de parada e a etapa de incremento em uma única linha. Ideal quando se sabe antecipadamente o número exato de iterações.

### 2. Comandos de Controle de Fluxo dentro de Laços
* `break`: Interrompe a execução do laço imediatamente, transferindo o fluxo para a primeira instrução após o bloco do loop.
* `continue`: Interrompe apenas a iteração atual, pulando o restante do código daquele ciclo e avançando diretamente para o próximo teste de condição/incremento.

### 3. Modelagem de Movimentação no Tabuleiro de Xadrez (8x8)
* **Torre:** Move-se em linhas retas horizontais ou verticais → Laço `for` simples iterando o número de casas em uma direção.
* **Bispo:** Move-se estritamente pelas diagonais → Laço combinando deslocamentos simultâneos de linha e coluna (`Cima + Direita`).
* **Rainha:** Combina o movimento da Torre e do Bispo → Laço simulando até 8 casas em qualquer direção.
* **Cavalo:** Move-se em formato de 'L' (2 casas em um eixo seguidas de 1 casa no eixo perpendicular) → Implementado por meio de **Loops Aninhados (*Nested Loops*)** e condicionais de passos para respeitar o trajeto em 'L'.
