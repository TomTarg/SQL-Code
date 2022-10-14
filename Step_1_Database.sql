---  ===========================================================
--- 1 Select filegroup, create recovery bulk, create Database  
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

/*
Columns explanation for the next step: 
1	SortOrder 	SortOrder (numeric): record counter
2	LocID 	LocID (numeric): numeric code for the location; for countries and areas, it follows the ISO 3166-1 numeric standard
3	Notes 	Notes (string): symbol linked to location notes file (available for download below)
4	ISO3_code 	ISO3_code (string): ISO 3166-1 alpha-3 location codes
5	ISO2_code 	ISO2_code (string): ISO 3166-1 alpha-2 location codes
6	SDMX_code 	SDMX_code (string): SDMX Global Registry, cross domain code list for geographical areas (version 2.0) represents a combination of reference area codes in M49 and ISO-3166 classification for international data exchange and interoperability https://sdmx.org/?page_id=3215 and https://registry.sdmx.org/ws/public/sdmxapi/rest/codelist/SDMX/CL_AREA/2.0
7	LocTypeID 	LocTypeID (numeric): code for location type
8	LocTypeName 	LocTypeName (string): type of location
9	ParentID 	ParentID (numeric): numeric code of the parent location
10	Location 	Location (string): name of the region, subregion, country or area
11	VarID 	VarID (numeric): numeric code for the scenario
12	Variant 	Variant (string): projection scenario name (Medium is the most used); for more information see Definition of Projection Scenarios (https://population.un.org/wpp/DefinitionOfProjectionScenarios)
13	Time 	Time (numeric): year the data refers to
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
*/
