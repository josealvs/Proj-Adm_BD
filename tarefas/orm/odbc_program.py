import pyodbc

conn = pyodbc.connect(
    'DRIVER={PostgreSQL Unicode};SERVER=localhost;PORT=5433;DATABASE=AtividadesBD;UID=admin;PWD=admin123'
)
cursor = conn.cursor()

try:
    # Inserir projeto
    cursor.execute("INSERT INTO Projeto (nome, lider) VALUES (?, ?)", ("Projeto A", "João"))
    conn.commit()

    # Obter ID do projeto
    cursor.execute("SELECT id FROM Projeto WHERE nome = ?", ("Projeto A",))
    projeto_id = cursor.fetchone()[0]

    # Inserir atividade
    cursor.execute("INSERT INTO Atividade (descricao, status, projeto_id) VALUES (?, ?, ?)",
                   ("Atividade 1", "pendente", projeto_id))
    conn.commit()

    # Atualizar líder
    cursor.execute("UPDATE Projeto SET lider = ? WHERE id = ?", ("Maria", projeto_id))
    conn.commit()

    # Listar projetos e atividades
    cursor.execute("""
        SELECT p.nome, p.lider, a.descricao, a.status
        FROM Projeto p
        LEFT JOIN Atividade a ON p.id = a.projeto_id
    """)
    for row in cursor.fetchall():
        print(row)

except Exception as e:
    print("Erro:", e)
finally:
    cursor.close()
    conn.close()
