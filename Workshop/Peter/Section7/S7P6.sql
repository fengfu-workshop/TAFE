SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P6
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DELETE FROM NewHorse
	WHERE	died IS NOT NULL

	--SELECT	*
	--FROM	NewHorse
	--WHERE	died IS NOT NULL

END
GO