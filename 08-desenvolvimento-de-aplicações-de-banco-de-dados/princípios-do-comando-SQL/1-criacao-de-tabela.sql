create table aluno (id number(5) primary key, nome varchar2(20) not null, data_matricula date default sysdate, cod_turma number(2));

create table turma (cod_turma numb(2) primary key, descricao_turma varchar2(30));

alter table 