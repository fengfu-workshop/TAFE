SELECT TOP 1 horse_name AS [The Winner], total
FROM
(
	SELECT		horse_name, SUM(prizemoney) AS total

	FROM		Horse, Entry, Event, Prize
	WHERE		Horse.horse_id = Entry.horse_id
	AND			Entry.event_id = Event.event_id
	AND			Event.event_id = Prize.event_code
	AND			Entry.place = Prize.place
	GROUP BY	horse_name
	--ORDER BY	total DESC
	--OFFSET	0 ROWS
	--FETCH	NEXT 1 ROWS ONLY
) Temp
ORDER BY total DESC
