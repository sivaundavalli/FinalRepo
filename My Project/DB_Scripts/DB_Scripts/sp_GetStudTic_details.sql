USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetStudTic_details]    Script Date: 10/06/2016 21:49:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 4/10/2016
-- Description:	get student ticket details in Summary
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetStudTic_details]
@Ticket_ID nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     Select Ticket_Title,Instructor_ID from Ticket_MasterTbl where Ticket_ID=@Ticket_ID
END

GO


