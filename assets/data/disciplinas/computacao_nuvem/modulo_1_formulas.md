# Módulo 1: Fórmulas, Métricas e Regras-Chave

### 1. Economia de Custos e Métricas Financeiras
* **TCO (Total Cost of Ownership - Custo Total de Propriedade):**
 
> **TCO = Aquisição Hardware + Licenciamento + Manutenção/Energia + Mão de Obra Especializada + Downtime**

* **ROI (Retorno sobre o Investimento):**
 
> **ROI = (Ganho com a Migração - Custo de Migração) / (Custo de Migração) × 100%**

* **Transição Financeira:**
 
> **Modelo Tradicional (CapEx Fixo) → Modelo Nuvem (OpEx Variável / Pay-as-you-go)**


### 2. Matriz de Hipervisores (Virtualização)
| Tipo | Nome | Execução | Exemplos | Desempenho |
| :--- | :--- | :--- | :--- | :--- |
| **Tipo 1** | *Bare-metal* | Diretamente sobre o hardware físico | VMware ESXi, Microsoft Hyper-V, KVM, Xen | Máxima eficiência, baixa latência |
| **Tipo 2** | *Hosted* | Sobre um Sistema Operacional hospedeiro | VirtualBox, VMware Workstation | Ideal para testes e desenvolvimento pessoal |

### 3. Comparativo de Responsabilidade (IaaS vs PaaS vs SaaS)
* **SaaS:** Provedor cuida de 100% da pilha (Rede, Armazenamento, Servidores, Virtualização, SO, Middleware, Runtime, Dados, Aplicação).
* **PaaS:** Cliente gerencia **Aplicações** e **Dados**; Provedor cuida do Runtime para baixo.
* **IaaS:** Cliente gerencia **Aplicações, Dados, Runtime, Middleware e Sistema Operacional**; Provedor cuida de Virtualização, Servidores, Armazenamento e Redes.
