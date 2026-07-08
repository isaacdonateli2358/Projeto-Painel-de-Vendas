CREATE TABLE d_moeda (
    id_moeda INT AUTO_INCREMENT PRIMARY KEY,
    moeda VARCHAR(50),
    simbolo_moeda VARCHAR(10)
);
INSERT INTO d_moeda (moeda, simbolo_moeda)
SELECT DISTINCT
    moeda,
    simbolo_moeda
FROM base_vendas
WHERE moeda IS NOT NULL;
SELECT COUNT(*) FROM d_moeda;
SELECT * FROM d_moeda;