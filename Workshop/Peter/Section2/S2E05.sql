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
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2E05
	-- Add the parameters for the stored procedure here
	@SearchChars NVARCHAR(10) = 'TV'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT model_code, model_name, stock_num, condition
	FROM	model, appliance
	WHERE	model_code = model_num
	AND		model_name LIKE '%' + 'TV' + '%'
	ORDER BY model_code, stock_num DESC
END
GO
