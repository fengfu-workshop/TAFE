SELECT * 
FROM TWEEDLEDEER C
INNER JOIN TWEEDLEDEER F ON C.Father = F.Tweedle_No
INNER JOIN SHIP_ROSTER S1 ON C.Tweedle_No = S1.Tweedle_No
INNER JOIN SHIP_ROSTER S2 ON F.Tweedle_No = S2.Tweedle_No
INNER JOIN SPACESHIP SP1 ON S1.ShipRego_NO = SP1.ShipRego_No
INNER JOIN SPACESHIP SP2 ON S2.ShipRego_NO = SP2.ShipRego_No 
--WHERE	SP1.ShipName = SP2.ShipName
ORDER BY C.Tweedle_No

SELECT * 
FROM TWEEDLEDEER C
INNER JOIN TWEEDLEDEER F ON C.Father = F.Tweedle_No
WHERE	C.Tweedle_No IN (SELECT Tweedle_No
						 FROM	SHIP_ROSTER)
AND		F.Tweedle_No IN (SELECT Tweedle_No
						 FROM	SHIP_ROSTER)

SELECT	*
FROM	PLANET
WHERE	DayLength = (SELECT MAX(DayLength) FROM PLANET)