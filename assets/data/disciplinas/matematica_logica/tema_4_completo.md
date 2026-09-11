# Aprofundamento de Funções (Conteúdo Completo)

> 💡 **DICA DE OURO**: Uma função só existe plenamente quando seu domínio (D), contradomínio (CD) e lei de correspondência (f(x)) estão explicitados. A sobrejetividade depende diretamente do contradomínio declarado!

---

## 1. Condições de Existência e Domínio Real
Para funções reais f: D → ℝ, o domínio é o maior subconjunto de ℝ para o qual a expressão matemática faz sentido:
1. **Denominadores de Frações**: Não podem ser nulos (D(x) ≠ 0).
2. **Radicais de Índice Par no Numerador**: Radicando não-negativo (g(x) ≥ 0).
3. **Radicais de Índice Par no Denominador**: Radicando estritamente positivo (g(x) > 0), pois não pode ser negativo nem zero.
4. **Logaritmos**: Logaritmando estritamente positivo (b(x) > 0) e base positiva diferente de 1.

---

## 2. Classificação de Funções
- **Função Injetora**: Elementos distintos do domínio produzem imagens distintas:
 
> **x₁ ≠ x₂ ⇒ f(x₁) ≠ f(x₂)**

 *Teste da Reta Horizontal*: Qualquer reta horizontal paralela ao eixo x cruza o gráfico no máximo em um ponto.
- **Função Sobrejetora**: Quando o conjunto imagem é idêntico a todo o contradomínio declarado:
 
> **Im(f) = CD**

- **Função Bijetora**: Quando é simultaneamente **Injetora** e **Sobrejetora**.

---

## 3. Função Inversa (f⁻¹)
Uma função admite função inversa **se e somente se for bijetora**.
- Se f: A → B é bijetora, então f⁻¹: B → A.
- f(f⁻¹(x)) = x e f⁻¹(f(x)) = x.
- **Propriedade Gráfica**: Os gráficos de y = f(x) e y = f⁻¹(x) são perfeitamente simétricos em relação à bissetriz dos quadrantes ímpares (a reta y = x).

---

## 4. Funções Periódicas
Uma função f é periódica de período fundamental P > 0 se:

> **f(x + P) = f(x), ∀ x ∈ D**

Por indução, para qualquer número inteiro k ∈ ℤ:

> **f(x + k · P) = f(x)**

Para calcular f(N) com N elevado, divide-se N pelo período P e calcula-se a função no resto da divisão.
