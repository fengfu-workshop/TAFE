
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
