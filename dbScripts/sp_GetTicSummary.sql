USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetTicSummary]    Script Date: 10/06/2016 21:49:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 3/10/2016
-- Description:	Get Ticket Summary
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTicSummary]
@Ticket_ID nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  Select ID as [Desc_ID],User_ID,Ticket_Desc,Created_dt from Ticket_SubMasterTbl where Ticket_ID=@Ticket_ID order by ID

END

GO


