# Tema 3: Fórmulas & Regras de Ouro
### Fichamento de Modelos Arquiteturais

#### 1. Tabela Comparativa OSI vs. TCP/IP
| Camada OSI | Camada TCP/IP | PDU Principal | Exemplos de Protocolos |
|---|---|---|---|
| 7. Aplicação | Aplicação | Mensagem | HTTP, HTTPS, DNS, SMTP, IMAP, SSH |
| 6. Apresentação | Aplicação | Dados | TLS/SSL, ASCII, JSON, JPEG |
| 5. Sessão | Aplicação | Dados | RPC, NetBIOS, SIP |
| 4. Transporte | Transporte | Segmento / Datagrama | TCP, UDP, SCTP, QUIC |
| 3. Rede | Internet | Datagrama / Pacote | IPv4, IPv6, ICMP, ARP, OSPF, BGP |
| 2. Enlace | Acesso à Rede | Quadro (Frame) | Ethernet (802.3), Wi-Fi (802.11), PPP |
| 1. Física | Acesso à Rede | Bits | 1000BASE-T, V.90, DSL, NRZ, Manchester |

#### 2. Regras de Ouro da Arquitetura
- **Serviço é vertical**: Camada N serve à camada N+1.
- **Protocolo é horizontal**: Entidade na máquina A dialoga com entidade na máquina B na MESMA camada.
- **Cintura Fina (Narrow Waist)**: O IP é o ponto comum indispensável; tudo funciona sobre IP e IP funciona sobre tudo.
