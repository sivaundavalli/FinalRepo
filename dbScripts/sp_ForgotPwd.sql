CREATE PROCEDURE [dbo].[sp_ForgotPwd]
	@UserID nvarchar(50),
	@EmailID nvarchar(50)
AS
BEGIN
IF @UserID IS NOT NULL AND LEN(@UserID) > 0
Begin
	SELECT Pwd from UserMasterTbl where User_ID=@UserID;
end
else
Begin
Select Pwd from UserMasterTbl where Email_ID=@EmailID;
End
End