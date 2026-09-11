# Métodos de Demonstração (Conteúdo Completo)

> 💡 **DICA DE OURO**: Para provar que algo vale para todos (∀), você precisa de uma demonstração matemática rigorosa. Para derrubar uma afirmativa universal, basta UM ÚNICO contraexemplo!

---

## 1. Estrutura de Teoremas (H → T)
Um teorema é uma proposição condicional onde H é a Hipótese e T é a Tese.

---

## 2. Classificação dos Métodos de Prova
1. **Demonstração Direta**:
 Assume que a hipótese H é verdadeira. Aplica axiomas, definições e teoremas anteriores através de passos lógicos encadeados até concluir que T é verdadeira.
2. **Demonstração por Contraposição (Contrapositiva)**:
 Em vez de provar H → T, prova-se a proposição logicamente equivalente ¬ T → ¬ H. Assume-se que a tese é falsa e demonstra-se que a hipótese deve ser falsa.
3. **Demonstração por Redução ao Absurdo (Contradição)**:
 Assume-se que o teorema é falso, ou seja, assume-se simultaneamente a hipótese H verdadeira e a negação da tese ¬ T verdadeira (H ∧ ¬ T). Deduz-se uma contradição lógica (C ∧ ¬ C). Como a matemática não tolera contradições, a suposição ¬ T é descartada e T é declarada verdadeira.
4. **Demonstração Trivial**:
 Ocorre quando a tese T é verdadeira por si só, independentemente da hipótese (H → V ≡ V).
5. **Demonstração por Vacuidade**:
 Ocorre quando a hipótese H é manifestamente impossível ou falsa nos reais (F → T ≡ V).

---

## 3. Princípio da Indução Finita (PIF)
Usado para provar propriedades P(n) sobre números inteiros positivos (n ≥ 1):
1. **Base da Indução**: Verifica-se que P(1) é verdadeira.
2. **Hipótese de Indução**: Assume-se que P(k) é verdadeira para algum inteiro arbitrário k ≥ 1.
3. **Passo Indutivo**: Sob a hipótese de que P(k) vale, demonstra-se algebricamente que P(k + 1) também é verdadeira.
