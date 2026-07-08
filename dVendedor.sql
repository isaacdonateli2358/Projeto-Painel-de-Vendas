CREATE TABLE d_vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_vendedor VARCHAR(150)
);
INSERT INTO d_vendedor (nome_vendedor)
SELECT DISTINCT
    nome_vendedor
FROM base_vendas
WHERE nome_vendedor IS NOT NULL;
SELECT COUNT(*) FROM d_vendedor;
SELECT * FROM d_vendedor