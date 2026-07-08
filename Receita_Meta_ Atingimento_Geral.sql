SELECT 
    SUM(conversao_monetaria_receita) AS receita_total,
    SUM(meta_mensal_vendedor) AS meta_total,
    ROUND(
        (SUM(conversao_monetaria_receita) /
         SUM(meta_mensal_vendedor)) * 100, 2
    ) AS perc_atingimento_geral
FROM (
    SELECT 
        id_vendedor,
        id_tempo,
        SUM(conversao_monetaria_receita) AS conversao_monetaria_receita,
        MAX(meta_mensal_vendedor) AS meta_mensal_vendedor
    FROM f_vendas
    GROUP BY id_vendedor, id_tempo
) AS sub;