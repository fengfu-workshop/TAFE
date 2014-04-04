
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
