USE [master]
GO
/****** Object:  Database [TicketManagementTest]    Script Date: 14.09.2020 22:45:46 ******/
CREATE DATABASE [TicketManagementTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TicketManagementTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TicketManagementTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TicketManagementTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TicketManagementTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TicketManagementTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TicketManagementTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TicketManagementTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TicketManagementTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TicketManagementTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TicketManagementTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TicketManagementTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [TicketManagementTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TicketManagementTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TicketManagementTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TicketManagementTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TicketManagementTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TicketManagementTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TicketManagementTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TicketManagementTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TicketManagementTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TicketManagementTest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TicketManagementTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TicketManagementTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TicketManagementTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TicketManagementTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TicketManagementTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TicketManagementTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TicketManagementTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TicketManagementTest] SET RECOVERY FULL 
GO
ALTER DATABASE [TicketManagementTest] SET  MULTI_USER 
GO
ALTER DATABASE [TicketManagementTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TicketManagementTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TicketManagementTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TicketManagementTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TicketManagementTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TicketManagementTest', N'ON'
GO
ALTER DATABASE [TicketManagementTest] SET QUERY_STORE = OFF
GO
USE [TicketManagementTest]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Id] [int] NOT NULL,
	[LayoutId] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CoordX] [int] NOT NULL,
	[CoordY] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](120) NOT NULL,
	[Description] [nvarchar](400) NOT NULL,
	[LayoutId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventArea]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventArea](
	[Id] [int] NOT NULL,
	[EventId] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[CoordX] [int] NOT NULL,
	[CoordY] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventSeat]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventSeat](
	[Id] [int] NOT NULL,
	[EventAreaId] [int] NOT NULL,
	[Row] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[State] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Layout]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Layout](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[VenueId] [int] NOT NULL,
	[Description] [nvarchar](120) NOT NULL,
 CONSTRAINT [PK_Layout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[Id] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
	[Row] [int] NOT NULL,
	[Number] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](120) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](15) NULL,
 CONSTRAINT [PK_Venue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_Area_Layout] FOREIGN KEY([LayoutId])
REFERENCES [dbo].[Layout] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_Area_Layout]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Layout] FOREIGN KEY([LayoutId])
REFERENCES [dbo].[Layout] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Layout]
GO
ALTER TABLE [dbo].[EventArea]  WITH CHECK ADD  CONSTRAINT [FK_EventArea_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventArea] CHECK CONSTRAINT [FK_EventArea_Event]
GO
ALTER TABLE [dbo].[EventSeat]  WITH CHECK ADD  CONSTRAINT [FK_EventArea_EventSeat] FOREIGN KEY([EventAreaId])
REFERENCES [dbo].[EventArea] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventSeat] CHECK CONSTRAINT [FK_EventArea_EventSeat]
GO
ALTER TABLE [dbo].[Layout]  WITH CHECK ADD  CONSTRAINT [FK_Layout_Venue] FOREIGN KEY([VenueId])
REFERENCES [dbo].[Venue] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Layout] CHECK CONSTRAINT [FK_Layout_Venue]
GO
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FK_Area_Seat] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Area] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FK_Area_Seat]
GO

INSERT INTO [Venue] ([Id], [Name], [Description], [Address], [Phone]) VALUES (100, 'Some venue name', 'Some description', 'Some address', '8-800-555-35-35')
INSERT INTO [Venue] ([Id], [Name], [Description], [Address], [Phone]) VALUES (101, 'Another venue name', 'Another description', 'Another address', '7-545-678-45-24')

INSERT INTO [Layout] ([Id], [Name], [VenueId], [Description]) VALUES (200, 'Some layout name', 100, 'Some description')
INSERT INTO [Layout] ([Id], [Name], [VenueId], [Description]) VALUES (201, 'Another layout name', 101, 'Other description')

INSERT INTO [Area] ([Id], [Description], [LayoutId], [CoordX], [CoordY]) VALUES (300, 'Some description', 200, 23, 45)
INSERT INTO [Area] ([Id], [Description], [LayoutId], [CoordX], [CoordY]) VALUES (301, 'Another description', 200, 10, 15)
INSERT INTO [Area] ([Id], [Description], [LayoutId], [CoordX], [CoordY]) VALUES (302, 'Third description', 201, 45, 32)
INSERT INTO [Area] ([Id], [Description], [LayoutId], [CoordX], [CoordY]) VALUES (303, 'Fourth description', 201, 22, 21)

INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (400, 300, 23, 45)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (401, 300, 1, 1)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (402, 300, 2, 3)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (403, 300, 2, 1)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (404, 300, 4, 32)

INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (405, 301, 1, 1)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (406, 301, 2, 3)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (407, 301, 4, 15)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (408, 301, 10, 6)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (409, 301, 11, 2)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (410, 301, 6, 7)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (411, 301, 1, 1)

INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (412, 302, 1, 1)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (413, 302, 1, 2)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (414, 302, 7, 9)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (415, 302, 42, 32)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (416, 302, 25, 29)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (417, 302, 45, 1)

INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (418, 303, 1, 1)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (419, 303, 2, 1)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (420, 303, 20, 20)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (421, 303, 12, 13)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (422, 303, 3, 8)
INSERT INTO [Seat] ([Id], [AreaId], [Row], [Number]) VALUES (423, 303, 21, 16)
/****** Object:  StoredProcedure [dbo].[AddEvent]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddEvent]
    @Id INT,
    @Name NVARCHAR(120),
    @Descr NVARCHAR(400),
    @LayoutId INT,
	@StartDate DATE,
	@EndDate DATE
AS
INSERT INTO Event(Id, [Name], [Description], LayoutId, StartDate, EndDate) 
VALUES(@Id, @Name, @Descr, @LayoutId, @StartDate, @EndDate)
GO
/****** Object:  StoredProcedure [dbo].[DeleteEvent]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEvent]
    @Id INT
AS
DELETE FROM Event WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UpdateEvent]    Script Date: 14.09.2020 22:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEvent]
    @Id INT,
    @Name NVARCHAR(120),
    @Descr NVARCHAR(400),
    @LayoutId INT,
	@StartDate DATE,
	@EndDate DATE
AS
UPDATE Event SET [Name] = @Name, [Description] = @Descr, LayoutId = @LayoutId, StartDate = @StartDate, EndDate = @EndDate 
	WHERE Id = @Id 
GO
USE [master]
GO
ALTER DATABASE [TicketManagementTest] SET  READ_WRITE 
GO
