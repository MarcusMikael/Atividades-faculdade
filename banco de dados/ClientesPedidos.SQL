-- Criação de tabelas

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE DEFAULT CURRENT_DATE,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

-- Inserir dados nas tabelas

INSERT INTO clientes (nome, email) VALUES 
('João Silva', 'joao.silva@email.com'),
('Maria Oliveira', 'maria.oliveira@email.com'),
('Carlos Santos', 'carlos.santos@email.com'),
('Ana Souza', 'ana.souza@email.com'),
('Pedro Rocha', 'pedro.rocha@email.com'),
('Marcus Mikael', 'marcus@gmail.com'),
('Anderson Soares', 'anderson@unifsa.com.br');

INSERT INTO pedidos (id_cliente, data_pedido, total) VALUES 
(1, '2024-03-01', 150.00),
(1, '2024-03-05', 200.00),
(2, '2024-03-10', 99.90),
(3, '2024-03-15', 350.50),
(4, '2024-03-20', 220.75),
(5, '2024-03-25', 180.30),
(2, '2024-04-01', 120.00),
(3, '2024-04-05', 450.00),
(1, '2024-04-10', 75.50),
(5, '2024-04-15', 90.00);

-- Passo 1
select * from clientes;

-- Passo 2
select * from pedidos;

-- Passo 3
-- DISTINCT -> Cliente apareça apenas uma vez
SELECT DISTINCT  c.nome, c.email
FROM clientes c, pedidos p
WHERE c.id_cliente = p.id_cliente;

-- Passo 4
-- select * from pedidos where id_cliente = 1;
SELECT p.id_pedido, p.data_pedido, p.total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE c.nome = 'João Silva';

-- Passo 5
select * from pedidos where total > 200.00;

-- Passo 6
select * from clientes where email like '%@email.com';

-- Passo 7
select * from pedidos where data_pedido BETWEEN '2024-03-01' AND '2024-03-15';

-- Passo 8
select * from pedidos where total BETWEEN 100.00 AND 300.00;

-- Passo 9
select * from cliente ORDER BY nome;

-- Passo 10
select * from pedidos ORDER BY total DESC;

-- Passo 11
select * from pedidos ORDER BY data_pedido DESC;

-- Passo 12
SELECT p.id_pedido, c.nome, p.data_pedido, p.total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente;

-- Passo 13
-- COUNT -> Contador de pedidos
-- AS -> Renomeia
-- LEFT JOIN -> Todos os clientes apareça
-- GROUP BY -> Agrupar
SELECT c.id_cliente, c.nome, COUNT(p.id_pedido) AS quantidade_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome;

-- Passo 14
-- SUM -> Calcular o total
SELECT c.id_cliente, c.nome, SUM(p.total) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome;

-- Passo 15
SELECT c.id_cliente, c.nome
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- Passo 16
SELECT COUNT(id_pedido) AS total_pedidos
FROM pedidos;

-- Passo 17
-- AVG -> Calcula a media
SELECT AVG(total) AS valor_medio_pedidos
FROM pedidos;

-- Passo 18
-- MAX -> Retorna maior valor
-- MIN -> Retorna menor valor
SELECT MAX(total) AS maior_valor_pedido, MIN(total) menor_valor_pedido
FROM pedidos;

-- Passo 19
-- HAVING -> Filtra os resultados
SELECT c.id_cliente, c.nome, SUM(p.total) AS total_gasto
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING SUM(p.total) > 300;

-- Passo 20
-- EXTRACT -> extrair partes de uma data
SELECT EXTRACT(MONTH FROM data_pedido) as mes, COUNT(id_pedido) AS quantidade_pedidos
FROM pedidos
GROUP BY EXTRACT(MONTH FROM data_pedido)
ORDER BY mes;
