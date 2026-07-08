SELECT 
    p.nome_produto,
    SUM(f.conversao_monetaria_receita) AS receita_total
FROM f_vendas f
JOIN d_produto p 
    ON f.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY receita_total DESC
LIMIT 5;