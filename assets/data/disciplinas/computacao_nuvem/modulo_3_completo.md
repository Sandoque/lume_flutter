# Módulo 3: Segurança em Computação em Nuvem
## Conteúdo Completo e Aprofundado

---

### 1. O Modelo de Responsabilidade Compartilhada

Ao migrar para a nuvem, a segurança passa a ser uma parceria entre o cliente e o provedor. Compreender a fronteira exata de onde termina a obrigação do provedor e onde começa a responsabilidade da organização é o requisito mais fundamental para evitar vazamentos de dados:

* **No modelo tradicional (*On-Premises*):** A empresa é 100% responsável por tudo: controle de acesso físico aos prédios, combate a incêndio nos racks, troca de discos danificados, cabos de rede, hipervisores, patches de sistema operacional, firewall e criptografia.
* **No modelo IaaS (ex: VMs no Azure ou EC2 na AWS):** O provedor assume a segurança física dos datacenters, fontes de energia, servidores físicos e a integridade do hipervisor. O **cliente** é estritamente responsável por:
 * Escolher, instalar e manter atualizado o Sistema Operacional com patches de segurança contra vulnerabilidades conhecidas (CVEs);
 * Configurar corretamente os firewalls lógicos de entrada e saída (*Security Groups*);
 * Gerenciar as contas de usuário e senhas locais dos servidores;
 * Criptografar os discos de dados anexados.
* **No modelo PaaS (ex: Azure App Service ou AWS Elastic Beanstalk):** O provedor absorve também a atualização do sistema operacional, manutenção do runtime (Java, .NET, Node.js, Python) e a alta disponibilidade. O cliente é responsável por validar o código-fonte de suas aplicações contra falhas como injeção de SQL e configurar as permissões de acesso aos dados.
* **No modelo SaaS (ex: Microsoft 365 ou Salesforce):** O provedor gerencia praticamente toda a pilha tecnológica. O cliente é responsável unicamente pela **governança dos dados**, correta **classificação das informações** e **gestão dos usuários e credenciais de acesso** que possuem autorização para entrar no sistema.

> **Regra de Ouro da Nuvem:** Em qualquer modelo (IaaS, PaaS ou SaaS), os **Dados** e o **Controle de Acesso às Contas** são sempre de responsabilidade do cliente!

---

### 2. Gestão de Identidade e Acesso (*IAM - Identity & Access Management*)

Na infraestrutura em nuvem, a identidade é o novo perímetro de segurança (substituindo o antigo conceito de perímetro físico de rede).

* **Princípio do Menor Privilégio (*PoLP*):** Nenhum usuário ou aplicação deve ter privilégios além daqueles estritamente necessários para executar seu trabalho. Não se devem utilizar credenciais com privilégios de Administrador Geral (*Root/Global Admin*) para operações rotineiras.
* **Autenticação Multifator (*MFA*):** Exige pelo menos dois fatores de autenticação:
 1. Algo que você sabe (senha, PIN);
 2. Algo que você tem (aplicativo autenticador como Google Authenticator, token de hardware FIDO2);
 3. Algo que você é (biometria facial ou digital).
* **Papéis Temporários para Serviços (*Roles / Service Accounts*):** Máquinas virtuais, contêineres e funções serverless nunca devem ter credenciais de acesso fixas gravadas em código-fonte ou arquivos de configuração. Utilizam-se papéis gerenciados que injetam chaves de sessão temporárias com rotação automática de curto prazo.

---

### 3. Criptografia de Dados

A proteção de ativos digitais na nuvem opera em camadas:
* **Criptografia em Repouso (*At Rest*):** Os dados armazenados em discos de estado sólido (SSDs), discos magnéticos, buckets de objetos e bancos de dados são codificados utilizando o algoritmo padrão **AES-256**. O gerenciamento das chaves criptográficas pode ser feito pelo provedor (*Server-Side Encryption with Provider Keys*) ou com chaves de custódia total do cliente via serviços de cofre com hardware dedicado (**Cloud HSM - Hardware Security Module**).
* **Criptografia em Trânsito (*In Transit*):** Todo tráfego trafegando pela internet aberta ou entre regiões de nuvem é encapsulado por túneis seguros utilizando **TLS 1.3** ou túneis de **IPsec VPN**.
* **Criptografia em Uso (*In Use / Confidential Computing*):** Tecnologias avançadas de isolamento de hardware (como processadores com suporte a enclaves seguros AMD SEV ou Intel SGX) mantêm os dados criptografados mesmo enquanto estão sendo processados na memória RAM física do servidor.

---

### 4. Arquitetura de Rede Segura e Firewalls

* **Isolamento de Nuvem Privada Virtual (VPC / VNet):** Criação de uma rede privada logicamente isolada de todos os outros clientes do provedor na nuvem.
* **Segmentação em Sub-redes:**
 * **Sub-redes Públicas:** Contêm apenas recursos que necessitam estritamente de exposição à internet pública, como balanceadores de carga (*Load Balancers*) e gateways de aplicação.
 * **Sub-redes Privadas:** Onde residem servidores de aplicação, microsserviços e bancos de dados corporativos. Não possuem endereço IP público e não aceitam conexões diretas da internet.
* **Firewalls de Camada de Rede (*Security Groups* vs *NACLs*):**
 * *Security Groups (Stateful):* Se você autorizar a entrada de tráfego na porta 443 (HTTPS), a resposta de saída daquela requisição é automaticamente permitida, independentemente das regras de saída configuradas.
 * *Network ACLs (Stateless):* Avaliam pacotes individualmente; regras de entrada e regras de saída devem ser expressamente criadas em ambas as direções.
* **Web Application Firewall (WAF):** Inspeciona o tráfego HTTP/HTTPS na camada 7 do modelo OSI, bloqueando ativamente ataques comuns da lista **OWASP Top 10**, tais como *SQL Injection*, *Cross-Site Scripting (XSS)*, invasões por bots e requisições maliciosas com cabeçalhos corrompidos.
