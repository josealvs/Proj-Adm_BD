## LINKS
[Script ODBC](https://github.com/josealvs/Proj-Adm_BD/blob/main/tarefas/orm/odbc_program.py)
[Script1 ORM Django](https://github.com/josealvs/Proj-Adm_BD/blob/main/tarefas/orm/atividades/insert_atividade.py)
[Script2 ORM Django](https://github.com/josealvs/Proj-Adm_BD/blob/main/tarefas/orm/atividades/insert_lider.py)
[Script3 ORM Django](https://github.com/josealvs/Proj-Adm_BD/blob/main/tarefas/orm/atividades/select_all_projects.py)

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

## 🧱 Resumo sobre ORM em Django


O Django possui um ORM (Object-Relational Mapper) nativo e poderoso, que permite trabalhar com tabelas do banco de dados como se fossem objetos Python. Ele abstrai SQL cru, melhora a legibilidade e segurança da aplicação, e integra-se diretamente ao sistema de migrações e validação do Django.

Exemplo:

```python
# models.py
from django.db import models

class Projeto(models.Model):
    nome = models.CharField(max_length=100)

class Atividade(models.Model):
    descricao = models.TextField()
    projeto = models.ForeignKey(Projeto, on_delete=models.CASCADE)
```

Com isso, é possível realizar operações como:

```python
from app.models import Projeto

projetos = Projeto.objects.all()

```
