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
CREATE PROCEDURE usp_S3E11
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- List the number of each ot th e models we have in stock
	SELECT	condition,
			model_num,
			model_name,
			COUNT(*) AS Num_of_units
	FROM	appliance, 
			model
	WHERE	appliance.model_num = model.model_code
	GROUP BY condition, model_num, model_name
END
GO

/*
SELECT * FROM model
*/