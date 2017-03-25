USE [QTS]
GO

/****** Object:  Table [dbo].[UserMasterTbl]    Script Date: 10/06/2016 21:45:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserMasterTbl](
	[User_ID] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](10) NOT NULL,
	[User_Name] [nvarchar](max) NULL,
	[Role_Type] [nvarchar](20) NOT NULL,
	[Department_ID] [nvarchar](50) NOT NULL,
	[Phone_Num] [nvarchar](15) NULL,
	[Email_ID] [nvarchar](50) NULL,
	[Sex] [nvarchar](1) NULL,
 CONSTRAINT [PK_UserMasterTbl] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


