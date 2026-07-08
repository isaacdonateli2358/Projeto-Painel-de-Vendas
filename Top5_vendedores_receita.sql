SELECT 
    v.nome_vendedor,
    SUM(f.conversao_monetaria_receita) AS receita_total
FROM f_vendas f
JOIN d_vendedor v 
    ON f.id_vendedor = v.id_vendedor
GROUP BY v.nome_vendedor
ORDER BY receita_total DESC
LIMIT 5;