SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P06
	-- Add the parameters for the stored procedure here
	@HorseName NVARCHAR(15) = 'Flash'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		father.horse_name
	FROM		Horse child
	INNER JOIN	Horse father ON child.sire = father.horse_id
	WHERE		child.horse_name = @HorseName					

END
GO