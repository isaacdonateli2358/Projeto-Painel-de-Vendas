CREATE TABLE d_localizacao (
    id_localizacao INT AUTO_INCREMENT PRIMARY KEY,
    cidade VARCHAR(100),
    estado VARCHAR(100),
    pais VARCHAR(100)
);
INSERT INTO d_localizacao (cidade, estado, pais)
SELECT DISTINCT
    cidade,
    estado,
    pais
FROM base_vendas
WHERE cidade IS NOT NULL;
SELECT COUNT(*) FROM d_localizacao;
SELECT * FROM d_localizacao;