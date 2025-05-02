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



