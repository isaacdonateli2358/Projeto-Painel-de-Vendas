SELECT COUNT(*) 
FROM f_vendas
WHERE id_tempo IS NULL
   OR id_loja IS NULL
   OR id_produto IS NULL
   OR id_vendedor IS NULL
   OR id_canal IS NULL
   OR id_moeda IS NULL;