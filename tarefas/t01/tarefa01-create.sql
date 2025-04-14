CREATE TABLE departamento (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100),
    cod_gerente INT,
    FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo) on delete set null on update cascade

);

CREATE TABLE funcionario (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    sexo CHAR(1),
    dt_nasc DATE,
    salario NUMERIC(10,2),
    cod_depto INT,
	FOREIGN KEY (codDepto) REFERENCES departamento(codigo) on delete set null on update cascade
);

CREATE TABLE projeto (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    cod_depto INT,
    cod_responsavel INT REFERENCES funcionario(codigo),
    data_inicio DATE,
    data_fim DATE,
    UNIQUE KEY projNome(nome),
    FOREIGN KEY (codDepto) REFERENCES departamento(codigo) on delete set null on update cascade
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo) on delete set null on update cascade

);

CREATE TABLE atividade (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),  
    descricao TEXT,
    cod_responsavel INT,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo)

);

CREATE TABLE atividade_projeto (
    cod_projeto INT,
    cod_atividade INT,
    PRIMARY KEY (cod_projeto, cod_atividade),
    FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo) on delete set null on update cascade
    FOREIGN KEY (cod_atividade) REFERENCES departamento(codigo) on delete set null on update cascade

);