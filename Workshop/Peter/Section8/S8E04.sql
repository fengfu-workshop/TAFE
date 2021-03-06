
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	SQL Section 8 - Examples
-- =============================================
CREATE PROCEDURE usp_S8E04
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- List the stock_num and cust_num of every appliance that has been hired more than once by the same customer
	-- Suppose I wanted to list all appliances that had been hired more than once by different customers
	-- To do this I would need to have TWO copies of the hire table that match them up on stock_num then throw out all those rows
	-- where customer number is the same.
	SELECT		hire1.stock_num,
				hire1.cust_num
	FROM		Hire hire1
	INNER JOIN	Hire hire2
	ON			hire1.stock_num = hire2.stock_num
	

END
GO
