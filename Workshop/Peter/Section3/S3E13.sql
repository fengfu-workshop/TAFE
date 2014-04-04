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
CREATE PROCEDURE usp_S3E13
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- List the cust_num and numbers of times they've hired an appliance
	SELECT		Customer.cust_num,
				cust_name,
				COUNT(*) AS Number_Of_Hires
	FROM		customer,
				hire
	WHERE		customer.cust_num = hire.cust_num
	GROUP BY	Customer.cust_num, cust_name
END
GO

/*

*/