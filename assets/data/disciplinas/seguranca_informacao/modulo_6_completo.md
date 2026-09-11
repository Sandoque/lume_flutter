# Módulo 6: Gestão de Continuidade do Negócio
## Conteúdo Completo e Aprofundado

---

### 1. Conceito e Propósito da Continuidade de Negócios

A **Gestão de Continuidade de Negócios (GCN)** é o conjunto abrangente de processos, políticas, protocolos e planos que capacitam uma organização a responder a incidentes disruptivos graves de forma estruturada, assegurando a preservação de vidas humanas em primeiro lugar e a manutenção de suas funções de negócio mais críticas.

A norma internacional que estabelece os padrões e requisitos de um Sistema de Gestão de Continuidade de Negócios é a **ISO 22301**.

---

### 2. A Análise de Impacto no Negócio (*BIA - Business Impact Analysis*)

O ponto de partida inegociável de qualquer PCN é a execução da **Análise de Impacto no Negócio (BIA)**:
* A BIA não avalia a tecnologia em si, mas sim os **processos operacionais e financeiros** da organização (ex: faturamento de notas fiscais, atendimento hospitalar em UTI, pagamento de folha, processamento de transações de cartão).
* Identifica os prazos máximos que cada processo suporta permanecer inoperante antes que danos financeiros, legais ou à reputação se tornem fatais para a sobrevivência da instituição.
* Estabelece as duas métricas mais cruciais de engenharia de resiliência:
 * **RTO (Recovery Time Objective):** Determina quanto tempo a equipe técnica tem para recolocar o sistema no ar. Se o RTO de um banco de dados é de 2 horas, o sistema precisa estar operacional no máximo 120 minutos após o incidente.
 * **RPO (Recovery Point Objective):** Quantifica o prejuízo tolerável de perda de dados históricos. Se o RPO é de 15 minutos, a empresa não pode admitir perder mais de 15 minutos de transações comerciais entre o último snapshot e o momento da queda.

---

### 3. A Estrutura Organizacional do Plano de Continuidade de Negócios (PCN)

Um PCN de classe internacional não se resume a um único arquivo em PDF esquecido em uma prateleira; ele se desdobra em quatro vertentes operacionais complementares:

```
 [ POLÍTICA DE GESTÃO DE CONTINUIDADE (PGCN) ]
 |
 +------------------+------------------+
 | |
 [ GESTÃO DE CRISES (PGC) ] [ CONTINUIDADE OPERACIONAL (PCO) ]
 (Decisão executiva e mídia) (Procedimentos manuais e pessoas)
 | |
 [ PLANO DE CONTINGÊNCIA ] [ RECUPERAÇÃO DE DESASTRES (PRD) ]
 (Absorção do choque inicial) (Restauração de TI e Redes)
```

1. **Plano de Gestão de Crises (PGC):** Define quem assume o comando geral da empresa durante o desastre (Comitê de Crise), quais são os porta-vozes autorizados a falar com a imprensa para conter rumores e como contatar acionistas e órgãos governamentais reguladores.
2. **Plano de Continuidade Operacional (PCO):** Descreve como as equipes executam suas rotinas de trabalho quando o prédio principal estiver inacessível (ex: migração para home office ou acionamento de unidades de trabalho remotas).
3. **Plano de Recuperação de Desastres (*PRD / DRP*):** O braço tecnológico do PCN. Define detalhadamente o passo a passo que a equipe de TI deve seguir para religar servidores, restaurar cópias de segurança de bancos de dados, reconfigurar zonas de DNS e apontar o tráfego de usuários para a infraestrutura de contingência.
4. **Plano de Contingência:** Ações emergenciais de contorno imediato disparadas no calor da ocorrência.

---

### 4. Ambientes de Recuperação de Infraestrutura: Hot, Warm e Cold Sites

Quando o data center principal de uma empresa sofre um sinistro destrutivo físico (como incêndio ou enchente), a recuperação depende da estratégia de local secundário contratada:

* **Hot Site (Ambiente Ativo):** Um data center secundário totalmente equipado e mantido em operação simultânea. Possui servidores, redes e bancos de dados duplicados e sincronizados ativamente através de links de fibra dedicada. Se a sede desabar, os balanceadores comutam o tráfego para o Hot Site em questão de poucos minutos com quase zero de perda de dados. Apresenta o mais alto custo de manutenção.
* **Warm Site (Ambiente Semipronto):** Possui as instalações físicas e os servidores montados em racks com sistema operacional básico instalado, porém não mantém réplicas ativas dos dados em tempo real. A equipe precisa recuperar os dados a partir de fitas de backup ou snapshots de nuvem, o que leva de algumas horas a um dia para restabelecimento total.
* **Cold Site (Ambiente Básico Físico):** Um galpão ou sala de data center que possui apenas a infraestrutura básica predial: energia de emergência, conexões de internet e refrigeração. Não há computadores ou servidores pré-instalados. Se ocorrer uma tragédia, a empresa precisará comprar ou alugar servidores emergenciais para instalá-los no local, processo que pode levar dias ou semanas.
