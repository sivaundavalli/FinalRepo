USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_PostTicket]    Script Date: 10/06/2016 21:50:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 3/10/2016
-- Description:	Post Ticket
-- =============================================
CREATE PROCEDURE [dbo].[sp_PostTicket]
@Ticket_ID nvarchar(max),
@Ticket_Title nvarchar(max),
@Student_ID nvarchar(50),
@strStatus nvarchar(10),
@Created_dt nvarchar(50),
@Ticket_Desc nvarchar(max),
@Instructor_ID nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Insert into Ticket_MasterTbl(Ticket_ID,Ticket_Title,Student_ID,strStatus,Created_dt,Instructor_ID) 
   values(@Ticket_ID,@Ticket_Title,@Student_ID,@strStatus,@Created_dt,@Instructor_ID)
   
    Insert into Ticket_SubMasterTbl(Ticket_ID,Ticket_Desc,User_ID,strStatus,Created_dt) 
   values(@Ticket_ID,@Ticket_Desc,@Student_ID,@strStatus,@Created_dt)
   
END

GO


