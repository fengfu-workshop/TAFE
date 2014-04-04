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
CREATE PROCEDURE usp_S3E17
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- List customers theat have hired something
	SELECT	hire.cust_num,
			appliance.model_num,
			COUNT(*) AS No_of_Units
	FROM	hire,
			appliance
	WHERE	hire.stock_num = appliance.stock_num
	GROUP BY cust_num, model_num
	HAVING	COUNT(*) > 1
	AND		MIN(date_hired) >= '01/01/1990'

END
GO

/*

*/