DROP TABLE master_counties

CREATE TABLE master_counties
( 
  county VARCHAR,
  county_ascii VARCHAR,
  county_full VARCHAR,
  county_fips INT,
  state_id VARCHAR,  
  state_name VARCHAR,
  lat DECIMAL,
  lng DECIMAL,
  population INT,
  county_state VARCHAR PRIMARY KEY);

SELECT * FROM master_counties

CREATE TABLE uscounties

	(county_state VARCHAR PRIMARY KEY);

SELECT * FROM uscounties