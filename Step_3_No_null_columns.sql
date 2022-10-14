---  ===========================================================
--- 3 Add constraint not null for 68 columns using the procedure, dynamic SQL, while loop and try & catch.    
---  ===========================================================
use World_population
GO

CREATE OR ALTER PROC [dbo].[nonull_check]
AS
BEGIN

DECLARE @COUNT INT, @MAXCOUNT INT,@COLNAME nvarchar(100), @sql nvarchar(1000), @dtype nvarchar(100),@tabnam nvarchar(100)

CREATE TABLE #ColumnList (ID INT IDENTITY (1,1),TABLE_NAME nvarchar(50),COLUMN_NAME nvarchar(50),DATA_TYPE nvarchar(50))
INSERT INTO #ColumnList
select TABLE_NAME ,COLUMN_NAME,DATA_TYPE
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'World'
 
SELECT @COUNT = 1
SELECT @MAXCOUNT = MAX(ID) FROM #ColumnList

WHILE (@COUNT<@MAXCOUNT)
	BEGIN

	    SELECT @tabnam = TABLE_NAME FROM #ColumnList WHERE ID = @COUNT 
		SELECT @COLNAME = COLUMN_NAME FROM #ColumnList WHERE ID = @COUNT
		SELECT @dtype = DATA_TYPE FROM #ColumnList WHERE ID = @COUNT
 
		SET @sql = N'ALTER TABLE ' + @tabnam + ' ALTER COLUMN ' + @COLNAME + ' ' +@dtype + ' NOT NULL;'

		begin try
		exec sp_executesql @sql
		print '-- ' + @COLNAME + ' - column NOT NULL constraint has been added!'
		end try
		begin catch
		end catch

		SET @COUNT = @COUNT + 1
	END
drop table #ColumnList
END
GO

exec nonull_check
GO

