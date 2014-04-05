
-- for each Prisoner that was captured on Raid No.9 and that has been ransomed
-- list the Prisoner_No, FirstName, LastName, Raid_No, ShipName and RansomPaid. Include
-- Prisoners that have not been ransomed

SELECT		Prisoner_No, FirstName, LastName, P.Raid_No, ShipName, RansomPaid
FROM		((PRISONER AS P
			LEFT OUTER JOIN	RAID AS R ON P.Raid_No = R.Raid_No)
			LEFT JOIN	SPACESHIP AS S ON R.ShipRego_No = S.ShipRego_No)
WHERE		R.Raid_No = 9 

-- List FirstName, LastName, PaidRego_No and RansomPaid of
-- all Prisoners that have been ransomed. Also list these details for
-- Prisoners that have not been ransomed

SELECT	FirstName, LastName, R.Raid_No, ShipRego_No, RansomPaid
FROM	PRISONER AS P
		LEFT OUTER JOIN RAID AS R ON P.Raid_No = R.Raid_No

-- List FirstName, LastName and SHipRego_No for Tweedledeer that have been restored on a spaceship
-- Also list details for Tweedledeers that have never been restored on a spaceship

SELECT	FirstName, LastName, ShipRego_No
FROM	TWEEDLEDEER AS T
LEFT OUTER JOIN	SHIP_ROSTER AS S ON T.Tweedle_No = S.Tweedle_No



-- List the name of each Planet that was raided in 2100 Don't list duplicate planet names
SELECT  DISTINCT P.Name
FROM	PLANET AS P
INNER JOIN RAID AS R ON P.Planet_No = R.Planet_No
WHERE	YEAR(R.Date) = 2100

-- List the name of each Planet that was raided on the 11th day (of any month or year)
-- together with the number of times the planet was eaided on that day

SELECT  P.Name,
		COUNT(*) AS NumOfTimesRaided
FROM	PLANET AS P
INNER JOIN RAID AS R ON P.Planet_No = R.Planet_No
WHERE	DAY(R.Date) = 11
GROUP BY P.Name

-- List the name of each Planet that was raided in April(use the word 'April' not the num 4)
-- together with the number of times the planet was eaided in the Month

SELECT  P.Name,
		COUNT(R.Raid_No) AS NumOfTimesRaided
FROM	PLANET AS P
INNER JOIN RAID AS R ON P.Planet_No = R.Planet_No
WHERE	DATENAME(MONTH, R.Date) = 'April'
GROUP BY P.Name

-- Using Subqueries only (without products of any kind), list the FirstName, LastName of
-- Tweedledeer that have been restored on a Spaceship and have never won a medal.

SELECT  FirstName, LastName
FROM	TWEEDLEDEER
WHERE	Tweedle_No IN ( SELECT Tweedle_No
						FROM	SHIP_ROSTER
						WHERE	Medal IS NULL)

SELECT  FirstName, LastName
FROM	TWEEDLEDEER
WHERE	Tweedle_No IN ( SELECT Tweedle_No
						FROM	SHIP_ROSTER)
AND		Tweedle_No NOT IN ( SELECT Tweedle_No
						FROM	SHIP_ROSTER
						WHERE	Medal IS NOT NULL)


-- List the FirstName and LastName and a value of 'Alive' for Tweedledeers that are still alive
-- together with details of their father if he is 'Dead'

SELECT	Child.FirstName, Child.LastName, 'Alive' AS LivingOrDeath, Father.*

FROM	TWEEDLEDEER Child
INNER JOIN TWEEDLEDEER Father ON Child.Father = Father.Tweedle_No 
WHERE	Child.Death_Date IS NULL
AND		Father.Death_Date IS NOT NULL



SELECT	Child.FirstName, Child.LastName, 'Alive' AS LivingOrDeath

FROM	TWEEDLEDEER Child
WHERE	Child.Death_Date IS NULL

UNION

SELECT	F.FirstName, F.LastName, 'Dead' AS LivingOrDeath

FROM	TWEEDLEDEER F,
		TWEEDLEDEER C
WHERE	C.Father=F.Tweedle_No
AND		F.Death_Date IS NOT NULL


-- For each Tweedledeer with a recorded Father, list the firstname and lastName of the Tweedledeer,
-- their Position and the date of birth of their Father

SELECT child.FirstName, child.LastName, child.Position, father.Birth_Date
FROM	TWEEDLEDEER child
INNER JOIN	TWEEDLEDEER father ON child.Father = Father.Tweedle_No
--INNER JOIN	POSITION ON child.Position = POSITION.PositionName
