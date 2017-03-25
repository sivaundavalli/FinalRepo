USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_AddTicResponses]    Script Date: 10/06/2016 21:46:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 4/10/2016
-- Description:	Insert Ticket Responses
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddTicResponses]
@Ticket_ID nvarchar(max),
@Ticket_Title nvarchar(max),
@User_ID nvarchar(50),
@Created_dt nvarchar(50),
@Ticket_Desc nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @Role_Type nvarchar(20)
--	Declare @latestStatus nvarchar(15)
--	Declare @CurStatus nvarchar(15)
	
--	Select @latestStatus= strStatus from Ticket_SubMasterTbl where Ticket_ID=@Ticket_ID order by ID
--if @latestStatus = 'Open'
--Begin
--Set @CurStatus = 'Open'
--End
--Else
--Begin
--Set @CurStatus='Resolved'
--End
Select @Role_Type=Role_Type from UserMasterTbl where User_ID=@User_ID
If @Role_Type = 'Student'
	Begin
		Insert into Ticket_SubMasterTbl(Ticket_ID,Ticket_Desc,User_ID,strStatus,Created_dt) 
		values(@Ticket_ID,@Ticket_Desc,@User_ID,'Open',@Created_dt)
   
		Update Ticket_MasterTbl set strStatus='Open',Updated_dt=@Created_dt where Ticket_ID=@Ticket_ID
	End
else
	Begin
		Insert into Ticket_SubMasterTbl(Ticket_ID,Ticket_Desc,User_ID,strStatus,Created_dt) 
		values(@Ticket_ID,@Ticket_Desc,@User_ID,'Resolved',@Created_dt)
   
		Update Ticket_MasterTbl set strStatus='Resolved',Updated_dt=@Created_dt where Ticket_ID=@Ticket_ID
    End 
END

GO


