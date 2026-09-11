# Módulo 4: Boas Práticas em Segurança da Informação
## Resumo Executivo & Pontos-Chave

As boas práticas em segurança compreendem o conjunto de hábitos, configurações e políticas organizacionais que reduzem drasticamente as superfícies de ataque em ambientes corporativos.

### 1. Política de Segurança da Informação (PSI)
* É a declaração formal da diretoria sobre como a organização protege seus ativos.
* Deve ser clara, aplicável a 100% dos funcionários e prestadores de serviços, e prever sanções disciplinares claras em caso de violação deliberada.

### 2. Gestão de Senhas e Identidades
* Senhas fortes exigem tamanho mínimo (12+ caracteres), mistura de maiúsculas, minúsculas, números e símbolos especiais.
* Proibição estrita do uso de dados pessoais (matrícula, data de nascimento, nome de familiares).
* Adoção mandatória de **MFA (Autenticação Multifator)** em todos os acessos remotos e contas com privilégios de administração.

### 3. Políticas de Postura Operacional
* **Política de Mesa Limpa (*Clear Desk*):** Nenhum documento confidencial, anotação com senhas em post-its ou mídias USB pode ficar exposto sobre a mesa de trabalho após o término do expediente.
* **Política de Tela Limpa (*Clear Screen*):** Bloqueio automático de tela após poucos minutos de inatividade (máximo 5 minutos) com exigência de senha para desbloqueio ao se ausentar da estação de trabalho.

### 4. Gestão de Cópias de Segurança: A Regra 3-2-1 de Backup
* Ter pelo menos **3 cópias** dos dados importantes (1 produção + 2 backups).
* Armazenadas em **2 tipos diferentes de mídia** (ex: disco local SSD/NAS e fita/nuvem).
* Manter pelo menos **1 cópia fora da empresa (*off-site*)**, preferencialmente em armazenamento de nuvem criptografado geograficamente distante.
