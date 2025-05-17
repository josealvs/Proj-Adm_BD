import pyodbc

conn = pyodbc.connect(
    'DRIVER={PostgreSQL Unicode};SERVER=localhost;PORT=5432;DATABASE=AtividadesBD;UID=atividades_user;PWD=senha123'
)
cursor = conn.cursor()

# Inserir uma atividade
cursor.execute("INSERT INTO Projeto (nome, lider) VALUES (%s, %s)", ("Projeto A", "João"))
conn.commit()
projeto_id = cursor.execute("SELECT id FROM Projeto WHERE nome = %s", ("Projeto A",)).fetchone()[0]
cursor.execute("INSERT INTO Atividade (descricao, status, projeto_id) VALUES (%s, %s, %s)", ("Atividade 1", "pendente", projeto_id))
conn.commit()

# Atualizar líder
cursor.execute("UPDATE Projeto SET lider = %s WHERE id = %s", ("Maria", projeto_id))
conn.commit()

# Listar projetos e suas atividades
cursor.execute("""
    SELECT p.nome, p.lider, a.descricao, a.status
    FROM Projeto p
    LEFT JOIN Atividade a ON p.id = a.projeto_id
""")
for row in cursor.fetchall():
    print(row)

cursor.close()
conn.close()
