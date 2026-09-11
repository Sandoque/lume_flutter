# Tema 7: Segurança e Administração em Redes
## Conteúdo Completo e Aprofundado

### 1. Princípios de Segurança e a Tríade CIA
A segurança de redes visa proteger a infraestrutura e os dados em trânsito contra acessos não autorizados, interceptações e danos.

#### Os Pilares da Tríade CIA:
1. **Confidencialidade**: Garante que o conteúdo da comunicação seja ininteligível para qualquer bisbilhoteiro que intercepte os pacotes no enlace. Alcançada por meio de **Criptografia** (Simétrica como AES, ou Assimétrica como RSA).
2. **Integridade**: Assegura que a mensagem recebida seja exatamente idêntica à que foi enviada, sem acréscimo, supressão ou alteração de nenhum bit. Alcançada com algoritmos de hash criptográfico (SHA-2/SHA-3) e códigos de autenticação de mensagem (MAC / HMAC).
3. **Disponibilidade**: Garante que os recursos e serviços computacionais estejam acessíveis aos usuários autorizados sempre que necessário. Protegida por redundância de hardware, enlaces múltiplos, firewalls e balanceadores contra ataques DDoS.

---

### 2. Taxonomia de Ameaças e Ataques
Os ataques são classificados em duas grandes famílias:
- **Ataques Passivos**: O atacante não interage nem altera os pacotes na rede. Seu objetivo exclusivo é interceptar e monitorar informações sensíveis (senhas, e-mails, conversas).
 - Exemplos: *Sniffing* (captura de pacotes) e análise de padrões de tráfego. Como não há alteração no fluxo, a detecção é extremamente complexa; a prevenção consiste na criptografia ponta a ponta (HTTPS, SSH, VPN IPsec).
- **Ataques Ativos**: O atacante altera mensagens, injeta tráfego fraudulento ou derruba serviços.
 - Exemplos: *IP Spoofing* (forjar o IP de origem), *Man-in-the-Middle (MitM)*, ataques de Negação de Serviço (*DoS / DDoS*) e infecções por *Ransomware* (como o infame **WannaCry** de 2017 que explorou falhas no protocolo SMBv1).

---

### 3. Arquitetura de Defesa e Zona Desmilitarizada (DMZ)
Em redes corporativas, nenhum servidor com portas expostas diretamente para a Internet deve ficar posicionado dentro da rede local interna.

A melhor prática é criar uma **DMZ (Demilitarized Zone)**:
- Sub-rede perimetral intermediária controlada por regras rígidas de firewall.
- Abriga apenas os serviços públicos: Servidor Web (HTTP/HTTPS), Servidor de Correio (SMTP/IMAP) e Servidor DNS externo.
- Se um hacker invadir com sucesso o servidor web na DMZ, as políticas do firewall bloqueiam qualquer tentativa de movimento lateral para dentro dos computadores ou bancos de dados da rede interna corporativa.

---

### 4. Gerenciamento de Redes com o Protocolo SNMP
Gerenciar uma infraestrutura de rede composta por centenas de roteadores, switches, access points e servidores requer automação. O padrão universal é o **SNMP (Simple Network Management Protocol)**.

#### A Arquitetura SNMP é formada por:
1. **NMS (Network Management Station)**: Estação de gerenciamento central onde o administrador opera softwares de monitoramento (como Zabbix, PRTG, Nagios).
2. **Agente SNMP**: Processo de software leve que roda dentro de cada equipamento de rede gerenciado.
3. **MIB (Management Information Base)**: Base de dados estruturada em árvore hierárquica (formato ASN.1 com identificadores OID) que armazena todas as variáveis do dispositivo: estatísticas de uso de CPU, memória, status das portas físicas (up/down), pacotes descartados e erros.
4. **Mensagens SNMP**:
 - `GetRequest`: Gerente consulta o valor de uma variável na MIB do agente.
 - `SetRequest`: Gerente altera uma configuração no dispositivo gerenciado.
 - `Trap`: Alerta assíncrono emitido espontaneamente pelo agente para notificar o gerente sobre um evento crítico e urgente (ex.: superaquecimento, enlace rompido).
