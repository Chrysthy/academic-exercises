-- Subconsultas, subqueries ou consulta da consulta são consultas SQL que estão aninhadas dentro de outra consulta SQL. 
--É uma consulta dentro de outra, uma consulta menor que retorna para a consulta maior.


--Exemplo 1:
--exibir o nome e o número do departamento de quem trabalha no mesmo departamento do Smith

--Iremos fazer primeiro a consulta de dentro, pra descobror qual é o departamento do Smith e essa consulta de dentro irá fornecer o valor para a consulta de fora. Onde iremos buscar o nome e o número do departamento de quem trabalha no mesmo departamento do Smith.

-- Consulta de dentro/subconsulta:
-- saber o departamento do Smith
--sempre entre parênteses
--colocar a subconsulta mais a direta e a consulta de fora mais a esquerda
select ename, deptno
from scott.emp
where deptno = (select deptno
                from scott.emp
                where ename = 'SMITH');



-- Saber o departamento
select deptno 
from scott.emp
where ename = 'SMITH';

