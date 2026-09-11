# Módulo 6: Gestão de Continuidade do Negócio (PCN / DRP)
## Resumo Executivo & Pontos-Chave

A Gestão de Continuidade do Negócio assegura que uma organização consiga manter ou restabelecer suas operações críticas em níveis predefinidos aceitáveis após a ocorrência de um desastre de grandes proporções (incêndios, inundações, ciberataques severos).

### 1. Métricas Essenciais de Resiliência
* **RTO (Recovery Time Objective - Objetivo de Tempo de Recuperação):** O tempo máximo tolerável em que um processo ou sistema pode permanecer fora do ar após o desastre sem causar colapso irreversível ao negócio.
* **RPO (Recovery Point Objective - Objetivo de Ponto de Recuperação):** O volume máximo aceitável de dados perdidos (medido pelo tempo transcorrido desde o último backup seguro até o momento da falha). Se o RPO é de 1 hora, significa que a empresa tolera perder no máximo os dados transacionados nos últimos 60 minutos.

### 2. Estrutura do Plano de Continuidade de Negócios (PCN)
O PCN desdobra-se em planos especializados e complementares:
* **Plano de Gestão de Crises (PGC):** Liderança, tomada de decisão estratégica e comunicação com a imprensa, autoridades regulatórias e clientes.
* **Plano de Continuidade Operacional (PCO):** Manutenção dos processos essenciais de trabalho da equipe (ex: transferência de funcionários para home office ou escritórios alternativos).
* **Plano de Recuperação de Desastres (PRD / DRP):** Plano técnico focado especificamente na restauração da infraestrutura de TI, servidores, bancos de dados e links de comunicação.
* **Plano de Contingência:** Procedimentos emergenciais imediatos para absorver o choque inicial do sinistro.

### 3. Ambientes Alternativos de Recuperação de TI
* **Hot Site:** Centro de processamento secundário totalmente operacional e sincronizado em tempo real com a sede. Recuperação quase instantânea (minutos), mas com custo financeiro elevado.
* **Warm Site:** Possui a infraestrutura física de servidores e redes pré-instalada, porém os dados mais recentes precisam ser restaurados a partir dos backups (recuperação em algumas horas).
* **Cold Site:** Espaço físico preparado com eletricidade, refrigeração e cabeamento, mas sem equipamentos computacionais prévios instalados (recuperação em dias ou semanas).
