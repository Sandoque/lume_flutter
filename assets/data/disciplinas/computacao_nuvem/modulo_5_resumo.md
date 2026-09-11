# Módulo 5: Amazon Web Services (AWS)
## Resumo Executivo & Pontos-Chave

A AWS é a provedora pioneira e líder global de computação em nuvem, oferecendo um catálogo abrangente com infraestrutura altamente distribuída.

### 1. Infraestrutura Global AWS
* **Regiões AWS:** Áreas geográficas isoladas contendo múltiplas Zonas de Disponibilidade. No Brasil, temos a região `sa-east-1` (São Paulo).
* **Zonas de Disponibilidade (AZs):** Datacenters isolados com infraestrutura redundante de energia, rede e refrigeração. Uma região AWS possui no mínimo 3 AZs (ex: `sa-east-1a`, `sa-east-1b`, `sa-east-1c`).
* **Pontos de Presença (*Edge Locations / CloudFront PoPs*):** Centenas de locais distribuídos pelo mundo para entrega de conteúdo via CDN com baixa latência e mitigação de ataques DDoS pelo AWS Shield.

### 2. Computação com Amazon EC2 (*Elastic Compute Cloud*)
* **Famílias de Instâncias:**
 * `t4g`, `m6i`, `m5`: Uso geral (*General Purpose*) para servidores web e microsserviços.
 * `c6g`, `c5`: Otimizadas para Computação (*Compute Optimized*) com alta taxa de GHz para processamento em lote.
 * `r6g`, `r5`: Otimizadas para Memória (*Memory Optimized*) para bancos de dados relacionais e caches.
* **Modelos de Compra de EC2:**
 * **On-Demand:** Pagamento por segundo/hora sem fidelidade; flexibilidade máxima.
 * **Savings Plans / Reserved Instances (RI):** Descontos de até 72% em troca de compromisso de uso de 1 ou 3 anos.
 * **Spot Instances:** Descontos de até 90% aproveitando capacidade ociosa de datacenters da AWS; a AWS pode recuperar a instância com aviso prévio de 2 minutos. Ideal para processamento em lote tolerante a falhas.

### 3. Armazenamento na AWS
* **Amazon S3 (Simple Storage Service):** Armazenamento de objetos com **11 noves de durabilidade (99,999999999%)**. Suporta hospedagem nativa de sites estáticos (HTML/CSS/JS), controle de versões e criptografia transparente.
 * Classes: Standard, Intelligent-Tiering, Standard-IA, One Zone-IA, Glacier Instant/Flexible/Deep Archive.
* **Amazon EBS (Elastic Block Store):** Discos virtuais de bloco anexados a instâncias EC2:
 * `gp3`: SSD de uso geral com IOPS e throughput configuráveis independentemente do tamanho.
 * `io2 Block Express`: SSD de altíssimo desempenho para bancos de dados de missão crítica.
 * `st1`: HDD otimizado para taxa de transferência contínua de big data.

### 4. Redes Virtuais com Amazon VPC
* **Amazon VPC (*Virtual Private Cloud*):** Sua rede privada isolada na AWS.
* **Regra dos 5 IPs Reservados:** Em qualquer sub-rede IPv4 criada na AWS (ex: `10.0.0.0/24`), os primeiros 4 endereços (`.0`, `.1`, `.2`, `.3`) e o último endereço de broadcast (`.255`) são **reservados pela AWS** para roteador, DNS e uso futuro. Apenas os IPs de `.4` a `.254` podem ser atribuídos a instâncias!
* **Alta Disponibilidade:** Uma VPC com alta disponibilidade requer recursos distribuídos em no mínimo **Duas Zonas de Disponibilidade (AZs)** distintas.
