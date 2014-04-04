USE Thirlemere_Fengfu_Chen

DECLARE @Question AS Varchar(6) = 'S1P10';

IF @Question = 'S1P10'
BEGIN
	SELECT horse_name, born
	FROM horse
	WHERE died is NOT NULL and born IN ('1976', '1978', '1980', '1981')
END

IF @Question = 'S1P09'
BEGIN
	SELECT horse_id, horse_name
	FROM horse
	WHERE died is NULL and born < '1990'
	ORDER BY horse_id;
END

IF @Question = 'S1P08'
BEGIN
	SELECT horse_name
	FROM horse
	WHERE colour = 'white';
END

IF @Question = 'S1P07'
BEGIN
	SELECT event_code
	FROM prize
	WHERE place = '1' AND (prizemoney BETWEEN 100 and 200);
END

IF @Question = 'S1P06'
BEGIN
	SELECT DISTINCT event_name
	FROM event;
END

IF @Question = 'S1P05'
BEGIN
	SELECT horse_name, died
	FROM horse
	WHERE died IS NOT NULL
	ORDER BY died DESC;
END

IF @Question = 'S1P04'
BEGIN
	SELECT horse_name, born, colour
	FROM horse
	WHERE gender = 'M' AND (colour = 'grey' OR colour = 'white');
END

IF @Question = 'S1P03'
BEGIN
	SELECT show_name, show_address
	FROM show
	WHERE show_address LIKE '%13%';
END

IF @Question = 'S1P02'
BEGIN
	SELECT horse_name
	FROM horse
	WHERE born = '1990';
END

IF @Question = 'S1P01'
BEGIN
	SELECT show_name, show_address
	FROM show;
END
