-- Operador UNION

create table conjuntoA(
    cod_fruta_A number(2),
    nome_fruta_A varchar2(30)
);

insert into conjuntoA values (1, 'banana');
insert into conjuntoA values (2, 'mamão');
insert into conjuntoA values (3, 'limão');
commit;

select * from conjuntoA;

create table conjuntoB(
    cod_fruta_B number(2),
    nome_fruta_B varchar2(30)
);

insert into conjuntoB values (1, 'banana');
insert into conjuntoB values (20, 'melancia');
insert into conjuntoB values (30, 'abacaxi');

select * from conjuntoB;


--Fazendo a união dos conjuntos A e B

select cod_fruta_A, nome_fruta_A from conjuntoA
union
select cod_fruta_B, nome_fruta_B from conjuntoB;

--A consulta acima retorna os valores distintos, ou seja, não repete os valores iguais.


select cod_fruta_A, nome_fruta_A from conjuntoA
union all
select cod_fruta_B, nome_fruta_B from conjuntoB;

--Se quisermos que os valores repetidos sejam mostrados, utilizamos o UNION ALL
