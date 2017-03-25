CREATE PROCEDURE [dbo].[sp_UpdateStatus]
	@Ticket_ID nvarchar(max),
	@Status nvarchar(20),
	@Flag nvarchar(20)
AS
BEGIN
 if(@Flag ='ViewStatus')
 Begin
	Update Ticket_MasterTbl set View_Status=@Status where Ticket_ID=@Ticket_ID
	end
	else
	Begin
	Update Ticket_MasterTbl set Subject_Type=@Status where Ticket_ID=@Ticket_ID 
	End
END