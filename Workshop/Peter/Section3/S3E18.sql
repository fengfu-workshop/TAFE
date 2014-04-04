-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 26/02/2014
-- Description:	SQL Section 3 Example - Aggregation and Grouping
-- =============================================
CREATE PROCEDURE usp_S3E18
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- 
	SELECT	customer.title,
			customer.cust_name,
			model.model_name,
			COUNT(*) AS times_hired
	FROM	customer,
			hire,
			appliance,
			model
	WHERE	customer.cust_num = hire.cust_num
	AND		hire.stock_num = appliance.stock_num
	AND		appliance.model_num = model.model_code
	AND		customer.title != 'Mr'
	GROUP BY customer.title,
			 customer.cust_name,
			 model.model_name
	HAVING	 COUNT(*) > 1
	ORDER BY cust_name

END
GO

/*

*/