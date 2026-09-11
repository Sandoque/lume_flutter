# Cálculo de Predicados (Conteúdo Completo)

> 💡 **DICA DE OURO**: No cálculo de predicados, letras minúsculas representam constantes/indivíduos nomeados (como `carlos`, `mario`), e letras maiúsculas representam variáveis ou predicados.

---

## 1. Termos, Predicados e Variáveis
- **Predicado**: Propriedade atribuída a termos ou relação entre termos (ex: P(x) = "x é par").
- **Sentença Aberta**: Expressão com variáveis que não possui valor-verdade definido até que a variável receba um valor do Universo de Discurso (U).
- **Variável Livre vs. Ligada**: Uma variável é ligada se está sob a ação de um quantificador (∀ x ou ∃ x). Caso contrário, é livre.

---

## 2. Quantificadores Lógicos
- **Universal (∀ x)**: Significa "para todo x", "qualquer que seja x". A sentença ∀ x P(x) é verdadeira se P(x) é verdadeiro para **todos** os elementos do universo.
- **Existencial (∃ x)**: Significa "existe ao menos um x". É verdadeira se ao menos um elemento satisfizer P(x).
- **Existencial com Unicidade (∃! x)**: Significa "existe um único x".

### Negação de Proposições Quantificadas

> **¬ ∀ x P(x) ≡ ∃ x ¬ P(x)**


> **¬ ∃ x P(x) ≡ ∀ x ¬ P(x)**


---

## 3. Ordem dos Quantificadores
A ordem relativa dos quantificadores é crucial:
- ∀ x ∃ y P(x, y): Para cada x fornecido, podemos escolher um y (que pode depender de x).
- ∃ y ∀ x P(x, y): Existe um único y universal fixo que satisfaz a propriedade para todos os x simultaneamente.
- Logo: ∀ x ∃ y P(x, y) \not≡ ∃ y ∀ x P(x, y).

---

## 4. Programação em Lógica (Prolog) e Sistemas Especialistas
- **Fato**: `pai(carlos, mario).` (minúsculas para átomos).
- **Regra**: `filho(Y, X) :- pai(X, Y).`
- **Consulta**: `?- pai(carlos, X).`
- **Classificação dos Sistemas**:
 - *Diagnóstico*: Deduz falhas ou conclusões a partir de sintomas observados.
 - *Predição*: Estima estados futuros a partir de históricos.
 - *Monitoramento*: Acompanha e compara dados em tempo real com limites seguros.
