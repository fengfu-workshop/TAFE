SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	
-- =============================================
CREATE PROCEDURE usp_S4E07

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	CONVERT(NVARCHAR, date_hired, 106) AS Hire_Date,
			DATENAME(DAY, date_hired) + '/' +
			CONVERT(NVARCHAR(2), DATEPART(MONTH, date_hired)) + '/' +
			DATENAME(YEAR, date_hired) AS Hire_Dtae

	FROM	hire
END
GO
