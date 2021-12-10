# bootcamp_project_2

## Table of Contents
1. [Background](#background)
2. [ETL Project Proposal](#etlprojectproposal)
3. [Team Members](#teammembers)
4. [Data Sources](#datasources)

## Background
This is the second group project for the GT Data Science Bootcamp!

## ETL Project Proposal
* We propose to create a database which contains historical rent and income information. 

* We will use data from zillow via kaggle for historical rent prices and data from the american community survey for historical per capita income. The data will be at the county level. See "Data Sources" for the data sources. 

 * We will create a postgresql database which will contain the data. 

* Next steps:
  * Determine what cleanup steps are necessary. 
  * Clean the data. 
  * Database Design
  * Database population - load the information

<<<<<<< Updated upstream
* challenges:
=======
## Report

The ETL process was accomplished using pandas and sqlalchemy in a jupyter notebook named ETL_Project.ipynb. All the team members used this repo and followed our [stated process](#githubworkflow) for branching, pushing, and merging to the main branch. 

### Extract
* County Data
  * The county data set was downloaded as a .csv file. 
  * The data were imported to the ETL_Project notebook using pandas.read_csv()
* Zillow Data
  * The data set was downloaded as a .csv file. 
  * The data were imported to the ETL_Project notebook using pandas.read_csv()
* Evictionlab Data
  * The data set was downloaded as a .csv file. 
  * The data were imported to the ETL_Project notebook using pandas.read_csv()

### Transform
* Master County Data
  * Create a clean csv
  * Drop irrelevant columns
  * Remove duplicate data
* Zillow Data
  *
* Evictionlab Data
  * The columns "name" and "parent.location" were renamed "county" and "state" to match the state_county_master table. 
  * The data set contained counties and also other divisions such as borroughs and census tracts. The other divisions were eliminated, leaving only counties and their data. 
  * The county names were in the format "'name' County" EG "Fulton County". The " County" string was removed from the county names to match the county_master_table. 
  * It was found that one county had changed names and didn't match the county_master_table. 
    * In 2015, Shannon County, South Dakota changed its name to Oglala Lakota County, South Dakota. 
    * Using a conditional pandas.loc() command, the name was changed in all the rows that contained "Shannon" in the county column and "South Dakota" in the State column. 
    * The name was not changed in any other counties with the name "Shannon" in other states. There is a Shannon County in Missouri which was untouched. 
  * The following columns were not needed and were dropped: 'GEOID', 'low.flag', 'imputed', and 'subbed'. 
  * The columns of the DataFrame were renamed for readability and clarity. The names match the column names in the two sql tables where the data will be loaded. 

### Load
* Database Design and Setup
  * Prior to loading any data, the sql file Database_artifacts/rental_db_ddl.sql was run to set up the four tables in the sql relational database: state_county_master, county_zillow_rental_prices, county_demographics_and_income, and county_renters_evictions
  *
* County Data
  * The master county table was loaded for all other tables to reference
* Zillow Data
* Evictionlab Data
  * The evictionlab data was loaded into two tables. The table county_renters_evictions contained data such as rent, eviction filings, actual evictions, and number of renter households, among other data. There was data for each county in each year that data were recorded for that county. The table county_demographics_and_income contained data such as county population size, poverty rate, median household income, and the proportion of each race. 
  * The data was loaded into the database using the .to_sql() function. 
>>>>>>> Stashed changes

## Team Members
* Abishua Prashanth
* Wesley Watkins
* Anthony Ndungu
* Theadora James
* Beverly Phillips - Scout
* Sidney Henry
* Di Gibson
* Elsa Hernandez
* Harsh Patel
* Jason Degrace
* Mark Alford
* Randy Weaver

## Data Sources
* zillow dataset from kaggle for rent information
https://www.kaggle.com/zillow/rent-index
* eviction lab data:
https://evictionlab.org/#home-menu
* Master county data 
https://simplemaps.com/data/us-counties


Other potential sources:
Eviction information: https://data-downloads.evictionlab.org/
Rent prices: https://www.apartmentlist.com/research/category/data-rent-estimates
Wages: https://www.bls.gov/eag/
Interactive map: https://evictionlab.org/#home-menu
https://fred.stlouisfed.org/release/tables?eid=259515&rid=249
census.gov
acs per capita income data
https://www.nhgis.org/
