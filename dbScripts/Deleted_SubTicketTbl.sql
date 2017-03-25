USE [QTS]
GO

/****** Object:  Table [dbo].[Deleted_SubTicketTbl]    Script Date: 10/06/2016 21:42:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Deleted_SubTicketTbl](
	[ID] [int] NULL,
	[Ticket_ID] [nvarchar](max) NULL,
	[Ticket_Desc] [nvarchar](max) NULL,
	[User_ID] [nvarchar](50) NULL,
	[Create_by] [nvarchar](50) NULL,
	[strStatus] [nvarchar](15) NULL
) ON [PRIMARY]

GO


