# Tema 6: Camadas de Enlace e Física
### ⚡ Resumo Rápido (Revisão em 4 minutos)

- **Camada Física**: Converte bits em sinais analógicos/digitais no meio de transmissão.
 - **Meios Guiados**: Par trançado (fios trançados cancelam ruído/crosstalk), cabo coaxial e fibra óptica (monomodo para longas distâncias com laser; multimodo para curtas distâncias com LED).
 - **Meios Não Guiados**: Ondas de rádio, micro-ondas e satélites.
- **Camada de Enlace**: Responsável por transferir quadros (frames) entre nós vizinhos conectados ao mesmo meio físico.
- **Técnicas de Enquadramento**:
 - Contagem de caracteres.
 - Inserção de bytes (*Byte Stuffing* com bytes de escape ESC).
 - Inserção de bits (*Bit Stuffing* com flag `01111110`; insere um bit `0` após cinco `1`s consecutivos).
- **Controle de Erro**: Stop-and-Wait ARQ só necessita de 1 bit de sequência (0 ou 1) para diferenciar quadros novos de duplicatas.
- **Acesso ao Meio Compartilhado (MAC)**:
 - **ALOHA Puro**: Transmite a qualquer momento (eficiência teórica de ~18,4%).
 - **ALOHA Ranhurado (Slotted)**: Transmite no início de slots sincronizados (eficiência de ~36,8%).
 - **CSMA/CD**: Usado no Ethernet com cabo. Escuta antes e detecta colisão enquanto transmite.
 - **CSMA/CA**: Usado no Wi-Fi (802.11). Evita colisões no ar usando IFS, backoff e RTS/CTS.
- **Endereço MAC e ARP**: Endereço físico de 48 bits. O protocolo **ARP** traduz um endereço IP conhecido no endereço MAC correspondente na rede local via broadcast.
