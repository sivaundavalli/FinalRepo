USE [QTS]
GO

/****** Object:  Table [dbo].[Ticket_SubMasterTbl]    Script Date: 10/06/2016 21:45:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ticket_SubMasterTbl](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ticket_ID] [nvarchar](max) NOT NULL,
	[Ticket_Desc] [nvarchar](max) NOT NULL,
	[User_ID] [nvarchar](50) NOT NULL,
	[Created_dt] [nvarchar](50) NOT NULL,
	[strStatus] [nvarchar](15) NOT NULL
) ON [PRIMARY]

GO


