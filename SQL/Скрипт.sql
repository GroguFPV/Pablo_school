USE [master]
GO
/****** Object:  Database [EP]    Script Date: 24.11.2023 14:10:07 ******/
CREATE DATABASE [EP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EP] SET ARITHABORT OFF 
GO
ALTER DATABASE [EP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EP] SET  MULTI_USER 
GO
ALTER DATABASE [EP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EP] SET QUERY_STORE = OFF
GO
USE [EP]
GO
/****** Object:  UserDefinedFunction [dbo].[func_10]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_10]()
returns @countSpr 
table (name varchar(100), spread float)
as begin
insert @countSpr select Continent, sum(c.Population) from Countries c
group by Continent
return
end
GO
/****** Object:  UserDefinedFunction [dbo].[Func_3]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Func_3]
(@Population AS INT,@Square AS FLOAT)
RETURNS FLOAT
AS
BEGIN
 DECLARE @P AS FLOAT SET @P = ROUND(CAST(@Population AS FLOAT) / @Square, 2)
 RETURN @P
 END
GO
/****** Object:  UserDefinedFunction [dbo].[Func_4]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[Func_4]()
Returns VARCHAR(100)
AS BEGIN 
 DECLARE @P AS VARCHAR(100) DECLARE @M1 AS FLOAT
 DECLARE @M2 AS FLOAT DECLARE @M3 AS FLOAT
 SELECT 
  @M1 = MAX(c.Population) FROM Countries c

 Select   @M2 = Max(c.Population)
 From Countries c 
 Where c.Population < @M1
 Select   @M3 = Max(c.Population)
 From Countries c Where c.Population < @M2
 SELECT @P = c.C_Name
 FROM Countries c WHERE c.Population = @M3
 Return @p
END
GO
/****** Object:  UserDefinedFunction [dbo].[Func_5]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Func_5]
(@Cont AS VARCHAR(100) = 'Азия')
returns varchar(100)as
begin
declare @p as varchar(100)
declare @m as float
select @m = max(c.Population)from Countries c
where c.Continent = @Cont
select @p = c.C_Name
From Countries c
where Continent = @Cont and c.Population = @m 
return @p
end
GO
/****** Object:  UserDefinedFunction [dbo].[func_6]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_6]
(@a as varchar(100))
returns varchar(100)
as 
begin
return LEFT(@A, 2) + replicate('Тест', LEN(@a)-2) + RIGHT(@a,1)
end
GO
/****** Object:  UserDefinedFunction [dbo].[func_7]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[func_7]
(@c as char(1))
returns int
as
begin
declare @k as int
select @k = Count(*) from Countries
where charindex(@c, C_Name) = 0
return @K
end
GO
/****** Object:  UserDefinedFunction [dbo].[Func1]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Func1]
(@capital AS VARCHAR(100))
RETURNS VARCHAR(100)
AS 
BEGIN
 DECLARE @S AS VARCHAR(100) SELECT
  @S = C_Name FROM
  Countries WHERE
  Capital = @capital RETURN @S + ' ' + @capital
END
GO
/****** Object:  UserDefinedFunction [dbo].[Func2]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Func2](
@population AS FLOAT)
RETURNS FLOAT
AS
BEGIN DECLARE @P AS FLOAT
 SET @P = ROUND(@Population / 1000000, 2) RETURN @P
END
GO
/****** Object:  UserDefinedFunction [dbo].[IsPalindrom]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IsPalindrom] (@n AS INT)
RETURNS INT
AS
BEGIN
    DECLARE @temp AS INT
    SET @temp = @n
    DECLARE @rev AS INT
    SET @rev = 0
    DECLARE @dig AS INT
    DECLARE @result AS INT
    WHILE (@n > 0)
    BEGIN
        SET @dig = @n % 10
        SET @rev = @rev * 10 + @dig
        SET @n = @n / 10
    END
    IF (@temp = @rev)
        SET @result = 1
    ELSE
        SET @result = 0
    RETURN @result
END
GO
/****** Object:  UserDefinedFunction [dbo].[Quarter]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Quarter](@x float, @y float)
RETURNS int
AS  
BEGIN
  DECLARE @q int
  IF @x > 0 AND @y > 0 SET @q = 1
  IF @x < 0 AND @y > 0 SET @q = 2
  IF @x < 0 AND @y < 0 SET @q = 3
  IF @x > 0 AND @y < 0 SET @q = 4

  RETURN @q
END
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[C_Name] [nvarchar](100) NULL,
	[Capital] [nvarchar](100) NULL,
	[Area] [int] NULL,
	[Population] [int] NULL,
	[Continent] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[func_8]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[func_8]
( @n as int)returns table
as
return (select * from Countries where Area < @N)
GO
/****** Object:  UserDefinedFunction [dbo].[func_9]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_9]
( @a as float, @b as float)
returns table
as return (select * from Countries c
where c.Population between @a and @b )
GO
/****** Object:  Table [dbo].[Academics]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Academics](
	[ID] [int] NOT NULL,
	[FIO] [nvarchar](150) NULL,
	[Birthdate] [date] NULL,
	[Specialization] [nvarchar](50) NULL,
	[Year_invocation] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[ID] [int] NOT NULL,
	[Squad] [nvarchar](40) NULL,
 CONSTRAINT [Animal_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auditorium]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditorium](
	[AuditoriumID] [int] NOT NULL,
	[Auditorium] [nvarchar](50) NULL,
 CONSTRAINT [PK_Auditorium] PRIMARY KEY CLUSTERED 
(
	[AuditoriumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Control]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control](
	[ID] [int] NOT NULL,
	[Surname] [nvarchar](40) NULL,
 CONSTRAINT [Control_ManakovID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[Code] [int] NOT NULL,
	[Volume] [int] NULL,
	[Title] [varchar](50) NULL,
	[Kaf_ID] [int] NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[TabNumber] [int] NOT NULL,
	[Kaf_id] [int] NULL,
	[LastName] [varchar](50) NULL,
	[PositionID] [int] NULL,
	[Salary] [int] NULL,
	[Shef] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[TabNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engineer]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engineer](
	[EnginnerID] [int] NOT NULL,
	[TabNumber] [int] NOT NULL,
	[EnSpecID] [int] NULL,
 CONSTRAINT [PK_Engineer] PRIMARY KEY CLUSTERED 
(
	[EnginnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnSpec]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnSpec](
	[EnSpecID] [int] NOT NULL,
	[EnSpec] [nvarchar](50) NULL,
 CONSTRAINT [PK_EnSpec] PRIMARY KEY CLUSTERED 
(
	[EnSpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Dis_Code] [int] NULL,
	[RegNumber] [int] NULL,
	[TabNumber] [int] NULL,
	[AuditoriumID] [int] NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Abbreviation] [varchar](2) NULL,
	[Title] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flowers]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flowers](
	[ID] [int] NOT NULL,
	[Class] [nvarchar](40) NULL,
 CONSTRAINT [Flowers_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kafedra]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kafedra](
	[Kaf_ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](2) NULL,
	[Name] [varchar](50) NULL,
	[FacultyAbbreviation] [varchar](2) NULL,
 CONSTRAINT [PK_Kafedra] PRIMARY KEY CLUSTERED 
(
	[Kaf_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Licei]    Script Date: 24.11.2023 14:10:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licei](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[School] [varchar](50) NOT NULL,
	[Score] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Code] [int] NULL,
	[Number] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialty]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialty](
	[SpecID] [int] NOT NULL,
	[Number] [nvarchar](25) NULL,
	[Direction] [varchar](100) NULL,
	[Kaf_ID] [int] NULL,
 CONSTRAINT [PK_Specialty] PRIMARY KEY CLUSTERED 
(
	[SpecID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[RegNumber] [int] NOT NULL,
	[Spec_ID] [int] NULL,
	[LastName] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[RegNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_sch]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_sch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[School] [varchar](50) NOT NULL,
	[Score] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] NOT NULL,
	[TabNumber] [int] NOT NULL,
	[Title] [varchar](50) NULL,
	[Degree] [varchar](20) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View_6]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View_6](
	[Номер недели] [int] NULL,
	[Количество экзаменов] [int] NULL,
	[Количество студентов] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View_7]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View_7](
	[Continent] [varchar](50) NULL,
	[SquareMax] [float] NULL,
	[SquareMin] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zav_kaf]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zav_kaf](
	[TabNumber] [int] NULL,
	[Experience] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (1, N'Аничков Николай Николаевич', CAST(N'1885-11-03' AS Date), N'медицина', 1939)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (2, N'Бартольд Василий Владимирович', CAST(N'1869-11-15' AS Date), N'историк', 1913)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (3, N'Белопольский Аристарх Аполлонович', CAST(N'1854-07-13' AS Date), N'астрофизик', 1903)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (4, N'Бородин Иван Парфеньевич', CAST(N'1847-01-30' AS Date), N'ботаник', 1902)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (5, N'Вальден Павел Иванович', CAST(N'1863-07-26' AS Date), N'химик-технолог', 1910)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (6, N'Вернадский Владимир Иванович', CAST(N'1863-03-12' AS Date), N'геохимик', 1908)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (7, N'Виноградов Павел Гаврилович', CAST(N'1854-11-30' AS Date), N'историк', 1914)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (8, N'Ипатьев Владимир Николаевич', CAST(N'1867-11-21' AS Date), N'химик', 1916)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (9, N'Истрин Василий Михайлович', CAST(N'1865-02-22' AS Date), N'филолог', 1907)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (10, N'Карпинский Александр Петрович', CAST(N'1847-01-07' AS Date), N'геолог', 1889)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (11, N'Коковцов Павел Константинович', CAST(N'1861-07-01' AS Date), N'историк', 1906)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (12, N'Курнаков Николай Семёнович', CAST(N'1860-12-06' AS Date), N'химик', 1913)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (13, N'Марр Николай Яковлевич', CAST(N'1865-01-06' AS Date), N'лингвист', 1912)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (14, N'Насонов Николай Викторович', CAST(N'1855-02-26' AS Date), N'зоолог', 1906)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (15, N'Ольденбург Сергей Фёдорович', CAST(N'1863-09-26' AS Date), N'историк', 1903)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (16, N'Павлов Иван Петрович', CAST(N'1849-09-26' AS Date), N'физиолог', 1907)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (17, N'Перетц Владимир Николаевич', CAST(N'1870-01-31' AS Date), N'филолог', 1914)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (18, N'Соболевский Алексей Иванович', CAST(N'1857-01-07' AS Date), N'лингвист', 1900)
INSERT [dbo].[Academics] ([ID], [FIO], [Birthdate], [Specialization], [Year_invocation]) VALUES (19, N'Стеклов Владимир Андреевич', CAST(N'1864-01-09' AS Date), N'математик', 1912)
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (1, N'т505')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (2, N'т506')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (3, N'ф419')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (4, N'м425')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (5, N'м424')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (6, N'ф333')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (7, N'ф349')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (8, N'э105')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (9, N'с324')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (10, N'ф417')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (11, N'ф201')
INSERT [dbo].[Auditorium] ([AuditoriumID], [Auditorium]) VALUES (12, N'ф414')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Австрия', N'Вена', 83858, 8741753, N'Европа')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Азербайджан', N'Баку', 86600, 9705600, N'Азия')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Албания', N'Тирана', 28748, 2866026, N'Европа')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Алжир', N'Алжир', 2381740, 39813722, N'Африка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Ангола', N'Луанда', 1246700, 25831000, N'Африка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Афганистан', N'Кабул', 647500, 29822848, N'Азия')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Бахрейн', N'Манама', 701, 1397000, N'Азия')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Белоруссия', N'Минск', 207595, 9498400, N'Европа')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Болгария', N'София', 110910, 7153784, N'Европа')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Боливия', N'Сукре', 1098580, 10985059, N'Южная Америка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Бутан', N'Тхимпху', 47000, 784000, N'Азия')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Великобритания', N'Лондон', 244820, 65341183, N'Европа')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Венесуэла', N'Каракас', 912050, 31028637, N'Южная Америка')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Восточный Тимор', N'Дили', 14874, 1167242, N'Азия')
INSERT [dbo].[Countries] ([C_Name], [Capital], [Area], [Population], [Continent]) VALUES (N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия')
INSERT [dbo].[Discipline] ([Code], [Volume], [Title], [Kaf_ID]) VALUES (101, 320, N'Математика', 1)
INSERT [dbo].[Discipline] ([Code], [Volume], [Title], [Kaf_ID]) VALUES (102, 160, N'Информатика', 6)
INSERT [dbo].[Discipline] ([Code], [Volume], [Title], [Kaf_ID]) VALUES (103, 160, N'Физика', 4)
INSERT [dbo].[Discipline] ([Code], [Volume], [Title], [Kaf_ID]) VALUES (202, 120, N'Базы данных', 2)
INSERT [dbo].[Discipline] ([Code], [Volume], [Title], [Kaf_ID]) VALUES (204, 160, N'Электроника', 6)
INSERT [dbo].[Discipline] ([Code], [Volume], [Title], [Kaf_ID]) VALUES (205, 80, N'Программирование', 5)
INSERT [dbo].[Discipline] ([Code], [Volume], [Title], [Kaf_ID]) VALUES (209, 80, N'Моделирование', 3)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (105, 5, N'Петров П.П.', 2, 25000, 102)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (153, 5, N'Сидорова С.С.', 3, 15000, 301)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (201, 2, N'Андреев А.А.', 1, 35000, 105)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (202, 2, N'Борисов Б.Б.', 2, 25000, 201)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (241, 2, N'Глухов Г.Г.', 3, 20000, 201)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (242, 2, N'Чернов Ч.Ч.', 3, 15000, 202)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (301, 3, N'Басов Б.Б.', 1, 35000, 301)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (302, 3, N'Сергеева С.С.', 2, 25000, 301)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (401, 4, N'Волков В.В.', 1, 35000, 401)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (402, 4, N'Зайцев З.З.', 2, 25000, 401)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (403, 4, N'Смирнов С.С.', 2, 15000, 401)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (435, 4, N'Лисин Л.Л.', 3, 20000, 402)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (501, 1, N'Кузнецов К.К.', 1, 35000, 501)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (502, 1, N'Романцев Р.Р.', 2, 25000, 501)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (503, 1, N'Соловьев С.С.', 2, 25000, 501)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (555, 2, N'3', 1, 3, 105)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (601, 6, N'Зверев З.З.', 1, 35000, 601)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (602, 6, N'Сорокина С.С.', 2, 25000, 601)
INSERT [dbo].[Employee] ([TabNumber], [Kaf_id], [LastName], [PositionID], [Salary], [Shef]) VALUES (614, 6, N'Григорьев Г.Г.', 3, 20000, 602)
INSERT [dbo].[Engineer] ([EnginnerID], [TabNumber], [EnSpecID]) VALUES (1, 153, 1)
INSERT [dbo].[Engineer] ([EnginnerID], [TabNumber], [EnSpecID]) VALUES (2, 241, 1)
INSERT [dbo].[Engineer] ([EnginnerID], [TabNumber], [EnSpecID]) VALUES (3, 242, 2)
INSERT [dbo].[Engineer] ([EnginnerID], [TabNumber], [EnSpecID]) VALUES (4, 435, 1)
INSERT [dbo].[Engineer] ([EnginnerID], [TabNumber], [EnSpecID]) VALUES (5, 614, 2)
INSERT [dbo].[EnSpec] ([EnSpecID], [EnSpec]) VALUES (1, N'электроник')
INSERT [dbo].[EnSpec] ([EnSpecID], [EnSpec]) VALUES (2, N'программист')
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (3, CAST(N'2015-06-05' AS Date), 202, 20101, 202, 2, 4)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (4, CAST(N'2015-06-05' AS Date), 101, 20102, 202, 2, 3)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (5, CAST(N'2015-06-07' AS Date), 102, 30101, 153, 3, 3)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (8, CAST(N'2015-06-09' AS Date), 205, 80102, 402, 5, 4)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (9, CAST(N'2015-06-09' AS Date), 209, 20101, 302, 6, 3)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (10, CAST(N'2015-06-10' AS Date), 101, 10101, 501, 2, 4)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (11, CAST(N'2015-06-10' AS Date), 101, 10102, 501, 2, 4)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (12, CAST(N'2015-06-10' AS Date), 204, 30102, 601, 7, 5)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (13, CAST(N'2015-06-10' AS Date), 209, 80101, 301, 8, 5)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (14, CAST(N'2015-06-10' AS Date), 209, 80102, 301, 8, 4)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (15, CAST(N'2015-06-12' AS Date), 101, 80101, 502, 9, 4)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (16, CAST(N'2015-06-15' AS Date), 101, 30101, 503, 10, 4)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (17, CAST(N'2015-06-15' AS Date), 101, 50101, 501, 11, 5)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (18, CAST(N'2015-06-15' AS Date), 101, 50102, 501, 11, 3)
INSERT [dbo].[Exam] ([ExamID], [Date], [Dis_Code], [RegNumber], [TabNumber], [AuditoriumID], [Grade]) VALUES (19, CAST(N'2015-06-15' AS Date), 103, 10101, 403, 12, 4)
SET IDENTITY_INSERT [dbo].[Exam] OFF
INSERT [dbo].[Faculty] ([Abbreviation], [Title]) VALUES (N'ен', N'Естественные науки')
INSERT [dbo].[Faculty] ([Abbreviation], [Title]) VALUES (N'гн', N'Гуманитарные науки')
INSERT [dbo].[Faculty] ([Abbreviation], [Title]) VALUES (N'ит', N'Информационные технологии')
INSERT [dbo].[Faculty] ([Abbreviation], [Title]) VALUES (N'фм', N'Физико-математический')
SET IDENTITY_INSERT [dbo].[Kafedra] ON 

INSERT [dbo].[Kafedra] ([Kaf_ID], [Code], [Name], [FacultyAbbreviation]) VALUES (1, N'вм', N'Высшая математика', N'ен')
INSERT [dbo].[Kafedra] ([Kaf_ID], [Code], [Name], [FacultyAbbreviation]) VALUES (2, N'ис', N'Информационные системы', N'ит')
INSERT [dbo].[Kafedra] ([Kaf_ID], [Code], [Name], [FacultyAbbreviation]) VALUES (3, N'мм', N'Математическое моделирование', N'фм')
INSERT [dbo].[Kafedra] ([Kaf_ID], [Code], [Name], [FacultyAbbreviation]) VALUES (4, N'оф', N'Общая физика', N'ен')
INSERT [dbo].[Kafedra] ([Kaf_ID], [Code], [Name], [FacultyAbbreviation]) VALUES (5, N'пи', N'Прикладная информатика', N'ит')
INSERT [dbo].[Kafedra] ([Kaf_ID], [Code], [Name], [FacultyAbbreviation]) VALUES (6, N'эф', N'Экспериментальная физика', N'фм')
SET IDENTITY_INSERT [dbo].[Kafedra] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([PositionID], [Position]) VALUES (1, N'зав. кафедрой')
INSERT [dbo].[Position] ([PositionID], [Position]) VALUES (2, N'преподаватель')
INSERT [dbo].[Position] ([PositionID], [Position]) VALUES (3, N'инженер')
SET IDENTITY_INSERT [dbo].[Position] OFF
INSERT [dbo].[Request] ([Code], [Number]) VALUES (101, N'01.03.04')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (205, N'01.03.04')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (209, N'01.03.04')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (101, N'09.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (102, N'09.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (103, N'09.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (202, N'09.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (205, N'09.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (209, N'09.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (101, N'09.03.03')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (102, N'09.03.03')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (103, N'09.03.03')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (202, N'09.03.03')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (205, N'09.03.03')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (101, N'14.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (102, N'14.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (103, N'14.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (204, N'14.03.02')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (101, N'38.03.05')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (103, N'38.03.05')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (202, N'38.03.05')
INSERT [dbo].[Request] ([Code], [Number]) VALUES (209, N'38.03.05')
INSERT [dbo].[Specialty] ([SpecID], [Number], [Direction], [Kaf_ID]) VALUES (1, N'01.03.04', N'Прикладная математика', 3)
INSERT [dbo].[Specialty] ([SpecID], [Number], [Direction], [Kaf_ID]) VALUES (2, N'09.03.02', N'Информационные системы и технологии', 2)
INSERT [dbo].[Specialty] ([SpecID], [Number], [Direction], [Kaf_ID]) VALUES (3, N'09.03.03', N'Прикладная информатика', 5)
INSERT [dbo].[Specialty] ([SpecID], [Number], [Direction], [Kaf_ID]) VALUES (4, N'14.03.02', N'Ядерные физика и технологии', 6)
INSERT [dbo].[Specialty] ([SpecID], [Number], [Direction], [Kaf_ID]) VALUES (5, N'38.03.05', N'Бизнес-информатика', 2)
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (10101, 3, N'Николаева Н. Н.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (10102, 3, N'Иванов И. И.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (10103, 3, N'Крюков К. К.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (20101, 2, N'Андреев А. А.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (20102, 2, N'Федоров Ф. Ф.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (29333, 1, N'Тест 1')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (30101, 4, N'Бондаренко Б. Б.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (30102, 4, N'Цветков К. К.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (30103, 4, N'Петров П. П.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (50101, 1, N'Сергеев С. С.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (50102, 1, N'Кудрявцев К. К.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (80101, 5, N'Макаров М. М.')
INSERT [dbo].[Student] ([RegNumber], [Spec_ID], [LastName]) VALUES (80102, 5, N'Яковлев Я. Я.')
SET IDENTITY_INSERT [dbo].[Student_sch] ON 

INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (2, N'Никитин', N'Химия', N'МБОУ СОШ №2', 55)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (3, N'Петров', N'Русский язык', N'Школа №20', 99)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (4, N'Петрова', N'Мфтематика', N'Школа №18', 90)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (5, N'Иванова', N'Математика', N'Лицей', 98.5)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (6, N'Петров', N'Физика', N'Лицей', 99)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (7, N'Сидоров', N'Математика', N'Лицей', 88)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (8, N'Полухина', N'Физика', N'Гимназия', 78)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (9, N'Матвеева', N'Химия', N'Лицей', 92)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (10, N'Касимов', N'Химия', N'Гимназия', 68)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (11, N'Нурулин', N'Математика', N'Гимназия', 81)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (12, N'Авдеев', N'Физика', N'Лицей', 87)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (13, N'Никитина', N'Химия', N'Лицей', 94)
INSERT [dbo].[Student_sch] ([ID], [Last_Name], [Subject], [School], [Score]) VALUES (14, N'Барышева', N'Химия', N'Лицей', 88)
SET IDENTITY_INSERT [dbo].[Student_sch] OFF
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (3, 105, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (4, 201, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (5, 202, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (6, 301, N'профессор', N'д. т.н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (7, 302, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (8, 401, N'профессор', N'д. т.н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (9, 402, N'доцент', N'к. т.н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (10, 403, N'ассистент', N'-')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (11, 501, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (12, 502, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (13, 503, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Teacher] ([TeacherID], [TabNumber], [Title], [Degree]) VALUES (14, 601, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[View_6] ([Номер недели], [Количество экзаменов], [Количество студентов]) VALUES (23, 2, 7)
INSERT [dbo].[View_6] ([Номер недели], [Количество экзаменов], [Количество студентов]) VALUES (24, 4, 6)
INSERT [dbo].[View_6] ([Номер недели], [Количество экзаменов], [Количество студентов]) VALUES (25, 3, 4)
INSERT [dbo].[View_7] ([Continent], [SquareMax], [SquareMin]) VALUES (N'Азия', 647500, 701)
INSERT [dbo].[View_7] ([Continent], [SquareMax], [SquareMin]) VALUES (N'Африка', 2381740, 112620)
INSERT [dbo].[View_7] ([Continent], [SquareMax], [SquareMin]) VALUES (N'Европа', 244820, 28748)
INSERT [dbo].[View_7] ([Continent], [SquareMax], [SquareMin]) VALUES (N'Северная Америка', 22966, 22966)
INSERT [dbo].[View_7] ([Continent], [SquareMax], [SquareMin]) VALUES (N'Южная Америка', 8511965, 912050)
INSERT [dbo].[Zav_kaf] ([TabNumber], [Experience]) VALUES (101, 15)
INSERT [dbo].[Zav_kaf] ([TabNumber], [Experience]) VALUES (201, 18)
INSERT [dbo].[Zav_kaf] ([TabNumber], [Experience]) VALUES (301, 20)
INSERT [dbo].[Zav_kaf] ([TabNumber], [Experience]) VALUES (401, 10)
INSERT [dbo].[Zav_kaf] ([TabNumber], [Experience]) VALUES (501, 18)
INSERT [dbo].[Zav_kaf] ([TabNumber], [Experience]) VALUES (601, 8)
ALTER TABLE [dbo].[Animal] ADD  CONSTRAINT [DF_Animal]  DEFAULT ('Хищные') FOR [Squad]
GO
ALTER TABLE [dbo].[Control] ADD  CONSTRAINT [DF_Control]  DEFAULT ('Манаков') FOR [Surname]
GO
ALTER TABLE [dbo].[Flowers] ADD  CONSTRAINT [DF_Flowers]  DEFAULT ('Двудольные') FOR [Class]
GO
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Kafedra] FOREIGN KEY([Kaf_ID])
REFERENCES [dbo].[Kafedra] ([Kaf_ID])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Kafedra]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Kafedra] FOREIGN KEY([Kaf_id])
REFERENCES [dbo].[Kafedra] ([Kaf_ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Kafedra]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
ALTER TABLE [dbo].[Engineer]  WITH CHECK ADD  CONSTRAINT [FK_Engineer_Employee] FOREIGN KEY([TabNumber])
REFERENCES [dbo].[Employee] ([TabNumber])
GO
ALTER TABLE [dbo].[Engineer] CHECK CONSTRAINT [FK_Engineer_Employee]
GO
ALTER TABLE [dbo].[Engineer]  WITH CHECK ADD  CONSTRAINT [FK_Engineer_EnSpec] FOREIGN KEY([EnSpecID])
REFERENCES [dbo].[EnSpec] ([EnSpecID])
GO
ALTER TABLE [dbo].[Engineer] CHECK CONSTRAINT [FK_Engineer_EnSpec]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Auditorium] FOREIGN KEY([AuditoriumID])
REFERENCES [dbo].[Auditorium] ([AuditoriumID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Auditorium]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Discipline] FOREIGN KEY([Dis_Code])
REFERENCES [dbo].[Discipline] ([Code])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Discipline]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Employee1] FOREIGN KEY([TabNumber])
REFERENCES [dbo].[Employee] ([TabNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Employee1]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student] FOREIGN KEY([RegNumber])
REFERENCES [dbo].[Student] ([RegNumber])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student]
GO
ALTER TABLE [dbo].[Specialty]  WITH CHECK ADD  CONSTRAINT [FK_Specialty_Kafedra] FOREIGN KEY([Kaf_ID])
REFERENCES [dbo].[Kafedra] ([Kaf_ID])
GO
ALTER TABLE [dbo].[Specialty] CHECK CONSTRAINT [FK_Specialty_Kafedra]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Specialty] FOREIGN KEY([Spec_ID])
REFERENCES [dbo].[Specialty] ([SpecID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Specialty]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Employee] FOREIGN KEY([TabNumber])
REFERENCES [dbo].[Employee] ([TabNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Employee]
GO
ALTER TABLE [dbo].[Student_sch]  WITH CHECK ADD CHECK  (([Score]>=(0) AND [Score]<=(100)))
GO
/****** Object:  StoredProcedure [dbo].[SelectProcedur]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProcedur]
    @Columns NVARCHAR(MAX),
    @TableName NVARCHAR(MAX),
    @CheckColumn NVARCHAR(MAX),
    @ComparisonOperator NVARCHAR(2),
    @ComparisonValue INT
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    SET @SQL = 'SELECT ' + @Columns + ' FROM ' + @TableName + ' WHERE ' + @CheckColumn + ' ' + @ComparisonOperator + ' ' + CAST(@ComparisonValue AS NVARCHAR(MAX)) 
    EXEC sp_executesql @SQL
END
EXEC SelectProcedur 'Name, MainCity, Square', 'Countrу', 'Population', '>', 100000
GO
/****** Object:  StoredProcedure [dbo].[SelectProcedur_]    Script Date: 24.11.2023 14:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProcedur_]
    @Columns NVARCHAR(MAX),
    @TableName NVARCHAR(MAX),
    @CheckColumn NVARCHAR(MAX),
    @ComparisonOperator NVARCHAR(2),
    @ComparisonValue INT
AS
BEGIN
    DECLARE @SQL NVARCHAR(MAX)
    SET @SQL = 'SELECT ' + @Columns + ' FROM ' + @TableName + ' WHERE ' + @CheckColumn + ' ' + @ComparisonOperator + ' ' + CAST(@ComparisonValue AS NVARCHAR(MAX)) 
    EXEC sp_executesql @SQL
END
EXEC SelectProcedur_ 'C_Name, Capital, Area', 'Countries', 'Population', '>', 100000
GO
USE [master]
GO
ALTER DATABASE [EP] SET  READ_WRITE 
GO
