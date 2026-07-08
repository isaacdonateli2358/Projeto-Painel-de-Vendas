SELECT 
    (SELECT SUM(receita_total) FROM base_vendas) AS receita_base,
    (SELECT SUM(receita_total) FROM f_vendas) AS receita_fato;