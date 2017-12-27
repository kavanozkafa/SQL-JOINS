USE [db_Exp6]
GO

/****** Object:  Table [dbo].[Supplier]    Script Date: 11.12.2016 18:12:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Supplier](
	[SID] [int] NOT NULL,
	[SName] [nvarchar](40) NOT NULL,
	[SCity] [nvarchar](30) NOT NULL,
	[Commission] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



+++++++++++++++++++++


USE [db_Exp6]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 11.12.2016 18:12:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Orders](
	[OID] [int] NOT NULL,
	[OrderAmount] [money] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[CID] [int] NOT NULL,
	[SID] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CID])
REFERENCES [dbo].[Customer] ([CID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Supplier] FOREIGN KEY([SID])
REFERENCES [dbo].[Supplier] ([SID])
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Supplier]
GO



++++++++++++++++
USE [db_Exp6]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 11.12.2016 18:12:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customer](
	[CID] [int] NOT NULL,
	[CName] [nvarchar](40) NOT NULL,
	[CCity] [nvarchar](30) NOT NULL,
	[Grade] [int] NOT NULL,
	[SID] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Supplier] FOREIGN KEY([SID])
REFERENCES [dbo].[Supplier] ([SID])
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Supplier]
GO


