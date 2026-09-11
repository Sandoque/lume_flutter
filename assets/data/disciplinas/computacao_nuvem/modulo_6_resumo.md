# Módulo 6: Google Cloud Platform (GCP)
## Resumo Executivo & Pontos-Chave

O Google Cloud Platform (GCP) oferece a mesma infraestrutura global, segura e de altíssima performance que suporta produtos como a Busca Google, YouTube e Gmail.

### 1. Infraestrutura Global do Google Cloud
* **Rede Privada Global por Fibra Óptica:** A maior malha de telecomunicações privada do mundo. O tráfego de clientes GCP entra no ponto de presença (PoP) mais próximo e trafega pela fibra dedicada do Google, evitando a internet pública instável.
* **Regiões e Zonas:** Zonas de computação agrupadas em regiões ao redor do globo. Em São Paulo, o GCP opera a região `southamerica-east1` com três zonas (`a`, `b`, `c`).

### 2. Serviços Principais de Computação
* **Compute Engine:** IaaS para criar Máquinas Virtuais altamente configuráveis. Permite definir quantidades exatas de CPU e RAM sem ficar restrito a tamanhos fixos (*Custom Machine Types*).
* **Google Kubernetes Engine (GKE):** O serviço gerenciado de Kubernetes pioneiro da indústria (já que o Kubernetes foi criado originalmente pelo próprio Google como projeto Borg).
* **Cloud Run:** Plataforma *serverless* totalmente gerenciada que executa contêineres OCI/Docker diretamente sobre requisições HTTP, escalando de zero a milhares de instâncias instantaneamente.
* **Cloud Functions:** Execução de pequenas funções orientadas a eventos sem gerenciamento de infraestrutura.

### 3. Armazenamento e Análise de Big Data
* **Cloud Storage:** Armazenamento unificado de objetos com namespaces globais e classes de acesso: Standard, Nearline (30 dias), Coldline (90 dias) e Archive (365 dias).
* **Cloud Spanner:** O primeiro banco de dados relacional distribuído globalmente com consistência estrita (ACID), replicação síncrona mundial e disponibilidade de 99,999% (cinco noves).
* **BigQuery:** Data Warehouse empresarial analítico e *serverless*. Permite consultar petabytes de dados utilizando SQL padrão em poucos segundos sem necessidade de gerenciar nós ou índices.

### 4. Redes e Mensageria no GCP
* **VPC Global:** Ao contrário de outros provedores onde a rede virtual é restrita a uma região, a VPC do Google Cloud é **Global por padrão**, permitindo que sub-redes em diferentes continentes conversem por IPs privados sem necessidade de túneis VPN ou peering!
* **Cloud Pub/Sub:** Sistema de mensageria assíncrona desacoplado de altíssima escala capaz de processar milhões de mensagens por segundo com latência de milissegundos.
* **Cloud Load Balancing:** Balanceador de carga global Anycast com um único endereço IP público mundial para roteamento de tráfego automático para o datacenter mais próximo do usuário.
