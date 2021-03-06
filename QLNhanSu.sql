USE [QLNhanSu]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 26-04-2021 7:06:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [varchar](10) NOT NULL,
	[FirstName] [nvarchar](20) NULL,
	[LastName] [nvarchar](30) NULL,
	[Phone] [varchar](12) NULL,
	[JobID] [varchar](10) NULL,
	[PayGrade] [int] NULL,
 CONSTRAINT [PK_Employee_1] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JobTitle]    Script Date: 26-04-2021 7:06:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[JobTitle](
	[JobID] [varchar](10) NOT NULL,
	[JobTitles] [nvarchar](50) NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supervision]    Script Date: 26-04-2021 7:06:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supervision](
	[EmployeeID] [varchar](10) NOT NULL,
	[ManagerID] [varchar](10) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[ManagerName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supervision] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[ManagerID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'IT001', N'Quan Haha', N'Pham', N'123123', N'IT', 123123123)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'IT002', N'Ngọc Trung', N'Ngô', N'078912837', N'IT', 28500000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'IT003', N'Nhật Quang', N'Trần', N'078912837', N'IT', 28500000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'KT001', N'Thị Mĩ Hạnh', N'Lương', N'0933527443', N'KT', 22000000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'KT002', N'Thu Thảo', N'Trần', N'12345689', N'KT', 29500000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'KT003', N'Thái Linh', N'Trần', N'0249292929', N'KT', 220000000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'KT004', N'Cao Chí Trung', N'Hồ', N'0123848182', N'KT', 33000000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'LC001', N'Văn A', N'Trần', N'0249292929', N'LC', 220000000)
INSERT [dbo].[Employee] ([EmployeeID], [FirstName], [LastName], [Phone], [JobID], [PayGrade]) VALUES (N'LC002', N'Thế B', N'Hoàng', N'0123123', N'LC', 15000000)
INSERT [dbo].[JobTitle] ([JobID], [JobTitles]) VALUES (N'IT', N'Nhân viên IT')
INSERT [dbo].[JobTitle] ([JobID], [JobTitles]) VALUES (N'KT', N'Kế Toán')
INSERT [dbo].[JobTitle] ([JobID], [JobTitles]) VALUES (N'LC', N'Lao công')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'IT001', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'Quan')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'IT002', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'quân phạm')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'IT002', N'LD001', CAST(N'2021-02-01 00:00:00.000' AS DateTime), CAST(N'2023-01-01 00:00:00.000' AS DateTime), N'quân phạm')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'IT003', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'quân phạm')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'KT001', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'123')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'KT001', N'LD001', CAST(N'2020-01-01 00:00:00.000' AS DateTime), CAST(N'2022-01-02 00:00:00.000' AS DateTime), N'123')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'KT002', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'Phạm Hoàng Quân')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'KT003', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'Phạm Hoàng Quân')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'KT004', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'Quân Phạm Hoàng')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'LC001', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'Trần Tuấn A')
INSERT [dbo].[Supervision] ([EmployeeID], [ManagerID], [StartDate], [EndDate], [ManagerName]) VALUES (N'LC002', N'LD001', CAST(N'1900-01-01 00:00:00.000' AS DateTime), NULL, N'Hihi')
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_JobTitle] FOREIGN KEY([JobID])
REFERENCES [dbo].[JobTitle] ([JobID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_JobTitle]
GO
ALTER TABLE [dbo].[Supervision]  WITH CHECK ADD  CONSTRAINT [FK_Supervision_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Supervision] CHECK CONSTRAINT [FK_Supervision_Employee]
GO
