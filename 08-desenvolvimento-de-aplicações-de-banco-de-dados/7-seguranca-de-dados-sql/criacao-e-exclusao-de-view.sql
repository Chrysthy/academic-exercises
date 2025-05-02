-- Criação e exclusão de VIEWS

CREATE VIEW salvu31
AS SELECT empno EMPLOYEE_NUMBER, ename NAME, sal SALARY
FROM emp
WHERE deptno = 30;

--apelido EMPLOYEE_NUMBER

SELECT * FROM salvu31;
-- comando para ver a view criada



-- Para eliminar uma view, o comando é DROP VIEW, seguido do nome da view a ser eliminada.
DROP VIEW empvu10;

-- Para verificar se a view foi eliminada.
select * from empvu10;

-- O fato de eliminar a view não elimina a tabela base, ou seja, a tabela EMP continua existindo.
select * from emp;
