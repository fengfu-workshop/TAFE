SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
CREATE PROCEDURE usp_S8P01 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		event_id, 
				event_name, 
				judge_name
	FROM		Event
	INNER JOIN	Judge ON Event.judge_id = Judge.judge_id

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
CREATE PROCEDURE usp_S8P02
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		Event.event_id,  
				Entry.horse_id, 
				Prize.place, 
				FORMAT(prizemoney, 'C', 'en-us') AS prizemoney
	FROM		Entry
	INNER JOIN	Event ON Entry.event_id = Event.event_id
	INNER JOIN	Prize ON Event.event_id = Prize.event_code
	WHERE		entry.place = prize.place
	ORDER BY	event.event_id, entry.horse_id

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
CREATE PROCEDURE usp_S8P03
	-- Add the parameters for the stored procedure here
	@HorseName1 NVARCHAR(15) = 'Star',
	@HorseName2 NVARCHAR(15) = 'Flash',
	@JudgeName	NVARCHAR(15) = 'Smith',
	@Address	NVARCHAR(30) = 'Melbourne'
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		Event.event_id,  
				Event.event_name
	FROM		Horse
	INNER JOIN	Entry ON Horse.horse_id = Entry.horse_id
	INNER JOIN	Event ON Entry.event_id = Event.event_id
	INNER JOIN	Show ON	Event.show_id = Show.show_id
	INNER JOIN	Judge ON Event.judge_id = Judge.judge_id
	WHERE		horse_name IN (@HorseName1, @HorseName2)
	AND			(Judge.judge_name = @JudgeName AND address=@Address)

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P04
	-- Add the parameters for the stored procedure here
	@Money MONEY = 110
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		horse_name, 
				Horse.horse_id,
				SUM (prizemoney) AS total_prizemoney_won
	FROM		Horse
	INNER JOIN	Entry ON Horse.horse_id = Entry.horse_id
	INNER JOIN	Event ON Entry.event_id = Event.event_id
	INNER JOIN	Prize ON Event.event_id = Prize.event_code
	WHERE		Entry.place = Prize.place
	GROUP BY	horse_name, 
				Horse.horse_id
	HAVING		SUM (prizemoney) >= @Money
	ORDER BY	horse_name								

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P05
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		child.horse_name, 
				child.born,
				father.horse_name
	FROM		Horse child
	INNER JOIN	Horse father ON child.sire = father.horse_id
	ORDER BY	child.born						

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P06
	-- Add the parameters for the stored procedure here
	@HorseName NVARCHAR(15) = 'Flash'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		father.horse_name
	FROM		Horse child
	INNER JOIN	Horse father ON child.sire = father.horse_id
	WHERE		child.horse_name = @HorseName					

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P07
	-- Add the parameters for the stored procedure here
	@ChildColor  NVARCHAR(8) = 'White',
	@MotherColor NVARCHAR(8) = 'White',
	@ChildGender NCHAR(1) = 'M'
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		child.horse_name, mother.horse_name
	FROM		Horse child
	INNER JOIN	Horse mother ON child.dam = mother.horse_id
	WHERE		(child.colour = @ChildColor AND child.gender = @ChildGender)
	AND			mother.colour = @MotherColor		

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P08
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		child.horse_name, sire.horse_name, grandsire.horse_name
	FROM		Horse child
	INNER JOIN	Horse sire ON child.sire = sire.horse_id
	INNER JOIN	Horse grandsire ON sire.sire = grandsire.horse_id

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P09
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		p1.event_code, p1.prizemoney, p2.prizemoney, p3.prizemoney
	FROM		Prize p1
	INNER JOIN	Prize p2 ON p1.event_code = p2.event_code AND p1.prizemoney > p2.prizemoney
	INNER JOIN	Prize p3 ON p2.event_code = p3.event_code AND p2.prizemoney > p3.prizemoney

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 19/03/2014
-- Description:	Solution for Section 8 - Other type of join
-- =============================================
Create PROCEDURE usp_S8P10
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT		child.horse_name, sire.horse_name, event_name
	FROM		Horse child
	INNER JOIN	Entry e1 ON child.horse_id = e1.horse_id
	INNER JOIN	Entry e2 ON child.sire = e2.horse_id
	INNER JOIN	Horse sire ON child.sire = sire.horse_id
	INNER JOIN	Event ON e1.event_id = Event.event_id
	WHERE		e1.event_id = e2.event_id

END
GO


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
