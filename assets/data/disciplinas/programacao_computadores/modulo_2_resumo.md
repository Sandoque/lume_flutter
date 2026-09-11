# Módulo 2: Estruturas de Decisão & Lógica do Jogo em C
## Resumo Executivo & Pontos-Chave

As estruturas de decisão permitem que um programa execute diferentes blocos de código com base em condições lógicas que avaliam como verdadeiras ou falsas.

### 1. Operadores Relacionais e Lógicos em C
* **Relacionais:** `==` (igual), `!=` (diferente), `>` (maior), `<` (menor), `>=` (maior ou igual), `<=` (menor ou igual). *Atenção:* `=` é atribuição; `==` é comparação!
* **Lógicos:**
 * `&&` (E / AND): Verdadeiro somente se ambas as condições forem verdadeiras.
 * `||` (OU / OR): Verdadeiro se pelo menos uma condição for verdadeira.
 * `!` (NÃO / NOT): Inverte o valor lógico da expressão.
* **Avaliação de Curto-Circuito (*Short-Circuit*):** Em `A && B`, se `A` for falso, `B` nem sequer é avaliado. Em `A || B`, se `A` for verdadeiro, `B` é ignorado.

### 2. Estruturas `if`, `else if` e `else`
* Permite testar múltiplos cenários encadeados para determinar vitória, derrota ou empate.

### 3. A Estrutura de Múltipla Escolha `switch-case`
* Ideal para construir menus interativos de seleção de atributo do Super Trunfo.
* Avalia apenas valores inteiros ou caracteres (`char`).
* A instrução `break;` é obrigatória ao final de cada `case` para impedir a execução acidental dos blocos seguintes (*fall-through*).
* O bloco `default:` é executado quando nenhuma das opções do menu corresponde à escolha digitada.

### 4. A Regra Inversa do Super Trunfo
* Para a maioria dos atributos (População, Área, PIB, Pontos Turísticos, Super Poder), **vence a carta com o MAIOR valor**.
* Para a **Densidade Demográfica**, a regra inverte-se por convenção internacional do jogo: **vence a carta com o MENOR valor!**
