# Módulo 4: Microsoft Azure
## Resumo Executivo & Pontos-Chave

O Microsoft Azure é a plataforma de computação em nuvem da Microsoft, fornecendo mais de 200 produtos e serviços em nuvem em uma infraestrutura global massiva.

### 1. Infraestrutura Global do Azure
* **Geografias:** Mercados geopolíticos discretos que contêm pelo menos duas regiões para atender à soberania de dados (ex: Brasil).
* **Regiões:** Conjunto de datacenters conectados por uma rede de latência ultra-baixa. O Brasil possui a região *Brazil South* (São Paulo).
* **Pares de Regiões (*Region Pairs*):** Cada região é emparelhada com outra dentro da mesma geografia a centenas de quilômetros de distância (ex: Brazil South é emparelhado com South Central US para disaster recovery prioritário).
* **Zonas de Disponibilidade (*AZs - Availability Zones*):** Locais físicos separados dentro de uma mesma região do Azure, cada um com sua própria alimentação elétrica, refrigeração e rede independentes.

### 2. Principais Serviços de Computação
* **Azure Virtual Machines (VMs):** IaaS flexível com sistemas Windows Server ou distribuições Linux.
* **Azure Virtual Machine Scale Sets (VMSS):** Cria e gerencia automaticamente grupos de VMs com balanceamento de carga e auto-scaling.
* **Azure App Service:** PaaS gerenciado para hospedar aplicações web, APIs RESTful e backends móveis (.NET, Java, Node.js, Python, PHP) com deploy contínuo (CI/CD).
* **Azure Functions:** Computação *serverless* orientada a eventos; executa código sem gerenciar servidores, cobrado por tempo de execução em milissegundos.
* **Azure Kubernetes Service (AKS):** Orquestração corporativa de contêineres Docker totalmente gerenciada pela Microsoft.

### 3. Armazenamento e Redundância de Dados
* **Azure Blob Storage:** Armazenamento de objetos não estruturados com 4 camadas de acesso:
 * **Hot (Frequente):** Otimizado para dados acessados com frequência; menor custo de acesso, maior custo de armazenamento.
 * **Cool (Esporádico):** Para dados armazenados por pelo menos 30 dias com acesso infrequente.
 * **Cold (Frio):** Para dados armazenados por pelo menos 90 dias com acesso raro.
 * **Archive (Arquivo Morto):** Para dados de conformidade e backup de longo prazo (mínimo 180 dias); custo de armazenamento minúsculo, mas exige horas para reidratar os dados.
* **Níveis de Redundância:**
 * **LRS (Locally Redundant Storage):** 3 réplicas em um único datacenter (11 noves de durabilidade).
 * **ZRS (Zone-Redundant Storage):** 3 réplicas distribuídas em 3 Zonas de Disponibilidade diferentes dentro da mesma região (12 noves).
 * **GRS (Geo-Redundant Storage):** 6 réplicas (3 locais + 3 replicadas assincronamente em uma região secundária emparelhada) oferecendo **16 noves de durabilidade (99,99999999999999%)**.

### 4. Governança e Custos no Azure
* **Hierarquia de Recursos:** Grupos de Gerenciamento → Assinaturas (*Subscriptions*) → Grupos de Recursos (*Resource Groups*) → Recursos Individuais.
* **Marcas (*Tags*):** Pares chave-valor anexados aos recursos para organização lógica e controle detalhado de custos por centro de custos ou projeto.
* **Azure Policy:** Aplica regras de conformidade corporativa (ex: proibir a criação de VMs caras fora do Brasil).
* **Microsoft Defender for Cloud:** Central unificada de postura de segurança e proteção contra ameaças em tempo real.
