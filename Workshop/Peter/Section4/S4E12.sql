SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 5/3/2014
-- Description:	SQL 
-- =============================================
CREATE PROCEDURE usp_S4E12

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET DATEFORMAT DMY

    -- Insert statements for procedure here
	SELECT	*
	FROM	Hire
	WHERE	date_hired >= '1/3/1990'
	AND		date_hired < '1/5/1990'


END
GO
