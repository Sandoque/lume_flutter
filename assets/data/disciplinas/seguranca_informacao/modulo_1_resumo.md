# Módulo 1: Princípios da Segurança e Ciclo de Vida da Informação
## Resumo Executivo & Pontos-Chave

A Segurança da Informação visa preservar os valores e ativos tangíveis e intangíveis que possuem valor para um indivíduo ou corporação, aplicando controles organizacionais, humanos, físicos e lógicos.

### 1. Pilares Básicos da Segurança (Tríade CID)
* **Confidencialidade:** Garantia de que a informação não será disponibilizada nem revelada a indivíduos, entidades ou processos não autorizados (proteção contra acesso indevido).
* **Integridade:** Salvaguarda da exatidão, completeza e integridade das informações e dos métodos de processamento (proteção contra alteração não autorizada).
* **Disponibilidade:** Propriedade de estar acessível e utilizável sob demanda por uma entidade ou processo autorizado.
* **Pilares Complementares:Autenticidade** (garantia de veracidade da autoria), **Não-repúdio / Irretratabilidade** (impossibilidade de negar a autoria de uma transação) e **Conformidade** (aderência a leis e normas regulatórias).

### 2. O Ciclo de Vida da Informação
1. **Criação / Geração:** Momento em que o dado nasce; classificação preliminar de confidencialidade.
2. **Armazenamento:** Gravação segura em mídias físicas ou digitais com controles de redundância e criptografia em repouso.
3. **Manuseio / Uso:** Processamento e modificação do dado pelos sistemas autorizados.
4. **Compartilhamento / Transmissão:** Envio seguro pela rede com criptografia em trânsito (TLS).
5. **Descarte / Destruição Segura:** Eliminação definitiva através de sanitização lógica (*wiping*), desmagnetização (*degaussing*) ou destruição física mecânica (trituração).

### 3. Mecanismos de Controle de Acesso
* **Identificação:** O usuário alega quem é (ex: digita o nome de usuário).
* **Autenticação:** O sistema valida a identidade com base em 3 fatores: algo que você sabe (senha), algo que você tem (token/smartcard) ou algo que você é (biometria).
* **Autorização:** Determina quais ações o usuário autenticado tem permissão para realizar.
* **Auditoria (*Accountability*):** Registro imutável de logs para rastreabilidade de quem fez o que e quando.
