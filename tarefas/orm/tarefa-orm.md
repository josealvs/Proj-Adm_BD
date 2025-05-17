
## 📚 Resumo sobre ODBC em Python

ODBC (Open Database Connectivity) é uma API padrão para acesso a bancos de dados. Em Python, pode-se utilizar o pacote `pyodbc`, que fornece uma maneira de conectar, executar comandos SQL e interagir diretamente com um banco como o PostgreSQL.

Apesar de PostgreSQL oferecer drivers nativos, ODBC ainda é uma alternativa para integração com sistemas legados ou portabilidade entre SGBDs.

Exemplo:
```python
import pyodbc

conn = pyodbc.connect(
    "DRIVER={PostgreSQL Unicode};"
    "SERVER=localhost;"
    "PORT=5432;"
    "DATABASE=AtividadesBD;"
    "UID=admin;"
    "PWD=admin123"
)
cursor = conn.cursor()
cursor.execute("SELECT * FROM projetos")
for row in cursor.fetchall():
    print(row)
```

