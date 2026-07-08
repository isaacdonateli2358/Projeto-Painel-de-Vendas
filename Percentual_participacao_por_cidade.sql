SELECT 
    cidade,
    receita_total,
    (receita_total / receita_geral) * 100 AS perc_participacao
FROM (
    SELECT 
        loc.cidade,
        SUM(f.conversao_monetaria_receita) AS receita_total,
        (SELECT SUM(conversao_monetaria_receita) FROM f_vendas) AS receita_geral
    FROM f_vendas f
    JOIN d_loja l 
        ON f.id_loja = l.id_loja
    JOIN d_localizacao loc
        ON l.id_localizacao = loc.id_localizacao
    GROUP BY loc.cidade
) AS t
ORDER BY perc_participacao DESC;