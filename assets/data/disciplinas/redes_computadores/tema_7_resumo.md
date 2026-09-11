# Tema 7: Segurança e Administração em Redes
### ⚡ Resumo Rápido (Revisão em 4 minutos)

- **Tríade CIA**:
 - **Confidencialidade**: Acesso apenas por autorizados (Criptografia simétrica/assimétrica).
 - **Integridade**: Dados não alterados indevidamente (Hashes SHA-256 e Assinaturas Digitais).
 - **Disponibilidade**: Sistemas e redes operacionais quando solicitados (Redundância, Anti-DDoS).
- **Classificação de Ataques**:
 - **Ataques Passivos**: Apenas espionam o tráfego sem alterar dados (*Sniffing*, escuta clandestina). Defesa: Criptografia.
 - **Ataques Ativos**: Modificam mensagens, forjam identidades ou degradam serviços (*DDoS, Spoofing, Man-in-the-Middle*).
- **Ameaças Críticas**:
 - **APT (Advanced Persistent Threat)**: Ataques furtivos, complexos e duradouros focados em alvos específicos.
 - **Ransomware (ex: WannaCry)**: Sequestro de dados via criptografia com pedido de resgate.
- **Topologia Segura e DMZ**:
 - A Zona Desmilitarizada (DMZ) abriga servidores públicos (Web, DNS, E-mail) isolados da rede interna por firewalls.
- **Gerência de Redes (SNMP)**:
 - Estação Gerente (NMS) monitora Agentes rodando em roteadores e switches.
 - A base de dados estruturada é a **MIB** (Management Information Base).
 - Mensagens de alarme enviadas pelo agente ao gerente são as **Traps**.
