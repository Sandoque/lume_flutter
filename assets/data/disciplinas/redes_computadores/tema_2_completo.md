# Tema 2: Redes de Computadores e a Internet
## Conteúdo Completo e Aprofundado

### 1. Visão Geral e Organização da Internet
A Internet moderna é a maior criação de engenharia da humanidade, interconectando bilhões de dispositivos computacionais (hosts ou sistemas finais) ao redor do globo.

#### Os Três Componentes Estruturais:
1. **Sistemas Finais (Borda da Rede)**:
 - Dispositivos que se encontram na periferia da infraestrutura de rede.
 - **Clientes**: Computadores pessoais, notebooks, smartphones, smart TVs, dispositivos IoT.
 - **Servidores**: Máquinas de alto desempenho que hospedam e distribuem páginas web, streaming de vídeo e bases de dados. Vale ressaltar que o papel de servidor é definido pelo **software** que ele executa (processo que atende a requisições), e não exclusivamente pelo hardware.
2. **Redes de Acesso**:
 - Meios físicos e enlaces que conectam o sistema final ao primeiro roteador da rede (roteador de borda).
 - Exemplos: Redes de fibra óptica (FTTH - GPON), redes celulares móveis (4G LTE / 5G NR), redes sem fio locais (Wi-Fi 802.11) e cabo de par trançado Ethernet (802.3).
3. **Núcleo da Rede (Core)**:
 - Malha de roteadores e comutadores interconectados que transportam os dados entre as redes de acesso no mundo todo através de **comutação de pacotes**.

---

### 2. Desempenho e Atrasos em Redes de Pacotes
Quando um pacote transita da origem ao destino, ele sofre atrasos em cada nó intermediário (roteador).

O atraso nodal total é dado por:

> **d_{nodal} = d_{proc} + d_{fila} + d_{trans} + d_{prop}**


1. **Atraso de Processamento (d_{proc})**: Tempo que o roteador gasta examinando o cabeçalho do pacote, verificando erros de bits (checksum) e consultando a tabela de repasse para decidir a porta de saída.
2. **Atraso de Fila (d_{fila})**: Tempo em que o pacote fica armazenado no buffer aguardando outros pacotes anteriores serem transmitidos pelo enlace. Depende da intensidade de tráfego. Se o buffer encher, ocorre o descarte de pacotes (*packet loss*).
3. **Atraso de Transmissão (d_{trans} = L / R)**: Tempo necessário para que o transmissor injete todos os L bits do pacote no enlace com taxa de transmissão R bps.
4. **Atraso de Propagação (d_{prop} = d / s)**: Tempo que um bit leva para viajar fisicamente pelo meio desde o início do enlace até a outra ponta, sendo d a distância física e s a velocidade de propagação do sinal no meio (~2 imes 10⁸ m/s na fibra/cobre).

---

### 3. Modelo em Camadas e Encapsulamento
A complexidade das redes é tratada pela divisão em camadas hierárquicas. Cada camada oferece serviços para a camada imediatamente superior e esconde a complexidade interna.

No emissor, o dado da aplicação desce pelas camadas e recebe cabeçalhos sucessivos em um processo chamado **Encapsulamento**:
- Aplicação: gera a **Mensagem**.
- Transporte: adiciona cabeçalho TCP/UDP e gera o **Segmento**.
- Rede: adiciona cabeçalho IP com IPs de origem e destino e gera o **Datagrama**.
- Enlace: adiciona cabeçalho e trailer Ethernet/MAC e gera o **Quadro (Frame)**.
- Física: converte os quadros em pulsos elétricos, ópticos ou ondas de rádio (**Bits**).
