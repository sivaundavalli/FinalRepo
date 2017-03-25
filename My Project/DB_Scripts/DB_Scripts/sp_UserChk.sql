USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_UserChk]    Script Date: 10/06/2016 21:50:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 29/09/2016
-- Description: User Authorization Check
-- =============================================
CREATE PROCEDURE [dbo].[sp_UserChk]	
	@UserID nvarchar(50),	
	@Pwd nvarchar(10)
AS
BEGIN
SET NOCOUNT ON;
Declare @Cnt int
Declare @retVal int

   
     Set @Cnt= (Select COUNT(*) from UserMasterTbl where User_ID=@UserID and Pwd=@Pwd)
   
     if(@Cnt =0)
     Begin
     Set @retVal=1--Invalid User
     End
     Else
     Begin
     Set @retVal=0--Valid User
     End
     Select @retVal
END

GO


