create view gerentes as
SELECT d.codGerente
    FROM departamento d
    WHERE d.codGerente IS NOT NULL;

SELECT f.nome, f.salario,f.codigo
FROM funcionario f
JOIN departamento d ON f.codDepto = d.codigo
WHERE f.codigo NOT IN (
    SELECT * from gerentes
)
ORDER BY d.codigo;