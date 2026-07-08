CREATE TABLE d_loja (
    id_loja INT AUTO_INCREMENT PRIMARY KEY,
    nome_loja VARCHAR(150),
    id_localizacao INT,
    FOREIGN KEY (id_localizacao) REFERENCES d_localizacao(id_localizacao)
);
INSERT INTO d_loja (nome_loja, id_localizacao)
SELECT DISTINCT
    b.nome_loja,
    l.id_localizacao
FROM base_vendas b
JOIN d_localizacao l
    ON b.cidade = l.cidade
    AND b.estado = l.estado
    AND b.pais = l.pais
WHERE b.nome_loja IS NOT NULL;
SELECT COUNT(*) FROM d_loja;
SELECT * FROM d_loja