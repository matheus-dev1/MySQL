CREATE TABLE Produtos
(
Referencia VARCHAR(3) PRIMARY KEY,
Descricao VARCHAR(50) UNIQUE,
Estoque INT NOT NULL DEFAULT 0
);

INSERT INTO Produtos VALUES ('001', 'Feijão', 10);

INSERT INTO Produtos (referencia, descricao, estoque) VALUES ('002', 'Arroz', 5);

INSERT INTO Produtos VALUES ('003', 'Farinha', 15);

select * from produtos;

CREATE TABLE ItensVenda
(
Venda INT,
Produto VARCHAR(3),
Quantidade INT
);