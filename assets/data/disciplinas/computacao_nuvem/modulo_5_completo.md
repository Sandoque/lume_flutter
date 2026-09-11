# Módulo 5: Ambiente de Computação em Nuvem - AWS
## Conteúdo Completo e Aprofundado

---

### 1. Visão Geral e Infraestrutura Global da AWS

A **Amazon Web Services (AWS)** iniciou suas operações em 2006 e permanece como referência da indústria de nuvem pública. Sua infraestrutura é concebida sob o conceito de compartimentação e isolamento para tolerância máxima a desastres.

* **Regiões:** Uma Região AWS é uma localização física no mundo onde existem múltiplos datacenters agrupados. Cada região opera com isolamento total para garantir conformidade legal e autonomia. Na América do Sul, a principal região é **São Paulo (`sa-east-1`)**.
* **Zonas de Disponibilidade (*Availability Zones - AZs*):** Cada Região é composta por no mínimo três Zonas de Disponibilidade totalmente distintas fisicamente e separadas geograficamente por distâncias seguras contra desastres naturais (inundações, terremotos), mas conectadas por fibra óptica de latência de sub-milissegundo. Cada AZ possui prédios de datacenters independentes com geradores a diesel e subestações elétricas privativas.
* **Edge Locations (Pontos de Presença):** Mais de 400 pontos globais conectados à rede mundial de entrega de conteúdo (*CDN - Amazon CloudFront*) e ao serviço de resolução de nomes DNS (*Amazon Route 53*).

---

### 2. Computação com Amazon EC2

O **Amazon Elastic Compute Cloud (Amazon EC2)** disponibiliza capacidade computacional redimensionável na nuvem sob a forma de servidores virtuais.

#### Amazon Machine Image (AMI)
Uma **AMI** é um modelo pré-configurado contendo o sistema operacional, servidor de aplicação e softwares necessários para inicializar uma instância EC2. Podem ser fornecidas pela AWS (Amazon Linux 2023, Ubuntu oficial), compradas no AWS Marketplace de fornecedores verificados com garantia de procedência, ou criadas sob medida pela própria organização (*Golden Images*).

#### Famílias e Nomenclatura de Instâncias
O nome de uma instância (como `t4g.xlarge` ou `c6i.2xlarge`) revela sua arquitetura:
* **Primeira Letra (Família):**
 * `t` e `m`: Propósito Geral (*General Purpose*), balanceando CPU, memória e rede para a grande maioria das cargas web comuns. As instâncias `t` (como `t3a` e `t4g`) contam com crédito de burst de CPU.
 * `c`: Computação Otimizada (*Compute Optimized*), ideais para codificação de vídeo, jogos dedicados e processamento científico.
 * `r` ou `x`: Memória Otimizada (*Memory Optimized*), ideais para bancos de dados relacionais de alta performance e bancos em memória (Redis).
 * `i` ou `d`: Armazenamento Otimizado (*Storage Optimized*), com discos NVMe locais de altíssima taxa de IOPS para bancos NoSQL (Cassandra, MongoDB).
* **Geração (Número seguinte):** Indica a geração do hardware (ex: `6` é mais recente e eficiente que `5`).
* **Sufixos:** `g` indica processador AWS Graviton baseado em arquitetura ARM; `i` indica processador Intel Xeon; `a` indica processador AMD EPYC.
* **Tamanho:** Determina o número proporcional de vCPUs e GB de memória RAM (`nano`, `micro`, `small`, `medium`, `large`, `xlarge`, `2xlarge`, etc.).

---

### 3. Armazenamento na AWS: Objeto, Bloco e Arquivo

A AWS provê três paradigmas complementares de armazenamento:

#### Amazon S3 (Simple Storage Service) - Armazenamento de Objetos
Projetado para armazenar qualquer volume de dados com durabilidade de **11 noves (99,999999999%)**. Os dados são organizados em **Buckets** (que exigem nomes globalmente exclusivos em toda a AWS).
* O S3 possui capacidade nativa de **Hospedagem de Sites Estáticos** (HTML, JavaScript, CSS e imagens), executando como um servidor web serverless de altíssima escala sem necessidade de instâncias EC2 ou servidores Apache/Nginx.
* **Classes de Armazenamento:**
 * *S3 Standard:* Acesso frequente com baixa latência;
 * *S3 Intelligent-Tiering:* Move automaticamente os objetos entre camadas de acesso conforme o padrão de uso, sem taxas de recuperação;
 * *S3 Standard-IA (Infrequent Access):* Menor custo por GB para dados acessados raramente, mas que exigem disponibilidade em milissegundos quando requisitados;
 * *S3 Glacier Flexible e Deep Archive:* Armazenamento frio para arquivos de conformidade de longo prazo com o menor custo da AWS.

#### Amazon EBS (Elastic Block Store) - Armazenamento em Bloco
Fornece volumes de disco rígido virtuais que são formatados com um sistema de arquivos (ext4, NTFS) e montados diretamente em uma instância EC2.
* **gp3 (SSD de Uso Geral):** O tipo mais recomendado para volumes de boot, desenvolvimento, testes e bancos de dados moderados. Permite configurar o throughput (MB/s) e IOPS de forma totalmente independente da capacidade em GB do disco.
* **io2 Block Express:** Para sistemas corporativos críticos com exigência de latência abaixo de um milissegundo e milhares de IOPS dedicados.

---

### 4. Redes Virtuais: Arquitetura de Amazon VPC

A **Amazon Virtual Private Cloud (Amazon VPC)** permite provisionar uma seção isolada da nuvem AWS onde você executa recursos em uma rede virtual definida por você.

* **Bloco CIDR da VPC:** Define o espaço total de endereçamento IP privado (por exemplo, `10.0.0.0/16`, que provê até 65.536 endereços IP).
* **Sub-redes e Alocação de IPs:** Uma sub-rede reside sempre dentro de uma única Zona de Disponibilidade. Ao criar uma sub-rede `/24` (que em redes normais teria 256 endereços), a AWS **reserva compulsoriamente 5 endereços IP**:
 1. O primeiro IP (`10.0.0.0`): Endereço de rede;
 2. O segundo IP (`10.0.0.1`): Roteador da VPC;
 3. O terceiro IP (`10.0.0.2`): Mapeado para o resolvedor DNS da AWS;
 4. O quarto IP (`10.0.0.3`): Reservado para expansões futuras da AWS;
 5. O último IP (`10.0.0.255`): Endereço de broadcast.
 Portanto, apenas **251 endereços** (`10.0.0.4` a `10.0.0.254`) ficam disponíveis para atribuição a servidores e recursos!
* **Componentes de Conectividade:**
 * **Internet Gateway (IGW):** Permite comunicação bidirecional entre recursos em sub-redes públicas e a internet.
 * **NAT Gateway:** Permite que instâncias em sub-redes privadas baixem atualizações e acessem a internet sem expor suas portas a conexões originadas do mundo exterior.
 * **Elastic Load Balancing (ELB):** Distribui o tráfego de entrada em instâncias EC2, contêineres e endereços IP em múltiplas Zonas de Disponibilidade.
