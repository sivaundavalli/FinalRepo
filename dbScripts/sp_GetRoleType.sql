USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetRoleType]    Script Date: 10/06/2016 21:48:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 1/10/2016
-- Description:	Get Role Type by User 
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetRoleType] 
	@UserID nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
    Declare @retVal nvarchar(50)
    
	Set @retVal=(SELECT Role_Type from UserMasterTbl where User_ID=@UserID)
	select @retVal
	
END

GO


