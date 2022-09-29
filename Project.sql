/*
--- These CSV files are encoded in UTF-8 and all of them have the following columns:
1	SortOrder		SortOrder (numeric): record counter
2	LocID 			LocID (numeric): numeric code for the location; for countries and areas, it follows the ISO 3166-1 numeric standard
3	Notes 			Notes (string): symbol linked to location notes file (available for download below)
4	ISO3_code		ISO3_code (string): ISO 3166-1 alpha-3 location codes
5	ISO2_code		ISO2_code (string): ISO 3166-1 alpha-2 location codes
6	SDMX_code 		SDMX_code (string): SDMX Global Registry, cross domain code list for geographical areas (version 2.0) represents a combination of reference area codes in M49 and ISO-3166 classification for international data exchange and interoperability https://sdmx.org/?page_id=3215 and https://registry.sdmx.org/ws/public/sdmxapi/rest/codelist/SDMX/CL_AREA/2.0
7	LocTypeID 		LocTypeID (numeric): code for location type
8	LocTypeName 	LocTypeName (string): type of location
9	ParentID 		ParentID (numeric): numeric code of the parent location
10	Location 		Location (string): name of the region, subregion, country or area
11	VarID 			VarID (numeric): numeric code for the scenario
12	Variant			Variant (string): projection scenario name (Medium is the most used); for more information see Definition of Projection Scenarios (https://population.un.org/wpp/DefinitionOfProjectionScenarios)
13	Time 			Time (numeric): year the data refers to
14	TPopulation1Jan 	Total Population, as of 1 January (thousands)
15	TPopulation1July 	Total Population, as of 1 July (thousands)
16	TPopulationMale1July 	Male Population, as of 1 July (thousands)
17	TPopulationFemale1July 	Female Population, as of 1 July (thousands)
18	PopDensity 	Population Density, as of 1 July (persons per square km)
19	PopSexRatio 	Population Sex Ratio, as of 1 July (males per 100 females)
20	MedianAgePop 	Median Age, as of 1 July (years)
21	NatChange 	Natural Change, Births minus Deaths (thousands)
22	NatChangeRT 	Rate of Natural Change (per 1,000 population)
23	PopChange 	Population Change (thousands)
24	PopGrowthRate 	Population Growth Rate (percentage)
25	DoublingTime 	Population Annual Doubling Time (years)
26	Births 	Births (thousands)
27	Births1519 	Births by women aged 15 to 19 (thousands)
28	CBR 	Crude Birth Rate (births per 1,000 population)
29	TFR 	Total Fertility Rate (live births per woman)
30	NRR 	Net Reproduction Rate (surviving daughters per woman)
31	MAC 	Mean Age Childbearing (years)
32	SRB 	Sex Ratio at Birth (males per 100 female births)
33	Deaths 	Total Deaths (thousands)
34	DeathsMale 	Male Deaths (thousands)
35	DeathsFemale 	Female Deaths (thousands)
36	CDR 	Crude Death Rate (deaths per 1,000 population)
37	LEx 	Life Expectancy at Birth, both sexes (years)
38	LExMale 	Male Life Expectancy at Birth (years)
39	LExFemale 	Female Life Expectancy at Birth (years)
40	LE15 	Life Expectancy at Age 15, both sexes (years)
41	LE15Male 	Male Life Expectancy at Age 15 (years)
42	LE15Female 	Female Life Expectancy at Age 15 (years)
43	LE65 	Life Expectancy at Age 65, both sexes (years)
44	LE65Male 	Male Life Expectancy at Age 65 (years)
45	LE65Female 	Female Life Expectancy at Age 65 (years)
46	LE80 	Life Expectancy at Age 80, both sexes (years)
47	LE80Male 	Male Life Expectancy at Age 80 (years)
48	LE80Female 	Female Life Expectancy at Age 80 (years)
49	InfantDeaths 	Infant Deaths, under age 1 (thousands)
50	IMR 	Infant Mortality Rate (infant deaths per 1,000 live births)
51	LBsurvivingAge1 	Live births Surviving to Age 1 (thousands)
52	Under5Deaths 	Deaths under age 5 (thousands)
53	Q5 	Under-five Mortality Rate (deaths under age 5 per 1,000 live births)
54	Q0040 	Mortality before Age 40, both sexes (deaths under age 40 per 1,000 live births)
55	Q0040Male 	Male mortality before Age 40 (deaths under age 40 per 1,000 male live births)
56	Q0040Female 	Female mortality before Age 40 (deaths under age 40 per 1,000 female live births)
57	Q0060 	Mortality before Age 60, both sexes (deaths under age 60 per 1,000 live births)
58	Q0060Male 	Male mortality before Age 60 (deaths under age 60 per 1,000 male live births)
59	Q0060Female 	Female mortality before Age 60 (deaths under age 60 per 1,000 female live births)
60	Q1550 	Mortality between Age 15 and 50, both sexes (deaths under age 50 per 1,000 alive at age 15)
61	Q1550Male 	Male mortality between Age 15 and 50 (deaths under age 50 per 1,000 males alive at age 15)
62	Q1550Female 	Female mortality between Age 15 and 50 (deaths under age 50 per 1,000 females alive at age 15)
63	Q1560 	Mortality between Age 15 and 60, both sexes (deaths under age 60 per 1,000 alive at age 15)
64	Q1560Male 	Male mortality between Age 15 and 60 (deaths under age 60 per 1,000 males alive at age 15)
65	Q1560Female 	Female mortality between Age 15 and 60 (deaths under age 60 per 1,000 females alive at age 15)
66	NetMigrations 	Net Number of Migrants (thousands)
67	CNMR 	Net Migration Rate (per 1,000 population)



--- Primery keys:
 LocID, VarID, MidPeriod 

--- For files with data separated by age, the following columns are available:
AgeGrp (string): label identifying the single age (e.g. 15) or age group (e.g. 15-19)
AgeGrpStart (numeric): initial age of the age group
AgeGrpSpan (numeric): length of the age group, in years

*/




-- Create database 
 drop database if exists World_population;
 create database World_population
 Go
 use World_population
 GO

 --- Create table World
 drop table if exists World;

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
 );

-- Upload the data from CSV file
BULK INSERT World
from 'D:\Chrome Downloads\D.A\THE_PROJECT\WPP2022_Demographic_Indicators_Medium.csv'
with(
 format = 'CSV',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
  FIRSTROW = 3

);

-- Create 2nd table (World_OtherVariants) by copy/paste the columns from 'World' table
select*
into worldOtherVariants
from world
where 1=0 ;
-- Upload the data from CSV file

BULK INSERT worldOtherVariants
from 'D:\Chrome Downloads\D.A\THE_PROJECT\WPP2022_Demographic_Indicators_OtherVariants.csv'
with(
 format = 'CSV',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
  FIRSTROW = 2

);
-- Check for unique and not null columns for PRIMARY KEYS constraints and corralation between columns 
select LocID
from World 
where LocID = 0 or LocID is null ;

select LocID
from worldOtherVariants 
where LocID = 0 or LocID is null ;

select W.LocID,WOV.LocID
from World as W join worldOtherVariants WOV on w.LocID=WOV.LocID
where w.LocID=WOV.LocID
group by W.LocID,WOV.LocID

select LocID
into mastertable
from World
group by LocID

-- Create PRIMARY AND FOREIGH KEYS between the tables

alter table mastertable alter column LocID int not null;
alter table mastertable add constraint PK_lockid primary key (LocID);

alter table World add foreign key(locid) references mastertable(locid);
alter table worldOtherVariants add foreign key(locid) references mastertable(locid);

------------------

select Location,Variant ,Time,format(sum(TPopulation1Jan*1000),'#,#') as Total_pop
from World 
where location = 'world' and Time = 1950
group by Location, Variant,Variant ,Time



select Location,Variant ,Time,format(sum(TPopulation1Jan*1000),'#,#') as Total_pop
from worldOtherVariants 
where  Time = 2022
group by Location, Variant,Variant ,Time
order by time 


select SortOrder,LocID,Location,LocTypeID,LocTypeName
from World 
group by SortOrder,LocID,Location,LocTypeID,LocTypeName

select Location,LocID
from worldOtherVariants
where LocID<899
group by Location,LocID
order by LocID desc

select Variant
from worldOtherVariants
group by Variant


select time
from worldOtherVariants
group by time