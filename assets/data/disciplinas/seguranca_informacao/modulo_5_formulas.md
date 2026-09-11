# Módulo 5: Fórmulas e Métricas de Análise Quantitativa de Risco

### 1. Cálculos de Risco Financeiro (Modelo Quantitativo)
* **SLE (Single Loss Expectancy - Expectativa de Perda Única):** O prejuízo financeiro direto decorrente de um único evento de falha ou invasão:
 
> **SLE = AV (Asset Value - Valor do Ativo) × EF (Exposure Factor - Fator de Exposição)**

* **ARO (Annualized Rate of Occurrence - Taxa Anualizada de Ocorrência):** Estimativa da frequência com que o evento negativo deve ocorrer ao longo de um ano (ex: uma vez a cada dois anos → ARO = 0,5; duas vezes por ano → ARO = 2).
* **ALE (Annualized Loss Expectancy - Expectativa de Perda Anualizada):** O custo financeiro esperado por ano para o risco em questão:
 
> **ALE = SLE × ARO**


*Exemplo Prático:* Um banco de dados de clientes vale R\$ 2.000.000 (AV). Um ataque de vazamento comprometeria 40% do valor da marca e multas (EF = 0,40). Estima-se que esse ataque ocorra uma vez a cada 4 anos (ARO = 0,25).

> **SLE = 2.000.000 × 0,40 = R\$ 800.000**


> **ALE = 800.000 × 0,25 = R\$ 200.000 / ano**

*(Se um controle de segurança de ponta custar R\ 50.000/ano, sua contratação é altamente vantajosa, pois economiza até R\ 150.000/ano em risco).*

### 2. Matriz de Calor Qualitativa (Probabilidade x Impacto)
* **Risco Baixo:** Monitoramento rotineiro, aceitação tácita.
* **Risco Médio:** Mitigação programada no plano de ação de médio prazo.
* **Risco Crítico / Extremo:** Ação corretiva imediata; envolvimento compulsório da diretoria.
