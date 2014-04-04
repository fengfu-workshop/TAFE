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
-- Create date: 18/02/2014
-- Description:	SQL Section 1 Example
-- =============================================
Alter PROCEDURE usp_S1E11
	-- Add the parameters for the stored procedure here
	@Cust_Num NCHAR(4) = '1001'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List the hire details (*) for customer 1001 who has a current hire.

	SELECT	*
	FROM	hire
	WHERE	date_ret IS NULL	
	AND cust_num = @Cust_Num;

END
GO
