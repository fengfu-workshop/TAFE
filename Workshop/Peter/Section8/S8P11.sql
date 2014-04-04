SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P11
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT			Judge.judge_id, judge_name, event_id
	FROM			Judge
	LEFT OUTER JOIN Event ON Judge.judge_id = Event.judge_id

END
GO