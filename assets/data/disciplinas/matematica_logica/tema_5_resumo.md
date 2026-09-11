# Tema 5: Cálculo Proposicional

## 1. Proposições e Tabela-Verdade
- Uma proposição é uma sentença declarativa que assume um único valor: **Verdadeiro (V)** ou **Falso (F)**.
- **Condicional (p → q)**: só é FALSA quando p = V e q = F (V → F = F).
- **Classificações**:
 - **Tautologia**: sempre verdadeira em todas as linhas da tabela-verdade.
 - **Contradição**: sempre falsa em todas as linhas.
 - **Contingência**: possui ao menos uma linha V e ao menos uma linha F.

## 2. Equivalências Notáveis
- **Negação da Condicional (Regra do MANE)**:
 
> **¬(p → q) ≡ p ∧ ¬ q**

 (Mantém a 1ª E Nega a 2ª).
- **Contrapositiva**:
 
> **p → q ≡ ¬ q → ¬ p**

- **Condicional como Disjunção**:
 
> **p → q ≡ ¬ p ∨ q**

- **Leis de De Morgan**:
 
> **¬(p ∧ q) ≡ ¬ p ∨ ¬ q**

 
> **¬(p ∨ q) ≡ ¬ p ∧ ¬ q**


## 3. Regras de Inferência
- **Modus Ponens**: p, p → q ⊢ q.
- **Modus Tollens**: ¬ q, p → q ⊢ ¬ p.
- **Silogismo Disjuntivo**: p ∨ q, ¬ p ⊢ q.

## 4. Álgebra Booleana
- Operadores: NOT (inversor), AND (·), OR (+).
- **Ordem de Precedência**: NOT > AND > OR.
