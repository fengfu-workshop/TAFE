
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	SQL Section 8 - Examples
-- =============================================
CREATE PROCEDURE usp_S8E02
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- This query is from S2E10.
	SELECT	customer.cust_name, 
			date_hired, 
			condition, 
			mth_charge
	FROM	customer, 
			hire, 
			appliance, 
			model
	WHERE	customer.cust_num = hire.cust_num
	AND		hire.stock_num = appliance.stock_num
	AND		model_code = model_num

	-- Same query logic using INNER JOIN
	SELECT		customer.cust_name, 
				date_hired, 
				condition, 
				mth_charge
	FROM		(((Customer
	INNER JOIN	hire ON customer.cust_num = hire.cust_num)
	INNER JOIN	appliance ON hire.stock_num = appliance.stock_num)
	INNER JOIN	Model ON Appliance.model_num = Model.model_code)

END
GO
