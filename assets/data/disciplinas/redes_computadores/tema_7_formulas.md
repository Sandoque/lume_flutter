# Tema 7: Fórmulas & Regras de Ouro
### Fichamento de Segurança e Gerenciamento

#### 1. A Tríade CIA
- **C**onfidencialidade ⇒ Criptografia (AES, RSA, TLS).
- **I**ntegridade ⇒ Hashes e Assinaturas (SHA-256, HMAC).
- **A**utenticidade / Disponibilidade ⇒ Redundância e Proteção contra DoS.

#### 2. Classificação de Ataques
- **Passivo**: Apenas espiona (Sniffing, Traffic Analysis). **Não altera o tráfego**.
- **Ativo**: Altera dados ou interrompe o serviço (Spoofing, Replay, DoS, Ransomware).

#### 3. Componentes da Arquitetura SNMP
- **NMS**: Estação do Gerente (solicita dados).
- **Agente**: Roda no roteador/switch (coleta dados).
- **MIB**: Base de dados de variáveis (identificadas por OIDs).
- **Trap**: Mensagem espontânea enviada do Agente → Gerente na porta 162 UDP.
- **Portas SNMP**:
 - Porta **161 UDP**: Consultas normais (Get/Set).
 - Porta **162 UDP**: Notificações de alarme (Traps).
