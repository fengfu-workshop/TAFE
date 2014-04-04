
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
