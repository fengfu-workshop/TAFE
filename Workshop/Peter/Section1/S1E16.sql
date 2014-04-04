
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/02/2014
-- Description:	SQL Section 1 Example
-- =============================================
Alter PROCEDURE usp_S1E16
	-- Add the parameters for the stored procedure here
	@Cust1		NCHAR(4) = '1001',
	@Cust2		NCHAR(4) = '1003',
	@Stock1		NCHAR(4) = '2001',
	@Stock2		NCHAR(4) = '2005'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List hire Details for when customer 1001 or 1003 had hired item number (stock_num) 2001 or 2005

	SELECT	*
	FROM	hire
	WHERE	(((cust_num = @Cust1) OR (cust_num = @Cust2))
	AND		((stock_num = @Stock1) OR (stock_num = @Stock2)));

	/* When traced with complex conditions, SQL evaluates them in the following order
	 * -----Operations inside parenthesis (with ANDs and ORs, if present, evaluated as follows)
	 * -----then all ANDs
	 * -----then all ORs
	 */

END
GO
