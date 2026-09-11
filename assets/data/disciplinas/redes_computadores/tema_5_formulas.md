# Tema 5: Fórmulas & Regras de Ouro
### Fichamento Matemático de Sub-redes e Roteamento

#### 1. Equação Mágica de Sub-redes CIDR

> **Total de Hosts Úteis = 2^{32 - x} - 2**

- x = Tamanho do prefixo na notação `/x`.
- -2 = Subtração do endereço de Rede (todos os bits de host em 0) e do endereço de Broadcast (todos os bits de host em 1).

#### 2. Tabela Rápida de Máscaras IPv4
| Prefixo CIDR | Máscara Decimal | Bits de Host | Hosts Válidos |
|---|---|---|---|
| `/24` | `255.255.255.0` | 8 | 254 |
| `/25` | `255.255.255.128` | 7 | 126 |
| `/26` | `255.255.255.192` | 6 | 62 |
| `/27` | `255.255.255.224` | 5 | 30 |
| `/28` | `255.255.255.240` | 4 | 14 |
| `/29` | `255.255.255.248` | 3 | 6 |
| `/30` | `255.255.255.252` | 2 | 2 (enlaces roteador-roteador) |

#### 3. Blocos de Endereços Privados (RFC 1918)
- Classe A: `10.0.0.0` a `10.255.255.255` (`10.0.0.0/8`)
- Classe B: `172.16.0.0` a `172.31.255.255` (`172.16.0.0/12`)
- Classe C: `192.168.0.0` a `192.168.255.255` (`192.168.0.0/16`)

#### 4. Resumo de Algoritmos de Roteamento
- **Link-State**: Algoritmo de **Dijkstra** | Protocolo **OSPF** | Mapa global.
- **Distance-Vector**: Algoritmo de **Bellman-Ford** | Protocolo **RIP** | Métrica de saltos (máx 15).
- **Path-Vector**: Protocolo **BGP** | Entre Sistemas Autônomos (Internet).
