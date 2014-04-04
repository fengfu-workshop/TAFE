
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P07
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List event_id, horse_id, place and money. Sort the results into order on event_id then horse_id.

	
	SELECT 	event.event_id,  entry.horse_id, prize.place, FORMAT(prizemoney, 'C', 'en-us')
	FROM	entry, event, prize
	WHERE   entry.event_id = event.event_id
	AND		event.event_id = prize.event_code
	AND		entry.place = prize.place
	ORDER BY event.event_id, entry.horse_id

END
