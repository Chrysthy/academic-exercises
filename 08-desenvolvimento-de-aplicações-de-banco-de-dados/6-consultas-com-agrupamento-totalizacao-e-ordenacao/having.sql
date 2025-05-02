--Having
-- HAVING é uma cláusula utilizada para filtrar os resultados de uma consulta SQL após a aplicação de funções de agregação, como SUM, COUNT, AVG, etc. Ela é semelhante à cláusula WHERE, mas é aplicada após a agregação dos dados, enquanto a cláusula WHERE é aplicada antes da agregação.


select job, sum(sal) 
from scott.emp
group by job
having sum(sal) > 5000
order by sum(sal);