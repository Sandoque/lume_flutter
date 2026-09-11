# Tema 4: Camadas de Aplicação e Transporte
## Conteúdo Completo e Aprofundado

### 1. Paradigmas da Camada de Aplicação
A camada de aplicação é onde residem os protocolos que criam valor direto para os usuários finais.

#### Modelos Arquiteturais:
1. **Cliente-Servidor**:
 - Há um host sempre ativo (o servidor) que atende a requisições de muitos outros hosts (clientes).
 - O servidor possui um endereço IP estático e conhecido.
 - Ponto fraco: vulnerabilidade a sobrecarga e ponto único de falha quando o tráfego atinge picos.
2. **Peer-to-Peer (P2P)**:
 - Não depende de servidores dedicados centrais.
 - Os hosts (peers) comunicam-se de forma direta e descentralizada.
 - Vantagem: **Autoescalabilidade** (*self-scalability*) — cada nó que baixa um arquivo simultaneamente atua como servidor disponibilizando pedaços para os demais nós.

---

### 2. Protocolos Clássicos de Aplicação
- **DNS (Domain Name System)**:
 - Banco de dados hierárquico e distribuído responsável por traduzir nomes de domínio legíveis por humanos (ex: `ensine.me`) em endereços IP (ex: `198.51.100.10`).
 - Hierarquia: Servidores Raiz (Root Servers), Servidores de Domínio de Topo (TLD como `.com`, `.br`) e Servidores Autoritativos.
 - Utiliza **UDP na porta 53** para baixa latência.
- **Correio Eletrônico**:
 - **SMTP**: Protocolo baseado em texto para envio e retransmissão de mensagens entre servidores via TCP.
 - **IMAP**: Protocolo que permite ao usuário ler seus e-mails enquanto mantém mensagens e diretórios perfeitamente organizados e sincronizados no servidor.
 - **POP3**: Protocolo antigo que apenas descarrega mensagens para o cliente local e costuma excluí-las do servidor.

---

### 3. A Camada de Transporte: TCP vs. UDP
A camada de transporte implementa a comunicação lógica entre processos em execução em sistemas finais diferentes.

#### O Conceito de Portas e Sockets:
Cada processo na máquina abre um **Socket** identificado por uma tupla:
- No UDP: `(IP de Destino, Porta de Destino)`.
- No TCP: `(IP Origem, Porta Origem, IP Destino, Porta Destino)` — conexão de 4 elementos.

#### O Protocolo UDP:
- Fornece serviço de "melhor esforço" (best-effort).
- Não estabelece conexão antes do envio (0 RTT de atraso).
- Não mantém estado de conexão e possui cabeçalho de **apenas 8 bytes** (Porta Origem, Porta Destino, Comprimento, Checksum).

#### O Protocolo TCP:
- Conexão ponto a ponto confiável e full-duplex.
- **Three-Way Handshake**:
 1. Cliente envia `SYN` com número de sequência inicial x.
 2. Servidor responde com `SYN-ACK` com número de sequência y e ACK = x + 1.
 3. Cliente responde com `ACK = y + 1` e a conexão é estabelecida.
- **Controle de Fluxo**: O receptor informa ao transmissor quanto espaço livre possui em seu buffer através do campo **Receive Window (rwnd)** no cabeçalho TCP.
- **Controle de Congestionamento**: O TCP ajusta sua taxa de envio utilizando a **Janela de Congestionamento (cwnd)** com fases como *Slow Start* (crescimento exponencial da janela), *Congestion Avoidance* (crescimento aditivo) e reação rápida a perdas (*Fast Retransmit / Fast Recovery*).
