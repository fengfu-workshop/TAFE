-- 3.1  List the name of each event type, and the number of times that event is recorded as having been on.

SELECT		event_name,
			COUNT(*) AS number_of_events_with_this_name
FROM		event
GROUP BY	event_name

-- 3.2  List the name of each show, and the number of different times it has been held. List the show which has been held most 
-- often first.

SELECT		show_name, 
			COUNT(*) AS number_of_times_held
FROM		show
GROUP BY	show_name
ORDER BY	number_of_times_held DESC

-- 3.3  List the number of judges having each name.

SELECT		judge_name,
			COUNT(*)
FROM		judge
GROUP BY	judge_name	

-- 3.4  For each show, list the show name, date held and the number of events at that show.

SELECT		show_name, 
			show_held,
			COUNT(*) AS events_contested
FROM		show, event
WHERE		show.show_id = event.show_id
GROUP BY	show_name, 
			show_held

-- 3.5  For each horse that has won a prize, list the horse name, horse_id and total prize money won.

SELECT		horse_name, 
			horse.horse_id,
			SUM( prizemoney ) AS total_prizemoney_won
FROM		horse, entry, event, prize
WHERE		horse.horse_id = entry.horse_id
AND			entry.event_id = event.event_id
AND			event.event_id = prize.event_code
AND			entry.place = prize.place
GROUP BY	horse_name, 
			horse.horse_id

-- 3.6  For each horse which has won total prize money of at least $110, list the horse name, horse_id and total prize money won.

SELECT		horse_name, 
			horse.horse_id,
			SUM( prizemoney ) AS total_prizemoney_won
FROM		horse, entry, event, prize
WHERE		horse.horse_id = entry.horse_id
AND			entry.event_id = event.event_id
AND			event.event_id = prize.event_code
AND			entry.place = prize.place
GROUP BY	horse_name, 
			horse.horse_id
HAVING		SUM( prizemoney ) >= 110

-- 3.7  Produce a table similar to that below, showing, for first and second places, the number of times each prize was given, the 
-- total prize money awarded, the greatest prize, the smallest prize, and the average prize. (The attribute names in your 
-- solution may be different).
-- Place   Number  Total  Maximum   Miniumum    Average 
-- ------  ------  ------  -------  --------  ---------
	1		6		1250	1000		10		208.33 
--  2 ... 

SELECT		entry.place,
			COUNT(*) AS [Times Awarded],
			SUM( prizemoney ) AS Total,
			MAX( prizemoney ) AS Maximum,
			MIN( prizemoney ) AS Minimum,
			AVG( prizemoney ) AS Average
FROM		entry, event, prize
WHERE		entry.event_id = event.event_id
AND			event.event_id = prize.event_code
AND			entry.place <= 2
AND			entry.place = prize.place
GROUP BY	entry.place

-- 3.8  List the horse_id and horse name for each horse that has been placed in the top 2 more than once.

SELECT		horse.horse_id, 
			horse_name,
			COUNT(*) AS times_in_top_2_places
FROM		horse, entry
WHERE		horse.horse_id = entry.horse_id
AND			place <= 2
GROUP BY	horse.horse_id, 
			horse_name
HAVING		COUNT(*) >= 2

-- 3.9  List the name of each horse, and the number of times it has competed in an event judged by Smith of Melbourne.

SELECT		horse_name,
			COUNT(*) AS number_of_times_competing
FROM		horse, entry, event, judge
WHERE		horse.horse_id = entry.horse_id
AND			entry.event_id = event.event_id
AND			event.judge_id = judge.judge_id
AND			judge_name = 'Smith'
AND			address = 'Melbourne'
GROUP BY	horse_name

