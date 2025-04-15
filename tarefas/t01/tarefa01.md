## ✅Links

[📌Script de criação esquema relacional](https://github.com/josealvs/Proj-Adm_BD/blob/main/tarefas/t01/tarefa01-create.sql)

[📌Script de povoamento esquema relacional](https://github.com/josealvs/Proj-Adm_BD/blob/main/tarefas/t01/tarefa01-inserts.sql)

## 🔄 Sobre `NATURAL JOIN` e `CROSS JOIN`

### ✅ `NATURAL JOIN`

O `NATURAL JOIN` é uma junção automática entre tabelas baseada **nas colunas com o mesmo nome** em ambas as tabelas.

📌 O PostgreSQL identifica as colunas com o mesmo nome nas duas tabelas e realiza a junção implicitamente usando essas colunas.

#### 🧠 Exemplo:

```sql
SELECT * 
FROM funcionario 
NATURAL JOIN departamento;
```
Neste exemplo, como as duas tabelas compartilham a coluna `cod_depto`, o PostgreSQL irá utilizá-la automaticamente para fazer a junção.

Vantagens:

Código mais enxuto.

Útil em tabelas bem padronizadas.

Desvantagens:

Menos controle sobre quais colunas estão sendo usadas.

Pode causar erros se o schema mudar.

## ✅ CROSS JOIN
O `CROSS JOIN` gera o produto cartesiano entre duas tabelas, ou seja, todas as combinações possíveis entre as linhas de uma tabela e da outra.

🧠 Exemplo:
```sql
Copiar
Editar
SELECT f.nome, d.descricao 
FROM funcionario f 
CROSS JOIN departamento d;
```

Se houver 7 funcionários e 7 departamentos, o resultado será 49 linhas (7 x 7).

Quando usar?

Situações em que você quer todas as combinações possíveis (ex: comparar todos os pares possíveis de algo).

Cuidado: pode gerar um volume grande de dados muito rápido!

## 🧮 Sobre Window Functions no PostgreSQL
As Window Functions (funções de janela) permitem fazer cálculos sobre um conjunto de linhas relacionadas à linha atual, sem agrupá-las como nas funções agregadas (SUM, AVG, etc).

### ✅ Vantagens:
Você mantém todas as linhas.

Ideal para ranking, cálculos acumulados, comparações entre linhas, etc.

### ✳️ Sintaxe básica:
```sql
função_de_janela(...) OVER (
    PARTITION BY coluna
    ORDER BY coluna
)
```
### 🧠 Exemplo 1: Média salarial por departamento
```sql
SELECT 
  nome,
  cod_depto,
  salario,
  AVG(salario) OVER (PARTITION BY cod_depto) AS media_depto
FROM funcionario;
```
## ➡️ Calcula a média salarial por departamento e mostra junto com os dados individuais.

## 🧠 Exemplo 2: Ranking dos funcionários por salário
```sql
SELECT 
  nome,
  salario,
  RANK() OVER (ORDER BY salario DESC) AS ranking_salario
FROM funcionario;
```
## ➡️ Cria um ranking dos salários, do maior para o menor.

🔧 Funções mais comuns:
`ROW_NUMBER()`

`RANK()`, `DENSE_RANK()`

`LEAD()`, `LAG()` — ver valores anteriores ou posteriores

`SUM()`, `AVG()` — acumulado

## 💡 Window Functions são poderosas em análises avançadas e relatórios dinâmicos sem perder granularidade.


