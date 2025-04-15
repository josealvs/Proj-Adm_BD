SELECT 
    p.nome AS nome_projeto,
    p.data_inicio AS projeto_inicio,
    p.data_fim AS projeto_fim,
    a.nome AS nome_atividade,
    a.data_inicio AS atividade_inicio,
    a.data_fim AS atividade_fim
FROM projeto p
JOIN atividade_projeto ap ON p.codigo = ap.cod_projeto
JOIN atividade a ON ap.cod_atividade = a.codigo
WHERE 
    a.data_inicio < p.data_inicio
    OR a.data_fim > p.data_fim;
