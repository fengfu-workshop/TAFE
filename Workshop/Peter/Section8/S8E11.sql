
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	SQL Section 8 - Examples
-- =============================================
CREATE PROCEDURE usp_S8E11
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 	SELECT		c.cust_name,
				h.stock_num
	FROM		Customer c
	INNER JOIN	Hire h ON c.cust_num = h.cust_num

END
GO
