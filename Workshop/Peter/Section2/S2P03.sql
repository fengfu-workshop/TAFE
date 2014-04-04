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
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P03
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List the name of each horse who has been awarded a first place. Do not display the name of a horse more than once.

	
	SELECT 	horse_name, event_name, place
	FROM	horse, entry, event
	WHERE   horse.horse_id = entry.horse_id
	AND		entry.event_id = event.event_id

END
GO
