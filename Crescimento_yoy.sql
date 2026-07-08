SELECT 
    t.ano,
    SUM(f.conversao_monetaria_receita) AS receita,
    LAG(SUM(f.conversao_monetaria_receita)) 
        OVER (ORDER BY t.ano) AS receita_ano_anterior,
    ROUND(
        (
            SUM(f.conversao_monetaria_receita) -
            LAG(SUM(f.conversao_monetaria_receita)) 
                OVER (ORDER BY t.ano)
        ) /
        LAG(SUM(f.conversao_monetaria_receita)) 
            OVER (ORDER BY t.ano) * 100,
        2
    ) AS crescimento_percentual
FROM f_vendas f
JOIN d_tempo t ON f.id_tempo = t.id_tempo
GROUP BY t.ano
ORDER BY t.ano;