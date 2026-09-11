# Módulo 2: Matriz de Comparação de Ameaças e Vulnerabilidades

### 1. A Relação Fundamental de Risco

> **Risco = Ameaça × Vulnerabilidade × Impacto**

*Se não houver vulnerabilidade (sistema 100% protegido contra uma falha), o risco de exploração daquela ameaça cai para zero.*

### 2. Quadro Comparativo de Malwares
| Malware | Hospedeiro Necessário? | Execução Autônoma? | Objetivo Primário |
| :--- | :---: | :---: | :--- |
| **Vírus** | **Sim** (executável/doc) | Não (exige clique humano) | Corromper arquivos e se propagar localmente |
| **Worm** | **Não** (autônomo) | **Sim** (varredura de rede) | Propagação em massa e esgotamento de rede |
| **Trojan** | **Sim** (disfarçado) | Não (executado pela vítima) | Instalar backdoors, espiões e roubar senhas |
| **Ransomware** | Variável | Sim ou Não | Extorsão financeira por cifragem de dados |
| **Rootkit** | Não | Sim | Ocultar malwares modificando chamadas de kernel |

### 3. Taxonomia de Golpes de Engenharia Social
* **Vishing:** Engenharia social por chamadas de voz telefônica simulando bancos ou centrais de segurança.
* **Smishing:** Phishing via mensagens de texto SMS ou WhatsApp com links maliciosos.
* **Tailgating (Carona):** Invasor entra em uma área física restrita seguindo de perto um funcionário autorizado que abriu a porta com crachá.
* **Shoulder Surfing:** Espionagem visual direta por cima do ombro da vítima digitando senhas.
