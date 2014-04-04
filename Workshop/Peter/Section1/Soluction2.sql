-- S2P01

SELECT event_id, event_name, judge_name
FROM event e 
LEFT JOIN judge j
ON	e.judge_id = j.judge_id;

SELECT event_id, event_name, judge_name
FROM event e, judge j
WHERE e.judge_id = j.judge_id;

-- S2P02

SELECT horse_name
FROM	horse
WHERE	sire = '201';

SELECT TOP 2 horse_name
FROM	horse
WHERE	sire = '201';

-- S2P03

SELECT horse_name, event_name, place
FROM	horse h
JOIN	entry e
ON		h.horse_id = e.horse_id
JOIN	event ev
ON		e.event_id = ev.event_id

-- S2P04

SELECT	event_name, show_name, show_address, judge_name, address
FROM	show	s
JOIN	event	e
ON		s.show_id = e.show_id
JOIN	judge	j
ON		e.judge_id = j.judge_id

-- S2P05

SELECT	show_held, judge_name, event_name
FROM	show	s
JOIN	event	e
ON		s.show_id = e.show_id
JOIN	judge	j
ON		e.judge_id = j.judge_id
WHERE   show_held IN ('07/05/1995', '07/01/1996')