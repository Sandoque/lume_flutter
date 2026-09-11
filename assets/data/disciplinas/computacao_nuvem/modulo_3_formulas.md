# Módulo 3: Fórmulas, Normas e Matrizes de Segurança

### 1. Matriz de Responsabilidade Compartilhada por Modelo
| Camada de Segurança | On-Premises | IaaS | PaaS | SaaS |
| :--- | :---: | :---: | :---: | :---: |
| **Segurança Física do Data Center** | Cliente | Provedor | Provedor | Provedor |
| **Hardware e Redes Físicas** | Cliente | Provedor | Provedor | Provedor |
| **Camada de Virtualização / Hipervisor** | Cliente | Provedor | Provedor | Provedor |
| **Sistema Operacional do Servidor** | Cliente | **Cliente** | Provedor | Provedor |
| **Middleware e Runtime da Aplicação** | Cliente | **Cliente** | Provedor | Provedor |
| **Código e Aplicação** | Cliente | **Cliente** | **Cliente** | Provedor |
| **Identidades e Controle de Acesso** | Cliente | **Cliente** | **Cliente** | **Compartilhado** |
| **Dados e Classificação da Informação** | Cliente | **Cliente** | **Cliente** | **Cliente** |

### 2. Normas Internacionais para Nuvem
* **ISO/IEC 27017:** Código de prática com controles de segurança específicos para provedores e clientes de computação em nuvem.
* **ISO/IEC 27018:** Código de boas práticas para proteção de Informações de Identificação Pessoal (**PII**) em nuvens públicas (privacidade).
* **SOC 2 Tipo II (Service Organization Control):** Relatório de auditoria independente atestando a eficácia dos controles de segurança, disponibilidade e confidencialidade.
* **LGPD / GDPR:** Regulamentações legais que impõem soberania dos dados, direitos dos titulares e criptografia ponta a ponta.
