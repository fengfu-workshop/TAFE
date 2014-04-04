SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P09
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		p1.event_code, p1.prizemoney, p2.prizemoney, p3.prizemoney
	FROM		Prize p1
	INNER JOIN	Prize p2 ON p1.event_code = p2.event_code AND p1.prizemoney > p2.prizemoney
	INNER JOIN	Prize p3 ON p2.event_code = p3.event_code AND p2.prizemoney > p3.prizemoney

END
GO