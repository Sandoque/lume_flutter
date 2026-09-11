# Tema 4: Fórmulas & Regras de Ouro
### Fichamento de Transporte e Protocolos

#### 1. Estrutura do Cabeçalho TCP (20 bytes padrão)
- Portas de Origem e Destino (16 bits cada).
- Número de Sequência (32 bits) — número do primeiro byte transportado.
- Número de Confirmação ACK (32 bits) — **sempre o número do próximo byte esperado**.
- Flags de Controle: `SYN`, `ACK`, `FIN`, `RST`, `PSH`, `URG`.
- Janela de Recepção rwnd (16 bits) — controle de fluxo do receptor.

#### 2. Estrutura do Cabeçalho UDP (8 bytes total)
```
 0 7 8 15 16 23 24 31
+--------+--------+--------+--------+
| Porta Origem | Porta Destino |
+--------+--------+--------+--------+
| Comprimento | Checksum |
+--------+--------+--------+--------+
```

#### 3. Cálculo da Taxa de Envio no TCP

> **Taxa Efetiva ≈ (\min(cwnd, rwnd)) / (RTT)**


#### 4. Tabela de Portas Mais Cobradas em Provas
- Porta **20/21**: FTP (Dados / Controle)
- Porta **22**: SSH (Secure Shell)
- Porta **25 / 587**: SMTP (E-mail envio)
- Porta **53**: DNS (UDP/TCP)
- Porta **67 / 68**: DHCP (Servidor / Cliente)
- Porta **80**: HTTP
- Porta **110**: POP3
- Porta **143**: IMAP
- Porta **443**: HTTPS
