SELECT 
    c.canal_de_venda,
    SUM(f.conversao_monetaria_receita) AS receita_total
FROM f_vendas f
JOIN d_canal c 
    ON f.id_canal = c.id_canal
GROUP BY c.canal_de_venda
ORDER BY receita_total DESC;