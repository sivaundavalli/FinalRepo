USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 10/06/2016 21:50:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 2/10/2016
-- Description:	Update Instructor details by Admin
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateUser]
@UserID nvarchar(50),	
	@UserName nvarchar(max),
	@DeptID nvarchar(50),
	@PhNum nvarchar(15),
	@EmailID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Update UserMasterTbl Set User_Name=@UserName,Department_ID=@DeptID,Phone_Num=@PhNum,Email_ID=@EmailID where User_ID=@UserID;
    
END

GO


