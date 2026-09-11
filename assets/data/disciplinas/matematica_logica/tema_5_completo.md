# Cálculo Proposicional (Conteúdo Completo)

> 💡 **DICA DE OURO**: Uma proposição lógica é uma sentença declarativa fechada que admite exatamente um de dois valores-verdade: Verdadeiro (V) ou Falso (F), respeitando os princípios da Não-Contradição e do Terceiro Excluído. Sentenças exclamativas, interrogativas ou com variáveis livres não são proposições.

---

## 1. Tabela-Verdade dos Conectivos Lógicos
Considere as proposições primitivas p e q:

| p | q | ¬ p | p ∧ q (E) | p ∨ q (OU) | p → q (Se..então) | p ↔ q (Bicondicional) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| V | V | F | V | V | **V** | V |
| V | F | F | F | V | **F** | F |
| F | V | V | F | V | **V** | F |
| F | F | V | F | F | **V** | V |

*Atenção*: A condicional p → q só é FALSA na linha "V → F". Se a hipótese p for falsa, a condicional é sempre verdadeira!

---

## 2. Equivalências Notáveis
Duas fórmulas proposicionais são equivalentes quando possuem a mesma tabela-verdade:
1. **Negação da Condicional (Regra do MANE)**:
 
> **¬(p → q) ≡ p ∧ ¬ q**

 *(Mantém a primeira E Nega a segunda).* A negação de uma condicional NUNCA é outra condicional.
2. **Equivalência da Condicional**:
 
> **p → q ≡ ¬ p ∨ q**

3. **Contrapositiva**:
 
> **p → q ≡ ¬ q → ¬ p**

4. **Leis de De Morgan**:
 
> **¬(p ∧ q) ≡ ¬ p ∨ ¬ q**

 
> **¬(p ∨ q) ≡ ¬ p ∧ ¬ q**


---

## 3. Regras de Inferência e Dedução Formal
- **Modus Ponens (Afirmação do Antecedente)**:
 Premissas: p, p → q ⊢ Conclusão: q
- **Modus Tollens (Negação do Consequente)**:
 Premissas: ¬ q, p → q ⊢ Conclusão: ¬ p
- **Silogismo Disjuntivo**:
 Premissas: p ∨ q, ¬ p ⊢ Conclusão: q

---

## 4. Álgebra Booleana
Nos circuitos lógicos e computacionais:
- Porta NOT (inversor: \bar{A}), Porta AND (conjunção: A · B), Porta OR (disjunção: A + B).
- **Ordem de Precedência**: NOT > AND > OR.
