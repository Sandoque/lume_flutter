# Tema 2: Teoria dos Conjuntos e Princípios de Contagem

## 1. Notação Fundamental
- **Pertinência (x ∈ A)**: relaciona um **objeto/elemento** a um conjunto.
- **Inclusão (A ⊆ B)**: relaciona **dois conjuntos** (todo elemento de A pertence a B).
- **Vazio (∅)**: não contém elementos; ∅ ⊆ A para qualquer conjunto A.
- **Subconjuntos (2ⁿ)**: se A possui n elementos, o número de subconjuntos de A é 2ⁿ.
- **Cuidado essencial**: {3, 4} ∈ {1, 2, {3, 4}} é verdadeiro, mas 3 ∈ {1, 2, {3, 4}} é falso!

## 2. Intervalos Reais
- Fechado [a; b]: inclui os dois extremos (a ≤ x ≤ b).
- Aberto (a; b) ou ]a; b[: não inclui nenhum extremo (a < x < b).
- **Módulo**: |x - a| representa a distância geométrica entre x e a na reta real.
 - |x - a| < r ⇔ a - r < x < a + r.

## 3. Princípios de Contagem
- **Princípio Aditivo (OU)**: opções mutuamente exclusivas → **Some** os casos.
- **Princípio Multiplicativo / PFC (E)**: etapas sucessivas e dependentes → **Multiplique** as possibilidades.
- **Inclusão-Exclusão**: n(A ∪ B) = n(A) + n(B) - n(A ∩ B).
- **Princípio da Casa dos Pombos / Pior Caso**: para garantir uma escolha com certeza, calcule o pior cenário possível (esgote os itens indesejados e some a meta).

## 4. Agrupamentos
- **Combinação Simples**: a ordem **NÃO** importa (ex: comissões sem cargo, sorteios).
 
> **C(n, p) = (n!) / (p!(n - p)!)**

- **Arranjo Simples**: a ordem **SIM** importa (ex: senhas, cargos com atribuições).
 
> **A(n, p) = (n!) / ((n - p)!)**

- **Permutação Simples**: ordenar todos os n elementos distintos: P(n) = n!.
- **Combinação com Repetição**: CR(n, p) = C(n + p - 1, p) (técnica dos paus e bolas).
