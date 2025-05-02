-- View 

conn scott/tiger

create view empvu10
as select empno, ename, job
from emp
where deptno = 10;

--comando para ver a view criada
select * from empvu10;


-- Fazendo um update através da view
update empvu10
set ename = 'JOSE'
where empno = 7934;

-- Comando para ver o update feito na view
select * from empvu10;
select * from emp where empno = 7934;
