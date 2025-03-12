USE [Utility_DB]
GO

/****** Object:  Table [dbo].[Dim_Test_2016]    Script Date: 3/12/2025 9:28:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dim_Test_2016](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NULL,
	[Release_Date] [date] NULL,
	[Color_BW] [varchar](25) NULL,
	[Genre] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Rating] [varchar](50) NULL,
	[Lead Actor] [varchar](75) NULL,
	[Director] [varchar](75) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
