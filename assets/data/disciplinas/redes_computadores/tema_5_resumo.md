# Tema 5: Camada de Rede
### ⚡ Resumo Rápido (Revisão em 4 minutos)

- **Duas Funções Centrais**:
 - **Repasse (Forwarding / Plano de Dados)**: Ação local rápida no roteador de mover o pacote da porta de entrada para a saída correta.
 - **Roteamento (Routing / Plano de Controle)**: Processo global que calcula o caminho de ponta a ponta que os pacotes devem seguir (Dijkstra, Bellman-Ford).
- **Modelo de Datagrama da Internet**: Sem conexão na camada de rede; cada datagrama carrega o endereço IP de destino completo e pode percorrer rotas distintas.
- **Endereçamento IPv4 e CIDR**:
 - 32 bits divididos em 4 octetos.
 - Notação CIDR: `IP/x`, onde x bits representam a rede e 32 - x representam os hosts.
 - Total de hosts utilizáveis: 2^{32 - x} - 2.
- **NAT (Network Address Translation)**: Mapeia vários IPs privados locais em um único IP público válido para poupar endereços IPv4.
- **Protocolos de Suporte**:
 - **DHCP (DORA)**: Configuração automática de IPs via Discover, Offer, Request, ACK.
 - **ICMP**: Mensagens de erro e diagnóstico de rede (base do `ping` e `traceroute`).
- **Algoritmos de Roteamento**:
 - **Link-State (OSPF)**: Conhece o mapa global e usa Dijkstra.
 - **Distance-Vector (RIP)**: Troca vetores com vizinhos diretos e usa Bellman-Ford (máximo 15 saltos).
 - **BGP (Border Gateway Protocol)**: Roteamento interdomínio padrão entre Sistemas Autônomos (AS) da Internet global.
