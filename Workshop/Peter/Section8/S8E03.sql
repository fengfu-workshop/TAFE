
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	SQL Section 8 - Examples
-- =============================================
CREATE PROCEDURE usp_S8E03
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- List the stock_num and cust_num of every appliance that has been hired more than once by the same customer
	SELECT		stock_num,
				cust_num
	FROM		Hire
	GROUP BY	stock_num,
				cust_num
	HAVING		COUNT(*) > 1


END
GO
