CREATE PROCEDURE [dbo].[sp_GetAllTickets]
@Role nvarchar(20),
@CurUser nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@Role ='Student')
 Begin
  select Ticket_ID,Ticket_Title,Created_dt,strStatus from Ticket_MasterTbl where (Student_ID=@CurUser or View_Status='Public');
  End
  else
  Begin
   select Ticket_ID,Ticket_Title,Created_dt,strStatus from Ticket_MasterTbl;
  End
END