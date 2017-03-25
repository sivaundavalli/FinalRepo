USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetMyTics_Student]    Script Date: 10/06/2016 21:48:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 3/10/2016
-- Description:	Get My Tickets of Student
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMyTics_Student]
@UserID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
select Ticket_ID,Ticket_Title,Created_dt,strStatus from Ticket_MasterTbl where Student_ID=@UserID;
END

GO


