# Tema 6: Cálculo de Predicados

## 1. Termos, Predicados e Quantificadores
- **Sentença Aberta**: P(x) possui variáveis cujo valor-verdade depende da atribuição.
- **Variável Livre**: não está restrita por quantificador.
- **Variável Ligada**: está vinculada a ∀ ou ∃.

## 2. Negação de Proposições Quantificadas
- Negação do Universal:
 
> **¬ ∀ x P(x) ≡ ∃ x ¬ P(x)**

 ("Nem todos fazem" = "Existe alguém que não faz").
- Negação do Existencial:
 
> **¬ ∃ x P(x) ≡ ∀ x ¬ P(x)**

 ("Nenhum faz" = "Todos não fazem").

## 3. Ordem dos Quantificadores
- ∀ x ∃ y P(x, y) **NÃO** equivale a ∃ y ∀ x P(x, y).
- O existencial à esquerda exige um mesmo y fixo para todos os x.

## 4. Programação em Lógica (Prolog)
- **Fatos e Predicados**: começam com letras **minúsculas** (ex: `pai(carlos, mario).`).
- **Variáveis**: começam com letra **maiúscula** (ex: `X`, `Y`).
- **Sistemas Especialistas**:
 - *Diagnóstico*: infere conclusões e falhas a partir de sintomas observados.
 - *Monitoramento*: vigia parâmetros contínuos de sensores em tempo real.
