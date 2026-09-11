# Tema 4: Camadas de Aplicação e Transporte
### ⚡ Resumo Rápido (Revisão em 4 minutos)

- **Arquiteturas de Aplicação**:
 - **Cliente-Servidor**: Servidor central com IP fixo sempre ligado; clientes requisitam serviços. Risco de gargalo.
 - **P2P (Peer-to-Peer)**: Pares se comunicam diretamente sem servidor central. Autoescalabilidade (novos nós agregam capacidade de upload).
- **Protocolos Chave da Aplicação**:
 - **HTTP/HTTPS (Portas 80/443)**: Modelo requisição/resposta web.
 - **DNS (Porta 53 UDP)**: Tradução distribuída de nomes em IPs.
 - **SMTP (Porta 25/587 TCP)**: Envio e retransmissão de e-mails (*push*).
 - **IMAP (Porta 143/993 TCP)**: Acesso e leitura de e-mails mantendo sincronização de pastas no servidor.
- **Camada de Transporte**: Comunicação lógica entre **processos** (enquanto a camada de rede conecta **hosts**).
- **Multiplexação**: Usar números de portas (16 bits, 0 a 65535) para direcionar os dados ao socket correto.
- **TCP (Transmission Control Protocol)**:
 - Orientado à conexão: *Three-Way Handshake* (SYN -> SYN-ACK -> ACK).
 - Confiabilidade: ACKs cumulativos (ACK é o próximo byte esperado) e temporizador de retransmissão.
 - Controle de Fluxo: Protege o buffer do receptor (rwnd).
 - Controle de Congestionamento: Protege os roteadores da rede (cwnd).
- **UDP (User Datagram Protocol)**:
 - Sem conexão, sem handshake, sem garantias de ordem ou entrega.
 - Cabeçalho levíssimo de apenas 8 bytes. Ideal para streaming, jogos e DNS.
