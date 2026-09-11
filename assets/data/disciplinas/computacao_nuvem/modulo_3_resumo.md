# Módulo 3: Segurança em Computação em Nuvem
## Resumo Executivo & Pontos-Chave

A segurança em nuvem baseia-se na premissa de que a nuvem pública pode ser muito mais segura que datacenters tradicionais, desde que os papéis e controles sejam estritamente compreendidos e aplicados.

### 1. Modelo de Responsabilidade Compartilhada (*Shared Responsibility Model*)
* **Segurança DA Nuvem (*Security OF the Cloud*):** Responsabilidade do **Provedor**. Envolve a segurança física dos datacenters, geradores, cabeamento, switches, servidores de hardware e o hipervisor.
* **Segurança NA Nuvem (*Security IN the Cloud*):** Responsabilidade do **Cliente**. Envolve sistemas operacionais convidados, patches, configurações de firewall virtual, gestão de identidades e acessos, criptografia e proteção de dados.

### 2. Gestão de Identidades e Acessos (IAM)
* **Princípio do Menor Privilégio (*PoLP - Principle of Least Privilege*):** Cada usuário, aplicação ou processo deve ter apenas os privilégios estritamente necessários para executar sua tarefa.
* **Autenticação Multifator (*MFA*):** Exigência inegociável para contas administrativas e usuários de console.
* **Identidades para Máquinas (*Roles / Service Accounts*):** Evita salvar chaves secretas ou senhas dentro do código-fonte; instâncias recebem credenciais temporárias renovadas automaticamente.

### 3. Criptografia em Três Estados
* **Dados em Repouso (*At Rest*):** Criptografia de discos rígidos, snapshots e bancos de dados (AES-256) gerenciada por serviços de cofre de chaves (AWS KMS, Azure Key Vault, Google Cloud KMS).
* **Dados em Trânsito (*In Transit*):** Proteção de fluxos de dados em movimento pela internet ou entre VPCs usando TLS 1.3 / HTTPS e túneis IPsec.
* **Dados em Uso (*In Use*):** Computação confidencial com enclaves de hardware criptografados (AMD SEV, Intel SGX).

### 4. Defesa em Profundidade na Rede
* **VPC / VNet:** Isolamento lógico completo na camada 3 e 4.
* **Sub-redes Públicas vs Privadas:** Bancos de dados e backends nunca recebem endereços IP públicos e ficam em subnets privadas sem rota para internet.
* **Grupos de Segurança (*Security Groups*):** Firewalls virtuais baseados em estado (*stateful*).
* **WAF (Web Application Firewall):** Proteção na camada 7 contra injeção de SQL, Cross-Site Scripting (XSS) e bots maliciosos.
