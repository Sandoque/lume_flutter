# Módulo 4: Ambiente de Computação em Nuvem - Azure
## Conteúdo Completo e Aprofundado

---

### 1. A Infraestrutura Global da Microsoft

A rede global do Azure é uma das maiores infraestruturas interconectadas do planeta, desenhada para garantir conformidade regulatória, soberania de dados e altíssima disponibilidade para organizações corporativas e governamentais.

* **Regiões do Azure:** Uma região é um conjunto geográfico de datacenters conectados por uma rede dedicada de alta largura de banda e baixíssima latência (menos de 2 milissegundos). A Microsoft possui mais de 60 regiões em todo o mundo. No Brasil, temos a região **Brazil South** (localizada no Estado de São Paulo) e a região de suporte **Brazil Southeast** (no Rio de Janeiro).
* **Zonas de Disponibilidade (*Availability Zones - AZs*):** São locais físicos fisicamente separados dentro de uma mesma região do Azure. Cada Zona de Disponibilidade é composta por um ou mais datacenters equipados com infraestrutura independente de energia elétrica, refrigeração líquida/ar condicionado de precisão e conexões de rede redundantes. Ao implantar serviços com redundância de zona, se um datacenter sofrer uma inundação física ou colapso total de energia na Zona 1, a aplicação continua operando sem interrupção nas Zonas 2 e 3.
* **Pares de Regiões (*Region Pairs*):** Cada região do Azure é emparelhada de fábrica com outra região dentro da mesma geografia (a pelo menos 480 km de distância). Em caso de um desastre catastrófico de escala continental, a Microsoft prioriza a recuperação de uma das regiões do par para cada grupo de assinaturas e sincroniza a aplicação de atualizações do Azure para que nunca ambas as regiões emparelhadas sofram manutenção simultânea.

---

### 2. Principais Serviços de Computação do Azure

#### Máquinas Virtuais do Azure (*Azure VMs*)
Serviço IaaS clássico que permite criar instâncias com suporte a dezenas de distribuições Linux (Ubuntu, Red Hat, SUSE, Debian) e Windows Server. O usuário escolhe famílias de máquinas especializadas:
* *Série D:* Propósito geral balanceado (CPU e memória proporcionais);
* *Série E:* Otimizada para memória (ideal para bancos de dados in-memory como SAP HANA e SQL Server);
* *Série F:* Otimizada para computação intensiva (alta frequência de clock por núcleo);
* *Série N:* Equipadas com GPUs NVIDIA para renderização gráfica e inteligência artificial.

#### Conjuntos de Dimensionamento de VMs (*Virtual Machine Scale Sets - VMSS*)
Recurso que gerencia e automatiza a criação de pools de máquinas virtuais idênticas com balanceamento de carga nativo. Permite regras de escala elástica com base em métricas (por exemplo, adicionar uma VM se o uso médio de CPU passar de 75% por 5 minutos consecutivos).

#### Serviço de Aplicativo do Azure (*Azure App Service*)
A principal oferta de **PaaS** para hospedar sites e APIs. O desenvolvedor não gerencia o Windows ou Linux subjacente; o Azure entrega ambientes prontos para .NET Core, Java, Node.js, Python e PHP, integrados a certificados SSL gratuitos, balanceamento automático de tráfego, domínios personalizados e *Deployment Slots* (que permitem testar uma nova versão em um slot de homologação e fazer a troca instantânea para produção com zero downtime).

#### Azure Functions (Computação Serverless)
Permite executar pequenos blocos de código disparados por gatilhos (*triggers*), como a chegada de uma nova mensagem em uma fila, uma requisição HTTP ou a gravação de um arquivo em um bucket. Não há cobrança quando o código está ocioso.

---

### 3. Serviços de Armazenamento e Redundância de Dados

O **Azure Storage** é a espinha dorsal de dados não estruturados e discos virtuais:

#### Camadas de Acesso do Azure Blob Storage
* **Hot (Frequente):** Para dados que estão sendo ativamente lidos e modificados no dia a dia.
* **Cool (Esporádico):** Para dados acessados com menor frequência que permanecerão armazenados por no mínimo 30 dias. Oferece taxa de armazenamento por GB menor que a camada frequente, mas com custo por operação de leitura um pouco mais elevado.
* **Cold (Frio):** Para dados de acesso muito raro que permanecerão por no mínimo 90 dias.
* **Archive (Arquivo Morto):** Custo de armazenamento por GB extremamente baixo, ideal para backups históricos e retenções legais (mínimo de 180 dias). Fica offline; para ler um arquivo arquivado, é necessário solicitar sua **reidratação**, processo que pode levar algumas horas até que os dados sejam movidos para uma camada online.

#### Opções de Replicação e Durabilidade
1. **LRS (Locally Redundant Storage):** Os dados são replicados 3 vezes de forma síncrona dentro de um único datacenter físico. Protege contra falha de um disco ou rack de servidores, garantindo 11 noves (99,999999999%) de durabilidade.
2. **ZRS (Zone-Redundant Storage):** Os dados são replicados sincronamente em 3 Zonas de Disponibilidade distintas dentro da região primária (12 noves de durabilidade). Resiste à perda total de um datacenter inteiro.
3. **GRS (Geo-Redundant Storage):** Cria 3 cópias locais (LRS) na região primária e transmite assincronamente os dados para a região emparelhada a centenas de quilômetros de distância, onde são gravadas mais 3 cópias. Garante **16 noves de durabilidade (99,99999999999999%)**.

---

### 4. Governança, Políticas e Monitoramento no Azure

* **Grupos de Recursos (*Resource Groups*):** Contêineres lógicos onde todos os recursos relacionados de uma mesma solução são agrupados para gerenciamento do ciclo de vida conjunto. Se um grupo de recursos for excluído, todos os servidores, discos e IPs contidos nele são desalocados imediatamente.
* **Marcas (*Tags*):** Metadados em formato chave-valor (ex: `CentroDeCusto: 1045`, `Ambiente: Producao`, `Dono: TimePagamentos`) associados aos recursos para consolidar faturas, ratear despesas e emitir relatórios de contabilidade analítica.
* **Azure Policy:** Mecanismo de governança que impõe regras automatizadas em toda a organização. Exemplos: impedir que qualquer usuário crie máquinas virtuais com mais de 8 CPUs, forçar a obrigatoriedade de tags em qualquer novo recurso, ou proibir a inicialização de serviços fora do território nacional brasileiro.
* **Azure Monitor & Log Analytics:** Coleta, analisa e correlaciona telemetria, logs de auditoria e métricas de desempenho de recursos em nuvem e locais para disparar alertas e acionar rotinas de autocorreção.
