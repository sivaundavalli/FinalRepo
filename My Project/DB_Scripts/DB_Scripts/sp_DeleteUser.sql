USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 10/06/2016 21:47:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 2/10/2016
-- Description:	Delete Instructor by Admin
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteUser]
@UserID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  Delete from UserMasterTbl where User_ID=@UserID
END

GO


