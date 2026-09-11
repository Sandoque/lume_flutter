# Fórmulas & Regras de Ouro: Conjuntos e Contagem

### 🎯 Notações & Subconjuntos
- Pertinência: x ∈ A (elemento → conjunto)
- Inclusão: A ⊆ B (conjunto → conjunto)
- Subconjuntos (Partes): n(P(A)) = 2ⁿ

### 🎯 Inclusão-Exclusão
- Dois conjuntos: n(A ∪ B) = n(A) + n(B) - n(A ∩ B)
- Três conjuntos: n(A ∪ B ∪ C) = ∑ n(A) - ∑ n(A ∩ B) + n(A ∩ B ∩ C)

### 🎯 Agrupamentos
- **Permutação Simples**: Pₙ = n!
- **Permutação com Repetição**: Pₙ^{(a, b)} = (n!) / (a! · b!)
- **Arranjo Simples (Ordem importa)**: A(n, p) = (n!) / ((n - p)!)
- **Combinação Simples (Ordem NÃO importa)**: C(n, p) = (n!) / (p!(n - p)!)
- **Combinação com Repetição**: CR(n, p) = C(n + p - 1, p)
