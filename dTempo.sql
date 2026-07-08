CREATE TABLE d_tempo (
    id_tempo INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    ano INT,
    mes INT,
    nome_mes VARCHAR(20),
    trimestre INT,
    dia INT,
    dia_semana INT,
    nome_dia_semana VARCHAR(20),
    fim_de_semana BOOLEAN
);
INSERT INTO d_tempo (
    data,
    ano,
    mes,
    nome_mes,
    trimestre,
    dia,
    dia_semana,
    nome_dia_semana,
    fim_de_semana
)
SELECT DISTINCT
    DATE(data) AS data,
    YEAR(DATE(data)) AS ano,
    MONTH(DATE(data)) AS mes,
    MONTHNAME(DATE(data)) AS nome_mes,
    QUARTER(DATE(data)) AS trimestre,
    DAY(DATE(data)) AS dia,
    DAYOFWEEK(DATE(data)) AS dia_semana,
    DAYNAME(DATE(data)) AS nome_dia_semana,
    CASE 
        WHEN DAYOFWEEK(DATE(data)) IN (1,7)
        THEN TRUE
        ELSE FALSE
    END AS fim_de_semana
FROM base_vendas
WHERE data IS NOT NULL;
SELECT COUNT(*) FROM d_tempo;
SELECT * FROM d_tempo LIMIT 5;
