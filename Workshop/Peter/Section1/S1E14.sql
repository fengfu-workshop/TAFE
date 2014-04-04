
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/02/2014
-- Description:	SQL Section 1 Example
-- =============================================
CREATE PROCEDURE usp_S1E14
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List customers with an 'i' in their name

	SELECT	*
	FROM	hire
	WHERE	cust_num = '1001'
	   OR	cust_num = '1003' AND stock_num = '2001'
	   OR	stock_num = '2005';

END
GO
