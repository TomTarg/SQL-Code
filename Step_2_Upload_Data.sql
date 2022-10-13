/*
These CSV files are encoded in UTF-8 and have the the main columns:
1	SortOrder		SortOrder (numeric): record counter
2	LocID 			LocID (numeric): numeric code for the location; for countries and areas, it follows the ISO 3166-1 numeric standard
4	ISO3_code		ISO3_code (string): ISO 3166-1 alpha-3 location codes
7	LocTypeID 		LocTypeID (numeric): code for location type
8	LocTypeName 	LocTypeName (string): type of location
10	Location 		Location (string): name of the region, subregion, country or area
11	VarID 			VarID (numeric): numeric code for the scenario
12	Variant			Variant (string): projection scenario name (Medium is the most used); for more information see Definition of Projection Scenarios (https://population.un.org/wpp/DefinitionOfProjectionScenarios)
13	Time 			Time (numeric): year the data refers to
--- Columns LocID, VarID, MidPeriod - not unique, not null
*/

---  ===========================================================
--- 2 - Create tables and upload data from CSV file
---  ===========================================================
USE World_population
GO

drop table if exists World
Go

 create table World (
SortOrder int,
LocID int,
Notes nvarchar(55),
ISO3_code nvarchar(55),
ISO2_code nvarchar(55),
SDMX_code nvarchar(55),
LocTypeID int,
LocTypeName nvarchar(55),
ParentID int,
[Location] nvarchar(255),
VarID int,
Variant nvarchar(55),
[Time] int,
TPopulation1Jan float,
TPopulation1July float,
TPopulationMale1July float,
TPopulationFemale1July float,
PopDensity float,
PopSexRatio float,
MedianAgePop float,
NatChange float,
NatChangeRT float,
PopChange float,
PopGrowthRate float,
DoublingTime float,
Births float,
Births1519 float,
CBR float,
TFR float,
NRR float,
MAC float,
SRB float,
Deaths float,
DeathsMale float,
DeathsFemale float,
CDR float,
LEx float,
LExMale float,
LExFemale float,
LE15 float,
LE15Male float,
LE15Female float,
LE65 float,
LE65Male float,
LE65Female float,
LE80 float,
LE80Male float,
LE80Female float,
InfantDeaths float,
IMR float,
LBsurvivingAge1 float,
Under5Deaths float,
Q5 float,
Q0040 float,
Q0040Male float,
Q0040Female float,
Q0060 float,
Q0060Male float,
Q0060Female float,
Q1550 float,
Q1550Male float,
Q1550Female float,
Q1560 float,
Q1560Male float,
Q1560Female float,
NetMigrations float,
CNMR float
 )
 GO

 -- Create 2nd table (World_OtherVariants) by copy/paste the columns from 'World' table
drop table if exists worldOtherVariants
Go

select*
into worldOtherVariants
from World
where 1=0 
GO

/*
-- Upload the data from CSV file
BULK INSERT World
/*Dont forget to change the path */from 'C:\Users\U6067446\OneDrive - Clarivate Analytics\Desktop\Project\DataFiles\WPP2022_Demographic_Indicators_Medium.csv'
with(
 format = 'CSV',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
  FIRSTROW = 2
)
GO

-- Upload the data from CSV file

BULK INSERT worldOtherVariants
/*Dont forget to change the path */from 'C:\Users\U6067446\OneDrive - Clarivate Analytics\Desktop\Project\DataFiles\WPP2022_Demographic_Indicators_OtherVariants.csv'
with(
 format = 'CSV',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
  FIRSTROW = 2
);
*/

