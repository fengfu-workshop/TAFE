-- 4.1 List the name of each show, together with the date that it was held. Format the date into the following format exactly;

SELECT	show_name, 
		DATENAME(weekday, show_held) + ' ' + 
		DATENAME(DAY, show_held) + ' ' + 
		DATENAME(MONTH, show_held) + ', ' +
		DATENAME(YEAR, show_held) AS date_held
FROM	Show

-- 4.2  List the name of each event hosted at a show held in 1996

SELECT  event_name
FROM	Event, Show
WHERE	Event.show_id = Show.show_id
AND		DATEPART(YEAR, show_held) = 1996

-- 4.3  List the name of each horse, the name of the event and the show that the event was in, and its age at the time of the 
-- event (subtracting the year that the horse was born in, from the year that the show was held in will give a reasonable 
-- approximation for its age at the time).

SELECT	horse_name, 
		event_name, 
		show_name,
		DATEPART(year, show_held) - born AS age_at_the_time
FROM	Horse, Entry, Event, Show
WHERE	Horse.horse_id = Entry.horse_id
AND		Entry.event_id = Event.event_id
AND		Event.show_id = Show.show_id

-- 4.4  List the name of each event that has been held in July, together with the number of times it was held in that month.
-- Make sure your query uses ¡§July¡¨ and not ¡§7¡¨ to specify the month.

SELECT		event_name,
			COUNT(*) AS times_held_in_July
FROM		Event, Show
WHERE		Event.show_id = Show.show_id
AND			DATENAME(MONTH, show_held) = 'July'
GROUP BY	event_name

-- 4.5  List the horse_id, horse name and the number of years deceased for each dead horse since the year 2009.   Sort the 
-- results so that the horse which has been dead the longest appears first.

SELECT	horse_id, 
		horse_name,
		2009 - died AS NumberOfYearsDeceased
FROM	Horse
WHERE	died IS NOT NULL
ORDER BY NumberOfYearsDeceased DESC

-- 4.6  List the show name of any shows that have been held on a ¡§Saturday¡¨.

SELECT  show_name
FROM	Show
WHERE	DATENAME(weekday, show_held) = 'Saturday'

-- 4.7  List the number of days between the Dubbo show held at the ¡§Wingewarra St¡¨ show ground and the Castle Hill 
-- show.

SELECT DATEDIFF(DAY, 
	(SELECT	show_held
	FROM	Show
	WHERE	show_address LIKE '%Wingewarra St%'),

	(SELECT	show_held
	FROM	Show
	WHERE	show_address LIKE '%Castle Hill%')
) AS NoOfDaysBetweenShows

-- 4.8  List the id and name of each horse that has competed at a show together with the number of years between their last 
-- competition and 2009.

SELECT		Horse.horse_id,
			horse_name,
			2009 - DATEPART(year, MAX(show_held)) AS YearsToCompete
FROM		Horse, Entry, Event, Show
WHERE		Horse.horse_id = entry.horse_id
AND			Entry.event_id = Event.event_id
AND			Event.show_id = Show.show_id
GROUP BY	Horse.horse_id, horse_name
