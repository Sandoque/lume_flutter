# Módulo 6: Fórmulas e Arquitetura do Google Cloud Platform

### 1. Diferencial Arquitetural: VPC Global do GCP

> **Google VPC (Global) ⊃ * Subnet São Paulo : (10.1.0.0/24) * Subnet Iowa (EUA) : (10.2.0.0/24) * Subnet Frankfurt : (10.3.0.0/24)**

*Todas comunicam-se via fibra privada do Google sem necessidade de VPN ou roteadores adicionais.*

### 2. Classes de Acesso do Google Cloud Storage
| Classe | Tempo Mínimo de Retenção | Caso de Uso Primário |
| :--- | :--- | :--- |
| **Standard** | Sem tempo mínimo | Dados ativos, sites, streaming, APIs |
| **Nearline** | Mínimo 30 dias | Backups mensais, documentos lidos 1x/mês |
| **Coldline** | Mínimo 90 dias | Recuperação de desastres, dados de auditoria trimestral |
| **Archive** | Mínimo 365 dias | Arquivamento histórico e conformidade regulatória |

### 3. Hierarquia de Recursos do GCP
```
[ Organização (Domínio corporativo / Google Workspace) ]
 |
 [ Pastas (Folders) ]
 |
 [ Projetos (Projects) ] <-- Unidade de Cobrança e IAM
 |
 [ Recursos (VMs, Buckets, GKE, BigQuery) ]
```
