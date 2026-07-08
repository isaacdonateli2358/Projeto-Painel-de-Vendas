SELECT 
    loc.estado,
    SUM(f.conversao_monetaria_receita) AS receita_total
FROM f_vendas f
JOIN d_loja l
    ON f.id_loja = l.id_loja
JOIN d_localizacao loc
    ON l.id_localizacao = loc.id_localizacao
GROUP BY loc.estado
ORDER BY receita_total DESC;