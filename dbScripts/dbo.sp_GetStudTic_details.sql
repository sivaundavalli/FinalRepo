Alter PROCEDURE [dbo].[sp_GetStudTic_details]
@Ticket_ID nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     Select Ticket_Title,Instructor_ID,View_Status,Subject_Type from Ticket_MasterTbl where Ticket_ID=@Ticket_ID
END