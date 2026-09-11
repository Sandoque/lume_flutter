# Módulo 1: Princípios da Segurança e o Ciclo de Vida da Informação
## Conteúdo Completo e Aprofundado

---

### 1. Definição e Âmbito da Segurança da Informação

A Segurança da Informação (SI) consiste na preservação da confidencialidade, integridade e disponibilidade das informações; adicionalmente, outras propriedades, tais como autenticidade, responsabilização, não repúdio e confiabilidade, podem também estar envolvidas (NBR ISO/IEC 27001).

A informação constitui um dos ativos mais críticos e estratégicos de qualquer organização contemporânea, quer esteja sob formato impresso em papel, gravada eletronicamente em bancos de dados, trafegando por redes de computadores ou transmitida verbalmente em reuniões corporativas.

---

### 2. Os Pilares Clássicos e Contemporâneos da Segurança

```
 [ SEGURANÇA DA INFORMAÇÃO ]
 |
 +--------------------+--------------------+
 | | |
[ CONFIDENCIALIDADE ] [ INTEGRIDADE ] [ DISPONIBILIDADE ]
 | | |
[ AUTENTICIDADE ] [ NÃO-REPÚDIO ] [ CONFORMIDADE ]
```

#### A. A Tríade CID
1. **Confidencialidade:** Assegura que a informação seja acessada apenas por indivíduos, entidades e processos expressamente autorizados. A quebra de confidencialidade ocorre em vazamentos de senhas, espionagem industrial ou roubo de banco de dados por atacantes.
2. **Integridade:** Salvaguarda a exatidão, consistência e totalidade da informação e dos seus métodos de processamento ao longo de todo o tempo. A quebra de integridade envolve alteração não autorizada de dados (ex: alteração de valores de boletos bancários ou injeção de registros fraudulentos em cadastros).
3. **Disponibilidade:** Garante que os usuários legítimos tenham acesso contínuo e tempestivo aos recursos e dados sempre que demandado pelo negócio. Ataques de Negação de Serviço (DoS) e falhas de energia em data centers atacam diretamente a disponibilidade.

#### B. Propriedades Complementares
* **Autenticidade:** Certeza e comprovação inequívoca da identidade de quem gerou ou enviou a mensagem (ex: assinatura digital).
* **Não-Repúdio (Irretratabilidade):** Princípio que impede que o autor de uma ação digital afirme com sucesso que não realizou a transação (garantido por criptografia assimétrica e logs auditáveis).
* **Conformidade / Legalidade:** Alinhamento estrito dos sistemas às legislações vigentes, tais como a Lei Geral de Proteção de Dados Pessoais (LGPD - Lei nº 13.709/2018).

---

### 3. As Fases do Ciclo de Vida da Informação

Qualquer dado organizacional atravessa cinco fases fundamentais, exigindo salvaguardas sob medida em cada etapa:

1. **Criação / Coleta:** Geração original do dado ou recebimento de fontes externas. Exige imediata rotulagem de sensibilidade (Pública, Interna, Confidencial, Secreta).
2. **Armazenamento:** Repouso do dado em bancos relacionais, repositórios em nuvem ou arquivos físicos. Exige criptografia em repouso (AES-256), segmentação de redes e rotinas automatizadas de backup.
3. **Manuseio / Processamento:** Modificação e cálculo por aplicações em memória e estações de trabalho. Exige privilégio mínimo de acesso e prevenção de extração indevida (DLP - Data Loss Prevention).
4. **Compartilhamento / Transmissão:** Envio do dado internamente ou para parceiros externos. Exige proteção criptográfica em trânsito com protocolos robustos como TLS 1.3.
5. **Descarte / Destruição:** Fim do ciclo de vida útil ou expiração do prazo de retenção legal. O descarte negligente de discos rígidos em lixões ou venda de servidores usados sem sanitização é uma das maiores causas históricas de vazamentos em massa. Métodos aceitos incluem:
 * *Sanitização de software:* Sobrescrita múltipla de setores com padrões criptográficos;
 * *Degaussing (Desmagnetização):* Destruição de domínios magnéticos de fitas e discos por meio de pulsos magnéticos intensos;
 * *Destruição mecânica:* Trituração em fragmentos milimétricos.

---

### 4. Arquitetura de Controle de Acesso

O controle de acesso atua como o porteiro digital de sistemas corporativos, operando em quatro camadas sequenciais:

1. **Identificação:** Fase onde o usuário apresenta sua alegação de identidade (ex: `joao.silva@empresa.com`).
2. **Autenticação:** Validação probatória da identidade declarada através dos 3 fatores clássicos:
 * *Algo que você sabe:* Senhas complexas, passphrases;
 * *Algo que você tem:* Tokens de autenticação móvel, crachás RFID, chaves FIDO2 USB;
 * *Algo que você é:* Características biométricas estáticas (digital, íris) ou dinâmicas (reconhecimento de voz, dinâmica de digitação).
3. **Autorização:** Verificação dos direitos associados ao usuário autenticado para leitura, escrita, execução ou exclusão de um recurso.
4. **Auditoria (*Accountability*):** Registro indelével de todas as ações em logs protegidos contra modificação, possibilitando investigações forenses detalhadas.
