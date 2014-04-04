SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5E07
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	appliance.stock_num, date_hired, customer.cust_num, paid_till, date_ret
	FROM	customer, hire, appliance
	WHERE	customer.cust_num = hire.cust_num 
	AND		hire.stock_num = appliance.stock_num
	AND		title = 'Mr'
	AND		condition = 'E';

END
GO
