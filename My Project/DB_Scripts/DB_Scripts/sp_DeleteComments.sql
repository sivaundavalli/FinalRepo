USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_DeleteComments]    Script Date: 10/06/2016 21:47:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 4/10/2016
-- Description:	Delete comments by Admin
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteComments]
@Desc_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Insert into Deleted_SubTicketTbl Select * from Ticket_SubMasterTbl where ID=@Desc_ID
   
   Delete from Ticket_SubMasterTbl where ID=@Desc_ID
END

GO


