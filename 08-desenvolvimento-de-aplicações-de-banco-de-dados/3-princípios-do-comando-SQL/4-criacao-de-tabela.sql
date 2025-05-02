describe aluno

insert into aluno values (1, 'Chrystine', default, 10);

insert into aluno values (2, 'Noob', '10-oct-22', 11);

select * from aluno;

update aluno 
set cod_turma = 12
where id = 1;
-- atualizando, altera o aluno com id 1, mudando a turma dele para 12

select * from aluno;

delete from aluno where id = 2;
-- deletando o aluno com id 2

select * from aluno;