# Módulo 4: Fórmulas e Mapeamento de Recursos Azure

### 1. Hierarquia de Governança do Azure
```
[ Grupos de Gerenciamento (Management Groups) ]
 |
 [ Assinaturas (Subscriptions) ]
 |
 [ Grupos de Recursos (Resource Groups) ]
 |
 [ Recursos (VMs, Discos, VNets, Bancos) ]
```

### 2. Níveis de Redundância do Azure Storage
* **LRS:** 3 cópias no mesmo datacenter → Durabilidade de 99,999999999% (11 noves).
* **ZRS:** 3 cópias em 3 AZs distintas → Durabilidade de 99,9999999999% (12 noves).
* **GRS:** 6 cópias (LRS na região primária + LRS na região secundária) → Durabilidade de 99,99999999999999% (16 noves).
* **GZRS:** 6 cópias (ZRS na região primária + LRS na região secundária) → Durabilidade de 16 noves com máxima resiliência zonal.

### 3. Comparações de Acesso ao Blob Storage
* **Latência de Leitura:**
 
> **Hot / Cool / Cold ≈ Milissegundos \ll Archive (Reidratação) ≈ Até 15 horas**

* **Custo por GB Armazenado:**
 
> **Hot > Cool > Cold > Archive**

* **Custo por Transação de Leitura:**
 
> **Archive > Cold > Cool > Hot**

