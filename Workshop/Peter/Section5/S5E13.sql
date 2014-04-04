SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5E13
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	cust_name, 'hired', model_num, 'on', CONVERT(NVARCHAR, date_hired, 107) AS starting_date
	FROM	customer, hire, appliance
	WHERE	customer.cust_num = hire.cust_num 
	AND		hire.stock_num = appliance.stock_num

	UNION

	SELECT	cust_name, 'has hired', 'none', ' ', ' '
	FROM	customer
	WHERE	cust_num NOT IN (
		SELECT cust_num
		FROM hire)
	ORDER BY model_num;

END
GO
