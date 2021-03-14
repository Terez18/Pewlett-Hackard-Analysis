-- Drop table if exists
DROP TABLE firepower;

-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT
);

-- Import data from firepower.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM firepower;

ALTER TABLE firepower
ADD COLUMN id SERIAL PRIMARY KEY;

DELETE from firepower
where Reservepersonnel = 0;

SELECT * from firepower 
where FighterAircraft = 0;

UPDATE firepower 
SET FighterAircraft = 1
where FighterAircraft = 0;

UPDATE firepower
SET TotalAircraftStrength = TotalAircraftStrength + 1
where FighterAircraft = 1;

SELECT AVG(Totalmilitarypersonnel) from firepower;

SELECT AVG (Totalmilitarypersonnel) as AVGTotalPersonnel,
	AVG(..) as 
	AVG(..) as new name
	INTO firepower_averages
from firepower;

