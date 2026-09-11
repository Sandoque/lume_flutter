# Módulo 2: Fórmulas, Métricas e Arquitetura de Nuvem

### 1. Métricas de Disponibilidade (A Regra dos "Noves")

> **Disponibilidade (%) = (Tempo Total de Operação - Tempo de Inatividade) / (Tempo Total de Operação) × 100**


| Nível de SLA | Indisponibilidade Máxima / Ano | Indisponibilidade Máxima / Mês |
| :--- | :--- | :--- |
| **99% (Dois Noves)** | 3 dias e 15,6 horas | 7,2 horas |
| **99,9% (Três Noves)** | 8 horas e 45,6 minutos | 43,2 minutos |
| **99,99% (Quatro Noves)** | 52,6 minutos | 4,32 minutos |
| **99,999% (Cinco Noves)** | 5,26 minutos | 26 segundos |

### 2. Disponibilidade Composta em Sistemas
* **Componentes em Série (Ambos precisam funcionar):**
 
> **A_{série} = A₁ × A₂**

 *(Se dois serviços de 99,9% estão em série, a disponibilidade final cai para 0,999 × 0,999 = 99,80%).*
* **Componentes em Paralelo (Redundância ativa / failover):**
 
> **A_{paralelo} = 1 - (1 - A₁) × (1 - A₂)**

 *(Se dois servidores de 99% estão em paralelo com failover, a disponibilidade sobe para 1 - (0,01 × 0,01) = 99,99%).*

### 3. Algoritmos de Balanceamento de Carga
* **Round-Robin:** Distribuição sequencial circular (1, 2, 3, 1, 2, 3).
* **Weighted Round-Robin:** Distribuição ponderada pela capacidade de hardware de cada nó.
* **Least Connections:** Envia a nova requisição ao nó com menor número de sessões ativas no momento.
* **IP Hash:** Vincula o IP do cliente a um nó específico para persistência de afinidade.
