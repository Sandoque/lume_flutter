# Módulo 2: Super Trunfo em C: Lógica do Jogo e Decisão
## Conteúdo Completo e Aprofundado

---

### 1. Operadores Relacionais e Expressões Condicionais

Para construir as regras de combate do jogo Super Trunfo, o programa deve ser capaz de avaliar dados e tomar decisões autônomas.

Em C, não existe historicamente um tipo booleano nativo separado (a menos que se inclua `<stdbool.h>`). O compilador C trata internamente qualquer número inteiro diferente de zero (especialmente o número `1`) como **Verdadeiro** e o número `0` como **Falso**.

```c
int a = 10, b = 20;
printf("%d\n", a < b); // Imprime 1 (Verdadeiro)
printf("%d\n", a == b); // Imprime 0 (Falso)
```

> **Atenção ao Erro Crítico do Iniciante:** O operador `=` é usado exclusivamente para atribuição de valores (`x = 5;`). O operador de comparação de igualdade é formado por dois sinais de igual consecutivos: `==` (`if (x == 5)`). Se você escrever `if (x = 5)`, o C atribuirá 5 à variável e avaliará o bloco como verdadeiro sempre!

---

### 2. Estruturas `if`, `else if` e `else` no Duelo de Cartas

Vejamos como codificar a lógica de comparação entre duas cartas com tratamento formal de empates:

```c
// Duelo pelo atributo População (Maior valor vence)
if (carta1.populacao > carta2.populacao) {
 printf("Resultado: Carta 1 (%s) venceu com maior população!\n", carta1.nome);
} else if (carta2.populacao > carta1.populacao) {
 printf("Resultado: Carta 2 (%s) venceu com maior população!\n", carta2.nome);
} else {
 printf("Resultado: Empate populacional entre as duas cidades!\n");
}
```

---

### 3. A Regra Especial da Densidade Demográfica

Um ponto alto das regras de negócio do Super Trunfo de Cidades reside no atributo **Densidade Populacional**. Uma cidade com densidade populacional muito alta é considerada mais congestionada e menos eficiente em termos de planejamento urbano na convenção do jogo. Portanto, a regra é invertida: **vence quem tiver o MENOR valor**:

```c
// Duelo de Densidade Demográfica (Menor valor vence)
if (carta1.densidade < carta2.densidade) {
 printf("Carta 1 venceu com menor densidade populacional (%.2f hab/km²)!\n", carta1.densidade);
} else if (carta2.densidade < carta1.densidade) {
 printf("Carta 2 venceu com menor densidade populacional (%.2f hab/km²)!\n", carta2.densidade);
} else {
 printf("Empate em densidade populacional!\n");
}
```

---

### 4. Construção de Menus Interativos com `switch-case`

Para permitir que o jogador escolha qual atributo deseja disputar na rodada, utilizamos a estrutura `switch-case`:

```c
int opcao;
printf("Escolha o atributo para o combate:\n");
printf("1 - População\n");
printf("2 - Área Territorial\n");
printf("3 - Produto Interno Bruto (PIB)\n");
printf("4 - Densidade Demográfica\n");
printf("Digite sua escolha: ");
scanf("%d", &opcao);

switch (opcao) {
 case 1:
 printf("Você escolheu: POPULAÇÃO\n");
 if (c1ₚop > c2ₚop) printf("Vitória da Carta 1!\n");
 else if (c2ₚop > c1ₚop) printf("Vitória da Carta 2!\n");
 else printf("Empate!\n");
 break; // Crucial para sair do switch!

 case 2:
 printf("Você escolheu: ÁREA\n");
 if (c1_area > c2_area) printf("Vitória da Carta 1!\n");
 else if (c2_area > c1_area) printf("Vitória da Carta 2!\n");
 else printf("Empate!\n");
 break;

 case 3:
 printf("Você escolheu: PIB\n");
 if (c1ₚib > c2ₚib) printf("Vitória da Carta 1!\n");
 else if (c2ₚib > c1ₚib) printf("Vitória da Carta 2!\n");
 else printf("Empate!\n");
 break;

 case 4:
 printf("Você escolheu: DENSIDADE (Menor vence!)\n");
 if (c1_dens < c2_dens) printf("Vitória da Carta 1!\n");
 else if (c2_dens < c1_dens) printf("Vitória da Carta 2!\n");
 else printf("Empate!\n");
 break;

 default:
 printf("Opção inválida! Escolha um número entre 1 e 4.\n");
 break;
}
```

#### O Mecanismo de *Fall-Through*
Se a cláusula `break;` for omitida acidentalmente ao final de um `case`, o programa não sai da estrutura; ele continuará executando ininterruptamente todas as instruções dos `cases` subsequentes até encontrar um `break` ou o final do `switch`. Embora útil em casos raros de agrupamento de opções, esquecer o `break` é uma das causas mais comuns de bugs de lógica em C.
