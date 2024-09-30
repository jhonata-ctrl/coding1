jhonata teles: CREATE SCHEMA mercado_bd;
USE mercado_bd;
-- CRIANDO TABELAS
CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    categoria VARCHAR(100),
    preco DECIMAL(10,10),
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
('TSmart TV 50" 4K UHD LED Samsung 50DU7700- Wi-Fi Bluetooth Alexa 3 HDMI', 'TV', 2.299.08, 90),
('Xbox Series S Nova Geração 512GB SSD - 1 Controle Branco Microsoft', 'VIDEOGAME', 2.882,07, 68),
('Monitor Gamer Pichau Centauri Pulse Pro 27, 27 Pol, IPS, 2K, 1ms, 240Hz, FreeSync, HDMI/DP, PG-CTPROS27-BL01', 'MONITOR', 1.499,99, 60),
('Telefone Com Fio Intelbras Pleno - Preto', 'TELEFONE FIXO', 72.00, 99),
('Apple iPad 10,9" (10ª geração, Wi-Fi, 64GB) - Azul', 'TABLET', 3.399,00, 30),
('Lousa eletronica unionboard color cinza 82 polegadas','LOUSA ELETRONICA', 3.890,00, 15);
INSERT INTO clientes(nome, email, telefone)
VALUES
('Cezar Guilherme','cezarguilherme2005@gmail.com','(81) 9 3274-4585'),
('Paulo','paulo203@gmail.com','(81) 9 5423-6789'),
('Tereza','tereza192@gmail.com','(43) 9 3875-3473'),
('Kelly','kelly003@gmail.com','(51) 9 9876-8357'),
('Bruno','bruno4493@gmail.com','(69) 9 3845-3855');
INSERT INTO vendas (id_produto, id_cliente, quantidade, data_venda)
VALUES
    (1, 1, 2, '2024-09-01'), -- Cezar Guilherme comprou 2 TV Samsung
    (2, 2, 1, '2024-09-01'), -- Paulo comprou 1 Lousa Eletronica
    (3, 3, 3, '2024-09-03'), -- Kelly comprou 3 Apple Pad
    (4, 4, 5, '2024-09-01'), -- Bruno comprou 5 Monitor gamer
    (5, 5, 4, '2024-09-03'), -- Tereza comprou 4 XBOX SERIES S 
    (1, 3, 1, '2024-09-01'), -- Kelly comprou 1 TV Samsung
    (6, 1, 10, '2024-09-07'), -- Cezar Guilherme  comprou 10 Telefone com fio
    (3, 4, 6, '2024-09-01'), -- Bruno comprou 6 Apple Pad
    (2, 5, 2, '2024-09-03'), -- Tereza comprou 2 Lousa ELetronica
    (4, 2, 1, '2024-09-01'); -- Paulo comprou 1 Monitor Gamer
-- Atulizar preço/telefone
UPDATE produtos SET preco = 80.99
WHERE id_produto = 1;
UPDATE clientes SET telefone = '(62) 9 8625-5622'
WHERE id_cliente = 1; 
-- Removendo dados
DELETE FROM vendas WHERE id_vendas = 1;
DELETE FROM clientes WHERE id_cliente = 1;
-- Ordernar valores
SELECT preco FROM produtos ORDER BY preco ASC;
-- Consultas
SELECT * FROM produtos WHERE categoria = 'Telefone';
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
SELECT * FROM vendas:
