
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P01
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List the customer name and the model number for all hires.


	SELECT 	event_id, event_name, judge_name
	FROM 	event, judge
	WHERE	event.judge_id = judge.judge_id

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
ALTER PROCEDURE usp_S2P02
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List the name of each horse who has been awarded a first place. Do not display the name of a horse more than once.

	SELECT 	DISTINCT horse.horse_name
	FROM 	horse, entry
	WHERE	horse.horse_id = entry.horse_id
	AND		place = 1

END
GO


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
    -- For each event that a horse has entered. List the name of the horse together with the name of the event, and its placing in that event (if any).
	
	SELECT 	horse_name, event_name, place
	FROM	horse, entry, event
	WHERE   horse.horse_id = entry.horse_id
	AND		entry.event_id = event.event_id

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P04
	-- Add the parameters for the stored procedure here
	-- For each event, list the name of the event, the name and address of the show that it is in, and the name and address of the judge who is judging it.

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT 	event_name, show_name, show_address, judge_name, address
	FROM	event, show, judge
	WHERE   event.show_id = show.show_id
	AND		event.judge_id = judge.judge_id

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P05
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    -- For all events at the show named “Dubbo”, list the date of the show, the judge name and the event name.
	
	SELECT 	FORMAT(show_held, 'd', 'en-gb'), judge_name, event_name
	FROM	event, show, judge
	WHERE   event.show_id = show.show_id
	AND		event.judge_id = judge.judge_id
	AND		show_name = 'Dubbo'

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P06
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    -- For each event with a first prize, list the event name and the first prize money.
	
	SELECT 	event_name,  FORMAT(prize.prizemoney, 'C', 'en-us') AS prizemoney
	FROM	event, prize
	WHERE   event.event_id = prize.event_code
	AND		place = 1

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P07
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List event_id, horse_id, place and money. Sort the results into order on event_id then horse_id.

	
	SELECT 	event.event_id,  entry.horse_id, prize.place, FORMAT(prizemoney, 'C', 'en-us')  AS prizemoney
	FROM	entry, event, prize
	WHERE   entry.event_id = event.event_id
	AND		event.event_id = prize.event_code
	AND		entry.place = prize.place
	ORDER BY event.event_id, entry.horse_id

END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P08
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- For each event with a first prize, list the show name, event name and first prize money.

	
	SELECT 	show_name,  event_name, FORMAT(prizemoney, 'C', 'en-us')  AS prizemoney
	FROM	event, prize, show
	WHERE   event.event_id = prize.event_code
	AND		event.show_id = show.show_id
	AND		place = 1

END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P09
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List the horse name, show name, event name and place for all horses in events judged by ¡§Green¡¨

	
	SELECT 	horse_name,  show_name, event_name, entry.place
	FROM	horse, entry, event, show, judge
	WHERE   horse.horse_id = entry.horse_id
	AND		entry.event_id = event.event_id
	AND		event.show_id = show.show_id
	AND		event.judge_id = judge.judge_id
	AND		judge_name = 'Green'

END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 25/02/2014
-- Description:	SQL Section 2 Examples - Retriving information from sereval tables
-- =============================================
CREATE PROCEDURE usp_S2P10
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	-- List the event_id and event name for all events entered by Star or Flash and judged by Smith from Melbourne. 

	
	SELECT 	event.event_id,  event.event_name
	FROM	horse, entry, event, show, judge
	WHERE   horse.horse_id = entry.horse_id
	AND		entry.event_id = event.event_id
	AND		event.show_id = show.show_id
	AND		event.judge_id = judge.judge_id
	AND		horse_name IN ('Star', 'Flash')
	AND		(judge.judge_name = 'Smith' AND address='Melbourne')

END
GO