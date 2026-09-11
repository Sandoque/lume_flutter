# Tema 3: Modelo de Referência OSI e Arquitetura TCP/IP
### ⚡ Resumo Rápido (Revisão em 4 minutos)

- **Tríade de Conceitos**:
 - **Serviço**: O que a camada faz para a camada superior (vertical).
 - **Interface**: Como a camada superior acessa as operações (pontos SAP).
 - **Protocolo**: Regras de sintaxe e temporização entre entidades pares em máquinas distintas (horizontal).
- **As 7 Camadas OSI**:
 - Camada 7 (Aplicação): Interface com programas do usuário (HTTP, DNS).
 - Camada 6 (Apresentação): Criptografia, compressão e conversão de formatos de dados.
 - Camada 5 (Sessão): Controle de diálogo e pontos de sincronização (checkpoints).
 - Camada 4 (Transporte): Comunicação processo a processo fim a fim (TCP/UDP).
 - Camada 3 (Rede): Roteamento e repasse de pacotes entre redes distintas (IP).
 - Camada 2 (Enlace): Comunicação nó a nó no mesmo meio físico, controle de acesso ao meio e detecção de erros (MAC/Ethernet).
 - Camada 1 (Física): Transmissão de bits brutos no meio físico (sinais elétricos, ópticos, rádio).
- **Modelo TCP/IP (4 Camadas)**: Aplicação (absorve Sessão e Apresentação) -> Transporte -> Internet -> Acesso à Rede.
- **Ampulheta da Internet**: Centenas de aplicações no topo, centenas de meios físicos na base, e um único protocolo obrigatório no meio: **o IP**.
