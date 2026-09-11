# Módulo 1: Fórmulas, Sintaxes e Especificadores em C

### 1. Tabela de Especificadores de Formato
| Tipo de Dado | Especificador `printf` | Especificador `scanf` | Exemplo de Declaração |
| :--- | :---: | :---: | :--- |
| **Inteiro (`int`)** | `%d` ou `%i` | `%d` | `int idade = 25;` |
| **Inteiro Longo Sem Sinal** | `%lu` | `%lu` | `unsigned long int pop = 1400000000UL;` |
| **Ponto Flutuante (`float`)** | `%f` ou `%.2f` | `%f` | `float area = 1521.11;` |
| **Ponto Flutuante Duplo (`double`)** | `%lf` | `%lf` | `double pib = 699.28;` |
| **Caractere Único (`char`)** | `%c` | ` %c` (com espaço) | `char estado = 'A';` |
| **String (`char[]`)** | `%s` | `%s` ou `fgets` | `char cidade[50] = "São Paulo";` |

### 2. Fórmulas de Atributos do Super Trunfo
* **Densidade Populacional:**
 
> **densidade = ((float) populacao) / (area)**

* **PIB per Capita:**
 
> **pib\ₚer\_capita = (pib) / ((float) populacao)**

* **Super Poder (Soma Ponderada):**
 
> **Super Poder = populacao + area + pib + pontos\_turisticos + pib\ₚer\_capita + ((1) / (densidade))**

 *(Nota: Na densidade, menor valor vence; portanto, seu inverso entra na pontuação global).*

### 3. Operadores Aritméticos
* Adição: `+` | Subtração: `-` | Multiplicação: `*`
* Divisão: `/` (se ambos operandos forem `int`, o resultado trunca a parte decimal!)
* Resto da Divisão (Módulo): `%` (aplicável apenas entre números inteiros!)
* Incremento/Decremento: `x++` (pós-fixado), `++x` (pré-fixado), `x--`, `--x`
