USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 18.06.2022 3:05:01 ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'D:\БД SQL\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'D:\БД SQL\Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital', N'ON'
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Service_Id] [int] NOT NULL,
	[Client_Id] [int] NOT NULL,
	[Start_date] [datetime] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Departament_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cabinet]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabinet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Departament_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card_Line]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card_Line](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Card_Id] [int] NOT NULL,
	[Recording] [nvarchar](1000) NOT NULL,
	[Date_add] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adres] [nvarchar](255) NOT NULL,
	[Telephone] [nvarchar](20) NULL,
	[Name] [nvarchar](25) NOT NULL,
	[First_Name] [nvarchar](25) NOT NULL,
	[Last_Name] [nvarchar](25) NULL,
	[Birthday] [date] NOT NULL,
	[Medical_Insurance] [int] NOT NULL,
	[Status] [nvarchar](40) NULL,
	[Gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Telephone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departament]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departament](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Floor] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[First_Name] [nvarchar](25) NOT NULL,
	[Last_Name] [nvarchar](25) NULL,
	[Position_Id] [int] NOT NULL,
	[Telephone] [nvarchar](20) NULL,
	[Departament_Id] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Medical_Insurance] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Telephone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medical_Card]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical_Card](
	[Id] [int] NOT NULL,
	[Start_treatment] [datetime] NULL,
	[End_treatment] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medical_Card_Appointment]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical_Card_Appointment](
	[Id] [int] NOT NULL,
	[Appointment_Id] [int] NOT NULL,
	[Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Client_Id] [int] NOT NULL,
	[Date_add] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt_Line]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt_Line](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Receipt_Id] [int] NOT NULL,
	[Service_Id] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Client_Id] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Recording] [nvarchar](1000) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Appointment_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Service_time] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Departament_Id] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Cabinet_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Departament_Id] [int] NOT NULL,
	[Place] [int] NOT NULL,
	[Owner_Place] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Gender] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ward_Client]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward_Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ward_Id] [int] NOT NULL,
	[Client_Id] [int] NOT NULL,
	[Date_Invite] [date] NOT NULL,
	[Date_Leave] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([Departament_Id])
REFERENCES [dbo].[Departament] ([Id])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([Service_Id])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Cabinet]  WITH CHECK ADD FOREIGN KEY([Departament_Id])
REFERENCES [dbo].[Departament] ([Id])
GO
ALTER TABLE [dbo].[Cabinet]  WITH CHECK ADD FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Card_Line]  WITH CHECK ADD FOREIGN KEY([Card_Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Departament_Id])
REFERENCES [dbo].[Departament] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([Position_Id])
REFERENCES [dbo].[Position] ([Id])
GO
ALTER TABLE [dbo].[Medical_Card]  WITH CHECK ADD FOREIGN KEY([Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Medical_Card_Appointment]  WITH CHECK ADD FOREIGN KEY([Appointment_Id])
REFERENCES [dbo].[Appointment] ([Id])
GO
ALTER TABLE [dbo].[Medical_Card_Appointment]  WITH CHECK ADD FOREIGN KEY([Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Receipt_Line]  WITH CHECK ADD FOREIGN KEY([Receipt_Id])
REFERENCES [dbo].[Receipt] ([Id])
GO
ALTER TABLE [dbo].[Receipt_Line]  WITH CHECK ADD FOREIGN KEY([Service_Id])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([Appointment_Id])
REFERENCES [dbo].[Appointment] ([Id])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([Cabinet_Id])
REFERENCES [dbo].[Cabinet] ([Id])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([Departament_Id])
REFERENCES [dbo].[Departament] ([Id])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD FOREIGN KEY([Departament_Id])
REFERENCES [dbo].[Departament] ([Id])
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Ward_Client]  WITH CHECK ADD FOREIGN KEY([Client_Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Ward_Client]  WITH CHECK ADD FOREIGN KEY([Ward_Id])
REFERENCES [dbo].[Ward] ([Id])
GO
ALTER TABLE [dbo].[Receipt_Line]  WITH CHECK ADD CHECK  (([Amount]>=(1)))
GO
ALTER TABLE [dbo].[Receipt_Line]  WITH CHECK ADD CHECK  (([Price]>=(1)))
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD CHECK  (([Price]>=(1)))
GO
/****** Object:  StoredProcedure [dbo].[Add_Appointment]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Appointment](@Service_Id int,@Client_Id int,@Start_date datetime,@Employee_Id int,@Departament_Id int)
As
Begin
Insert into Appointment(Service_Id,Client_Id,Start_date,Employee_Id,Departament_Id) values
(@Service_Id,@Client_Id,@Start_date,@Employee_Id,@Departament_Id)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Cabinet]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Cabinet](@Employee_Id int,@Departament_Id int)
As
Begin
Insert into Cabinet(Employee_Id,Departament_Id) values
(@Employee_Id,@Departament_Id)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Card_Line]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Card_Line](@Card_Id int,@Recording nvarchar(1000))
As
Begin
Declare @Date datetime
Select @Date = SYSDATETIME()
insert into Card_Line(Card_Id,Recording,Date_add) values
(@Card_Id,@Recording,@Date)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Client]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Add_Client](@Adres nvarchar(255),@Telephone nvarchar(20),@Name nvarchar(25),@First_Name nvarchar(25)
,@Last_Name nvarchar(25),@Birthday Date,@Medical_Insurance int,@Status nvarchar(40),@Gender bit)
As
Begin
insert into Client(Adres,Telephone,Name,First_Name,Last_Name,Birthday,Medical_Insurance,Status,Gender) values
(@Adres,@Telephone,@Name,@First_Name,@Last_Name,@Birthday,@Medical_Insurance,@Status,@Gender)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Departament]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Departament](@Floor int,@Name nvarchar(30))
As
Begin
Insert into Departament(Floor,Name) values
(@Floor,@Name)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Employee]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Employee](@Name nvarchar(25),@First_Name nvarchar(25),@Last_Name nvarchar(25)
,@Position_Id int,@Telephone nvarchar(20),@Departament_Id int,@Birthday Date,@Medical_Insurance int)
As
Begin
Insert into Employee(Name,First_Name,Last_Name,Position_Id,Telephone,Departament_Id,Birthday,Medical_Insurance) values
(@Name,@First_Name,@Last_Name,@Position_Id,@Telephone,@Departament_Id,@Birthday,@Medical_Insurance)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Medical_Card]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Medical_Card](@Id int,@Start_treatment datetime,@End_treatment datetime)
As
Begin
insert into Medical_Card(Id,Start_treatment,End_treatment) values
(@Id,@Start_treatment,@End_treatment)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Medical_Card_Appointment]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Medical_Card_Appointment](@Id int,@Appointment_Id int,@Date datetime)
As
Begin
insert into Medical_Card_Appointment(Id,Appointment_Id,Date) values
(@Id,@Appointment_Id,@Date)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Position]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Position](@Name nvarchar(30))
As
Begin
Insert into Position(Name) values
(@Name)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Receipt]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Receipt](@Client_Id int,@Date_add datetime)
As
Begin
insert into Receipt(Client_Id,Date_add) values
(@Client_Id,@Date_add)
End 
GO
/****** Object:  StoredProcedure [dbo].[Add_Receipt_Line]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Receipt_Line](@Receipt_Id int,@Service_Id int,@Amount int)
As
Begin
Declare @Price money
Select @Price = Price * @Amount from Service where Id = @Service_Id
insert into Receipt_Line(Receipt_Id,Service_Id,Amount,Price) values
(@Receipt_Id,@Service_Id,@Amount,@Price)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Report]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Report](@Client_Id int,@Employee_Id int,@Recording nvarchar(1000),@Appointment_Id int)
As
Begin
Declare @Date datetime
Select @Date = SYSDATETIME()
Insert into Report(Client_Id,Employee_Id,Recording,Date,Appointment_Id) values
(@Client_Id,@Employee_Id,@Recording,@Date,@Appointment_Id)

Insert into Card_Line(Card_Id,Recording,Date_add) values
(@Client_Id,@Recording,@Date)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Service]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Service](@Name nvarchar(30),@Service_time int,@Price MONEY,@Departament_Id int,@Employee_Id int,
							 @Cabinet_Id int)
As
Begin
Insert into Service(Name,Service_time,Price,Departament_Id,Employee_Id,Cabinet_Id) values
(@Name,@Service_time,@Price,@Departament_Id,@Employee_Id,@Cabinet_Id)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Ward]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Ward](@Departament_Id int,@Place int,@Owner_Place int,@Employee_Id int,@Gender bit)
As 
Begin
Insert into Ward(Departament_Id,Place,Owner_Place,Employee_Id,Gender) values
(@Departament_Id,@Place,@Owner_Place,@Employee_Id,@Gender)
End
GO
/****** Object:  StoredProcedure [dbo].[Add_Ward_Client]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Add_Ward_Client](@Ward_Id int,@Client_Id int,@Date_Invite date,@Date_Leave date)
As
Begin 
Insert into Ward_Client(Ward_Id,Client_Id,Date_Invite,Date_Leave) values
(@Ward_Id,@Client_Id,@Date_Invite,@Date_Leave)
End
GO
/****** Object:  StoredProcedure [dbo].[Mesta_for_All]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mesta_for_All]
As
Begin
Select 'Колличество мест в палатах общего назначения'=SUM(Place) from Ward where Gender is null
End
GO
/****** Object:  StoredProcedure [dbo].[Mesta_for_M]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mesta_for_M]
As
Begin
Select 'Колличество мест для мужчин'=SUM(Place) from Ward where Gender = 1
End
GO
/****** Object:  StoredProcedure [dbo].[Mesta_for_W]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Mesta_for_W]
As
Begin
Select 'Колличество мест для женщин'=SUM(Place) from Ward where Gender = 0
End
GO
/****** Object:  StoredProcedure [dbo].[Operated_patients]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Operated_patients]
As
Begin
Select 'Колличество прооперированных клиентов'=SUM(c.Id),'С осложнениями' = (Select SUM(c.Id) where Status = 'Осложнения'),
'Умерших' = (Select SUM(c.Id) where Status = 'Умерший' ) from Appointment a inner join
Client c on a.Client_Id = c.Id inner join
Medical_Card mc on mc.Id = c.Id where (Service_Id = 14) and (mc.End_treatment is null)
Group by Status
End
GO
/****** Object:  StoredProcedure [dbo].[Propusk]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Propusk]
As
Begin
Select sum(Owner_Place)/sum(DATEDIFF(DAY, Date_Invite, Date_Leave)) from Ward_Client inner join 
Ward on Ward.Id = Ward_Client.Ward_Id
End
GO
/****** Object:  StoredProcedure [dbo].[Sred]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sred]
As
Begin
Select 'Среднее время пробывание в больнице'=AVG(DATEDIFF(DAY, Date_Invite, Date_Leave)) from Ward_Client
End
GO
/****** Object:  StoredProcedure [dbo].[Time_of_treatment]    Script Date: 18.06.2022 3:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Time_of_treatment](@Client_Id int)
As
Begin
Select 'Срок лечения'=DATEDIFF(DAY, Start_treatment, End_treatment) from Medical_Card where Id = @Client_Id
End
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
