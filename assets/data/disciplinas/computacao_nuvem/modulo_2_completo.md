# Módulo 2: Arquitetura de Computação em Nuvem
## Conteúdo Completo e Aprofundado

---

### 1. Visão Geral da Arquitetura de Sistemas em Nuvem

Projetar arquiteturas de software e infraestrutura em nuvem exige a substituição de paradigmas monolíticos tradicionais por conceitos modernos focados em **alta disponibilidade, resiliência a falhas, desacoplamento e elasticidade automatizada**.

A arquitetura geral é dividida estruturalmente entre:
* **Front-End:** Compreende todas as interfaces pelas quais clientes humanos e sistemas externos interagem com a solução: consoles de gerenciamento web, linhas de comando (CLIs), ferramentas de infraestrutura como código (Terraform, Bicep, CloudFormation) e aplicativos móveis/web.
* **Back-End:** A imensa malha física e lógica gerenciada pelo provedor, incluindo:
 * Servidores físicos de computação organizados em racks de alta densidade;
 * Sistemas de armazenamento de massa redundantes (Storage Area Networks - SANs distribuídas);
 * Camada de software de orquestração que monitora a integridade de hardware e redistribui máquinas virtuais sem interrupção de serviço;
 * Mecanismos de segurança de borda, firewalls e balanceadores.

---

### 2. Mecanismos de Funcionamento e Orquestração

O coração operacional da nuvem reside no software de orquestração do provedor. Quando um usuário solicita o provisionamento de um servidor virtual (por exemplo, uma instância com 8 vCPUs e 32 GB de RAM):
1. A requisição chega à API do provedor e é validada pelo serviço de gerenciamento de identidades e acessos (**IAM**).
2. O agendador (*scheduler*) do provedor varre a base de dados de capacidade física dos datacenters na Zona de Disponibilidade escolhida para encontrar um nó físico (*host*) com recursos ociosos suficientes.
3. O hipervisor daquele servidor recebe o comando de criar a máquina virtual, mapear a memória RAM dedicada e alocar as vCPUs.
4. O sistema de rede definida por software (**SDN**) cria uma interface de rede virtual (vNIC), atribui um endereço IP privado da sub-rede do cliente e configura as regras de firewall de borda.
5. Os volumes de disco de rede são anexados via barramentos virtuais de alta performance e a imagem do sistema operacional é carregada em questão de segundos.

---

### 3. Estratégias Fundamentais de Dimensionamento: Vertical vs. Horizontal

Uma das decisões arquiteturais mais críticas reside na forma como a aplicação responde ao aumento da carga de trabalho:

```
Escala Vertical (Scale-Up):
[ Servidor P ] -> [ Servidor Médio ] -> [ Servidor Grande ] (Limite físico da máquina)

Escala Horizontal (Scale-Out):
[ Servidor 1 ] + [ Servidor 2 ] + [ Servidor 3 ] + [ Servidor N ] (Crescimento Ilimitado)
```

| Critério | Escalabilidade Vertical (*Scale-Up*) | Escalabilidade Horizontal (*Scale-Out*) |
| :--- | :--- | :--- |
| **Mecanismo** | Aumentar poder computacional de um nó existente (mais vCPUs, mais RAM). | Adicionar mais instâncias idênticas em paralelo sob um balanceador. |
| **Downtime** | Frequentemente exige reiniciar a máquina para redimensionar. | Zero downtime; novas instâncias entram no pool de serviço ativamente. |
| **Custo** | Custo exponencial (máquinas com dezenas de CPUs custam proporcionalmente muito mais). | Custo linear e otimizado (uso de várias máquinas médias ou econômicas). |
| **Tolerância a Falhas** | Ponto único de falha (*SPOF*): se a máquina morrer, a aplicação para. | Alta tolerância: se 1 nó falhar, os demais continuam atendendo. |
| **Arquitetura de Software** | Suporta sistemas monolíticos legados sem modificação de código. | Exige arquiteturas *stateless* (sem estado em disco/memória local). |

---

### 4. Padrões Arquiteturais para Alta Resiliência

Para construir sistemas verdadeiramente resilientes à prova de desastres em nuvem, adota-se os seguintes princípios recomendados:

#### Desacoplamento através de Mensageria Assíncrona
Em arquiteturas fortemente acopladas, se o serviço B (ex: faturamento) cair, o serviço A (ex: carrinho de compras) falha imediatamente. Com mensageria assíncrona (como AWS SQS, Azure Service Bus ou RabbitMQ), o serviço A publica mensagens em uma fila persistente e retorna sucesso ao usuário; o serviço B consome a fila em seu próprio ritmo, sem risco de perda de pedidos caso sofra oscilações.

#### Arquitetura de Microsserviços e Contêineres
A decomposição de grandes monólitos em microsserviços empacotados em contêineres Docker e orquestrados por Kubernetes (AKS, EKS, GKE) permite que cada módulo de negócio escale independentemente. Por exemplo, em uma Black Friday, apenas o serviço de catálogo e busca precisa escalar para centenas de pods, enquanto o módulo de devolução de produtos permanece em escala mínima.

#### Balanceamento de Carga e Verificações de Saúde (*Health Checks*)
O balanceador de carga atua como o ponto único de entrada do tráfego. Ele realiza verificações de integridade (*heartbeats*) a cada poucos segundos em uma rota dedicada (ex: `GET /healthz`). Se um nó travar ou passar a retornar erros HTTP 500, o balanceador o retira instantaneamente do pool, roteando novos usuários apenas para os nós operacionais.
