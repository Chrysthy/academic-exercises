--Operador MINUS/EXCEPT

-- minus tira um conjunto do outro, ou seja, tira os dados iguais entre os dois conjuntos.
-- pode-se usar o minus ou o except, são sinônimos.

select cod_fruta_A, nome_fruta_A from conjuntoA
minus
select cod_fruta_B, nome_fruta_B from conjuntoB;
-- tira do conjunto A os elementos do conjunto B, ou seja, tirando os elementos iguais entre os dois conjuntos.

select cod_fruta_B, nome_fruta_B from conjuntoB
minus
select cod_fruta_A, nome_fruta_A from conjuntoA;

-- A ordem importa, se colocar a e depois b tira os elementos iguais e mostra os dados da tablea A.
-- Se colocar b e depois a, tira os elementos iguais e mostra os dados da tabela B.