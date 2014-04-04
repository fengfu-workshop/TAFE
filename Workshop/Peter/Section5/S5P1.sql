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
CREATE PROCEDURE usp_S5P2
	--	@ShowId	NCHAR(2) = '01'

	-- Using subqueries only (without products of any kind), list the name of every judge who has judged an event at the 
	-- Dubbo show in 1995.	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	judge_name
	FROM	Judge
	WHERE	judge_id IN (
				SELECT	judge_id
				FROM	Event
				WHERE	show_id IN (
					SELECT	show_id
					WHERE	show_id = @ShowId));


END
GO
