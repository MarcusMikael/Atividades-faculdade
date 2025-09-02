-- Criando tabela de autores
CREATE TABLE autor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criando tabela de livros
CREATE TABLE livro (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    id_autor INT NOT NULL REFERENCES autor(id),
    ano_publicacao INT
);

-- Criando tabela de usuários
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criando tabela de empréstimos
CREATE TABLE emprestimo (
    id SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuario(id),
    id_livro INT NOT NULL REFERENCES livro(id),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE
);

-- Inserindo autores
INSERT INTO autor (nome) VALUES
('Machado de Assis'),
('J. K. Rowling'),
('George Orwell'),
('Clarice Lispector');

-- Inserindo livros
INSERT INTO livro (titulo, id_autor, ano_publicacao) VALUES
('Dom Casmurro', 1, 1899),
('Harry Potter e a Pedra Filosofal', 2, 1997),
('1984', 3, 1949),
('A Hora da Estrela', 4, 1977),
('Harry Potter e a Câmara Secreta', 2, 1998);

-- Inserindo usuários
INSERT INTO usuario (nome) VALUES
('Ana'),
('Bruno'),
('Carla'),
('Diego');

-- Inserindo empréstimos
INSERT INTO emprestimo (id_usuario, id_livro, data_emprestimo, data_devolucao) VALUES
(1, 1, '2025-08-01', '2025-08-10'),
(2, 2, '2025-08-02', NULL),
(3, 3, '2025-08-05', '2025-08-15'),
(1, 5, '2025-08-07', NULL),
(4, 4, '2025-08-08', NULL);

-- Exibir resultados
select * from autor
select * from livro
select * from usuario
select * from emprestimo
select * from livros_com_autores
select * from usuarios_com_emprestimos
select * from emprestimos_em_aberto
select * from historico_emprestimo
select * from qtd_emprestimos_por_usuario
select * from livros_mais_recentes
select * from usuarios_com_mais_de_um_emprestimo

-- Cadastro de usuario(PROCEDURE)
CREATE PROCEDURE cadastrar_usuario(p_usuario_nome VARCHAR(100))
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO usuario (nome) VALUES
(p_usuario_nome);
end;
$$;

CALL cadastrar_usuario('Marcus')

-- Registro de novo livro(PROCEDURE)
CREATE PROCEDURE cadastrar_livro(p_livro_id_autor INT, p_titulo VARCHAR(100), p_ano_publicacao INT)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO livro (id_autor, titulo, ano_publicacao) VALUES
(p_livro_id_autor, p_titulo, p_ano_publicacao);
END;
$$;

CALL cadastrar_livro (2, 'Marcus Mikael', 2025);

-- Registrar devolução(PROCEDURE)
CREATE PROCEDURE registrar_devolucao (p_emprestimo_id INT, p_data_devolucao DATE)
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE emprestimo
SET data_devolucao = p_data_devolucao
WHERE id = p_emprestimo_id;
END;
$$;

CALL registrar_devolucao(2, '2025-08-29');

-- Excluir usuário e seus empréstimos(PROCEDURE)
CREATE PROCEDURE excluir_usuario(p_usuario_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
DELETE FROM emprestimo WHERE id_usuario = p_usuario_id;
DELETE FROM usuario WHERE id = p_usuario_id;
END;
$$;

CALL excluir_usuario(1);

-- Livros com autores(VIEW)
CREATE VIEW livros_com_autores AS
SELECT l.titulo, a.nome as autor
FROM livro l
JOIN autor a ON l.id_autor = a.id;

-- Usuarios com empréstimos(VIEW)
CREATE VIEW usuarios_com_emprestimos as
SELECT u.nome, l.titulo as livro_emprestado
FROM emprestimo e
JOIN usuario u ON e.id_usuario = u.id
JOIN livro l ON e.id_livro = l.id;

-- Emprestimos em aberto(VIEW)
CREATE VIEW emprestimos_em_aberto as
SELECT u. nome, l.titulo, e.data_devolucao 
FROM emprestimo e
JOIN usuario u ON e.id_usuario = u.id
JOIN livro l ON e.id_livro = l.id
WHERE e.data_devolucao IS NULL;

-- Historicos de emprestimos(VIEW)
CREATE VIEW historico_emprestimo as
SELECT u.nome as usuario, a.nome as autor, l.titulo as livro, e.data_emprestimo
FROM emprestimo e
JOIN usuario u ON e.id_usuario = u.id
JOIN autor a ON e.id_usuario = u.id
JOIN livro l ON e.id_livro = l.id;

-- Emprestimo por usuario(VIEW)
CREATE VIEW qtd_emprestimos_por_usuario AS
SELECT u.nome AS usuario, COUNT(e.id) AS total_emprestimos
FROM usuario u
LEFT JOIN emprestimo e ON u.id = e.id_usuario
GROUP BY u.nome;

-- Livros mais recentes(Depois de 1950)(VIEW)
CREATE VIEW livros_mais_recentes as
SELECT a.nome as autor, l.titulo as livro, l.ano_publicacao
FROM livro l
JOIN autor a ON l.id_autor = a.id
WHERE l.ano_publicacao > 1950;

-- Usuarios com mais de um emprestimo(VIEW)
CREATE VIEW usuarios_com_mais_de_um_emprestimo as
SELECT u.nome AS usuario, COUNT(e.id) AS total_emprestimos
FROM usuario u
LEFT JOIN emprestimo e ON u.id = e.id_usuario
GROUP BY u.nome
HAVING COUNT(e.id) > 1;
