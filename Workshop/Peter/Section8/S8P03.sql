SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
CREATE PROCEDURE usp_S8P03
	-- Add the parameters for the stored procedure here
	@HorseName1 NVARCHAR(15) = 'Star',
	@HorseName2 NVARCHAR(15) = 'Flash',
	@JudgeName	NVARCHAR(15) = 'Smith',
	@Address	NVARCHAR(30) = 'Melbourne'
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		Event.event_id,  
				Event.event_name
	FROM		Horse
	INNER JOIN	Entry ON Horse.horse_id = Entry.horse_id
	INNER JOIN	Event ON Entry.event_id = Event.event_id
	INNER JOIN	Show ON	Event.show_id = Show.show_id
	INNER JOIN	Judge ON Event.judge_id = Judge.judge_id
	WHERE		horse_name IN (@HorseName1, @HorseName2)
	AND			(Judge.judge_name = @JudgeName AND address=@Address)

END
GO