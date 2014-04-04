SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P10
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		child.horse_name, sire.horse_name, event_name
	FROM		Horse child
	INNER JOIN	Entry e1 ON child.horse_id = e1.horse_id
	INNER JOIN	Entry e2 ON child.sire = e2.horse_id
	INNER JOIN	Horse sire ON child.sire = sire.horse_id
	INNER JOIN	Event ON e1.event_id = Event.event_id
	WHERE		e1.event_id = e2.event_id

END
GO