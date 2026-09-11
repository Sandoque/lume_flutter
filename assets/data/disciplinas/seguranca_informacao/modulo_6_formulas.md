# Módulo 6: Fórmulas e Linha do Tempo de Continuidade

### 1. A Linha do Tempo de Desastre: RPO vs. RTO
```
[ Último Backup ] <--- RPO ---> [ MOMENTO DO DESASTRE ] <--- RTO ---> [ RETOMADA DA OPERAÇÃO ]
 10:00h 12:00h 14:00h
(Dados perdidos: 2 horas) (Downtime do sistema: 2 horas)
```
* **Se RPO = 0:** Exige replicação síncrona de dados em tempo real (zero perda aceita).
* **Se RTO = 0:** Exige arquitetura ativo-ativo com failover automático imediato.

### 2. Comparativo de Tipos de Ambientes Alternativos de Recuperação
| Modelo de Site | Tempo de Retomada (RTO) | Custo Financeiro | Prontidão de Hardware e Dados |
| :--- | :--- | :--- | :--- |
| **Hot Site** | Minutos (quase instantâneo) | **Muito Alto** | Servidores ligados com dados replicados ativamente |
| **Warm Site** | Horas | **Médio** | Servidores presentes; exige restauração de backups |
| **Cold Site** | Dias a Semanas | **Baixo** | Apenas espaço físico; hardware deve ser adquirido |
| **Cloud DRaaS** | Minutos a Horas | **Flexível (OpEx)** | Imagens e réplicas sob demanda na nuvem |

### 3. As 4 Etapas do Ciclo PDCA no PCN (ISO 22301)
* **Plan:** Conduzir Análise de Impacto no Negócio (BIA) e definir estratégias de continuidade.
* **Do:** Elaborar os planos de emergência e treinar as equipes de suporte.
* **Check:** Executar exercícios simulados e auditorias formais de prontidão.
* **Act:** Atualizar os planos corrigindo as falhas detectadas nas simulações.
