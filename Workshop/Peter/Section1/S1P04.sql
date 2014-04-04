
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/02/2014
-- Description:	SQL Section 1 Problems
-- =============================================
CREATE PROCEDURE usp_S1P04
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List customers with an 'i' in their name

	SELECT	horse_name, born, colour
	FROM	horse
	WHERE	gender = 'M' AND (colour = 'grey' OR colour = 'white');
END
GO
