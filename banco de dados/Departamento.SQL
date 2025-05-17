CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE Empregado (
    id_empregado INT PRIMARY KEY,
    nome VARCHAR(100),
    salario DECIMAL(10,2),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

-- Departamentos
INSERT INTO Departamento (id_departamento, nome) VALUES
(1, 'TI'),
(2, 'RH'),
(3, 'Financeiro');

-- Empregados
INSERT INTO Empregado (id_empregado, nome, salario, id_departamento) VALUES
(1, 'Ana', 5000, 1),
(2, 'Bruno', 3000, 2),
(3, 'Carlos', 4500, 1),
(4, 'Diana', 7000, 3),
(5, 'Eduarda', 3200, 2),
(6, 'Felipe', 4000, 3);

-- SEGUNDA PARTE
CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Inserts
INSERT INTO Produto (id_produto, nome, preco) VALUES
(1, 'Camiseta', 49.90),
(2, 'Calça Jeans', 89.90),
(3, 'Tênis', 159.90),
(4, 'Boné', 29.90),
(5, 'Jaqueta', 199.90);

CREATE TABLE Venda (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Inserts
INSERT INTO Venda (id_venda, id_produto, quantidade, data_venda) VALUES
(1, 1, 2, '2025-01-10'),
(2, 2, 1, '2025-01-15'),
(3, 3, 1, '2025-02-20'),
(4, 4, 3, '2025-03-01'),
(5, 5, 1, '2025-03-10');


select * from departamento
select * from empregado
select * from produto
select * from venda

--
select nome
from empregado
where id_departamento = 1;
--
select e.nome AS empregado, d.nome AS departamento
from Empregado e
JOIN Departamento d ON e.id_departamento = d.id_departamento;
--

SELECT AVG(salario) FROM empregado
--
select nome AS Empregado, salario
from Empregado 
where salario > (
select AVG(salario) FROM Empregado
) and salario < 7000;
--
select id_departamento
from departamento 
where nome = 'RH' or nome = 'TI';

select id_departamento
from departamento 
where id_departamento IN(1,2);
--
SELECT nome
from empregado
where id_departamento IN (
SELECT id_departamento
FROM departamento
WHERE nome = 'RH' or nome = 'TI'
);
--
SELECT id_departamento
from empregado
where nome = 'Carlos';

SELECT nome
from empregado
where id_departamento = (
SELECT id_departamento
from empregado
where nome = 'Carlos'
);
--
select salario 
from empregado
where nome = 'Ana'

SELECT e.nome, e.salario
FROM empregado e
WHERE salario < (
SELECT salario 
FROM empregado
WHERE nome
--
SELECT nome, salario
FROM empregado 
WHERE salario BETWEEN
(SELECT MIN(salario) FROM empregado)
AND
(SELECT	MAX(salario) FROM empregado);
--
SELECT nome, salario
FROM empregado
WHERE salario < (
SELECT AVG(salario)
FROM empregado
)
OR id_departamento = (
SELECT id_departamento FROM departamento WHERE nome = 'RH'
);
--
SELECT nome
FROM empregado
WHERE id_departamento IN (
SELECT id_departamento
FROM empregado
GROUP BY id_departamento 
HAVING COUNT(*) > 1
);
--
SELECT nome, salario,
(SELECT MAX(salario) FROM empregado) AS maior_salario
from empregado;
--

select * from produto

select preco
from produto 
where nome = 'Camiseta'

select nome, preco
from produto
where preco > (
select preco
from produto 
where nome = 'Camiseta'
);
