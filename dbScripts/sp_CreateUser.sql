USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_CreateUser]    Script Date: 10/06/2016 21:46:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 1/10/2016
-- Description:	User Creation
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateUser] 
	-- Add the parameters for the stored procedure here
	@UserID nvarchar(50),	
	@Pwd nvarchar(10),
	@UserName nvarchar(max),
	@RoleType nvarchar(10),
	@DeptID nvarchar(50),
	@PhNum nvarchar(15),
	@EmailID nvarchar(50),
	@Sex nvarchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Insert Into UserMasterTbl([User_ID],Pwd,[User_Name],Role_Type,Department_ID,Phone_Num,Email_ID,[Sex]) 
   values(@UserID,@Pwd,@UserName,@RoleType,@DeptID,@PhNum,@EmailID,@Sex)
END

GO


