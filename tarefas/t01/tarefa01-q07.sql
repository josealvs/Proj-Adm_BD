CREATE OR REPLACE VIEW vw_total_funcionarios AS
SELECT 
    cod_depto,
    COUNT(*) AS total_funcionarios
FROM funcionario
GROUP BY cod_depto;

SELECT 
    d.descricao AS nome_departamento,
    g.nome AS nome_gerente,
    COALESCE(v.total_funcionarios, 0) AS num_funcionarios
FROM departamento d
LEFT JOIN funcionario g ON d.cod_gerente = g.codigo
LEFT JOIN vw_total_funcionarios v ON d.codigo = v.cod_depto;
