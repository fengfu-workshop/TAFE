
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P08
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- For each event with a first prize, list the show name, event name and first prize money.

	
	SELECT 	show_name,  event_name, FORMAT(prizemoney, 'C', 'en-us')
	FROM	event, prize, show
	WHERE   event.event_id = prize.event_code
	AND		event.show_id = show.show_id
	AND		place = 1

END
