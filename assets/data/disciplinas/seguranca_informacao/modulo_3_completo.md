# Módulo 3: Normas de Segurança da Informação (ISO/IEC 27000)
## Conteúdo Completo e Aprofundado

---

### 1. A Família de Normas ISO/IEC 27000

Para evitar que a segurança da informação seja tratada de forma caótica, pontual ou improvisada, a *International Organization for Standardization* (ISO) e a *International Electrotechnical Commission* (IEC) desenvolveram o conjunto de padrões normativos da série 27000, projetado para harmonizar as práticas mundiais de cibersegurança.

A espinha dorsal dessa família apoia-se em duas normas com propósitos distintos e complementares:

#### ISO/IEC 27001: O Sistema de Gestão (SGSI)
É a norma que especifica os **requisitos formais** para estabelecer, implementar, manter e melhorar continuamente um Sistema de Gestão da Segurança da Informação (SGSI).
* **É a única norma da série auditável e certificável:** As empresas contratam entidades certificadoras independentes credenciadas (como BSI, Bureau Veritas, DNV) para auditar seus sistemas e receber o selo internacional de certificação ISO 27001.
* Exige forte engajamento da Alta Liderança corporativa, alocação de orçamento formal e foco em melhoria contínua orientada a processos.

#### ISO/IEC 27002: O Código de Prática de Controles
Enquanto a 27001 foca no processo de gestão executiva, a 27002 atua como um **guia prático de engenharia de segurança**. Ela detalha como planejar e implementar controles técnicos, administrativos e operacionais. Ela não gera certificados isolados; funciona como o catálogo de melhores práticas que alimenta o Anexo A da ISO 27001.

---

### 2. A Evolução da ISO/IEC 27002:2022

A atualização recente da norma ISO/IEC 27002 revolucionou a organização dos controles para refletir a era da nuvem, teletrabalho e ameaças cibernéticas sofisticadas:
* Os antigos 114 controles da versão de 2013 foram consolidados e reorganizados em **93 controles modernos**.
* Foram eliminadas as 14 seções antigas e adotados **4 temas centrais**:
 1. **Controles Organizacionais (37 controles):** Tratam de políticas corporativas, papéis e responsabilidades, segregação de funções, gestão de ativos de informação, segurança no relacionamento com fornecedores e terceiros, e resposta a incidentes.
 2. **Controles de Pessoas (8 controles):** Abrangem todo o ciclo de vida do colaborador na empresa: seleção prévia com checagem de referências, termos de confidencialidade (NDA), programa contínuo de conscientização e treinamento contra fraudes, e procedimentos de revogação imediata de acessos na rescisão contratual.
 3. **Controles Físicos (14 controles):** Englobam barreiras físicas perimetrais, cartões de acesso a data centers, proteção contra desastres ambientais, segurança de cabos de rede e política de mesa limpa e tela limpa.
 4. **Controles Tecnológicos (34 controles):** Focam em gestão de privilégios de acesso, proteção contra códigos maliciosos, mascaramento de dados, prevenção contra vazamento de dados (DLP), criptografia e monitoramento de logs.

---

### 3. A Declaração de Aplicabilidade (*Statement of Applicability - SoA*)

A Declaração de Aplicabilidade é um dos documentos fundamentais mais exigidos pelos auditores externos durante o processo de certificação:
* Não existe obrigatoriedade de aplicar os 93 controles indistintamente em todas as empresas. Uma empresa de software em nuvem pode não possuir estoques físicos de mercadorias, por exemplo.
* Na SoA, a organização deve listar explicitamente todos os controles, declarando se cada um foi **incluído** ou **excluído**.
* Para cada controle incluído, deve justificar o motivo com base no apetite ao risco da empresa; para cada controle excluído, deve justificar tecnicamente o porquê de sua não aplicabilidade.

---

### 4. O Processo Formal de Auditoria de Segurança

Uma auditoria externa para concessão do certificado ISO 27001 segue um fluxo rigoroso:
1. **Fase 1 (Revisão da Documentação):** O auditor avalia se a documentação da empresa (Política de SI, Matriz de Riscos, SoA e Procedimentos Operacionais) cumpre formalmente todas as cláusulas do padrão ISO 27001.
2. **Fase 2 (Auditoria Presencial / Operacional):** O auditor visita os escritórios e datacenters, entrevista colaboradores de diversos setores (do operacional à diretoria), analisa logs de servidores e verifica se o que está escrito nos manuais é estritamente cumprido na prática cotidiana.
3. **Emissão de Relatório:** Identifica pontos fortes, oportunidades de melhoria e eventuais **Não Conformidades** (Maiores ou Menores). A certificação só é concedida após a correção e evidência de tratamento das não conformidades identificadas.
