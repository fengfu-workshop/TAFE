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
CREATE PROCEDURE usp_S5P7

	-- List the name of each horse, together with the number of events in which it has been awarded first place. Horses 
	-- who have never won a first place should also be listed with a count of zero. Sort the list into descending order on 
	-- number of wins.

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	horse_name, COUNT(*) AS number_of_wins
	FROM	Horse, Entry
	WHERE	Horse.horse_id = Entry.horse_id
	AND		place = 1
	GROUP BY horse_name

	UNION

	SELECT	horse_name, 0
	FROM	Horse
	WHERE	horse_id NOT IN (
		SELECT	Horse.horse_id
		FROM	Horse, Entry
		WHERE	Horse.horse_id = Entry.horse_id
		AND		place = 1
		GROUP BY Horse.horse_id)

	ORDER BY number_of_wins DESC
				
END
GO
