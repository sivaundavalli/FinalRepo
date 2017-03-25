USE [QTS]
GO

/****** Object:  Table [dbo].[Ticket_MasterTbl]    Script Date: 10/06/2016 21:44:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ticket_MasterTbl](
	[Ticket_ID] [nvarchar](max) NOT NULL,
	[Ticket_Title] [nvarchar](max) NOT NULL,
	[Student_ID] [nvarchar](50) NOT NULL,
	[strStatus] [nvarchar](10) NOT NULL,
	[Created_dt] [nvarchar](50) NOT NULL,
	[Updated_dt] [nvarchar](50) NULL,
	[Instructor_ID] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO


