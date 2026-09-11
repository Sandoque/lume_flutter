# Teoria dos Conjuntos e Princípios de Contagem (Conteúdo Completo)

> 💡 **DICA DE OURO**: Conjunto não é fila: {1; 2; 3} = {3; 1; 2}. A ordem dos elementos e a repetição de itens idênticos na representação entre chaves não criam novos elementos.

---

## 1. Linguagem e Notação Fundamental

A teoria dos conjuntos fornece os alicerces fundamentais da matemática discreta e da lógica formal.

### 1.1 Pertinência vs. Inclusão
- **Pertinência (x ∈ A ou x ∉ A)**: Relaciona um **objeto individual** ao conjunto. Dizemos que x é elemento de A.
- **Inclusão (A ⊆ B)**: Relaciona **dois conjuntos**. Afirma que todo elemento que pertence a A também pertence a B. A notação ⊆ admite a igualdade (A = B).
- **Conjunto Vazio (∅ ou {})**: O conjunto desprovido de elementos. Uma propriedade crucial: ∅ ⊆ A para qualquer conjunto A.
- **Conjunto das Partes e Subconjuntos**: Para qualquer conjunto finito com n elementos, o total de subconjuntos possíveis (o conjunto das partes P(A)) é calculado por:
 
> **n(P(A)) = 2ⁿ**

 Isso inclui sempre o conjunto vazio ∅ e o próprio conjunto total A.

> ⚠️ **PEGADINHA DE PROVA**: Um conjunto pode ser elemento de outro!
> Se A = {1, 2, {3, 4}, 5}, então:
> - O bloco {3, 4} ∈ A (Verdadeiro, pois ele está listado como elemento direto).
> - 3 ∈ A (FALSO! O número 3 está encapsulado dentro da caixa {3, 4}).
> - {3, 4} ⊆ A (FALSO! Para ser subconjunto, o 3 e o 4 deveriam ser elementos individuais de A).
> - {1, 2} ⊆ A (Verdadeiro, pois tanto 1 quanto 2 são elementos de A).

---

## 2. Operações com Conjuntos
- **União (A ∪ B)**: Elementos que pertencem a A **OU** a B (inclusive a ambos).
- **Interseção (A ∩ B)**: Elementos que pertencem a A **E** a B simultaneamente. Conjuntos com A ∩ B = ∅ são chamados de **disjuntos**.
- **Diferença (A - B)**: Elementos que pertencem a A, **mas NÃO** pertencem a B. Note que em geral A - B ≠ B - A.
- **Complementar (A' = U - A)**: O que falta a A dentro de um conjunto universo fixo U.

---

## 3. Intervalos Reais e Inequações Modulares
Nos números reais (ℝ), representamos subconjuntos contínuos por intervalos:
- **Fechado [a; b]**: {x ∈ ℝ | a ≤ x ≤ b} (inclui os dois extremos).
- **Aberto (a; b) ou ]a; b[**: {x ∈ ℝ | a < x < b} (exclui ambos).
- **Semiabertos**: [a; b) inclui a e exclui b; (a; b] exclui a e inclui b.

### O Módulo como Distância Geométrica
O módulo |x - a| mede rigorosamente a distância na reta real entre o ponto x e o ponto a.
- |x - a| = r ⇔ x = a - r ou x = a + r
- |x - a| < r ⇔ a - r < x < a + r
- |x - a| > r ⇔ x < a - r ou x > a + r

---

## 4. Princípios de Contagem e Análise Combinatória

### 4.1 Princípio Fundamental da Contagem (PFC)
- **Princípio Aditivo (Soma)**: Se uma decisão A tem m maneiras e uma decisão B tem n maneiras, e elas são **mutuamente exclusivas** (não ocorrem juntas), então escolher A OU B tem m + n maneiras.
 
> **n(A ∪ B) = n(A) + n(B) - n(A ∩ B)**

- **Princípio Multiplicativo (Produto)**: Se uma ação é composta por etapas sucessivas 1, 2, \dots, k, com n₁, n₂, \dots, n_k opções em cada etapa, o total de configurações é n₁ × n₂ × \dots × n_k.

### 4.2 Princípio da Casa dos Pombos (Pior Caso)
Se n objetos ocupam m categorias e n > m, então ao menos uma categoria conterá 2 ou mais objetos.
Para questões de "número mínimo para garantir com certeza absoluta", modele sempre o **pior caso de azar**: retire todos os elementos indesejados primeiro antes de obter a meta.

### 4.3 Fórmulas de Agrupamentos
- **Permutação Simples**: Ordenação de n objetos distintos:
 
> **Pₙ = n!**

- **Permutação com Repetição**:
 
> **Pₙ^{(a, b, \dots)} = (n!) / (a! · b! \cdots)**

- **Arranjo Simples (A ordem importa)**:
 
> **A(n, p) = (n!) / ((n - p)!)**

- **Combinação Simples (A ordem NÃO importa)**:
 
> **C(n, p) = (n!) / (p!(n - p)!)**

- **Combinação com Repetição (Técnica dos Paus e Bolas)**:
 
> **CR(n, p) = C(n + p - 1, p)**

