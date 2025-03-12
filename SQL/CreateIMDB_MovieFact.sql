USE [Utility_DB]
GO

/****** Object:  Table [dbo].[Fact_Test_2016]    Script Date: 3/12/2025 9:38:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fact_Test_2016](
	[MovieID] [int] NOT NULL,
	[Lead Actor FB Likes] [int] NULL,
	[Cast FB Likes] [int] NULL,
	[Director FB Likes] [int] NULL,
	[Movie FB Likes] [int] NULL,
	[IMDB Score] [decimal](3, 1) NULL,
	[Total Reviews] [int] NULL,
	[Duration] [int] NULL,
	[Gross Revenue] [int] NULL,
	[Budget] [int] NULL
) ON [PRIMARY]
GO


