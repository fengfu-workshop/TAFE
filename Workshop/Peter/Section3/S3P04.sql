
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
