# bootcamp_project_2

## Table of Contents
1. [Background](#background)
2. [ETL Project Proposal](#etlprojectproposal)
3. [Report](#report)
4. [Team Members](#teammembers)
5. [Data Sources](#datasources)
6. [github workflow](#githubworkflow)

## Background
This is the second group project for the GT Data Science Bootcamp!

This is the "ETL" Project. ETL stands for "Extract, Transform, and Load". From the ["Extract, transform, load" Wikipedia article](https://en.wikipedia.org/wiki/Extract,_transform,_load) (retrieved 12/08/21):

> "In computing, extract, transform, load (ETL) is the general procedure of copying data from one or more sources into a destination system which represents the data differently from the source(s) or in a different context than the source(s)."

## ETL Project Proposal
* We propose to create a database which contains historical rent and income information. 
* We will use county data to create a master county table in our database. This will be referenced by the other tables as our data is at the county level. 
* We will use data from zillow via kaggle for historical rent prices and data from the american community survey for historical per capita income. The data will be at the county level and were recorded monthly. See "Data Sources" for the data sources. 
* We will use data from evictionlab for historical income and eviction data, including eviction filings and actual evictions. These data are at the county level and are recorded yearly.  
* We will create a postgresql database which will contain the data. 
* Next steps:
  * Determine what cleanup steps are necessary. 
  * Clean the data. 
  * Database Design
  * Database population - load the information

## Report

The ETL process was accomplished using pandas and sqlalchemy in a jupyter notebook named ETL_Project.ipynb. All the team members used this repo and followed our [stated process](#githubworkflow) for branching, pushing, and merging to the main branch. 

### Extract
* The County, Zillow, and Evicionlab data were all downloaded as .csv files and imported into the project notebook using pandas.read_csv()

### Transform
* Master County Data
  * Create a clean csv
  * Drop irrelevant columns
  * Remove duplicate data
* Zillow Data
  * Zillow had the rental data by month across the columns, which had to be stored in the tables as rows
  * Many of the county names in this data set needed to be changed to match the names in the master county list. 
  * The state names were changed from the two-letter abbreviations to the full name using the worldpopulationreview data. 
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
* County Data
  * The master county table was loaded for all other tables to reference
  * The table used a composite primary key composed of the county and state. The other tables used a composite foreign key tied to this primary key. 
* The county and zillow data were loaded into the state_county_master and the county_zillow_rental_prices tables, respectively. 
* Evictionlab Data
  * The evictionlab data was loaded into two tables. The table county_renters_evictions contained data such as rent, eviction filings, actual evictions, and number of renter households, among other data. There was data for each county in each year that data were recorded for that county. The table county_demographics_and_income contained data such as county population size, poverty rate, median household income, and the proportion of each race. 
* The data were loaded into the database using the .to_sql() function. 

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
* State Names and State Codes
https://worldpopulationreview.com/states/state-abbreviations

## github workflow
The team followed the guidelines set in the [Github Best Practices](https://docs.github.ncsu.edu/github-best-practices/) document. This included making effective use of branching, using .gitignore to prevent tracking files, and writing thoughtful commit messages. The group merged most of the branches during meetings but also used the reviewer function of github when possible. Some branches were merged by their creator when the change was simple enough. 
