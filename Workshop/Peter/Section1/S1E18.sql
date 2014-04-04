
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/02/2014
-- Description:	SQL Section 1 Example
-- =============================================
ALTER PROCEDURE usp_S1E18
	-- Add the parameters for the stored procedure here
	@SearchChar		NCHAR(1) = 'i'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List customers with an 'i' in their name

	SELECT	*
	FROM	Customer
	WHERE	cust_name LIKE '%'+@SearchChar+'%';

END
GO
