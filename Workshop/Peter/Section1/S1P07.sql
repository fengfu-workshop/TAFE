
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/02/2014
-- Description:	SQL Section 1 Problems
-- =============================================
CREATE PROCEDURE usp_S1P07
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List customers with an 'i' in their name

	SELECT	event_code
	FROM	prize
	WHERE	place = '1' AND (prizemoney BETWEEN 100 and 200);
END
GO
