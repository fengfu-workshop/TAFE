
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P10
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List the event_id and event name for all events entered by Star or Flash and judged by Smith from Melbourne. 

	
	SELECT 	event.event_id,  event.event_name
	FROM	horse, entry, event, show, judge
	WHERE   horse.horse_id = entry.horse_id
	AND		entry.event_id = event.event_id
	AND		event.show_id = show.show_id
	AND		event.judge_id = judge.judge_id
	AND		horse_name IN ('Star', 'Flash')
	AND		(judge.judge_name = 'Smith' AND address='Melbourne')

END
