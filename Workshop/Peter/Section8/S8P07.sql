SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P07
	-- Add the parameters for the stored procedure here
	@ChildColor  NVARCHAR(8) = 'White',
	@MotherColor NVARCHAR(8) = 'White',
	@ChildGender NCHAR(1) = 'M'
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		child.horse_name, mother.horse_name
	FROM		Horse child
	INNER JOIN	Horse mother ON child.dam = mother.horse_id
	WHERE		(child.colour = @ChildColor AND child.gender = @ChildGender)
	AND			mother.colour = @MotherColor		

END
GO