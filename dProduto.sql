CREATE TABLE d_produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(150),
    categoria VARCHAR(100)
);
INSERT INTO d_produto (nome_produto, categoria)
SELECT DISTINCT
    produto_vendido,
    categoria
FROM base_vendas
WHERE produto_vendido IS NOT NULL;
SELECT COUNT(*) FROM d_produto;
SELECT * FROM d_produto