SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	
-- =============================================
CREATE PROCEDURE usp_S4E06

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	CONVERT(NVARCHAR, date_hired, 106) AS Hire_Date,
			DATEPART(DAY, date_hired) AS [Day],
			DATEPART(MONTH, date_hired) AS [Month],
			DATEPART(YEAR, date_hired) AS [Year]
	FROM	hire
END
GO
