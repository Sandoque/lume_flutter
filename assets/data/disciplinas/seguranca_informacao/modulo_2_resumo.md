# Módulo 2: Ameaças e Vulnerabilidades à Segurança da Informação
## Resumo Executivo & Pontos-Chave

O entendimento claro da distinção técnica entre Vulnerabilidade, Ameaça, Risco e Ataque é fundamental para a correta proteção de ativos organizacionais.

### 1. Conceitos Fundamentais
* **Vulnerabilidade:** Uma fraqueza ou falha existente em um ativo ou controle de segurança que pode ser explorada por uma ameaça (ex: software sem atualização, senha fraca, porta de servidor aberta sem firewall).
* **Ameaça:** Qualquer causa potencial de um incidente indesejado que possa causar dano a um sistema ou organização (ex: hacker malicioso, vírus, inundação, funcionário desatento).
* **Ataque:** A ação deliberada de tentar explorar ativamente uma vulnerabilidade.
* **Impacto:** A consequência danosa ou prejuízo material resultante da concretização da ameaça.

### 2. Classificação de Malwares
* **Vírus:** Código malicioso que se anexa a programas executáveis ou documentos hospedeiros legítimos e depende da ação humana para ser executado e se propagar.
* **Worm:** Código malicioso autônomo e autorreplicante que se propaga automaticamente através de vulnerabilidades na rede, consumindo largura de banda e recursos sem precisar de um programa hospedeiro nem de interação humana.
* **Cavalo de Troia (*Trojan Horse*):** Programa aparentemente inofensivo ou útil (ex: utilitário gratuito, jogo, protetor de tela) que, ao ser executado pelo usuário, executa ações maliciosas ocultas em segundo plano, como abrir portas de comunicação (*backdoors*).
* **Ransomware:** Malware que criptografa os arquivos do sistema e exige o pagamento de um resgate (geralmente em criptomoedas) para fornecer a chave de descriptografia.
* **Rootkit:** Conjunto de ferramentas avançadas que mascara sua presença e a de outros malwares nas camadas mais profundas do sistema operacional (nível de kernel).

### 3. Técnicas de Engenharia Social e Ataques Web
* **Phishing:** Tentativa fraudulenta de obter informações confidenciais (senhas, cartões) fingindo ser uma entidade confiável por e-mail ou mensagens.
* **Spear Phishing:** Ataque de phishing altamente personalizado e direcionado a um indivíduo ou departamento específico de uma empresa.
* **Negação de Serviço (DoS / DDoS):** Ataque focado em esgotar recursos de hardware, rede ou processamento de um servidor por meio de milhões de requisições coordenadas de máquinas zumbis (*botnets*), tornando o serviço indisponível para usuários legítimos.
* **SQL Injection (Injeção de SQL):** Inserção de comandos maliciosos em campos de entrada de formulários para manipular a base de dados SQL no servidor.
