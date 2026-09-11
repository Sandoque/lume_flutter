# Módulo 4: Fórmulas e Diretrizes Operacionais

### 1. A Regra de Ouro do Backup: 3-2-1

> **Segurança Máxima de Dados = * 3 cópias de dados * 2 mídias distintas (ex: Storage Local + Nuvem) * 1 cópia externa (off-site / nuvem)**


### 2. Força de Senha e Entropia
A complexidade de uma senha com comprimento L e conjunto de caracteres de tamanho N:

> **Espaço de Busca = N^L**


> **Entropia (bits) = L × \log₂(N)**

*Exemplo:* Uma senha de 8 caracteres numéricos (N=10) possui 10⁸ = 100.000.000 combinações (quebrada em milissegundos). Uma senha de 14 caracteres com letras, números e símbolos (N=94) possui 94¹⁴ ≈ 4,2 × 10²⁷ combinações (leva milhares de anos para ser decifrada por força bruta).

### 3. Tipos de Criptografia
* **Simétrica (Chave Única Secreta):** Mesma chave cifra e decifra. Algoritmo padrão: **AES** (Advanced Encryption Standard). Extremamente rápida, ideal para grandes volumes de dados em repouso.
* **Assimétrica (Par de Chaves Pública e Privada):** A chave pública cifra; apenas a chave privada correspondente decifra. Algoritmos: **RSA, ECC**. Usada para troca segura de segredos, assinaturas digitais e certificados SSL/TLS.
* **Funções Hash (Resumo Criptográfico Unidirecional):** Gera um resumo de tamanho fixo impossível de reverter. Algoritmos: **SHA-256, SHA-3**. Usado para verificar a integridade de arquivos e armazenar senhas com salt.
