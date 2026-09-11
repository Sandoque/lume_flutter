import os
import sys
import pypdf
import pdfplumber

def extrair_texto_pdf(pdf_path, max_paginas=None):
    """Extrai texto e metadados de um arquivo PDF usando pdfplumber."""
    if not os.path.exists(pdf_path):
        print(f"Arquivo nao encontrado: {pdf_path}")
        return ""
    
    texto_total = []
    with pdfplumber.open(pdf_path) as pdf:
        total_pags = len(pdf.pages)
        limite = min(total_pags, max_paginas) if max_paginas else total_pags
        print(f"Lendo '{os.path.basename(pdf_path)}' ({limite}/{total_pags} paginas)...")
        
        for i in range(limite):
            pagina = pdf.pages[i]
            txt = pagina.extract_text() or ""
            if txt.strip():
                texto_total.append(f"--- PAGINA {i+1} ---\n{txt.strip()}")
                
    return "\n\n".join(texto_total)

def inspecionar_pasta_disciplina(pasta_disciplina):
    """Varre uma pasta de disciplina e lista os PDFs encontrados com contagem de páginas."""
    if not os.path.exists(pasta_disciplina):
        print(f"Diretorio nao encontrado: {pasta_disciplina}")
        return
    
    arquivos = [f for f in os.listdir(pasta_disciplina) if f.lower().endswith(".pdf")]
    print(f"\nDiretorio: {pasta_disciplina}")
    print(f"Total de PDFs encontrados: {len(arquivos)}")
    
    for arq in sorted(arquivos):
        caminho = os.path.join(pasta_disciplina, arq)
        try:
            reader = pypdf.PdfReader(caminho)
            pags = len(reader.pages)
            tamanho_kb = os.path.getsize(caminho) / 1024
            print(f" - {arq} ({pags} paginas, {tamanho_kb:.1f} KB)")
        except Exception as e:
            print(f" - {arq} (Erro ao ler: {e})")

if __name__ == '__main__':
    if len(sys.argv) > 1:
        caminho = sys.argv[1]
        if os.path.isdir(caminho):
            inspecionar_pasta_disciplina(caminho)
        elif os.path.isfile(caminho):
            res = extrair_texto_pdf(caminho, max_paginas=5)
            print(res[:1500])
    else:
        # Padrao: inspecionar central de apostilas (dentro do projeto)
        base = os.path.normpath(os.path.join(os.path.dirname(__file__), '..', 'apostilas', '1_periodo'))
        for disc in sorted(os.listdir(base)):
            p = os.path.join(base, disc)
            if os.path.isdir(p):
                inspecionar_pasta_disciplina(p)
