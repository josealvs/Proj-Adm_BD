import pyodbc

# Conexão com o PostgreSQL via ODBC
conn = pyodbc.connect(
    'DRIVER={PostgreSQL Unicode};SERVER=localhost;PORT=5433;DATABASE=atividade_db;UID=admin;PWD=admin123'
)
cursor = conn.cursor()

try:
    # Inserir novo projeto com dados obrigatórios
    cursor.execute("""
        INSERT INTO projeto (nome, descricao, codDepto, codResponsavel, dataInicio, dataFim)
        VALUES (?, ?, ?, ?, ?, ?)
    """, ("Projeto A", "Descrição do Projeto A", 1, 1, '2025-05-01', '2025-12-31'))
    conn.commit()

    # Obter ID do projeto (campo: codigo)
    cursor.execute("SELECT codigo FROM projeto WHERE nome = ?", ("Projeto A",))
    projeto_id = cursor.fetchone()[0]

    # Inserir atividade associada ao projeto
    cursor.execute("""
        INSERT INTO atividade (descricao, codProjeto, dataInicio, dataFim)
        VALUES (?, ?, ?, ?)
    """, ("Atividade 1 do Projeto A", projeto_id, '2025-05-10', '2025-05-20'))
    conn.commit()

    # Atualizar descrição do projeto
    cursor.execute("""
        UPDATE projeto SET descricao = ? WHERE codigo = ?
    """, ("Projeto A atualizado", projeto_id))
    conn.commit()

    # Listar projetos e atividades (LEFT JOIN)
    cursor.execute("""
        SELECT p.nome, p.descricao, a.descricao, a.dataInicio, a.dataFim
        FROM projeto p
        LEFT JOIN atividade a ON p.codigo = a.codProjeto
        ORDER BY p.codigo
    """)
    for row in cursor.fetchall():
        print(row)

except Exception as e:
    print("Erro:", e)

finally:
    cursor.close()
    conn.close()
