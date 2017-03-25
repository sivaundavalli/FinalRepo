Create PROCEDURE [dbo].[sp_UserChk]	
	@UserID nvarchar(50)	
	--@Pwd nvarchar(10)
AS
BEGIN
SET NOCOUNT ON;
Declare @Cnt int
Declare @retVal int

   
     Set @Cnt= (Select COUNT(*) from UserMasterTbl where User_ID=@UserID)-- and Pwd=@Pwd)
   
     if(@Cnt =0)
     Begin
     Set @retVal=1--Invalid User
     End
     Else
     Begin
     Set @retVal=0--Valid User
     End
     Select @retVal
END