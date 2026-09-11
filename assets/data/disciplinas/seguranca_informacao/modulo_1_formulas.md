# Módulo 1: Fórmulas, Fatores e Modelos de Controle de Acesso

### 1. Fatores de Autenticação (MFA)
* **Fator 1 - O que você sabe:** Senhas, PINs, perguntas de segurança.
* **Fator 2 - O que você tem:** Tokens OTP, cartões inteligentes, smartphones com aplicativo autenticador.
* **Fator 3 - O que você é:** Biometria (impressão digital, reconhecimento facial, leitura de íris, voz).

> **MFA Autêntico ≥ Combinação de pelo menos 2 fatores de categorias DIFERENTES**


### 2. Modelos Formais de Controle de Acesso
* **DAC (Discretionary Access Control):** O proprietário do arquivo decide discricionariamente quem pode acessá-lo.
* **MAC (Mandatory Access Control):** O sistema impõe rótulos de sensibilidade estritos (Top Secret, Secret, Confidencial) baseados em regras centrais inegociáveis.
* **RBAC (Role-Based Access Control):** As permissões são vinculadas a funções/cargos corporativos (ex: 'Médico', 'Enfermeiro', 'Recepcionista').
* **ABAC (Attribute-Based Access Control):** Permissões avaliadas dinamicamente com base em atributos do usuário, do recurso e do ambiente (ex: localização, horário).

### 3. Técnicas de Sanitização e Descarte Seguro
* **Limpeza Lógica (*Clear/Overwriting*):** Sobrescrever setores do disco com zeros e dados aleatórios (ex: padrão DoD 5220.22-M).
* **Desmagnetização (*Degaussing*):** Exposição a campo magnético de alta intensidade (inutiliza discos magnéticos e fitas).
* **Destruição Física (*Destruction*):** Trituração, perfuração mecânica ou incineração.
