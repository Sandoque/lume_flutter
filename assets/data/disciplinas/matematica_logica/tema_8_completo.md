# Prática Integrada e Aplicações (Conteúdo Completo)

> 💡 **DICA DE OURO**: Problemas práticos de tomada de decisão e modelagem de software conectam conjuntos, contagem e lógica formal.

---

## 1. Operações Avançadas com Conjuntos
- **Soma de Conjuntos Discretos e Contínuos (X + Y)**:
 Se X = {0, 2} e Y = [1, 2], então:
 - Para x = 0: 0 + [1, 2] = [1, 2]
 - Para x = 2: 2 + [1, 2] = [3, 4]
 - Conjunto total: [1, 2] ∪ [3, 4] (o intervalo (2; 3) fica inacessível).

---

## 2. Inclusão-Exclusão com 3 Conjuntos
No diagrama de Venn com três conjuntos A, B e C:

> **n(A ∪ B ∪ C) = n(A) + n(B) + n(C) - [n(A ∩ B) + n(A ∩ C) + n(B ∩ C)] + n(A ∩ B ∩ C)**

Para calcular os que praticam **apenas um** elemento:

> **Apenas 1 = Total - (Apenas 2 + Os 3)**


---

## 3. Combinação com Repetição e Modelagem
- Quando compramos p itens entre n opções permitindo repetição:
 
> **CR(n, p) = C(n + p - 1, p)**

- Em verificação formal de software, técnicas probabilísticas comprovam apenas que o código é "provavelmente correto", enquanto métodos baseados em lógica de predicados e pré/pós-condições de Hoare demonstram formalmente a ausência de falhas.
