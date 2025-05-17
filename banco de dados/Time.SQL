-- Usuario da rede social
CREATE TABLE usuario (
id SERIAL PRIMARY KEY,
nome VARCHAR(100),
email VARCHAR(100) UNIQUE,
data_nascimento DATE
);

-- Publicações(tweets)
CREATE TABLE tweet (
id SERIAL PRIMARY KEY,
usuario_id INTEGER REFERENCES usuario(id),
conteudo TEXT,
data_publicacao TIMESTAMP
);

-- Curtidas tweets
CREATE TABLE curtida (
id SERIAL PRIMARY KEY,
usuario_id INTEGER REFERENCES usuario(id),
tweet_id INTEGER REFERENCES tweet(id),
data_curtida TIMESTAMP
);

-- Seguidores(relacionamento entre ususario)
CREATE TABLE seguidor (
id SERIAL PRIMARY KEY,
seguidor_id INTEGER REFERENCES usuario(id),
seguido_id INTEGER REFERENCES usuario(id),
data_inicio DATE DEFAULT CURRENT_DATE
);

-- Comentario
CREATE TABLE comentario (
id SERIAL PRIMARY KEY,
tweet_id INTEGER REFERENCES tweet(id),
usuario_id INTEGER REFERENCES usuario(id),
conteuto TEXT VARCHAR(200),
data_comentario DATE
);

-- Adiciona a bio do perfil do usuario
ALTER TABLE usuario ADD COLUMN bio TEXT;

-- Altera o tipo do campo do "conteudo" do tweet para limitar a 280 caracteres
ALTER TABLE tweet ALTER COLUMN conteudo TYPE VARCHAR(280);

-- Inserindo usuarios
INSERT INTO usuario (nome,email, data_nascimento, bio) VALUES
('Alice', 'alice@emalil.com','2000-05-10', 'Amante de tecnologia'),
('Bob', 'bob@email.com', '1998-12-22', 'Futebol e programação'),
('Carol', 'carol@email.com', '2002-03-15', 'Café e livros');

-- Tweets
INSERT INTO tweet(usuario_id, conteudo) VALUES
(1, 'Primeiro tweet da Alice!'),
(2, 'Programando em SQL é top!'),
(1, 'SQL + café = <3');

-- curtidas
INSERT INTO curtida(usuario_id, tweet_id) VALUES
(2,1),
(3,1),
(3,2);

-- seguidores
INSERT INTO seguidor(seguidor_id, seguido_id) VALUES
(2,1),
(3,1),
(1,3);

-- Atualizando registros
UPDATE usuario
SET nome = 'Bob Silva'
WHERE id = 2;

-- Excluir um tweet especifico
DELETE FROM tweet
WHERE id = 7;

-- Usuario com nome começando com "A"
SELECT * FROM usuario WHERE nome LIKE 'A%';

-- Tweets contendo "SQL"
SELECT * FROM tweet WHERE conteudo LIKE '%sql%';

-- Tweets publicados após uma certa data
SELECT * FROM tweet WHERE data_publicacao > '2025-01-01';

-- Usuários nascidos após 2001
SELECT * FROM usuario WHERE data_nascimento > '2001-12-31';

-- Usuarios cujo nome começa com "C" e nasceram antes de 2001
SELECT * FROM usuario
WHERE nome NOT LIKE 'C%' AND data_nascimento < '2001-01-01';

-- Tweets com "cafe" ou "SQL"
SELECT * FROM tweet
WHERE conteudo ILIKE '%café%' OR conteudo ILIKE '%sql%';

-- Ordenar usuarios pelo nome
SELECT * FROM usuario ORDER BY nome;

-- Tweets ordenados da publicação mais recente para a mais antiga
SELECT * FROM tweet ORDER BY data_publicacao DESC;

-- Descricao do twitter
SELECT u.nome AS nome_usuario, t.conteudo AS tweet
FROM usuario u JOIN tweet t ON u.id = t.usuario_id;

-- Mostrar quem curtiu quais tweets:
SELECT u.nome AS quem_curtiu, t.conteudo AS tweet_curtida
FROM curtida c
INNER JOIN usuario u ON c.usuario_id = u.id
INNER JOIN tweet t ON c.tweet_id = t.id;

-- Quantidade total de tweets por usuário
SELECT u.nome, COUNT(t.id) AS total_tweets
FROM usuario u
LEFT JOIN tweet t ON u.id = t.usuario_id
GROUP BY u.nome;

-- Mostrar seguidores de cada usuário (quem segue quem):
SELECT s1.nome AS seguidor, s2.nome AS seguido
FROM seguidor seg
INNER JOIN usuario s1 ON seg.seguidor_id= s1.id
INNER JOIN usuario s2 ON seg.seguido_id = s2.id;

-- Quem são os seguidores de Alice?
SELECT u2.nome AS seguidor
FROM usuario u1
JOIN seguidor s ON u1.id = s.seguido_id
JOIN usuario u2 ON u2.id= s.seguidor_id
WHERE u1.nome = 'Alice';

-- Mostrar o nome do usuário e a qtde de curtidas de seus tweets
SELECT u.nome, COUNT(c.id) AS total_curtidas
FROM usuario u
INNER JOIN tweet t ON u.id = t.usuario_id
INNER JOIN curtida c ON t.id = c.tweet_id
GROUP BY u.nome;

--Tweets com mais de 1 curtida
SELECT t.conteudo, COUNT(c.id) AS curtidas
FROM tweet t
JOIN curtida c ON t.id = c.tweet_id
GROUP BY t.id
HAVING COUNT(c.id) > 1;

-- Usuários com mais de 1 seguidor
SELECT u.nome, COUNT(s.id) AS total_seguidore
FROM usuario u
JOIN seguidor s ON u.id = s.seguido_id
GROUP BY u.nome
HAVING COUNT(s.id) > 1;

-- Tweets que não receberam nenhuma curtida
SELECT t.*
FROM tweet t
LEFT JOIN curtida c ON t.id = c.tweet_id
WHERE c.id IS NULL;

--Mostrar o usuário que mais curtiu tweets
SELECT u.nome, COUNT(c.id) AS total_curtidas
FROM usuario u
JOIN curtida c ON u.id = c.usuario_id
GROUP BY u.nome
ORDER BY total_curtidas DESC
LIMIT 1;

-- Mostrar tweets e o nome de quem os curtiu (nome do autor e nome do fã):
SELECT autor.nome AS autor_do_tweet, t.conteudo, fa.nome AS quem_curtiu
FROM curtida c
INNER JOIN tweet t ON c.tweet_id = t.id
INNER JOIN usuario autor ON t.usuario_id = autor.id
INNER JOIN usuario fa ON c.usuario_id = fa.id;

-- Exibir o nome do autor e conteúdo dos tweets curtidos por Carol
SELECT u.nome AS autor, t.conteudo
FROM curtida c
JOIN tweet t ON c.tweet_id = t.id
JOIN usuario u ON t.usuario_id = u.id
WHERE c.usuario_id = (
SELECT id FROM usuario WHERE nome = 'Carol'
);
