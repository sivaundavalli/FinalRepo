USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetTics_Instructor]    Script Date: 10/06/2016 21:49:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 4/10/2016
-- Description:	Get Instructor Tickets
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTics_Instructor]
@UserID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select Ticket_ID,Ticket_Title,Created_dt,strStatus from Ticket_MasterTbl where Instructor_ID=@UserID;
END

GO


