CREATE SCHEMA mercado_bd;
USE mercado_bd;
-- CRIANDO TABELAS
CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT
);
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(100)
);
CREATE TABLE vendas(
	id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    quantidade INT,
    data_venda DATE
);
-- INSERINDO DADOS
INSERT INTO produtos (nome, categoria, preco, estoque)
VALUES
('Samsung Galaxy S24 Ultra', 'Smartphone', 4750.99, 105),
('Fone de ouvido Bluetooth', 'Fones', 473.95, 205),
('Iphone 16Pro Max', 'Smartphone', 16.500 , 57),
('Teclado Gamer', 'Acessorios', 250.00, 15),
('Xiaomi Redmi Note 13', 'Smartphone', 1700.00, 102),
('Fonte 500W real','Acessorios', 678.99, 500);
INSERT INTO clientes(nome, email, telefone)
VALUES
('Carlos Jose','carlosjose@gamil.com','(81) 9 5545-4050'),
('Mário','mario@gmail.com','(81) 9 5423-6789'),
('Luigi','luigi@gmail.com','(33) 9 4321-1234'),
('Piache','piache@gmail.com','(51) 9 9876-6789'),
('Bauser','bauser@gmail.com','(53) 9 0987-4710');
INSERT INTO vendas (id_produto, id_cliente, quantidade, data_venda)
VALUES
    (1, 1, 2, '2024-09-01'), -- Carlos Jose comprou 2 Samsung
    (2, 2, 1, '2024-09-01'), -- Mário comprou 1 Fone de ouvido
    (3, 3, 3, '2024-09-03'), -- Luigi comprou 3 Iphones
    (4, 4, 5, '2024-09-01'), -- Piache comprou 5 Teclado Gamer
    (5, 1, 4, '2024-09-03'), -- Carlos Jose comprou 4 Xiaomi
    (1, 2, 1, '2024-09-01'), -- Mário comprou 1 Samsung
    (6, 3, 10, '2024-09-07'), -- Luigi comprou 10 Fonte
    (2, 4, 6, '2024-09-01'), -- Piache comprou 6 Fone
    (3, 5, 2, '2024-09-03'), -- Bauser comprou 2 Iphones
    (4, 1, 1, '2024-09-01'); -- Carlos Jose comprou 1 Teclado gamer
-- Atulizar preço/telefone
UPDATE produtos SET preco = 4780.45
WHERE id_produto = 3;
UPDATE clientes SET telefone = '(81) 9 555-798'
WHERE id_cliente = 1; 
-- Removendo dados
DELETE FROM vendas WHERE id_cliente = 1;
DELETE FROM clientes WHERE id_cliente = 1;
-- Ordernar valores
SELECT preco FROM produtos ORDER BY preco ASC;
-- Consultas
SELECT * FROM produtos WHERE categoria = 'Smartphone';
SELECT * FROM vendas WHERE data_venda = '2024-09-01';
SELECT id_produto, SUM(quantidade) AS total_vendas
FROM vendas
GROUP BY id_produto;
-- Calculando A receita total
SELECT
	clientes.id_cliente,
    clientes.nome,
    SUM(vendas.quantidade * produtos.preco) as receita_total
    FROM vendas
    JOIN produtos ON vendas.id_produto = produtos.id_produto
    JOIN clientes ON vendas.id_cliente = clientes.id_cliente
    GROUP BY clientes.id_cliente;
-- Ordenando na ordem Ascendente e Descendente
SELECT nome FROM produtos ORDER BY nome ASC;
SELECT nome FROM clientes ORDER BY nome DESC;
SELECT * FROM clientes;
SELECT * FROM vendas;