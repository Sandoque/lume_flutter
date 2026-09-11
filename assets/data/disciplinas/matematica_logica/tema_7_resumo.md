# Tema 7: Métodos de Demonstração

## 1. Estrutura de Teoremas (H → T)
- H: Hipótese (premissas assumidas como ponto de partida).
- T: Tese (conclusão que se deseja provar).

## 2. Métodos de Demonstração
- **Prova Direta**: assume H verdadeira e deduz T passo a passo por axiomas e definições.
- **Contraposição (Contrapositiva)**: prova ¬ T → ¬ H. Muito útil quando a negação da tese é uma expressão algébrica mais simples de manipular.
- **Redução ao Absurdo (Contradição)**: assume simultaneamente H verdadeira e ¬ T verdadeira, deduzindo uma contradição lógica (C ∧ ¬ C).
- **Prova Trivial**: a tese T é sempre verdadeira por si só (H → V ≡ V).
- **Prova por Vacuidade**: a hipótese H é impossível/sempre falsa nos reais (F → T ≡ V).
- **Refutação por Contraexemplo**: para derrubar uma afirmação universal ∀ x P(x), basta encontrar **um único caso** onde a afirmação falhe.

## 3. Princípio da Indução Finita (PIF)
1. **Passo Base**: provar que a propriedade vale para o menor elemento (ex: n = 1).
2. **Hipótese de Indução**: assumir que vale para um inteiro n = k, ou seja, assumir P(k).
3. **Passo Indutivo**: usando a hipótese P(k), demonstrar algebricamente que P(k + 1) é verdadeira.
