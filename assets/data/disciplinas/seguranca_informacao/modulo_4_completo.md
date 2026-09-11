# Módulo 4: Boas Práticas em Segurança da Informação
## Conteúdo Completo e Aprofundado

---

### 1. A Política de Segurança da Informação (PSI)

A base de qualquer programa de segurança reside na elaboração de uma **Política de Segurança da Informação (PSI)** bem estruturada. A PSI não deve ser encarada como um manual técnico incompreensível para especialistas, mas sim como um documento normativo acessível que delineia os deveres e direitos de todos os membros da comunidade corporativa:

* **Patrocínio da Alta Direção:** Uma política que não tenha o aval expresso e assinado do Presidente e da Diretoria Executiva torna-se inócua. O apoio institucional garante recursos e legitimidade para aplicação de medidas disciplinares.
* **Abrangência Universal:** Aplica-se compulsoriamente a funcionários de todos os níveis hierárquicos, diretores, prestadores de serviços terceirizados, consultores e estagiários.
* **Cláusulas de Uso Aceitável:** Define as regras de uso de internet, correio eletrônico corporativo, instalação de softwares e dispositivos pessoais no ambiente de trabalho (*BYOD - Bring Your Own Device*).

---

### 2. Boas Práticas em Recursos Humanos e Conscientização

As falhas mais catastróficas de cibersegurança acontecem quase sempre através de erros de operadores e não por falhas puramente matemáticas em algoritmos criptográficos:

* **Antes da Admissão:** Checagem criteriosa de referências e qualificação profissional de candidatos, especialmente para funções que manusearão bases financeiras ou de clientes. Assinatura imediata de Acordo de Confidencialidade (*NDA - Non-Disclosure Agreement*).
* **Durante o Vínculo Empregatício:** Campanhas contínuas e obrigatórias de conscientização. Testes simulados de phishing periódicos enviados pela equipe de segurança para identificar colaboradores vulneráveis e direcioná-los para treinamentos adicionais sem caráter punitivo inicial.
* **No Desligamento:** No exato instante em que o colaborador é comunicado da rescisão contratual, o departamento de TI deve executar o procedimento de desativação imediata de suas contas de rede, e-mail, VPN corporativa e revogar tokens de acesso à nuvem, além de recolher imediatamente laptops, crachás e smartphones funcionais.

---

### 3. Controles Operacionais de Senhas e Postura de Trabalho

#### Recomendações de Gestão de Senhas
* **Complexidade e Comprimento:** O tamanho da senha é o fator mais determinante contra ataques de força bruta modernos executados por placas de vídeo (GPUs). Senhas devem conter no mínimo 12 a 16 caracteres, combinando caixas alta e baixa, dígitos numéricos e caracteres especiais.
* **Proibição de Dados Óbvios:** Sistemas corporativos devem barrar ativamente palavras contidas em dicionários e sequências numéricas óbvias (como número de matrícula, CPF, telefone ou datas de aniversário).
* **Autenticação em Duas Etapas (2FA/MFA):** Torna um vazamento acidental de senha inofensivo para o atacante, pois a invasão exigirá o acesso físico ao dispositivo gerador de código OTP do usuário.

#### Política de Mesa Limpa e Tela Limpa (*Clear Desk and Clear Screen*)
* **Mesa Limpa:** Proíbe deixar documentos sensíveis em impressoras compartilhadas, mesas de reunião ou sobre as bancadas ao sair para o almoço ou ao fim da jornada de trabalho. Mídias removíveis (pendrives, HDs externos) devem ser trancadas em gaveteiros com chave.
* **Tela Limpa:** As estações de trabalho devem ter descanso de tela configurado para bloquear automaticamente com no máximo 3 a 5 minutos de ociosidade, exigindo a redigitação da senha para retomar a sessão.

---

### 4. Criptografia Aplicada e Certificados Digitais

Para proteger a confidencialidade e a integridade de ativos digitais, utilizam-se três tecnologias criptográficas consagradas:
* **Criptografia Simétrica:** Utiliza a mesma chave secreta tanto para embaralhar quanto para desembaralhar a mensagem. Destaca-se pela altíssima velocidade computacional, sendo o padrão ouro para criptografar terabytes de bancos de dados e discos rígidos com **AES-256**.
* **Criptografia Assimétrica:** Utiliza um par de chaves matematicamente correlacionadas: uma **chave pública** (que pode ser divulgada abertamente para qualquer pessoa no mundo) e uma **chave privada** (que deve ser mantida em segredo absoluto pelo seu titular). Se uma informação for criptografada com a chave pública, somente o detentor da respectiva chave privada conseguirá decifrá-la.
* **Certificado Digital:** Um documento eletrônico assinado por uma Autoridade Certificadora (AC) confiável que vincula a chave pública de uma entidade à sua identidade real no mundo físico. Contém: nome do titular, CNPJ/CPF, número de série único, validade, dados da Autoridade Emissora e a chave pública do titular.
