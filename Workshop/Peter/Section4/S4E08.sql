SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	
-- =============================================
CREATE PROCEDURE usp_S4E08

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	stock_num,
			cust_num,
			CONVERT(NVARCHAR, date_hired, 106) AS [Start_date]

	FROM	Hire
	ORDER BY  date_hired

END
GO
