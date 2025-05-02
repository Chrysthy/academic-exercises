-- Criação e exclusão de VIEWS

CREATE VIEW salvu31
AS SELECT empno EMPLOYEE_NUMBER, ename NAME, sal SALARY
FROM emp
WHERE deptno = 30;

--apelido EMPLOYEE_NUMBER

SELECT * FROM salvu31;
-- comando para ver a view criada



