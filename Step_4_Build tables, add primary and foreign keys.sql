
use world_population

-----------------------------------------
------------------------------------
---1 First tables will be split by loctypename - Subregion, World ,SDG region, Geographic region, Development group, Income group, Country/Area

--- 1.1 Sustainable Development Goal (SDG) regions:
--- countries and areas are grouped into eight Sustainable Development Goal (SDG) regions as defined by the United Nations Statistics Division and used for The Sustainable Development Goals Report 

--- 1.2 Geographic regions: countries and areas are also grouped geographically into six major areas designated as:
-- Africa; Asia; Europe; Latin America and the Caribbean; Northern America, and Oceania.

--- 1.3 UN development groups: the designation of “more developed” and “less developed”, or “developed” and “developing”,
-- is intended for statistical purposes and does not express a judgment about the stage in the development process reached by a particular country or area.

--- 1.4 World Bank income groups: the country classification by income level is based on July 2022 GNI per capita from the World Bank.

--- 1.5 Subregion 

--- 1.6 World

--- 1.7 Country/Area


--- Create new procedure for populationg and creating new tables.

create or alter proc TableCreater (@loctypename nvarchar(30), @newtable varchar(30))
as
BEGIN

Declare @sql NVARCHAR(MAX); 
set @sql = 
N'select casid,locid,loctypename,location,parentid,time,variant,
SUM(TPopulation1Jan) as TPopulation1Jan,
SUM(TPopulation1July) as TPopulation1July,
SUM(TPopulationMale1July) as TPopulationMale1July,
SUM(TPopulationFemale1July) as TPopulationFemale1July,
SUM(PopDensity) as PopDensity,
SUM(PopSexRatio) as PopSexRatio,
SUM(MedianAgePop) as MedianAgePop,
SUM(NatChange) as NatChange,
SUM(NatChangeRT) as NatChangeRT,
SUM(PopChange) as PopChange,
SUM(PopGrowthRate) as PopGrowthRate,
SUM(DoublingTime) as DoublingTime,
SUM(Births) as Births,
SUM(Births1519) as Births1519,
SUM(CBR) as CBR,
SUM(TFR) as TFR,
SUM(NRR) as NRR,
SUM(MAC) as MAC,
SUM(SRB) as SRB,
SUM(Deaths) as Deaths,
SUM(DeathsMale) as DeathsMale,
SUM(DeathsFemale) as DeathsFemale,
SUM(CDR) as CDR,
SUM(LEx) as LEx,
SUM(LExMale) as LExMale,
SUM(LExFemale) as LExFemale,
SUM(LE15) as LE15,
SUM(LE15Male) as LE15Male,
SUM(LE15Female) as LE15Female,
SUM(LE65) as LE65,
SUM(LE65Male) as LE65Male,
SUM(LE65Female) as LE65Female,
SUM(LE80) as LE80,
SUM(LE80Male) as LE80Male,
SUM(LE80Female) as LE80Female,
SUM(InfantDeaths) as InfantDeaths,
SUM(IMR) as IMR,
SUM(LBsurvivingAge1) as LBsurvivingAge1,
SUM(Under5Deaths) as Under5Deaths,
SUM(Q5) as Q5,
SUM(Q0040) as Q0040,
SUM(Q0040Male) as Q0040Male,
SUM(Q0040Female) as Q0040Female,
SUM(Q0060) as Q0060,
SUM(Q0060Male) as Q0060Male,
SUM(Q0060Female) as Q0060Female,
SUM(Q1550) as Q1550,
SUM(Q1550Male) as Q1550Male,
SUM(Q1550Female) as Q1550Female,
SUM(Q1560) as Q1560,
SUM(Q1560Male) as Q1560Male,
SUM(Q1560Female) as Q1560Female,
SUM(NetMigrations) as NetMigrations,
SUM(CNMR) as CNMR
into ' + @newtable + ' from world
where loctypename = ' + @loctypename +
' group by casid,locid,loctypename,location,parentid, time, variant;'

exec sp_executesql @sql;
END;


------------------ Execution plan for the procedure 'TableCreater' 

set nocount on;

exec TableCreater @loctypename ='''Subregion''', @newtable = 'SubregionTable';
GO
exec TableCreater @loctypename ='''SDG region''', @newtable = '[SDG regionTable]';
GO
exec TableCreater @loctypename ='''Geographic region''', @newtable = '[Geographic regionTable]';
GO
exec TableCreater @loctypename ='''Development group''', @newtable = '[Development groupTable]';
GO
exec TableCreater @loctypename ='''Income group''', @newtable = '[Income groupTable]';
GO
exec TableCreater @loctypename ='''Country/Area''', @newtable = '[Country/AreaTable]';
GO
exec TableCreater @loctypename ='''World''', @newtable = 'WorldCutTable';
GO

----------------- Create Primary keys

Alter table SubregionTable ADD constraint PK_Casid_Subregion PRIMARY KEY (Casid); 
GO
Alter table [SDG regionTable] ADD constraint PK_Casid_SDG PRIMARY KEY (Casid); 
GO
Alter table [Geographic regionTable] ADD constraint PK_Casid_Geographic PRIMARY KEY (Casid); 
GO
Alter table [Development groupTable] ADD constraint PK_Casid_Development PRIMARY KEY (Casid); 
GO
Alter table [Income groupTable] ADD constraint PK_Casid_Income PRIMARY KEY (Casid); 
GO
Alter table [Country/AreaTable] ADD constraint PK_Casid_Country PRIMARY KEY (Casid); 
GO
Alter table WorldCutTable ADD constraint PK_Casid_WorldCutTable PRIMARY KEY (Casid); 
GO


----------------- Create Foreign Keys

Alter table SubregionTable ADD FOREIGN KEY (Casid) REFERENCES World (Casid); 
GO
Alter table [SDG regionTable] ADD FOREIGN KEY (Casid) REFERENCES World (Casid); 
GO
Alter table [Geographic regionTable] ADD FOREIGN KEY (Casid) REFERENCES World (Casid);
GO
Alter table [Development groupTable] ADD FOREIGN KEY (Casid) REFERENCES World (Casid);
GO
Alter table [Income groupTable] ADD FOREIGN KEY (Casid) REFERENCES World (Casid);
GO
Alter table [Country/AreaTable] ADD FOREIGN KEY (Casid) REFERENCES World (Casid); 
GO
Alter table WorldCutTable ADD FOREIGN KEY (Casid) REFERENCES World (Casid); 
GO