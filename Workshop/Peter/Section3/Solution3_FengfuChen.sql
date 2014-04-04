
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P01 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		event_name,
				COUNT(*) AS number_of_events_with_this_name
	FROM		Event
	GROUP BY	event_name

END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P02
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		show_name,
				COUNT(*) AS number_of_times_held
	FROM		Show
	GROUP BY	show_name
	ORDER BY	number_of_times_held DESC

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P03
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		judge_name,
				COUNT(*) AS number_of_judge_with_this_name
	FROM		Judge
	GROUP BY	judge_name

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P04
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		show_name, 
				show_held,
				COUNT(*) AS events_contested
								
	FROM		Show, Event
	WHERE		Show.show_id = Event.show_id
	GROUP BY	show_name,
				show_held
	ORDER BY	show_name

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P05
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		horse_name, 
				Horse.horse_id,
				SUM (prizemoney) AS total_prizemoney_won
								
	FROM		Horse, Entry, Event, Prize
	WHERE		Horse.horse_id = Entry.horse_id
	AND			Entry.event_id = Event.event_id
	AND			Event.event_id = Prize.event_code
	AND			Entry.place = Prize.place
	GROUP BY	horse_name, 
				horse.horse_id
	ORDER BY	horse_name

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P06
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		horse_name, 
				Horse.horse_id,
				SUM (prizemoney) AS total_prizemoney_won
								
	FROM		Horse, Entry, Event, Prize
	WHERE		Horse.horse_id = Entry.horse_id
	AND			Entry.event_id = Event.event_id
	AND			Event.event_id = Prize.event_code
	AND			Entry.place = Prize.place
	GROUP BY	horse_name, 
				Horse.horse_id
	HAVING		SUM (prizemoney) >= 110
	ORDER BY	horse_name

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P07
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		entry.place,
				COUNT(*) AS [Times Awarded],
				SUM( prizemoney ) AS Total,
				MAX( prizemoney ) AS Maximum,
				MIN( prizemoney ) AS Minimum,
				AVG( prizemoney ) AS Average
	FROM		Entry, Event, Prize
	WHERE		Entry.event_id = Event.event_id
	AND			Event.event_id = Prize.event_code
	AND			Entry.place = Prize.place
	AND			Entry.place <= 2
	GROUP BY	Entry.place

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P08
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		Horse.horse_id, 
				Horse.horse_name,
				COUNT(*) AS times_in_top_2_places
	FROM		Horse, Entry
	WHERE		horse.horse_id = entry.horse_id
	AND			place <= 2
	GROUP BY	Horse.horse_id, 
				Horse.horse_name
	HAVING		COUNT(*) > 1

END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P09
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		horse_name,
				COUNT(*) AS number_of_times_competing
	FROM		Horse, Entry, Event, Judge
	WHERE		Horse.horse_id = Entry.horse_id
	AND			Entry.event_id = Event.event_id
	AND			Event.judge_id = Judge.judge_id
	AND			judge_name = 'Smith'
	AND			address = 'Melbourne'
	GROUP BY	horse_name

END
GO