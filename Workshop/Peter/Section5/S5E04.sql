SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5E04
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT	*
	FROM	hire
	WHERE	cust_num IN
		(SELECT cust_num
		FROM customer
		WHERE title = 'Mr')
	AND stock_num IN
		(SELECT stock_num
		FROM appliance
		WHERE condition = 'E')
	ORDER BY stock_num, date_hired;

END
GO
