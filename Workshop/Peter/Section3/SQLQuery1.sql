-- 3.1
SELECT		event_name,
			COUNT(*)
FROM		Event
GROUP BY	event_name

-- 3.2
SELECT		show_name,
			COUNT(*)
FROM		Show
GROUP BY	show_name
ORDER BY	COUNT(*) DESC

-- 3.3
SELECT		judge_name,
			COUNT(*)
FROM		Judge
GROUP BY	judge_name

-- 3.4
SELECT		show_name,
			show_held,
			COUNT(*)
FROM		Show, Event
WHERE		Show.show_id = Event.show_id
GROUP BY	show_name, show_held
ORDER BY	show_name

-- 3.5
SELECT		horse_name,
			Horse.horse_id,
			SUM(prizemoney)
FROM		Horse, Entry, Event, Prize
WHERE		Horse.horse_id = Entry.horse_id
AND			Entry.event_id = Event.event_id
AND			Event.event_id = Prize.event_code
AND			Entry.place = Prize.place
GROUP BY	horse_name, Horse.horse_id

-- 3.6
SELECT		horse_name,
			Horse.horse_id,
			SUM(prizemoney)
FROM		Horse, Entry, Event, Prize
WHERE		Horse.horse_id = Entry.horse_id
AND			Entry.event_id = Event.event_id
AND			Event.event_id = Prize.event_code
AND			Entry.place = Prize.place
GROUP BY	horse_name, Horse.horse_id
HAVING		SUM(prizemoney) >= 110

-- 3.7
SELECT		Entry.place,
			COUNT(prizemoney),
			SUM(prizemoney),
			MAX(prizemoney),
			MIN(prizemoney),
			AVG(prizemoney)
FROM		Entry, Event, Prize
WHERE		Entry.event_id = Event.event_id
AND			Event.event_id = Prize.event_code
AND			Entry.place = Prize.place
AND			Entry.place <= 2
GROUP BY	Entry.place

-- 3.8
SELECT		Horse.horse_id, 
			horse_name,
			COUNT(*)
FROM		Horse, Entry
WHERE		Horse.horse_id = Entry.horse_id
AND			place <= 2
GROUP BY	Horse.horse_id, horse_name
HAVING		COUNT(*) > 1

-- 3.9
SELECT		horse_name,
			COUNT(*)
FROM		Horse, Entry, Event, Judge
WHERE		Horse.horse_id = Entry.horse_id
AND			Entry.event_id = Event.event_id
AND			Event.judge_id = Judge.judge_id
AND			judge_name = 'Smith'
AND			address = 'Melbourne'
GROUP BY	horse_name

