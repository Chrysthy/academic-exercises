--Criando e gerenciando autorizações e perfis

-- O profile é aquilo que dá as características de como será a senha desse usuário, como por exemplo:
-- quantas tentativas ele tem para logar, se a senha expira, se ele pode usar a mesma senha novamente, bloqueio, etc.

-- Cria o usuário e grarante a permissão de sessão para ele
conn system/manager

create user peter
identified by peter
default tablespace system
quota 15m on system;
--está relacionada a limitar o espaço em disco (quota) que um usuário pode usar dentro de uma tablespace (neste caso, a SYSTEM). 15 megabytes.

grant create session to peter;

conn peter/peter;

show user; -- Verifica se o usuário foi criado com sucesso

--Dando um select na dba users para ver o status do usuário
select username, account_status from dba_users order by username;


-- Bloqueando o usuário
conn system/manager

alter user peter account lock; -- Bloqueia o usuário, ele não consegue mais logar no banco de dados.

conn peter/peter; -- Tenta logar com o usuário bloqueado, não vai conseguir.
-- O status do usuário vai ficar como LOCKED (bloqueado) e não vai conseguir logar no banco de dados.


-- Desbloqueando o usuário
conn system/manager

select username, account_status, lock_date, expiry_Date, default_tablespace, profile from dba_users where username = 'PETER'; -- Verifica o status do usuário antes de desbloquear

alter user peter
account unlock; -- Desbloqueia o usuário, ele consegue logar novamente no banco de dados.



--Controlar profile:

-- Criando profile conexão e o parâmetro/ recurso de falhas na tentativa do login
-- Esse significa que pode errar a senha duas vezes, na terceira vez ele vai ser bloqueado.

create profile conexao limit
FAILED_LOGIN_ATTEMPTS 2; -- Número de tentativas de login com falha antes de bloquear o usuário 

-- Dar um select na dba_profiles para ver o profile que foi criado

select profile, resource_name, limit from dba_profiles where profile = 'CONEXAO' and resource_name='FAILED_LOGIN_ATTEMPTS'; -- Verifica as caracteristicas do profile que foi criado

-- Associar o profile ao usuário
alter user peter
profile conexao; -- Associa o profile ao usuário, ou seja, o usuário vai ter as características do profile que foi criado.


select username,account_status, lock_date, expiry_Date, default_tablespace, profile from dba_users where username = 'PETER'; -- Verifica o status do usuário e o profile que foi associado a ele


-- Para eliminar um profile:

drop profile conexao; -- Elimina o profile que foi criado, não pode estar associado a nenhum usuário.

drop user peter cascade; -- Elimina o usuário que foi criado, se ele tiver objetos associados a ele, vai eliminar tudo (cascade).