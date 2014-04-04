SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P08
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		child.horse_name, sire.horse_name, grandsire.horse_name
	FROM		Horse child
	INNER JOIN	Horse sire ON child.sire = sire.horse_id
	INNER JOIN	Horse grandsire ON sire.sire = grandsire.horse_id

END
GO