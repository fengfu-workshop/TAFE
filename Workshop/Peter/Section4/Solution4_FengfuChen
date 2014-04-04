SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P1 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	show_name,
			DATENAME(dw, show_held) + ' ' +
			DATENAME(DAY, show_held) + ' ' +
			DATENAME(MONTH, show_held) + ', ' +
			DATENAME(YEAR, show_held) + ' ' AS date_held
	FROM	SHOW

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P2
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	event_name

	FROM	Show, Event
	WHERE	Show.show_id = Event.show_id
	AND		DATEPART(YEAR, show_held) = 1996

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P3
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	horse_name, 
			event_name, 
			show_name, 
			DATEPART(year, show_held) - born AS age_at_the_time
	
	FROM	Horse, Entry, Event, Show 
	WHERE	Horse.horse_id = Entry.horse_id
	AND		Entry.event_id = Event.event_id
	AND		Event.show_id = Show.show_id

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P4
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	event_name, 
			COUNT(*) AS times_held_in_July
	
	FROM	Event, Show 
	WHERE	Event.show_id = Show.show_id
	AND		DATENAME(MONTH, show_held) = 'July'
	GROUP BY event_name

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P5
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		horse_id, 
				horse_name,
				2009 - died AS NumberOfYearsDeceased
	
	FROM		Horse
	WHERE		died IS NOT NULL
	ORDER BY	NumberOfYearsDeceased DESC

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P6
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		show_name
	
	FROM		Show
	WHERE		DATENAME(dw, show_held) = 'Saturday'

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P7
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT DATEDIFF(DAY, 
		(SELECT		show_held
		FROM		Show
		WHERE		show_name = 'Dubbo'
		AND			show_address LIKE '%Wingewarra St%'),

		(SELECT		show_held
		FROM		Show
		WHERE		show_name = 'Castle Hill') 
	) AS NoOfDaysBetweenShows

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P8
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		Horse.horse_id,
				horse_name,
				2009 - DATEPART(YEAR, MAX(show_held))
				--2009-MAX(Year(Show_held))
				
	FROM		Horse, Entry, Event, Show
	WHERE		Horse.horse_id = Entry.horse_id
	AND			Entry.event_id = Event.event_id
	AND			Event.show_id = Show.show_id
	GROUP BY	Horse.horse_id,
				horse_name
END
GO
