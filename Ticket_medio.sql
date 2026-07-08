SELECT 
    ROUND(
        SUM(conversao_monetaria_receita) /
        SUM(quantidade), 2
    ) AS ticket_medio
FROM f_vendas;