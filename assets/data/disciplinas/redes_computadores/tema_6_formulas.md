# Tema 6: Fórmulas & Regras de Ouro
### Fichamento de Enlace e Física

#### 1. Rendimento do Protocolo ALOHA
- **ALOHA Puro**:
 
> **S_{max} = (1) / (2e) ≈ 0,184 (18,4%)**

- **ALOHA Slotted (Ranhurado)**:
 
> **S_{max} = (1) / (e) ≈ 0,368 (36,8%)**


#### 2. Regra de Ouro do Bit Stuffing
- Flag delimitadora: `01111110` (seis bits 1 seguidos).
- No transmissor: 5 bits `1` seguidos nos dados ⇒ insere `0` extra.
- No receptor: 5 bits `1` seguidos de `0` ⇒ remove o `0`.

#### 3. Comparativo CSMA/CD vs. CSMA/CA
| Característica | CSMA/CD (Ethernet) | CSMA/CA (Wi-Fi) |
|---|---|---|
| Meio | Físico com cabo (IEEE 802.3) | Sem fio / Rádio (IEEE 802.11) |
| Estratégia | Detecção de Colisão durante envio | Prevenção de Colisão antes do envio |
| Ação na colisão | Aborta imediatamente + Jam Signal | Timeout por falta de ACK no ar |
| Recuo | Binary Exponential Backoff | Contagem regressiva em slots de tempo |
| Mecanismo opcional | Não possui | Troca de quadros RTS / CTS |
