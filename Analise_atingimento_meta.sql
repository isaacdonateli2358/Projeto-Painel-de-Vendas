SELECT 
    v.nome_vendedor,
    t.ano,
    t.mes,
    SUM(f.conversao_monetaria_receita) AS receita_mes,
    SUM(DISTINCT f.meta_mensal_vendedor) AS soma_metas_mes,
    ROUND(
        (SUM(f.conversao_monetaria_receita) /
         SUM(DISTINCT f.meta_mensal_vendedor)) * 100, 2
    ) AS perc_atingimento_mes
FROM f_vendas f
JOIN d_vendedor v 
    ON f.id_vendedor = v.id_vendedor
JOIN d_tempo t
    ON f.id_tempo = t.id_tempo
GROUP BY v.nome_vendedor, t.ano, t.mes
ORDER BY perc_atingimento_mes DESC;
SELECT 
    v.nome_vendedor,
    ROUND(
        (SUM(f.conversao_monetaria_receita) /
         SUM(DISTINCT f.meta_mensal_vendedor)) * 100, 2
    ) AS perc_total
FROM f_vendas f
JOIN d_vendedor v 
    ON f.id_vendedor = v.id_vendedor
GROUP BY v.nome_vendedor
ORDER BY perc_total DESC;
SELECT 
    t.ano,
    COUNT(*) AS qtd_registros,
    SUM(f.conversao_monetaria_receita) AS receita_total,
    SUM(DISTINCT f.meta_mensal_vendedor) AS meta_total
FROM f_vendas f
JOIN d_tempo t ON f.id_tempo = t.id_tempo
GROUP BY t.ano;
SELECT 
    t.mes,
    COUNT(*) AS qtd_registros
FROM f_vendas f
JOIN d_tempo t ON f.id_tempo = t.id_tempo
WHERE t.ano = 2026
GROUP BY t.mes
ORDER BY t.mes;