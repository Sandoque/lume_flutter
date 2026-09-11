# Módulo 2: Arquitetura de Computação em Nuvem
## Resumo Executivo & Pontos-Chave

A arquitetura de nuvem abrange os componentes de hardware, software, redes e interfaces que se combinam para fornecer um ambiente de computação elástico, resiliente e escalável.

### 1. Componentes da Arquitetura
* **Front-End:** Interface com o usuário final (aplicativos móveis, clientes web, navegadores, SDKs e CLIs).
* **Back-End:** A infraestrutura oculta do provedor (datacenters massivos, servidores de processamento, storage de alta densidade, hipervisores e controladores de SDN).
* **Plano de Controle (*Control Plane*):** Sistema de gestão central que recebe requisições de API, autentica chamadas, aloca instâncias e orquestra a rede.
* **Plano de Dados (*Data Plane*):** O caminho onde trafegam os dados brutos e as cargas de trabalho reais dos clientes.

### 2. Estratégias de Escalabilidade
* **Escalabilidade Vertical (*Scale-Up / Scale-Down*):** Adição de mais recursos (CPU, RAM, disco) a uma máquina existente. Possui limite físico e gera indisponibilidade transitória no reinício.
* **Escalabilidade Horizontal (*Scale-Out / Scale-In*):** Adição de mais nós/instâncias em paralelo ao cluster. É a fundação da resiliência em nuvem, permitindo crescimento infinito sem desligar nós existentes.

### 3. Balanceamento de Carga (*Load Balancing*)
* Distribui o tráfego de entrada de forma uniforme entre múltiplos servidores saudáveis.
* **L4 (Transporte):** Roteia pacotes com base em IPs e Portas TCP/UDP (altíssima velocidade, baixa latência).
* **L7 (Aplicação):** Roteia com base em URLs, cabeçalhos HTTP, cookies e path `/api/v1` (roteamento inteligente).
* **Health Checks:** Mecanismo contínuo que testa os servidores e remove nós defeituosos automaticamente.

### 4. Padrões de Resiliência
* **Desacoplamento:** Componentes se comunicam por meio de filas de mensageria assíncrona (RabbitMQ, AWS SQS, Azure Service Bus). Se um componente falhar, os dados não se perdem.
* **Statelessness (Sem Estado):** Servidores web não gravam sessões na memória local; sessões são salvas em bancos de cache centralizados (Redis, Memcached), permitindo destruição ou criação de instâncias a qualquer momento.
