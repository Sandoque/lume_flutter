# Módulo 2: Ameaças e Vulnerabilidades à Segurança de Informação
## Conteúdo Completo e Aprofundado

---

### 1. O Triângulo de Ataque: Ativo, Ameaça e Vulnerabilidade

Na literatura especializada e nas normas internacionais (ISO/IEC 27000), os conceitos de risco e incidentes gravitam em torno de três entidades fundamentais:

* **Ativo (*Asset*):** Qualquer coisa que tenha valor palpável ou estratégico para a organização e que, portanto, necessite de proteção. Exemplos: patentes, registros de clientes, código-fonte, servidores, reputação da marca e infraestrutura física.
* **Vulnerabilidade (*Vulnerability*):** Uma fragilidade, ponto fraco, brecha de segurança ou falha de projeto em um ativo ou grupo de ativos que pode ser explorada acidentalmente ou por um agente malicioso. A vulnerabilidade não causa dano por si só; ela é a porta deixada aberta.
* **Ameaça (*Threat*):** Qualquer causa potencial de um incidente prejudicial. A ameaça é o agente externo que deseja ou pode explorar a vulnerabilidade existente.

> **Exemplo Clássico:** Um servidor rodando um software web desatualizado possui uma **Vulnerabilidade**. A existência de cibercriminosos na internet capazes de criar scripts automáticos de invasão é a **Ameaça**. A tentativa de invasão efetiva é o **Ataque**. A perda financeira decorrente da parada do servidor é o **Impacto**.

---

### 2. Anatomia Detalhada dos Tipos de Malware

Os códigos maliciosos (*malicious software*) apresentam comportamentos bem diferenciados na forma como operam e se proliferam:

#### Vírus de Computador
Código que insere cópias de si mesmo em outros arquivos executáveis legítimos (.exe, .dll, macros de planilhas). Para entrar em atividade, o vírus necessita compulsoriamente que um usuário execute o arquivo hospedeiro infectado. Podem ser polimórficos (mudam sua assinatura de código a cada infecção para burlar antivírus) ou residentes em memória.

#### Worms (Vermes de Rede)
Diferenciam-se drasticamente dos vírus porque **são programas independentes e autossuficientes** que não necessitam de arquivos hospedeiros para existir nem de interação humana para disparar. Os worms exploram falhas de portas e protocolos de rede abertos (como vulnerabilidades em SMB ou RDP), escaneiam faixas inteiras de endereços IP na internet e se propagam automaticamente para outros servidores, causando lentidão severa na infraestrutura global de telecomunicações.

#### Cavalos de Troia (*Trojans*)
Inspirados no lendário cavalo de madeira da mitologia grega: apresentam-se para o usuário como um software benéfico, utilitário, jogo gratuito ou ferramenta de produtividade atraente. Ao ser baixado e instalado voluntariamente pela vítima, o trojan executa em segredo sua carga maliciosa (*payload*), instalando **Backdoors** (portas dos fundos para permitir o controle remoto por um atacante), desligando firewalls ou registrando teclas digitadas.

#### Ransomware
A principal ameaça corporativa da atualidade. Ao penetrar em uma rede empresarial, o ransomware mapeia discos locais, servidores de arquivos e compartilhamentos em rede, utilizando algoritmos criptográficos modernos de chave pública/privada (como RSA-4096 e AES-256) para codificar todos os documentos. Uma nota de resgate (*ransom note*) é deixada na tela exigindo quantias astronômicas em criptomoedas como Bitcoin ou Monero sob a ameaça de destruição perpétua da chave ou vazamento público dos dados sensíveis (*Dupla Extorsão*).

---

### 3. Técnicas de Engenharia Social e Ataques à Camada Humana

O fator humano é frequentemente considerado o elo mais vulnerável da cadeia de segurança. A Engenharia Social explora características psicológicas inerentes ao ser humano: curiosidade, medo, pressa, obediência à autoridade e desejo de ajudar.

* **Phishing Clássico:** E-mails em massa simulando comunicados oficiais de instituições bancárias, Receita Federal ou transportadoras alegando dívidas pendentes ou pacotes extraviados, induzindo a vítima a clicar em links que copiam formulários legítimos para captura de credenciais.
* **Spear Phishing:** Diferente do ataque massivo, o spear phishing pesquisa antecipadamente a vida e o organograma da vítima (frequentemente usando redes sociais como o LinkedIn) para confeccionar um e-mail ultra-personalizado.
* **Whaling (Pesca de Baleia):** Ataques de spear phishing direcionados à alta diretoria corporativa (CEOs, CFOs, Diretores Jurídicos), fingindo convocações urgentes de fusões de empresas ou processos judiciais em segredo de justiça.
* **Tailgating (Carona):** Técnica de invasão física onde o atacante aproveita a cortesia de um colaborador segurando a porta de vidro de um prédio com catraca de controle de acesso.

---

### 4. Ataques de Rede e Aplicação

* **DDoS (Distributed Denial of Service):** Em vez de tentar roubar dados, o objetivo do atacante é derrubar a disponibilidade do serviço. Utilizando redes de milhares de dispositivos invadidos (a chamada *Botnet*, composta por câmeras IP, roteadores e servidores mal configurados), o invasor dispara milhões de requisições por segundo contra o alvo, saturando os links de rede e esgotando a memória RAM do servidor web.
* **SQL Injection (SQLi):** Ocorre quando aplicações web concatenam dados fornecidos pelo usuário diretamente em comandos de banco de dados sem validação prévia. Se um campo de login receber o texto `' OR '1'='1`, a query SQL avalia como verdadeira e o atacante obtém acesso administrativo sem conhecer a senha.
