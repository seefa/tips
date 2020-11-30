STEP 1) find out puggable database name

$ sqlplus / as sysdba     -> Connect to SQL*Plus

SQL> show con_name;

OUTPUT: CDB$ROOT    -> show database type we connected(CDB=Container DataBase)
                        -> PDB= Pluggable DataBase

SQL> cl scr              -> Clear Screen
SQL> COLUMN name FORMAT a20;
SQL> SELECT name, con_id FROM v$pdbs;

OUTPUT:                        
-> list of pluggable database will return with upper query
NAME                     CON_ID
-------------------- ----------
PDB$SEED                      2
XEPDB1                        3

STEP 2) find out service name

SQL> SELECT name as "Service Name" FROM v$active_services where con_id=3;

OUTPUT:
-> show list of servie name for pluggable database id = 3(XEPDB1)
Service Name
--------------------- -----------
xepdb1

STEP 3) create an entry in TNSNAMES.ORD file

    1) go to Oracle DB_Home
    2) find network folder
    3) go admin folder
    4) tnsnames.ora is there
    5) open it with a text editor
    6) add new entry for our service name we find out in previous step

XEPDB1 =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = SAMANDELFAN1CA7)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = xepdb1)
    )
  )

$ lsnrctl reload           -> restart Oracle listener as Adminstrator user

STEP 4) switch from container database to pluggable database

SQL> ALTER SESSION SET container = XEPDB1;
SQL> SHOW con_name;


STEP 5) unlock the HR user

SQL> COLUMN name FORMAT a20;
SQL> SELECT name, open_mode FROM v$pdbs;

OUTPUT:
NAME                 OPEN_MODE
-------------------- ----------
XEPDB1               READ WRITE

SQL> ALTER PLUGGABLE DATABASE open;
SQL> ALTER USER HR IDENTIFIED BY hr ACCOUNT UNLOCK;
SQL> commit;
