USE [QTS]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAllTickets]    Script Date: 10/06/2016 21:47:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Create date: 4/10/2016
-- Description:	Get All Tickets for Student
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllTickets]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select Ticket_ID,Ticket_Title,Created_dt,strStatus from Ticket_MasterTbl;

END

GO


