SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P7
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	UPDATE	NewPrize
	SET		prizemoney = prizemoney + 100
	WHERE	place = 1

	--SELECT place, prizemoney, prizemoney+100
	--FROM	NewPrize
	--WHERE	place = 1

END
GO