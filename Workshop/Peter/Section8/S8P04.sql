SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P04
	-- Add the parameters for the stored procedure here
	@Money MONEY = 110
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		horse_name, 
				Horse.horse_id,
				SUM (prizemoney) AS total_prizemoney_won
	FROM		Horse
	INNER JOIN	Entry ON Horse.horse_id = Entry.horse_id
	INNER JOIN	Event ON Entry.event_id = Event.event_id
	INNER JOIN	Prize ON Event.event_id = Prize.event_code
	WHERE		Entry.place = Prize.place
	GROUP BY	horse_name, 
				Horse.horse_id
	HAVING		SUM (prizemoney) >= @Money
	ORDER BY	horse_name								

END
GO