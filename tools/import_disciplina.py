"""
Script utilitário para cadastrar novas disciplinas e temas no aplicativo.
Uso:
    python tools/import_disciplina.py --id algoritmos_prog --nome "Algoritmos e Programação" --periodo periodo_1 --temas 5
"""

import os
import json
import argparse

CATALOGO_PATH = os.path.join(os.path.dirname(__file__), '..', 'assets', 'data', 'catalogo.json')
DISCIPLINAS_BASE = os.path.join(os.path.dirname(__file__), '..', 'assets', 'data', 'disciplinas')

def cadastrar_disciplina(periodo_id, disc_id, nome, codigo, descricao, icone, cor_hex, num_temas):
    disc_dir = os.path.join(DISCIPLINAS_BASE, disc_id)
    os.makedirs(disc_dir, exist_ok=True)
    
    temas = []
    for i in range(1, num_temas + 1):
        tema_id = f"tema{i}"
        resumo_file = f"tema_{i}_resumo.md"
        completo_file = f"tema_{i}_completo.md"
        formulas_file = f"tema_{i}_formulas.md"
        
        # Gerar arquivos padrão se não existirem
        p_resumo = os.path.join(disc_dir, resumo_file)
        if not os.path.exists(p_resumo):
            with open(p_resumo, 'w', encoding='utf-8') as f:
                f.write(f"# Tema {i}: Tópicos Principais\n\n### Resumo Executivo\n- Conceito central do tema {i}...\n")
                
        p_completo = os.path.join(disc_dir, completo_file)
        if not os.path.exists(p_completo):
            with open(p_completo, 'w', encoding='utf-8') as f:
                f.write(f"# Tema {i}: Conteúdo Completo e Aprofundado\n\n## Fundamentação Teórica\nExplicação detalhada...\n")
                
        p_formulas = os.path.join(disc_dir, formulas_file)
        if not os.path.exists(p_formulas):
            with open(p_formulas, 'w', encoding='utf-8') as f:
                f.write(f"# Fórmulas & Regras de Ouro - Tema {i}\n\n- **Regra 1**: Definição...\n")
                
        temas.append({
            "id": tema_id,
            "numero": i,
            "titulo": f"Tópico {i} de {nome}",
            "descricao": f"Fundamentos e aplicações práticas do Tema {i}.",
            "resumoFile": resumo_file,
            "completoFile": completo_file,
            "formulasFile": formulas_file,
            "questoesCount": 0
        })
        
    p_questoes = os.path.join(disc_dir, "questoes.json")
    if not os.path.exists(p_questoes):
        with open(p_questoes, 'w', encoding='utf-8') as f:
            json.dump([], f, indent=2, ensure_ascii=False)
            
    p_flashcards = os.path.join(disc_dir, "flashcards.json")
    if not os.path.exists(p_flashcards):
        with open(p_flashcards, 'w', encoding='utf-8') as f:
            json.dump([], f, indent=2, ensure_ascii=False)

    # Atualizar catalogo.json
    with open(CATALOGO_PATH, 'r', encoding='utf-8') as f:
        catalogo = json.load(f)
        
    periodo_encontrado = False
    for p in catalogo.get("periodos", []):
        if p["id"] == periodo_id:
            periodo_encontrado = True
            # Checa se disciplina já existe
            disciplina_existente = None
            for d in p["disciplinas"]:
                if d["id"] == disc_id:
                    disciplina_existente = d
                    break
            if disciplina_existente:
                disciplina_existente["temas"] = temas
                disciplina_existente["dataPath"] = f"assets/data/disciplinas/{disc_id}"
            else:
                p["disciplinas"].append({
                    "id": disc_id,
                    "nome": nome,
                    "codigo": codigo,
                    "descricao": descricao,
                    "icone": icone,
                    "corHex": cor_hex,
                    "dataPath": f"assets/data/disciplinas/{disc_id}",
                    "temas": temas
                })
            break
            
    if not periodo_encontrado:
        print(f"Período '{periodo_id}' não encontrado no catalogo.json!")
        return

    with open(CATALOGO_PATH, 'w', encoding='utf-8') as f:
        json.dump(catalogo, f, indent=2, ensure_ascii=False)

    print(f"Disciplina '{nome}' ({disc_id}) cadastrada com sucesso com {num_temas} temas!")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Cadastrar disciplina no catalogo")
    parser.add_argument('--periodo', default='periodo_1', help='ID do período (ex: periodo_1)')
    parser.add_argument('--id', required=True, help='ID da disciplina (ex: algoritmos_prog)')
    parser.add_argument('--nome', required=True, help='Nome da disciplina')
    parser.add_argument('--codigo', default='CC-101', help='Código da disciplina')
    parser.add_argument('--descricao', default='', help='Descrição da matéria')
    parser.add_argument('--icone', default='book', help='Nome do ícone (calculate, code, storage, book)')
    parser.add_argument('--cor', default='#2563EB', help='Cor hexadecimal (ex: #2563EB)')
    parser.add_argument('--temas', type=int, default=6, help='Quantidade inicial de temas')
    
    args = parser.parse_args()
    cadastrar_disciplina(
        args.periodo,
        args.id,
        args.nome,
        args.codigo,
        args.descricao,
        args.icone,
        args.cor,
        args.temas
    )
