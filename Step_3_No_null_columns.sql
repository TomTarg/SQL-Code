---  ===========================================================
--- 3 Check for not null columns with Dynamic SQL and add 'not null' constraints for informative columns  
---  ===========================================================
use World_population
GO

CREATE or ALTER PROC nonull (@table NVARCHAR(128),@col NVARCHAR(128))
AS
BEGIN
    DECLARE @sql NVARCHAR(MAX);

    SET @sql = N'SELECT sum(iif ('+ @col + N'  is null,1,0)) FROM ' + @table;
	set @sql = @sql + ' alter table ' + @table + ' alter column ' + @col + ' int not NULL';

	EXEC sp_executesql @sql;
END;
GO

  SET NOEXEC ON
exec nonull 'World','LocID'
GO
exec nonull 'World','SortOrder'
GO
exec nonull 'World','LocTypeID'
GO
exec nonull 'World','VarID'
GO
exec nonull 'worldothervariants','LocID'
GO
exec nonull 'worldothervariants','SortOrder'
GO
exec nonull 'worldothervariants','LocTypeID'
GO
exec nonull 'worldothervariants','VarID'
GO
  SET NOEXEC OFF;

--- check what columns became not nullable

select TABLE_NAME ,COLUMN_NAME,DATA_TYPE, IS_NULLABLE
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME in ('World','worldothervariants')
and COLUMN_NAME in ('SortOrder','LocID','LocTypeID','VarID')

---check for comparison between columns of the 2 tables

select sum(iif(nullif(w.SortOrder,wo.SortOrder)is null,0,1)) as SortOrder_Check,
       sum(iif(nullif(w.locid,wo.locid)is null,0,1)) as Lock_Check,
	   sum(iif(nullif(w.LocTypeID,wo.LocTypeID)is null,0,1)) as LocTypeID_Check,
	   sum(iif(nullif(w.VarID,wo.VarID)is null,0,1)) as VarID_Check
from World W join worldOtherVariants wo on w.SortOrder=wo.SortOrder
