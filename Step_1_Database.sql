---  ===========================================================
--- 1 - Select filegroup, create recovery bulk, create Database  
---  ===========================================================

USE master
GO
SET NOCOUNT ON
if exists (select* from sysdatabases where name='World_population') drop database World_population
GO

DECLARE @directory NVARCHAR(550)
SELECT @directory =SUBSTRING(filename,1,CHARINDEX(N'master.mdf',lower(filename))-1 )
FROM master.dbo.sysaltfiles
WHERE fileid = 1 and dbid = 1  

EXECUTE (N'CREATE DATABASE World_population
  ON PRIMARY (NAME = N''World_population'', FILENAME = N''' + @directory + N'World_population.mdf'')
  LOG ON (NAME = N''World_population_log'', FILENAME = N''' + @directory + N'World_population.ldf'')')
GO

ALTER DATABASE World_population SET RECOVERY BULK_LOGGED
GO