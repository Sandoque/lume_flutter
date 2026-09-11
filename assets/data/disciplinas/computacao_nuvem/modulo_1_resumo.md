# Módulo 1: Fundamentos de Computação em Nuvem
## Resumo Executivo & Pontos-Chave

A Computação em Nuvem representa a mudança de paradigma da computação tradicional para a entrega sob demanda de poder computacional, armazenamento de banco de dados, aplicações e outros recursos de TI por meio da internet, com definição de preços pré-pagos (*pay-as-you-go*).

### 1. Cinco Características Essenciais (NIST SP 800-145)
1. **Autoatendimento sob demanda (*On-demand self-service*):** O usuário provisiona recursos (tempo de CPU, rede, armazenamento) unilateralmente sem intervenção humana do provedor.
2. **Amplo acesso à rede (*Broad network access*):** Recursos acessíveis via internet através de mecanismos padronizados (smartphones, tablets, laptops, desktops).
3. **Agrupamento de recursos em pool (*Resource pooling*):** Modelo multi-inquilino (*multi-tenant*), onde recursos físicos e virtuais são dinamicamente atribuídos e reatribuídos conforme a demanda dos clientes, com independência de localização física.
4. **Rápida elasticidade (*Rapid elasticity*):** Capacidades provisionadas e liberadas com extrema rapidez para escalar vertical e horizontalmente conforme picos de demanda.
5. **Serviço mensurado (*Measured service*):** Monitoramento, controle e tarifação transparente baseados no consumo real (por hora, segundo, GB transferido).

### 2. Modelos de Serviço (SPI Model)
* **IaaS (Infraestrutura como Serviço):** Controle sobre SO, armazenamento e apps instaladas. Ex: AWS EC2, Azure VMs, Google Compute Engine. O provedor cuida do hardware físico e virtualização.
* **PaaS (Plataforma como Serviço):** Ambiente de desenvolvimento e execução gerenciado. Ex: AWS Elastic Beanstalk, Azure App Service, Google App Engine. O usuário foca apenas no código da aplicação.
* **SaaS (Software como Serviço):** Software pronto acessado via navegador. Ex: Microsoft 365, Google Workspace, Salesforce. Provedor gerencia tudo.

### 3. Modelos de Implantação
* **Nuvem Pública:** Infraestrutura compartilhada de propriedade de terceiros aberta ao público geral.
* **Nuvem Privada:** Operada exclusivamente para uma única organização, localmente (*on-premises*) ou hospedada externamente.
* **Nuvem Híbrida:** Combinação integrada de nuvens públicas e privadas unidas por tecnologia padronizada que permite portabilidade de dados e aplicações.
* **Nuvem Comunitária:** Compartilhada por várias organizações com interesses e exigências regulatórias em comum (ex: setor bancário ou saúde).

### 4. Economia da Nuvem
* **CapEx (Capital Expenditure):** Gastos de capital fixos em hardware físico, datacenters e refrigeração.
* **OpEx (Operational Expenditure):** Despesas operacionais flexíveis e variáveis conforme o consumo mensal.
