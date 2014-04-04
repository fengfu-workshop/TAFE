
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	SQL Section 8 - Examples
-- =============================================
CREATE PROCEDURE usp_S8E10
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 	SELECT		W.cust_name,
				X.date_hired,
				X.paid_till,
				Z.model_name
	FROM		(((Customer AS W
	INNER JOIN	Hire AS X ON X.cust_num = W.cust_num)
	INNER JOIN	Appliance AS Y ON X.stock_num = Y.stock_num)
	INNER JOIN	Model AS Z ON Y.model_num = Z.model_code)
	WHERE		(X.date_hired >= '1 Mar 1909' AND X.date_hired < '1 May 1990')
	OR			(X.paid_till >= '1 Mar 1990' AND X.paid_till < '1 Mar 1990')

END
GO
