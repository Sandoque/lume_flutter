# Tema 6: Camadas de Enlace e Física
## Conteúdo Completo e Aprofundado

### 1. Camada Física e Meios de Transmissão
A camada física trata do envio de bits através do meio de transmissão, definindo especificações mecânicas, elétricas, funcionais e de temporização.

#### Classificação dos Meios:
1. **Meios Guiados**:
 - **Par Trançado (UTP/STP)**: Consiste em dois fios de cobre isolados e trançados em espiral. O trançamento faz com que sinais de ruído e interferência eletromagnética externa induzam correntes iguais e opostas em ambos os fios, cancelando o ruído (*crosstalk*).
 - **Cabo Coaxial**: Condutor central de cobre cercado por camada isolante e malha de blindagem.
 - **Fibra Óptica**: Utiliza refração e reflexão total de pulsos luminosos no núcleo de vidro/sílica.
 - *Monomodo (SMF)*: Núcleo finíssimo (~9 µm), utiliza laser e permite enlaces de dezenas de quilômetros com altíssima banda sem distorção modal.
 - *Multimodo (MMF)*: Núcleo mais largo (~50 ou 62,5 µm), utiliza LEDs de baixo custo para distâncias de até 500 metros em datacenters.
2. **Meios Não Guiados**:
 - Transmissão sem fio através do ar ou vácuo via ondas de rádio e micro-ondas.

---

### 2. Camada de Enlace: Enquadramento e Controle de Erros
A camada de enlace agrupa os bits da camada física em **Quadros (Frames)**.

#### Métodos de Enquadramento:
- **Preenchimento de Bits (Bit Stuffing)**:
 - Cada quadro é delimitado pela flag `01111110` (0x7E).
 - Regra no transmissor: sempre que encontrar uma sequência de cinco bits `1` seguidos nos dados, insere obrigatoriamente um bit `0`.
 - Regra no receptor: ao encontrar cinco bits `1` seguidos de um bit `0`, o receptor descarta o bit `0` restaurando os dados originais. Se o sexto bit for outro `1`, trata-se da flag delimitadora!

#### Controle de Erros com ARQ (Automatic Repeat reQuest):
- **Stop-and-Wait ARQ**: O emissor envia um quadro e para. Ele só envia o próximo quando receber a confirmação (ACK).
- Se o ACK for perdido no caminho, o temporizador estoura e o emissor retransmite o quadro.
- Para que o receptor não entregue o mesmo quadro duas vezes à camada de rede, é necessário um **número de sequência de 1 bit (0 ou 1)**.

---

### 3. Protocolos de Acesso Múltiplo (Subcamada MAC)
Quando vários nós compartilham o mesmo canal de comunicação (canal broadcast), é preciso um protocolo para coordenar quem pode transmitir.

1. **Protocolos ALOHA**:
 - *ALOHA Puro*: Estações transmitem imediatamente. Eficiência máxima teórica: S = (1) / (2e) ≈ 18,4%.
 - *ALOHA Ranhurado (Slotted)*: O tempo é dividido em intervalos (slots). Transmissões só começam no início do slot. Eficiência máxima: S = (1) / (e) ≈ 36,8%.
2. **CSMA (Carrier Sense Multiple Access)**:
 - "Ouça antes de falar": A estação escuta o canal antes de iniciar o envio.
 - **CSMA/CD (Ethernet IEEE 802.3)**:
 - Escuta antes e **continua escutando enquanto transmite**.
 - Se detectar colisão, emite sinal de colisão (*jam signal*), aborta o quadro e executa o algoritmo **Binary Exponential Backoff** (aguarda um tempo aleatório proporcional a 2^k slots).
 - **CSMA/CA (Wi-Fi IEEE 802.11)**:
 - Em redes sem fio, a estação transmissora não consegue escutar o meio enquanto transmite com sua própria antena potente (*hidden terminal problem*).
 - Por isso, adota **Prevenção de Colisão**: aguarda intervalos de silêncio (IFS/DIFS), escolhe tempo aleatório de recuo (*backoff*) e opcionalmente reserva o canal trocando pequenos quadros `RTS` (Request to Send) e `CTS` (Clear to Send).
