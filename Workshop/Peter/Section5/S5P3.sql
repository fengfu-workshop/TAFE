SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Solution of  Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5P3
	@Horse1		NVARCHAR(15) = 'Star',
	@Horse2		NVARCHAR(15) = 'Flash',
	@JudgeName	NVARCHAR(15) = 'Smith',
	@Address	NVARCHAR(30) = 'Melbourne'

	-- Using subqueries only (without products of any kind), list the event_id and event name for all events entered by Star 
	-- or Flash and judged by Smith from Melbourne.	

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	event_id, event_name
	FROM	Event
	WHERE	event_id IN (
				SELECT	event_id
				FROM	Entry
				WHERE	horse_id IN (
					SELECT	horse_id
					FROM	Horse
					WHERE	horse_name IN (@Horse1, @Horse2) ))

	AND		event_id IN (
				SELECT	event_id
				FROM	Event
				WHERE	judge_id IN (
							SELECT  judge_id
							FROM	Judge
							WHERE	judge_name = @JudgeName
							AND		address = @Address ));

END
GO