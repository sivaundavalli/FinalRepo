CREATE PROCEDURE [dbo].[sp_GetUserPwd]
	@UserID nvarchar(50)
AS
	Begin
	select pwd from UserMasterTbl where User_ID=@UserID;
	End