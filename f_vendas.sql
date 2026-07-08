CREATE TABLE f_vendas (
    id_fato INT AUTO_INCREMENT PRIMARY KEY,

    numero_venda INT,

    id_tempo INT,
    id_loja INT,
    id_produto INT,
    id_vendedor INT,
    id_canal INT,
    id_moeda INT,

    quantidade INT,
    preco_unitario DECIMAL(15,2),
    receita_total DECIMAL(15,2),
    meta_mensal_vendedor DECIMAL(15,2),
    taxa_de_cambio DECIMAL(15,6),
    conversao_monetaria_receita DECIMAL(15,2),
    conversao_monetaria_meta DECIMAL(15,2),
    diferenca DECIMAL(15,2),
    perc_atingimento DECIMAL(5,2),

    FOREIGN KEY (id_tempo) REFERENCES d_tempo(id_tempo),
    FOREIGN KEY (id_loja) REFERENCES d_loja(id_loja),
    FOREIGN KEY (id_produto) REFERENCES d_produto(id_produto),
    FOREIGN KEY (id_vendedor) REFERENCES d_vendedor(id_vendedor),
    FOREIGN KEY (id_canal) REFERENCES d_canal(id_canal),
    FOREIGN KEY (id_moeda) REFERENCES d_moeda(id_moeda)
);
INSERT INTO f_vendas (
    numero_venda,
    id_tempo,
    id_loja,
    id_produto,
    id_vendedor,
    id_canal,
    id_moeda,
    quantidade,
    preco_unitario,
    receita_total,
    meta_mensal_vendedor,
    taxa_de_cambio,
    conversao_monetaria_receita,
    conversao_monetaria_meta,
    diferenca,
    perc_atingimento
)
SELECT
    b.numero_venda,
    t.id_tempo,
    l.id_loja,
    p.id_produto,
    v.id_vendedor,
    c.id_canal,
    m.id_moeda,
    b.quantidade,
    b.preco_unitario,
    b.receita_total,
    b.meta_mensal_vendedor,
    b.taxa_de_cambio,
    b.conversao_monetaria_receita,
    b.Conversao_monetaria_meta,
    b.diferenca,
    b.perc_atingimento
FROM base_vendas b
JOIN d_tempo t 
    ON DATE(b.data) = t.data
JOIN d_localizacao loc
    ON b.cidade = loc.cidade
    AND b.estado = loc.estado
    AND b.pais = loc.pais
JOIN d_loja l
    ON b.nome_loja = l.nome_loja
    AND l.id_localizacao = loc.id_localizacao
JOIN d_produto p
    ON b.produto_vendido = p.nome_produto
    AND b.categoria = p.categoria
JOIN d_vendedor v
    ON b.nome_vendedor = v.nome_vendedor
JOIN d_canal c
    ON b.canal_de_venda = c.canal_de_venda
JOIN d_moeda m
    ON b.moeda = m.moeda
    AND b.simbolo_moeda = m.simbolo_moeda;
    SELECT COUNT(*) FROM f_vendas;
    SELECT * FROM f_vendas