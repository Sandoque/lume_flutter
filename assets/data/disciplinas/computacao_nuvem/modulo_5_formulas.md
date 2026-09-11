# Módulo 5: Fórmulas, Métricas e Regras de Rede AWS

### 1. Cálculo de Endereços IP Úteis em Sub-redes AWS
Para qualquer bloco CIDR /M:

> **Total de IPs = 2^{(32 - M)}**


> **IPs Utilizáveis pela Aplicação = 2^{(32 - M)} - 5**


*Exemplo para sub-rede /24 (como `10.0.0.0/24`):*
* Total bruto: 2⁽³²⁻²⁴⁾ = 2⁸ = 256 IPs.
* IPs Reservados pela AWS: **5**
 1. `10.0.0.0`: Endereço da Rede;
 2. `10.0.0.1`: Roteador da VPC;
 3. `10.0.0.2`: Servidor DNS do Amazon Route 53;
 4. `10.0.0.3`: Uso reservado futuro da AWS;
 5. `10.0.0.255`: Broadcast de rede.
* IPs Reais para instâncias EC2: 256 - 5 = 251 endereços (de `10.0.0.4` até `10.0.0.254`).

### 2. Durabilidade de Dados no Amazon S3

> **Durabilidade = 99,999999999% (11 noves)**

*Significado prático:* Se você armazenar 10.000.000 (10 milhões) de objetos no Amazon S3, a expectativa estatística é de perder apenas 1 único arquivo a cada 10.000 anos.

### 3. Os 6 Pilares do AWS Well-Architected Framework
1. **Excelência Operacional (*Operational Excellence*):** Executar e monitorar sistemas, melhorando continuamente processos.
2. **Segurança (*Security*):** Proteger informações, sistemas e ativos com privilégio mínimo e criptografia.
3. **Confiabilidade (*Reliability*):** Capacidade de recuperar-se de falhas de infraestrutura e mitigar interrupções.
4. **Eficiência de Desempenho (*Performance Efficiency*):** Usar recursos de TI com eficiência conforme a demanda muda.
5. **Otimização de Custos (*Cost Optimization*):** Evitar gastos desnecessários analisando métricas de consumo.
6. **Sustentabilidade (*Sustainability*):** Minimizar o impacto ambiental e a pegada de carbono da computação em nuvem.
