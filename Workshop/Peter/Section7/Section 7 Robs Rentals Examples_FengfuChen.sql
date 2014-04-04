SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E01
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	*
	INTO	NewCustomer
	FROM	Customer

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E02
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	stock_num, model_num, condition, date_maint
	INTO	NewAppliance
	FROM	Appliance

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E03
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT	stock_num,
			date_hired,
			cust_num,
			paid_till,
			date_ret
	INTO	NewHire
	FROM	Hire
	WHERE	stock_num IS NOT NULL

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E04
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	CREATE TABLE NewModel (
		model_code	NVARCHAR(5) PRIMARY KEY,
		model_name	NVARCHAR(40),
		mth_charge	MONEY
	)

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E05
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	INSERT	INTO NewModel
			SELECT	*
			FROM	model

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E06
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM NewCustomer
	UPDATE	NewCustomer
	SET		cust_name = 'Belinda Smithers'
	WHERE	cust_num = '1003'

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E07
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE	NewCustomer
	SET		title = 'Mr'

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E08
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE	NewCustomer
	SET		title = 'Sir/Madam'

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E09
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE	NewModel
	SET		mth_charge = mth_charge + 5
	WHERE	model_name LIKE '%TV%'

END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E10
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO NewMOdel VALUES
		('BE251', 'Subsonic Tri-dimesional woofer', 250.75);
	INSERT INTO NewMOdel VALUES
		('BE252', 'Digital Graphic Equaliser', 495.99);


END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E11
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM NewModel
	WHERE model_code = 'BE251' or model_code = 'BE252'


END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Fengfu Chen
-- Create date: 10/03/2014
-- Description:	Changing data
-- =============================================
CREATE PROCEDURE usp_S7E12
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DROP TABLE NewCustomer, NewAppliance, NewModel, NewHire


END
GO