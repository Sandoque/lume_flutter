# Tema 2: Fórmulas & Regras de Ouro
### Fichamento Prático de Redes e Desempenho

#### 1. Equação do Atraso Nodal

> **d_{nodal} = d_{proc} + d_{fila} + d_{trans} + d_{prop}**


#### 2. Atraso de Transmissão vs. Propagação
- **Transmissão (injetar bits no fio)**:
 
> **d_{trans} = (L) / (R)**

 - L = Tamanho do pacote em bits.
 - R = Taxa de transmissão (largura de banda) do enlace em bits por segundo (bps).

- **Propagação (viajar pelo fio)**:
 
> **d_{prop} = (d) / (s)**

 - d = Comprimento físico do enlace (metros).
 - s = Velocidade de propagação da luz no meio (aproximadamente 2 × 10⁸ m/s em cabos de cobre/fibra).

#### 3. Intensidade de Tráfego (I)

> **I = (L · a) / (R)**

- Onde a é a taxa média de chegada de pacotes (pacotes/segundo).
- Se I ≈ 0: Atraso de fila quase nulo.
- Se I → 1: Atraso de fila cresce assintoticamente.
- Se I > 1: O buffer transborda e pacotes são descartados obrigatoriamente.

#### 4. Mnemônico das 7 Camadas OSI (7 a 1)
> **A**plicação -> **A**presentação -> **S**essão -> **T**ransporte -> **R**ede -> **E**nlace -> **F**ísica
> *(A Arte Sempre Tem Respostas Em Filosofia)*
