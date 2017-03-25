CREATE PROCEDURE [dbo].[sp_ChkEmialID]
	@EmailID nvarchar(50)
AS
	BEGIN

Declare @Cnt int
Declare @retVal int

   
     Set @Cnt= (Select COUNT(*) from UserMasterTbl where Email_ID=@EmailID)
   
     if(@Cnt =0)
     Begin
     Set @retVal=1--Invalid Email
     End
     Else
     Begin
     Set @retVal=0--Valid Email
     End
     Select @retVal
END