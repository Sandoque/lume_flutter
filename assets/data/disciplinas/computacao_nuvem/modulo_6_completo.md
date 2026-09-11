# Módulo 6: Ambiente de Computação em Nuvem - Google Cloud (GCP)
## Conteúdo Completo e Aprofundado

---

### 1. A Infraestrutura e Rede do Google Cloud

O **Google Cloud Platform (GCP)** diferencia-se fortemente no mercado por se apoiar na mesma infraestrutura de rede e hardware proprietário que viabilizou os maiores serviços de internet do mundo (Google Search, YouTube, Maps e Gmail).

#### A Rede Privada Global por Fibra Óptica
Enquanto muitos serviços na internet pública sofrem degradação por saltos entre múltiplos provedores de telecomunicações desconhecidos (*hops*), o Google possui sua própria malha submarina e terrestre de cabos de fibra óptica proprietários intercontinentais.
* **Modelo Anycast:** Um único endereço IP público de balanceador pode ser anunciado para todo o planeta. A requisição de um usuário no Brasil ou no Japão é recebida no Ponto de Presença (*PoP*) mais próximo de sua casa e injetada imediatamente na rede privada do Google, viajando sob velocidade máxima com latência e segurança otimizadas.

#### Regiões e Zonas
* Uma **Região** é uma localização física independente que contém três ou mais **Zonas**.
* No Brasil, o Google opera a região de São Paulo (`southamerica-east1`), garantindo que empresas nacionais processem seus dados sensíveis sob a jurisdição da LGPD com latências inferiores a 5 milissegundos para os usuários locais.

---

### 2. Computação Moderna: VMs Flexíveis, Kubernetes e Serverless

#### Compute Engine (IaaS)
Permite executar máquinas virtuais nos datacenters do Google. Destaca-se pelos seguintes diferenciais:
* **Custom Machine Types:** Não é obrigatório selecionar tipos de máquinas fixos. É possível montar uma VM sob medida com exatamente 3 vCPUs e 11 GB de memória RAM, evitando o pagamento de recursos sobressalentes.
* **Spot VMs (antigas Preemptible VMs):** Instâncias com descontos de 60% a 91% em comparação aos preços sob demanda, recomendadas para computação em lote e clusters de processamento distribuído tolerantes a interrupções eventuais.

#### Google Kubernetes Engine (GKE)
O Kubernetes foi projetado originalmente por engenheiros do Google com base em duas décadas de experiência interna executando contêineres no sistema Borg. O GKE é a plataforma de orquestração de contêineres mais madura do mercado, oferecendo:
* Modo *GKE Autopilot*, onde o Google gerencia e otimiza automaticamente toda a infraestrutura subjacente de nós, segurança e faturamento por pod consumido.

#### Cloud Run (Contêineres Serverless)
Permite pegar qualquer imagem de contêiner Docker que responda a requisições web e colocá-la em execução na nuvem sem precisar provisionar nenhum cluster ou servidor. O Cloud Run escala automaticamente de zero (nenhum custo enquanto não houver tráfego) até milhares de instâncias simultâneas em milissegundos.

---

### 3. Soluções de Armazenamento e Big Data

#### Google Cloud Storage
Armazenamento de objetos seguro e altamente escalável para dados não estruturados:
* Organizado em **Buckets**, cada qual pertencente a uma região ou multi-região.
* Oferece quatro classes de acesso unificadas por uma mesma API: **Standard**, **Nearline** (para dados acessados no máximo uma vez ao mês), **Coldline** (para dados acessados no máximo uma vez por trimestre) e **Archive** (para arquivamento de longo prazo com retenção mínima de 365 dias).

#### BigQuery (Data Warehouse Analítico Serverless)
O BigQuery revolucionou a análise de dados moderna:
* Permite executar consultas analíticas complexas sobre tabelas com **terabytes ou petabytes de registros** em apenas alguns segundos utilizando a linguagem SQL padrão.
* É totalmente *serverless*: não há necessidade de provisionar instâncias, dimensionar discos ou configurar índices. O usuário paga estritamente pelo volume de bytes lidos durante a execução de cada consulta ou por capacidade reservada.

#### Cloud Spanner
Banco de dados relacional que resolve o clássico dilema do Teorema CAP para sistemas distribuídos:
* Entrega a consistência estrita transacional (**ACID**) de bancos de dados relacionais tradicionais combinada com a escala horizontal global de bancos NoSQL.
* Utiliza a tecnologia proprietária *TrueTime*, que sincroniza relógios atômicos e receptores de GPS nos datacenters mundiais do Google para assegurar ordenação de transações à escala planetária com disponibilidade de 99,999% (cinco noves).

---

### 4. Redes Virtuais e Mensageria Assíncrona

#### A Inovação da VPC Global
No Google Cloud, a **Virtual Private Cloud (VPC)** é um recurso global. Uma única VPC cobre todas as regiões do mundo. As sub-redes criadas dentro dessa VPC são regionais (ex: uma sub-rede em São Paulo `10.1.0.0/24` e outra em Frankfurt `10.2.0.0/24`), mas os servidores em ambas as sub-redes comunicam-se nativamente usando seus endereços IP privados através do backbone do Google sem exigir a criação de túneis VPN complexos.

#### Cloud Pub/Sub
Serviço de mensageria assíncrona projetado para atuar como o sistema nervoso central de aplicações distribuídas e pipelines de ingestão de dados em tempo real:
* Permite que produtores publiquem mensagens em **Tópicos** e consumidores recebam essas mensagens de forma desacoplada através de **Assinaturas (*Subscriptions*)**.
* Oferece entrega de mensagens com latência na casa dos milissegundos e armazenamento persistente e redundante em múltiplas zonas.
