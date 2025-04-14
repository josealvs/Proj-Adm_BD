INSERT INTO departamento (descricao) VALUES
('TI'),
('Gente e Gestão'),
('Financeiro'),
('Vendas'),
('Comercial'),
('Logística'),
('Frota');

INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_depto) VALUES
('Ana', 'F', '1990-05-21', 4500, 1),    -- TI(Gerente)
('Carlos', 'M', '1988-11-30', 6000, 1), -- TI
('Marina', 'F', '1992-07-15', 5000, 2), -- Gente e Gestão(Gerente)
('João', 'M', '1985-03-10', 5500, 3),   -- Financeiro
('Luana', 'F', '1995-09-25', 4700, 4),  -- Vendas
('Bruno', 'M', '1987-08-19', 6200, 5),  -- Comercial
('Paula', 'F', '1993-12-12', 4800, 6);  -- Logística

UPDATE departamento SET cod_gerente = 1 WHERE codigo = 1; 
UPDATE departamento SET cod_gerente = 3 WHERE codigo = 2; 

INSERT INTO projeto (nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
('Sistema X', 'Desenvolvimento do sistema X', 1, 2, '2024-01-10', '2024-12-10'),
('Intranet GG', 'Nova intranet para Gente e Gestão', 2, 3, '2024-02-01', '2024-11-30'),
('App Financeiro', 'Aplicativo para relatórios financeiros', 3, 4, '2024-03-01', '2024-09-30'),
('Portal Vendas', 'Portal de pedidos e metas', 4, 5, '2024-04-01', '2024-10-31'),
('CRM Comercial', 'Sistema de CRM para equipe comercial', 5, 6, '2024-05-01', '2024-12-01');

INSERT INTO atividade (nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
('Análise', 'Análise de requisitos', 1, '2024-01-15', '2024-02-15'),
('Design', 'Criação do layout', 2, '2024-02-20', '2024-03-20'),
('Teste', 'Testes de integração', 3, '2024-04-01', '2024-05-01'),
('Implantação', 'Deploy em produção', 2, '2024-05-15', '2024-06-15'),
('Treinamento', 'Treinamento dos usuários', 4, '2024-06-20', '2024-07-20');

-- Atividades em Projetos (6 registros, distribuídas)
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1), -- Sistema X - Análise
(1, 2), -- Sistema X - Design
(2, 3), -- Intranet GG - Teste
(3, 4), -- App Financeiro - Implantação
(4, 5), -- Portal Vendas - Treinamento
(5, 1); -- CRM Comercial - Análise (reusada)
