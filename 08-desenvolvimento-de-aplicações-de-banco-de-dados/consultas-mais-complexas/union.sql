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
