
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 04/03/2014
-- Description:	Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3P08
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT		Horse.horse_id, 
				Horse.horse_name,
				COUNT(*) AS times_in_top_2_places
	FROM		Horse, Entry
	WHERE		horse.horse_id = entry.horse_id
	AND			place <= 2
	GROUP BY	Horse.horse_id, 
				Horse.horse_name
	HAVING		COUNT(*) >= 2


END
GO
