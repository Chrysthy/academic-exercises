-- Atualização de VIEWS

-- Atualização de VIEW com o comando CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW empvu10 (employee_number, empl_name, job_title)
AS SELECT empno, ename, job
FROM emp
WHERE deptno = 10;

--Para acessar os dados
SELECT * FROM empvu10;


-- Atualizando nova view.
CREATE VIEW dept_sum_vu_10 (name, minsal, maxsal, avgsal)
AS SELECT d.dname, MIN(e.sal), MAX(e.sal), trunc(AVG(e.sal))
FROM emp e join dept d
ON e.deptno = d.deptno
GROUP BY d.dname;

--Para acessar os dados
select * from dept_sum_vu_10;



-- Para recriar a view
CREATE OR REPLACE VIEW empvu_10 (empno, ename, job)
AS SELECT empno, ename, job
FROM emp
WHERE deptno = 10
WITH READ ONLY; -- A view é somente leitura. Não poderá ocorrer operações DML (Data Manipulation Language) como INSERT, UPDATE ou DELETE.

select * from empvu_10; -- Para acessar os dados

-- Tentar fazer um update na view
update empvu_10 
set ename = 'JOSÉ' 
where empno = 7839; -- Não é possível fazer update na view, pois ela é somente leitura. Da erro.

select * from empvu_10;