--Operador INTERSECT

-- Pega os elementos que são comuns entre as duas tabelas, nos dois conjuntos.

select cod_fruta_a, nome_fruta_a from conjuntoA
intersect
select cod_fruta_b, nome_fruta_b from conjuntoB
