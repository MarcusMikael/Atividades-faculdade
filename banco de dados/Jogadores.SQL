-- create
CREATE TABLE EQUIPE (
id_equipe SERIAL PRIMARY KEY,
nome_equipe Varchar (100) NOT NULL,
descricao_equipe Varchar (100) NOT NULL
);

CREATE TABLE JOGADORES (
id_jogador SERIAL PRIMARY KEY,
nome_jogador Varchar (100) NOT NULL,
nivel_jogador INTEGER NOT NULL CHECK (nivel_jogador BETWEEN 1 AND 100),
email_jogador Varchar(30) unique NOT NULL,
data_nascimento date NOT NULL,
pontuacao_total Integer default 0,
Fk_cod_equipe INTEGER NOT NULL,
foreign KEY (Fk_cod_equipe) references EQUIPE(id_equipe)
);

-- Adicionar coluna na tabela 
alter TABLE JOGADORES add column apelido Varchar(30);

-- Inserir dados nas tabelas
INSERT INTO EQUIPE (nome_equipe, descricao_equipe) VALUES
('Dragões', 'Time de elite'),
('Falcões', 'Time rápido e ágil'),
('Flamengo', 'Time de força e resistência'),
('Espectros', 'Equipe misteriosa e estratégica');
INSERT INTO JOGADORES (nome_jogador, apelido, nivel_jogador, email_jogador, data_nascimento, pontuacao_total, Fk_cod_equipe)
VALUES 
('Amanda', 'Manda', 40, 'amanda@gmail.com', '2000-10-10', 100, 1 ),
('Felipe', 'Lipe', 50, 'felipe@gmail.com', '1995-12-01', 120, 2 ),
('Lucas', 'Luqueta', 60, 'lucas@gmail.com', '1997-09-12', 90, 1 ),
('Marcus', 'Marcão', 90, 'marcus@gmail.com', '2005-10-20', 180, 3),
('Anderson', 'X', 80, 'anderon@gmail.com', '1990-04-09', 100, 3);

-- Mostra tabelas
select * from EQUIPE;
select * from JOGADORES;

-- Atualizar JOGADORES
SELECT JOGADORES.nome_jogador, EQUIPE.nome_equipe
FROM JOGADORES
JOIN EQUIPE ON JOGADORES.fk_cod_equipe = EQUIPE.id_equipe;

UPDATE JOGADORES 
SET fk_cod_equipe = 1
WHERE nome_jogador = 'Felipe';
SELECT * FROM JOGADORES WHERE nome_jogador = 'Felipe';

-- Deletar Jogador
DELETE FROM JOGADORES WHERE nome_jogador = 'Lucas';

SELECT * FROM JOGADORES;
SELECT * FROM EQUIPE;
