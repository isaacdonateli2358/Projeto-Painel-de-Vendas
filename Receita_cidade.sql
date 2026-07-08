SELECT 
    f.id_loja,
    l.nome_loja,
    loc.cidade,
    f.conversao_monetaria_receita
FROM f_vendas f
JOIN d_loja l 
    ON f.id_loja = l.id_loja
JOIN d_localizacao loc
    ON l.id_localizacao = loc.id_localizacao;
    SELECT 
    loc.cidade,
    SUM(f.conversao_monetaria_receita) AS receita_total
FROM f_vendas f
JOIN d_loja l 
    ON f.id_loja = l.id_loja
JOIN d_localizacao loc
    ON l.id_localizacao = loc.id_localizacao
GROUP BY loc.cidade
ORDER BY receita_total DESC;