# Módulo 1: Fundamentos de Computação em Nuvem
## Conteúdo Completo e Aprofundado

---

### 1. Evolução Histórica e Contexto da Infraestrutura de TI

A história da computação empresarial iniciou-se com a era dos **Mainframes** nas décadas de 1960 e 1970, onde o processamento era totalmente centralizado em grandes computadores dedicados e acessados por meio de terminais burros (*dumb terminals*). 

Nas décadas de 1980 e 1990, houve uma descentralização maciça com a ascensão da arquitetura **Cliente-Servidor**, na qual estações de trabalho executavam sistemas locais comunicando-se com servidores corporativos dedicados. Esse modelo, embora flexível, resultou em:
* **Subutilização crônica de hardware:** Servidores eram superdimensionados para picos sazonais, operando na maior parte do tempo com 5% a 15% de utilização de CPU.
* **Complexidade e custos operacionais (CapEx elevado):** Necessidade de compra de servidores físicos dispendiosos, contratos de garantia, infraestrutura predial de data center, no-breaks industriais, refrigeração de precisão e equipes especializadas de sustentação física 24x7.

A virada do milênio trouxe a consolidação de duas tecnologias determinantes: a **Virtualização de Servidores** e as **Redes de Alta Velocidade baseadas em Fibra Ótica**. O marco divisor ocorreu em 2006, quando a Amazon lançou comercialmente o Amazon S3 e o Amazon EC2, inaugurando a era moderna da Computação em Nuvem comercial.

---

### 2. Definição Oficial e as 5 Características Essenciais do NIST

Segundo a definição clássica do *National Institute of Standards and Technology* (NIST - SP 800-145), a Computação em Nuvem é um modelo para possibilitar acesso onipresente, conveniente e sob demanda a um conjunto compartilhado de recursos computacionais configuráveis (redes, servidores, armazenamento, aplicativos e serviços) que podem ser rapidamente provisionados e liberados com o mínimo de esforço de gerenciamento ou interação com o provedor de serviços.

Para que um serviço seja genuinamente considerado computação em nuvem, ele deve cumprir **cinco características essenciais**:

#### A. Autoatendimento sob Demanda (*On-demand Self-service*)
Um consumidor pode provisionar unilateralmente recursos computacionais, como tempo de servidor e armazenamento em rede, conforme necessário, automaticamente e sem exigir interação humana com o provedor de serviços. O provisionamento ocorre via interfaces web (consoles), linhas de comando (CLIs) ou chamadas de API.

#### B. Amplo Acesso à Rede (*Broad Network Access*)
Os recursos de computação estão disponíveis pela rede e são acessados por meio de mecanismos e protocolos padronizados que promovem o uso por plataformas de clientes finos ou espessos heterogêneas (por exemplo, telefones celulares, tablets, laptops e estações de trabalho).

#### C. Compartilhamento de Recursos em Pool (*Resource Pooling*)
Os recursos de computação do provedor são agrupados para atender a múltiplos clientes usando um modelo **multi-inquilino (*multi-tenant*)**, com diferentes recursos físicos e virtuais atribuídos e reatribuídos dinamicamente de acordo com a demanda do consumidor. O cliente geralmente não tem controle ou conhecimento sobre a localização física exata dos recursos fornecidos (embora possa especificar localização em nível de abstração superior, como País, Região ou Zona de Disponibilidade).

#### D. Elasticidade Rápida (*Rapid Elasticity*)
As capacidades podem ser provisionadas e liberadas elasticamente, em alguns casos automaticamente, para escalar rapidamente de forma horizontal (*scale-out*) ou vertical (*scale-up*) proporcionalmente à demanda. Para o consumidor, os recursos disponíveis para provisionamento parecem frequentemente ilimitados e podem ser apropriados em qualquer quantidade e a qualquer momento.

#### E. Serviço Mensurado (*Measured Service*)
Os sistemas em nuvem controlam e otimizam automaticamente o uso de recursos aproveitando um recurso de medição em algum nível de abstração apropriado ao tipo de serviço (por exemplo, armazenamento, processamento, largura de banda e contas de usuário ativas). O uso de recursos pode ser monitorado, controlado e relatado, proporcionando transparência para o provedor e para o consumidor do serviço utilizado (*pay-as-you-go*).

---

### 3. Modelos de Serviço (O Modelo SPI)

A computação em nuvem organiza suas entregas em três camadas principais de abstração:

```
+-------------------------------------------------------------+
| SaaS - Software as a Service |
| (Aplicações completas: Microsoft 365, Google Docs) |
+-------------------------------------------------------------+
| PaaS - Platform as a Service |
| (Ambientes de execução: App Service, Beanstalk, Cloud Run) |
+-------------------------------------------------------------+
| IaaS - Infrastructure as a Service |
| (Recursos brutos: VMs, Discos virtuais, VNets) |
+-------------------------------------------------------------+
```

#### IaaS (Infrastructure as a Service)
O provedor entrega hardware virtualizado: servidores virtuais, endereços de rede, roteadores virtuais e espaço de bloco/disco. O cliente é responsável por instalar, configurar e atualizar o sistema operacional, drivers, middlewares, frameworks e a aplicação final. Exemplos: AWS EC2, Azure Virtual Machines, Google Compute Engine.

#### PaaS (Platform as a Service)
O provedor cuida do sistema operacional, segurança de baixo nível, aplicação de patches, runtime e servidores. O desenvolvedor apenas faz upload do código-fonte ou contêiner de sua aplicação e conecta a um banco de dados gerenciado. Exemplos: Azure App Service, AWS Elastic Beanstalk, Google App Engine, Heroku.

#### SaaS (Software as a Service)
O usuário final consome um aplicativo pronto operado na infraestrutura do provedor. Não há preocupação com código, banco de dados ou infraestrutura. Exemplos: Microsoft Office 365, Salesforce, Gmail, Trello.

---

### 4. Modelos de Implantação

* **Nuvem Pública (*Public Cloud*):** Infraestrutura mantida e operada por uma empresa terceira (como Amazon, Microsoft ou Google), onde os serviços são entregues através da internet pública e compartilhados entre milhares de organizações simultaneamente com estrito isolamento lógico.
* **Nuvem Privada (*Private Cloud*):** Infraestrutura computacional dedicada integralmente para uma única corporação. Pode residir no data center próprio da organização (*on-premises*) ou ser hospedada em um data center de co-location especializado. Oferece controle rigoroso, mas não desfruta da mesma economia de escala da nuvem pública.
* **Nuvem Híbrida (*Hybrid Cloud*):** Modelo que conecta ambientes locais privados a nuvens públicas por meio de conexões seguras dedicadas (como VPNs IPsec ou links diretos dedicados como AWS Direct Connect e Azure ExpressRoute). Permite a estratégia de *Cloud Bursting* (atender picos de processamento na nuvem pública mantendo dados sensíveis no ambiente privado).
* **Nuvem Comunitária (*Community Cloud*):** Compartilhada por organizações que possuem metas regulatórias, de compliance ou missões conjuntas similares (ex: hospitais compartilhando dados de pesquisa médica sob normas sanitárias estritas).

---

### 5. Fundamentos da Virtualização

A virtualização é a base técnica que viabilizou a nuvem moderna. Ela atua desacoplando o software (sistema operacional e aplicativos) do hardware físico através de uma camada intermediária chamada **Hypervisor** ou VMM (*Virtual Machine Monitor*):

* **Hipervisor Tipo 1 (Bare-Metal):** É instalado diretamente sobre o hardware físico do servidor, sem a necessidade de um sistema operacional anfitrião intermediário. Apresenta o mais alto desempenho, segurança e menor latência. Exemplos de mercado: **VMware ESXi, Microsoft Hyper-V, KVM (Kernel-based Virtual Machine) e Xen**. São os hipervisores utilizados nos datacenters dos provedores de nuvem.
* **Hipervisor Tipo 2 (Hosted):** É executado como uma aplicação de software dentro de um sistema operacional existente (como Windows, Linux ou macOS). Sofre com o overhead de dois sistemas operacionais concorrentes. Exemplos: **Oracle VirtualBox, VMware Workstation**.
