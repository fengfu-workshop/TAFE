SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5E05 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	*
	FROM	hire
	WHERE	stock_num IN (
		SELECT	stock_num
		FROM	appliance
		WHERE	model_num IN (
			SELECT	model_code
			FROM	model
			WHERE	model_name LIKE '%video%'));

END
GO
