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
-- Create date: 11/03/2014
-- Description:	Solution of  Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5P6

	-- List the name and id of each horse, together with one of the following text values, as appropriate, “Alive” or “Dead”. 
	-- Sort by horse_id

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	horse_name, horse_id, 'Alive' AS Status
	FROM	Horse
	WHERE	died IS NULL

	UNION

	SELECT	horse_name, horse_id, 'Dead'
	FROM	Horse
	WHERE	died IS NOT NULL
				
END
GO
