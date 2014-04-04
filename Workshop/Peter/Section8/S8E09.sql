
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	SQL Section 8 - Examples
-- =============================================
CREATE PROCEDURE usp_S8E09
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 	SELECT		Customer.cust_name,
				Hire.date_hired,
				Hire.paid_till,
				Model.model_name
	FROM		(((Customer
	INNER JOIN	Hire ON Hire.cust_num = Customer.cust_num)
	INNER JOIN	Appliance ON Hire.stock_num = Appliance.stock_num)
	INNER JOIN	Model ON Appliance.model_num = Model.model_code)
	WHERE		(Hire.date_hired >= '1 Mar 1909' AND Hire.date_hired < '1 May 1990')
	OR			(Hire.paid_till >= '1 Mar 1990' AND Hire.paid_till < '1 Mar 1990')

END
GO
