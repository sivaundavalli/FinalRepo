USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetInstByDept]    Script Date: 10/06/2016 21:48:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 3/10/2016
-- Description: Get Instructors by Dept
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetInstByDept]
@Dept nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Select USER_ID from UserMasterTbl where Department_ID=@Dept
END

GO


