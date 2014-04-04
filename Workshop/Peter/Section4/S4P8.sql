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
-- Create date: 5/3/2014
-- Description:	Solution 4 - DATE
-- =============================================
CREATE PROCEDURE usp_S4P8
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		Horse.horse_id,
				horse_name,
				2009 - DATEPART(YEAR, MAX(show_held))

	FROM		Horse, Entry, Event, Show
	WHERE		Horse.horse_id = Entry.horse_id
	AND			Entry.event_id = Event.event_id
	AND			Event.show_id = Show.show_id
	GROUP BY	Horse.horse_id,
				horse_name
END
GO
