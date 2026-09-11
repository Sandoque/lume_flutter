# Tema 5: Camada de Rede
## Conteúdo Completo e Aprofundado

### 1. O Papel da Camada de Rede
A camada de rede é responsável pelo transporte de pacotes desde o host emissor até o host receptor através de múltiplos enlaces e roteadores intermediários.

#### Diferença Crucial:
- **Repasse (Forwarding)**: Quando um pacote chega ao enlace de entrada de um roteador, este deve transferi-lo para o enlace de saída apropriado com base na sua **Tabela de Repasse**. É uma operação executada em nanossegundos no hardware (plano de dados).
- **Roteamento (Routing)**: Determina a rota completa tomada pelos pacotes da origem até o destino através de algoritmos de roteamento (plano de controle).

---

### 2. Endereçamento IPv4 e Notação CIDR
Um endereço IPv4 possui 32 bits, comumente representado em notação decimal com pontos (ex: `192.168.1.1`).

O sistema original de classes (Classe A: `/8`, Classe B: `/16`, Classe C: `/24`) gerava enorme desperdício de endereços. Ele foi substituído pelo **CIDR (Classless Inter-Domain Routing)**:
- A notação `a.b.c.d/x` indica que os primeiros x bits definem a rede/sub-rede.
- Os 32 - x bits restantes identificam os hosts daquela sub-rede.
- O endereço com todos os bits de host zerados representa o **Identificador da Rede**.
- O endereço com todos os bits de host iguais a 1 representa o **Endereço de Broadcast**.

---

### 3. Protocolos Essenciais da Camada de Rede

1. **NAT (Network Address Translation)**:
 - Desenvolvido para desacelerar o esgotamento do IPv4.
 - Permite que dispositivos em redes locais utilizem endereços privados (definidos na RFC 1918: `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`).
 - O roteador de borda mantém uma tabela de tradução NAT que reescreve o cabeçalho IP e a porta de transporte dos pacotes.

2. **DHCP (Dynamic Host Configuration Protocol)**:
 - Protocolo "plug-and-play" que automatiza a atribuição de configurações de rede.
 - Ciclo em 4 etapas (**DORA**):
 1. **DHCP Discover**: Cliente emite broadcast procurando um servidor DHCP.
 2. **DHCP Offer**: Servidor oferece um IP temporário (*lease*).
 3. **DHCP Request**: Cliente aceita formalmente a oferta.
 4. **DHCP ACK**: Servidor confirma e entrega parâmetros de gateway padrão e servidores DNS.

3. **ICMP (Internet Control Message Protocol)**:
 - Protocolo de apoio que reporta erros operacionais e informações de diagnóstico.
 - Tipos de mensagens: *Destination Unreachable*, *TTL Expired* (usado pelo `traceroute`) e *Echo Request/Reply* (usado pelo `ping`).

---

### 4. Algoritmos e Protocolos de Roteamento

1. **Algoritmo de Estado de Enlace (Link-State - OSPF)**:
 - Cada nó inunda a rede com mensagens LSA (Link-State Advertisements) informando o estado dos seus enlaces diretos.
 - Todos os roteadores constroem o grafo completo e idêntico da topologia e executam o algoritmo de **Dijkstra** para calcular o menor caminho até cada destino.
2. **Algoritmo de Vetor de Distância (Distance-Vector - RIP)**:
 - Baseado na equação de **Bellman-Ford**.
 - Cada nó mantém uma tabela com o custo estimado até cada rede e troca sua tabela periodicamente apenas com seus vizinhos imediatos.
3. **Roteamento Interdomínio com BGP**:
 - A Internet é subdividida em **Sistemas Autônomos (AS)**.
 - Dentro de um AS (Intra-AS) utilizam-se OSPF ou IS-IS.
 - Entre ASs diferentes (Inter-AS), o protocolo obrigatório é o **BGP (Border Gateway Protocol)**, que opera por vetor de caminhos (*path vector*) considerando acordos comerciais e políticas de tráfego entre provedores.
