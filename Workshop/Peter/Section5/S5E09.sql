SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5E09
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT cust_name, 'is an active customer'
	FROM customer
	WHERE cust_num IN (
		SELECT cust_num
		FROM hire);

END
GO
