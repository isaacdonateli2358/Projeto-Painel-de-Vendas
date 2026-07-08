CREATE TABLE d_canal (
    id_canal INT AUTO_INCREMENT PRIMARY KEY,
    canal_de_venda VARCHAR(100)
);
INSERT INTO d_canal (canal_de_venda)
SELECT DISTINCT
    canal_de_venda
FROM base_vendas
WHERE canal_de_venda IS NOT NULL;
SELECT COUNT(*) FROM d_canal;
SELECT * FROM d_canal;