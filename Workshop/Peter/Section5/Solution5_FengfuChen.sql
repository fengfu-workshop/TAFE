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
	@ShowName	NVARCHAR(15) = 'Dubbo',
	@ShowYear	INT = 1995

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
					FROM	show
					WHERE	show_name = @ShowName
					AND		Year(show_held) = @ShowYear));


END
GO


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


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Solution of  Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5P4

	@Address	NVARCHAR(30) = 'Melbourne',
	@gender		NCHAR(1) = 'S'
	-- Using subqueries only (without products of any kind), list the name of each judge who does not live in Melbourne, 
	-- and who has judged an event entered by any horse with a gender of ‘S’

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	judge_name
	FROM	Judge
	WHERE	address != @Address
	AND		judge_id IN (
				SELECT	judge_id 
				FROM	Event
				WHERE	event_id IN (
					SELECT	event_id
					FROM	Entry
					WHERE	horse_id IN (
						SELECT  horse_id
						FROM	Horse
						WHERE	gender = @gender)));
				
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 11/03/2014
-- Description:	Solution of  Subqueries and Union
-- =============================================
CREATE PROCEDURE usp_S5P5

	@Address	NVARCHAR(30) = 'Melbourne',
	@gender		NCHAR(1) = 'S'

	-- Using only products, list the name of each judge who does not live in Melbourne, 
	-- and who has judged an event entered by any horse with a gender of ‘S’

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	DISTINCT judge_name
	FROM	Judge, Event, Entry, Horse
	WHERE	Judge.judge_id = Event.judge_id
	AND		Event.event_id = Entry.event_id
	AND		Entry.horse_id = Horse.horse_id
	AND		address != @Address
	AND		gender = @gender
				
END
GO


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
