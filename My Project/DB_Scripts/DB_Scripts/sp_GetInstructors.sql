USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetInstructors]    Script Date: 10/06/2016 21:48:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 1/10/2016
-- Description:	Get Instructors
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetInstructors]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

		SELECT USER_ID as [User ID],Pwd,USER_NAME as [Name],Role_Type as [Role Type],Department_ID as [Department],Phone_Num as [Phone#],Email_ID as [Email],Sex from UserMasterTbl where Role_Type='Instructor'
	
END

GO


