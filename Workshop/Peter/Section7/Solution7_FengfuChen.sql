SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P1 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	*
	INTO	NewHorse
	FROM	Horse

	SELECT	*
	INTO	NewEntry
	FROM	Entry

	SELECT	*
	INTO	NewEvent
	FROM	Event

	SELECT	*
	INTO	NewShow
	FROM	Show

	SELECT	*
	INTO	NewJudge
	FROM	Judge

	SELECT	*
	INTO	NewPrize
	FROM	Prize

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P2
	-- Add the parameters for the stored procedure here
	@HorseId	NVARCHAR(3) =  '401',
	@HorseName	NVARCHAR(15) = 'Snappy'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	UPDATE  NewHorse
	SET		horse_name = @HorseId
	WHERE	horse_id = @HorseName


END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P3
	-- Add the parameters for the stored procedure here
	@EventId	NCHAR(4) = '0102',
	@Place		TINYINT = 1,
	@NewMoney	MONEY = 20

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	UPDATE  NewPrize
	SET		prizemoney = @NewMoney
	WHERE	event_code = @EventId
	AND		place = @Place
	
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P4
	-- Add the parameters for the stored procedure here
	@NameFrom	NVARCHAR(15) = 'Smith',
	@NameTo		NVARCHAR(15) = 'Smithers',
	@Address	NVARCHAR(30) = 'Sydney'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	UPDATE  NewJudge
	SET		judge_name = @NameTo
	WHERE	judge_name = @NameFrom
	AND		address = @Address
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P5
	-- Add the parameters for the stored procedure here
	@AddressInclude NVARCHAR(20) = '13',
	@Month			NVARCHAR(20) = 'April'

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DELETE FROM NewShow
	WHERE	show_address LIKE '%'+@AddressInclude+'%'
	AND		DATENAME(MONTH, show_held) = @Month

	--SELECT  *
	--FROM	NewShow
	--WHERE	show_address LIKE '%13%'
	--AND		DATENAME(MONTH, show_held) = 'April'

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P6
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DELETE FROM NewHorse
	WHERE	died IS NOT NULL

	--SELECT	*
	--FROM	NewHorse
	--WHERE	died IS NOT NULL

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 18/03/2014
-- Description:	Solution for Section 7 - Changing data
-- =============================================
CREATE PROCEDURE usp_S7P7
	-- Add the parameters for the stored procedure here
	@MoneyIncreased MONEY = 100

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	UPDATE	NewPrize
	SET		prizemoney = prizemoney + @MoneyIncreased
	WHERE	place = 1

	--SELECT place, prizemoney, prizemoney+100
	--FROM	NewPrize
	--WHERE	place = 1

END
GO