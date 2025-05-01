-- Para criar usuários precisamos conectar com um usuário DBA do banco - Sys ou System

-- Para criar usuário:
conn system/manager

create user aaron -- usuário
identified by futebol -- senha
default tablespace system -- local de gravação padrão, gravar os dados do usuário
quota unlimicreate ted on system -- pode gravar quantos dados ele quiser enquanto hover espaço no tablespace system
password expire; -- força o usuário a trocar a senha no primeiro login, informa que está expirado


-- Para condecer permissões/privilégios para o usuário:
--Pode se conectar e criar tabelas no banco de dados
grant create session, create table to aaron;


-- Para conectar com o usuário criado e como demos password expire, ele vai pedir a troca de senha
conn aaron/futebol

--Senha alterada para 123


-- Para mostrar o usuário que está conectado:
show user


-- Para ver se o usuário está com a permissão de criar tabelas, no comando que informamos, vamos criar uma tabela teste:
create table teste (id number);


-- Para eliminar o usuário:
conn system/manager

select username, account_status, default_tablespace, created from dba_users where username = 'AARON'; -- para ver se o usuário existe e o status dele, buscar as principais informações do usuário

drop user aaron cascade; -- para eliminar o usuário e tudo que ele criou, se não usar o cascade, não vai eliminar os objetos criados por ele