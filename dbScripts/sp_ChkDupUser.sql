USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_ChkDupUser]    Script Date: 10/06/2016 21:46:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ================================================
-- UserID parameters
-- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Create date: 30/09/2016
-- Description: Check if User ID already Exists
-- =============================================


CREATE PROCEDURE [dbo].[sp_ChkDupUser]	
	@UserID nvarchar(50)	
	
AS
BEGIN
SET NOCOUNT ON;
   
  Declare @Cnt int;
  Set @Cnt=(select COUNT(8) from UserMasterTbl where User_ID=@UserID);
    select @Cnt;
END

GO


