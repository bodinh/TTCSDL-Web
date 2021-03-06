USE [QuanLyCafe3]
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NULL,
	[password] [varchar](20) NOT NULL,
	[type] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datecheckin] [datetime] NULL DEFAULT (getdate()),
	[datecheckout] [datetime] NULL DEFAULT (NULL),
	[status] [nvarchar](20) NOT NULL DEFAULT ((0)),
	[idaccount] [int] NOT NULL,
	[idtable] [int] NOT NULL,
	[Tongtien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[billinfo]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billinfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idbill] [int] NOT NULL,
	[idfood] [int] NOT NULL,
	[count] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[food]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[price] [float] NOT NULL,
	[idcategory] [int] NOT NULL,
	[image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nhacungcap]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nhacungcap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nhapsanpham]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhapsanpham](
	[idsanpham] [int] IDENTITY(1,1) NOT NULL,
	[idncc] [int] NULL,
	[tensanpham] [nvarchar](50) NULL,
	[tongtien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idsanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[staff]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[idstaff] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[position] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[idaccount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idstaff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[staff_audit]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_audit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idstaff] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[changedate] [datetime] NOT NULL,
	[action] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tablefood]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablefood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[account] ON 

GO
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (1, N'admin', N'12345678', N'admin')
GO
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (3, N'user3', N'12345678', N'staff')
GO
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (5, N'user5', N'12345678', N'staff')
GO
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (6, N'user6', N'12345678', N'staff')
GO
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (7, N'user7', N'12345678', N'staff')
GO
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (8, N'user8', N'12345678', N'staff')
GO
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (9, N'user9', N'12345678', N'staff')
GO
INSERT [dbo].[account] ([id], [username], [password], [type]) VALUES (10, N'user10', N'12345678', N'staff')
GO
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (1, CAST(N'2020-04-26 14:37:01.410' AS DateTime), CAST(N'2020-04-26 14:37:51.387' AS DateTime), N'1', 1, 1, 352000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (2, CAST(N'2020-04-26 15:30:06.283' AS DateTime), CAST(N'2020-04-26 15:30:29.027' AS DateTime), N'1', 3, 1, 145000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (3, CAST(N'2020-04-27 17:53:10.783' AS DateTime), CAST(N'2020-04-27 17:53:17.950' AS DateTime), N'1', 8, 13, 58000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (4, CAST(N'2020-04-27 22:02:56.613' AS DateTime), CAST(N'2020-04-27 22:32:16.187' AS DateTime), N'1', 1, 3, 156000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (5, CAST(N'2020-04-27 23:02:23.367' AS DateTime), CAST(N'2020-04-27 23:02:43.623' AS DateTime), N'1', 1, 4, 412000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (6, CAST(N'2020-04-27 23:02:35.830' AS DateTime), CAST(N'2020-04-27 23:02:45.953' AS DateTime), N'1', 1, 14, 200000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (7, CAST(N'2020-04-28 10:40:07.487' AS DateTime), CAST(N'2020-04-28 10:40:26.710' AS DateTime), N'1', 1, 1, 220000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (8, CAST(N'2020-04-28 16:05:53.573' AS DateTime), CAST(N'2020-04-28 16:06:10.790' AS DateTime), N'1', 1, 1, 1180000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (9, CAST(N'2020-04-28 16:06:11.670' AS DateTime), CAST(N'2020-04-28 16:06:19.640' AS DateTime), N'1', 1, 11, 472000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (10, CAST(N'2020-04-28 16:09:56.603' AS DateTime), CAST(N'2020-04-28 16:10:15.203' AS DateTime), N'1', 1, 15, 668000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (11, CAST(N'2020-04-28 16:21:28.947' AS DateTime), CAST(N'2020-04-28 16:28:55.557' AS DateTime), N'1', 8, 13, 100000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (12, CAST(N'2020-04-28 16:28:58.483' AS DateTime), CAST(N'2020-04-28 16:29:03.143' AS DateTime), N'1', 8, 14, 100000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (13, CAST(N'2020-04-28 16:31:59.677' AS DateTime), CAST(N'2020-04-28 16:32:06.403' AS DateTime), N'1', 1, 15, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (14, CAST(N'2020-04-28 16:21:21.590' AS DateTime), CAST(N'2020-04-28 16:33:21.957' AS DateTime), N'1', 3, 3, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (15, CAST(N'2020-04-28 16:41:12.823' AS DateTime), CAST(N'2020-04-28 16:41:27.343' AS DateTime), N'1', 1, 1, 145000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (16, CAST(N'2020-04-28 16:35:58.463' AS DateTime), CAST(N'2020-04-28 16:36:00.977' AS DateTime), N'1', 3, 12, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (17, CAST(N'2020-04-28 16:31:23.187' AS DateTime), CAST(N'2020-04-28 16:31:33.863' AS DateTime), N'1', 1, 14, 200000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (18, CAST(N'2020-04-28 16:31:52.277' AS DateTime), CAST(N'2020-04-28 16:31:57.033' AS DateTime), N'1', 1, 13, 200000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (19, CAST(N'2020-04-28 16:33:23.867' AS DateTime), CAST(N'2020-04-28 16:33:33.913' AS DateTime), N'1', 3, 3, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (20, CAST(N'2020-04-28 16:36:04.297' AS DateTime), CAST(N'2020-04-28 16:36:07.773' AS DateTime), N'1', 3, 15, 220000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (21, CAST(N'2020-04-28 16:36:11.733' AS DateTime), CAST(N'2020-04-28 16:36:27.513' AS DateTime), N'1', 3, 15, 330000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (22, CAST(N'2020-04-28 18:22:11.263' AS DateTime), CAST(N'2020-04-28 18:22:26.970' AS DateTime), N'1', 1, 2, 145000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (23, CAST(N'2020-04-28 16:41:32.437' AS DateTime), CAST(N'2020-04-28 16:41:38.773' AS DateTime), N'1', 1, 14, 29000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (24, CAST(N'2020-04-28 18:23:25.803' AS DateTime), CAST(N'2020-04-28 18:23:36.980' AS DateTime), N'1', 1, 15, 203000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (25, CAST(N'2020-04-28 22:03:47.153' AS DateTime), NULL, N'0', 1, 4, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (26, CAST(N'2020-04-28 19:37:00.287' AS DateTime), CAST(N'2020-04-28 21:49:15.960' AS DateTime), N'1', 3, 1, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (27, CAST(N'2020-04-28 16:44:14.143' AS DateTime), CAST(N'2020-04-28 18:10:23.893' AS DateTime), N'1', 1, 5, 351000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (28, CAST(N'2020-04-28 18:12:18.993' AS DateTime), CAST(N'2020-04-28 18:22:54.090' AS DateTime), N'1', 1, 14, 174000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (29, CAST(N'2020-05-14 23:22:42.053' AS DateTime), NULL, N'0', 1, 12, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (30, CAST(N'2020-05-31 21:48:03.547' AS DateTime), NULL, N'0', 1, 5, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (31, CAST(N'2020-04-28 18:19:15.803' AS DateTime), CAST(N'2020-04-28 18:21:41.190' AS DateTime), N'1', 1, 3, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (32, CAST(N'2020-04-28 18:25:42.380' AS DateTime), CAST(N'2020-04-28 18:25:49.260' AS DateTime), N'1', 1, 10, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (33, CAST(N'2020-04-28 19:13:22.917' AS DateTime), CAST(N'2020-04-28 19:13:43.357' AS DateTime), N'1', 3, 2, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (34, CAST(N'2020-04-28 19:00:03.377' AS DateTime), CAST(N'2020-04-28 19:00:16.270' AS DateTime), N'1', 1, 3, 236000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (35, CAST(N'2020-04-28 19:10:12.287' AS DateTime), CAST(N'2020-04-28 19:10:38.613' AS DateTime), N'1', 1, 3, 118000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (36, CAST(N'2020-04-28 19:33:03.973' AS DateTime), CAST(N'2020-04-28 21:53:21.707' AS DateTime), N'1', 3, 2, 116000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (37, CAST(N'2020-04-28 21:50:17.293' AS DateTime), CAST(N'2020-04-28 21:50:20.450' AS DateTime), N'1', 3, 1, 58000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (38, CAST(N'2020-04-28 21:54:16.417' AS DateTime), CAST(N'2020-04-28 21:54:18.250' AS DateTime), N'1', 3, 2, 58000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (39, CAST(N'2020-04-28 21:55:22.933' AS DateTime), CAST(N'2020-04-28 21:55:25.993' AS DateTime), N'1', 3, 1, 58000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (40, CAST(N'2020-04-29 10:21:58.397' AS DateTime), CAST(N'2020-04-29 11:21:38.917' AS DateTime), N'1', 1, 2, 638000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (41, CAST(N'2020-06-14 14:12:25.527' AS DateTime), NULL, N'0', 1, 1, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (42, CAST(N'2020-04-28 22:04:01.027' AS DateTime), CAST(N'2020-04-28 22:04:07.457' AS DateTime), N'1', 1, 15, 180000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (43, CAST(N'2020-04-28 22:04:14.300' AS DateTime), NULL, N'0', 1, 10, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (44, CAST(N'2020-04-28 22:04:22.970' AS DateTime), CAST(N'2020-06-26 08:58:05.393' AS DateTime), N'1', 1, 14, 687500)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (45, CAST(N'2020-04-29 09:12:44.617' AS DateTime), NULL, N'0', 1, 3, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (46, CAST(N'2020-06-04 14:43:31.837' AS DateTime), NULL, N'0', 1, 15, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (47, CAST(N'2020-04-29 11:21:51.060' AS DateTime), CAST(N'2020-04-29 11:28:46.230' AS DateTime), N'1', 1, 2, 736000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (48, CAST(N'2020-04-29 11:28:47.637' AS DateTime), NULL, N'0', 1, 2, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (49, CAST(N'2020-04-29 21:40:47.593' AS DateTime), CAST(N'2020-04-29 21:41:01.037' AS DateTime), N'1', 1, 13, 58000)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (50, CAST(N'2020-05-25 14:23:02.080' AS DateTime), NULL, N'0', 1, 11, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (51, CAST(N'2020-06-05 17:47:25.817' AS DateTime), NULL, N'0', 1, 6, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (52, CAST(N'2020-05-31 22:42:09.917' AS DateTime), NULL, N'0', 1, 7, NULL)
GO
INSERT [dbo].[bill] ([id], [datecheckin], [datecheckout], [status], [idaccount], [idtable], [Tongtien]) VALUES (53, CAST(N'2020-06-26 08:58:29.393' AS DateTime), CAST(N'2020-06-26 08:59:42.427' AS DateTime), N'1', 1, 13, 127600)
GO
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[billinfo] ON 

GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (1, 1, 39, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (2, 1, 30, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (3, 2, 1, 5)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (4, 3, 1, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (5, 4, 34, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (6, 5, 1, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (7, 5, 31, 6)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (8, 6, 8, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (9, 7, 4, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (10, 8, 30, 10)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (11, 8, 31, 10)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (12, 9, 30, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (13, 9, 31, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (14, 10, 16, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (15, 10, 29, 8)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (19, 14, 1, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (20, 11, 8, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (22, 12, 32, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (25, 17, 8, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (26, 18, 1, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (27, 13, 38, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (28, 13, 39, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (29, 19, 34, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (33, 16, 4, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (34, 20, 4, 6)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (35, 21, 8, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (41, 15, 1, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (42, 23, 1, 5)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (46, 27, 5, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (47, 27, 1, 9)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (55, 28, 1, 7)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (59, 31, 1, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (62, 22, 1, 5)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (63, 22, 4, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (64, 24, 19, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (65, 32, 33, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (74, 34, 30, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (77, 35, 31, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (78, 33, 1, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (79, 36, 1, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (80, 26, 1, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (81, 37, 1, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (82, 38, 1, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (83, 39, 1, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (84, 25, 16, 12)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (85, 42, 17, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (86, 43, 22, 5)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (87, 44, 4, 8)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (89, 45, 17, 12)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (141, 40, 1, 22)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (142, 45, 34, 12)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (143, 45, 38, 6)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (144, 45, 39, 5)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (152, 45, 7, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (153, 45, 9, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (155, 47, 8, 12)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (156, 47, 1, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (157, 47, 2, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (158, 48, 34, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (160, 48, 5, 3)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (161, 48, 1, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (162, 48, 2, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (163, 48, 4, 7)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (164, 48, 6, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (165, 48, 9, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (166, 48, 7, 5)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (167, 48, 10, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (168, 48, 12, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (169, 48, 3, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (170, 48, 11, 4)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (171, 48, 13, 3)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (172, 48, 15, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (173, 48, 14, 3)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (186, 49, 1, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (188, 45, 1, 2)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (193, 50, 1, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (199, 30, 1, 3)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (209, 30, 2, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (210, 30, 3, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (211, 30, 12, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (212, 44, 6, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (213, 44, 5, 3)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (214, 25, 1, 10)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (215, 51, 1, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (219, 25, 2, 1)
GO
INSERT [dbo].[billinfo] ([id], [idbill], [idfood], [count]) VALUES (224, 53, 1, 4)
GO
SET IDENTITY_INSERT [dbo].[billinfo] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

GO
INSERT [dbo].[category] ([id], [name]) VALUES (1, N'CÀ PHÊ')
GO
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'TRÀ VÀ MACCHIATO')
GO
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'THỨC UỐNG ĐÁ XAY')
GO
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'THỨC UỐNG TRÁI CÂY')
GO
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'BÁNH VÀ SNACK')
GO
INSERT [dbo].[category] ([id], [name]) VALUES (6, N'MÓN TRÁNG MIỆNG')
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[food] ON 

GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (1, N'BẠC SỈU', 31900, 1, N'bạc sỉu.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (2, N'AMERICANO', 42900, 1, N'americano_large.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (3, N'CAPUCHINO', 49500, 1, N'capuchino.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (4, N'CARAMEL MACCHIATO', 60500, 1, N'caramel machiato.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (5, N'COLD BREW CAM SẢ', 49500, 1, N'cold brew cam sả.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (6, N'COLD BREW PHÚC BỒN TỬ', 55000, 1, N'cold brew phúc bồn tử.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (7, N'COLD BREW SỮA TƯƠI MACCHIATO', 55000, 1, N'cold brew sữa tươi macchiato.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (8, N'COLD BREW SỮA TƯƠI', 55000, 1, N'cold brew sữa tươi.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (9, N'COLD BREW TRUYÊ`N THÔ´NG', 49500, 1, N'cold brew truyền thống.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (10, N'CÀ PHÊ SỮA', 31900, 1, N'cà phê sữa.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (11, N'CÀ PHÊ ĐEN', 31900, 1, N'cà phê đen.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (12, N'ESPRESSO', 38500, 1, N'espresso.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (13, N'TRÀ ĐEN MACCHIATO', 55000, 2, N'blacktea_macchiat_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (14, N'TRÀ MATCHA LATTLE', 59000, 2, N'matcha_latte_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (15, N'TRÀ MATHCA MACCHIATO', 45000, 2, N'matcha_macchiato_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (16, N'TRÀ PHÚC BỒN TỬ', 49000, 2, N'tea_raspberry_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (17, N'TRÀ ĐÀO CAM SẢ', 45000, 2, N'tra_dao_cam_sa_on_bg_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (18, N'TRÀ OOLONG SEN AN NHIÊN', 45000, 2, N'trasen_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (19, N'TRÀ OOLONG VẢI NHƯ Ý', 45000, 2, N'travai_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (20, N'TRÀ CHERRY MACCHIATO', 55000, 2, N'tràcherrymacchiato.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (21, N'TRÀ XOÀI MACCHIATO', 56000, 2, N'xoai_mac_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (22, N'TRÀ XOÀI MACCHIATO', 55000, 2, N'xoai_nong_mac_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (23, N'CHANH SẢ ĐÁ XAY', 49000, 3, N'chanh_sa_da_xay_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (24, N'CHOCOLATE ĐÁ XAY', 59000, 3, N'chocolate_ice_blended_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (25, N'COOKIES ĐÁ XAY', 59000, 3, N'cookies_ice_blended_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (26, N'ĐÀO VIỆT QUẤT ĐÁ XAY', 59000, 3, N'dao_viet_quat_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (27, N'PHÚC BỒN TỬ CAM ĐÁ XAY', 59000, 3, N'daxay_raspberry_ice_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (28, N'MATCHA ĐÁ XAY', 59000, 3, N'matcha_ice_blended_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (29, N'ỔI HỒNG VIỆT QUẤT ĐÁ XAY', 59000, 3, N'oihong_viet_quat_ice_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (30, N'SINH TỐ VIỆT QUẤT', 59000, 4, N'blueberry_smoothie_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (31, N'SINH TỐ CAM XOÀI', 59000, 4, N'mango_smoothie_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (32, N'BÁNH PASSION CHEESE', 29000, 5, N'banh_passion_cheese_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (33, N'BÁNH CHOCOLATE', 29000, 5, N'choco_cake_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (34, N'BÁNH GẤU CHOCOLATE', 39000, 5, N'gau_chocolate_cake_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (35, N'BÁNH MATCHA', 29000, 5, N'matcha_cake_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (36, N'BÁNH MÌ CHÀ BÔNG PHÔ MAI', 32000, 5, N'phomaichabong_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (37, N'BÁNH CROISSANT BƠ TỎI', 29000, 5, N'sungtrau_cake_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (38, N'BÁNH TIRAMISU', 29000, 5, N'tiramisu_cake_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (39, N'BÁNH BÔNG LAN TRỨNG MUỐI', 29000, 5, N'trungmuoi_bong_lan_large.png')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (53, N'11111222', 11111, 2, N'80295558_449884069029900_7367724454475988992_n.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (1052, N'111113333', 4444, 1, N'index.jpg')
GO
INSERT [dbo].[food] ([id], [name], [price], [idcategory], [image]) VALUES (1055, N'pham dinh', 111111, 5, N'103135409_889625851504177_121922_o.jpg')
GO
SET IDENTITY_INSERT [dbo].[food] OFF
GO
SET IDENTITY_INSERT [dbo].[staff] ON 

GO
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (1, N'Phạm Văn Đình', N'Hoạt động', N'Ban Quản Lý', N'phamvandinh@gmail.com', 1)
GO
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (3, N'Tạ Quốc Hùng', N'Ngưng Hoạt động', N'Nhân Viên', N'taquochung@gmail.com', 3)
GO
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (5, N'Tạ Ngọc Hùng', N'Ngưng Hoạt động', N'Nhân Viên', N'dinhvjps@gmail.com', 5)
GO
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (6, N'Lê Hào', N'Ngưng Hoạt động', N'Nhân Viên', N'Lehao@gmail.com', 6)
GO
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (7, N'Trịnh Ngọc Trinh', N'Ngưng hoạt động', N'Nhân Viên', N'Ngoctring@gmail.com', 7)
GO
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (8, N'Lê Hào', N'Ngưng hoạt động', N'Nhân Viên', N'Lehao@gmail.com', 8)
GO
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (9, N'pham dinh', N'Hoạt động', N'Nhân viên', N'Lehao@gmail.com', 9)
GO
INSERT [dbo].[staff] ([idstaff], [name], [status], [position], [email], [idaccount]) VALUES (10, N'Phạm thị C', N'Hoạt động', N'Nhân viên', N'phamthiC@gmail.com', 10)
GO
SET IDENTITY_INSERT [dbo].[staff] OFF
GO
SET IDENTITY_INSERT [dbo].[staff_audit] ON 

GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (1, 7, N'Trịnh Ngọc Trinh', CAST(N'2020-04-13 16:52:21.640' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (2, 7, N'Trịnh Ngọc Trinh', CAST(N'2020-04-13 17:06:31.953' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (3, 7, N'Trịnh Ngọc Trinh', CAST(N'2020-04-13 17:20:14.297' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (4, 7, N'Trịnh Ngọc Hùng', CAST(N'2020-04-13 17:20:49.550' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (5, 8, N'Lê Hào', CAST(N'2020-04-15 10:44:29.543' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (6, 8, N'Lê Hào', CAST(N'2020-04-15 10:45:03.343' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (7, 8, N'Trịnh Ngọc Trinh', CAST(N'2020-04-15 10:45:22.970' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (8, 8, N'Trịnh Ngọc Trinh', CAST(N'2020-04-15 10:45:37.587' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (9, 7, N'Trịnh Ngọc Hùng', CAST(N'2020-04-23 22:17:36.593' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (10, 7, N'pham dinh', CAST(N'2020-04-23 22:19:22.493' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (11, 6, N'Lê Hào', CAST(N'2020-04-23 22:21:49.637' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (12, 8, N'Lê Hào', CAST(N'2020-04-23 22:26:06.147' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (13, 8, N'Lê Hào', CAST(N'2020-04-23 22:33:08.057' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (14, 8, N'Lê Hào', CAST(N'2020-04-23 22:33:17.930' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (15, 8, N'Lê Hào', CAST(N'2020-04-23 22:42:32.990' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (16, 7, N'pham dinh', CAST(N'2020-04-24 14:06:24.957' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (17, 5, N'Tạ Ngọc Hùng', CAST(N'2020-04-24 14:22:38.537' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (18, 5, N'Tạ Ngọc Hùng', CAST(N'2020-04-24 14:31:53.457' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (19, 6, N'Lê Hào', CAST(N'2020-04-24 14:43:41.547' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (20, 7, N'Trịnh Ngọc Trinh', CAST(N'2020-04-26 15:37:58.277' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (21, 8, N'Lê Hào', CAST(N'2020-04-26 15:40:22.000' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (22, 9, N'Phạm thị A', CAST(N'2020-04-26 15:42:51.670' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (23, 10, N'Phạm thị B', CAST(N'2020-04-26 15:43:18.810' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (24, 11, N'Phạm thị C', CAST(N'2020-04-26 15:43:29.370' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (25, 12, N'Phạm thị D', CAST(N'2020-04-26 15:43:45.407' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (26, 12, N'Phạm thị D', CAST(N'2020-04-29 14:39:59.037' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (27, 3, N'Tạ Quốc Hùng', CAST(N'2020-04-29 14:40:21.967' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (28, 4, N'Nghiêm Khắc Lâm', CAST(N'2020-04-29 14:40:29.487' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (29, 5, N'Tạ Ngọc Hùng', CAST(N'2020-04-29 14:40:35.510' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (33, 9, N'Phạm thị A', CAST(N'2020-05-28 22:22:26.840' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (34, 13, N'pham dinh', CAST(N'2020-05-28 22:24:44.623' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (35, 12, N'Phạm thị D', CAST(N'2020-05-28 22:24:55.080' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (36, 13, N'pham dinh', CAST(N'2020-05-30 13:34:36.230' AS DateTime), N'Update')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (37, 11, N'Phạm thị C', CAST(N'2020-06-03 19:46:46.613' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (38, 14, N'Phạm thị C', CAST(N'2020-06-03 19:47:06.460' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (39, 14, N'Phạm thị C', CAST(N'2020-06-03 20:13:27.983' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (40, 13, N'pham dinh', CAST(N'2020-06-03 20:18:33.900' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (41, 10, N'Phạm thị B', CAST(N'2020-06-03 20:18:46.320' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (42, 9, N'Phạm thị C', CAST(N'2020-06-03 21:04:23.427' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (43, 9, N'Phạm thị C', CAST(N'2020-06-03 21:04:32.787' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (44, 9, N'pham dinh', CAST(N'2020-06-03 21:04:41.970' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (45, 9, N'pham dinh', CAST(N'2020-06-03 21:05:41.857' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (46, 9, N'pham dinh', CAST(N'2020-06-03 21:05:52.060' AS DateTime), N'Insert')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (47, 4, N'Nghiêm Khắc Lâm', CAST(N'2020-06-03 21:06:39.200' AS DateTime), N'Delete')
GO
INSERT [dbo].[staff_audit] ([id], [idstaff], [name], [changedate], [action]) VALUES (48, 10, N'Phạm thị C', CAST(N'2020-06-03 21:06:49.840' AS DateTime), N'Insert')
GO
SET IDENTITY_INSERT [dbo].[staff_audit] OFF
GO
SET IDENTITY_INSERT [dbo].[tablefood] ON 

GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (1, N'Bàn 1', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (2, N'Bàn 2', N'có người')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (3, N'Bàn 3', N'có người')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (4, N'Bàn 4', N'có người')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (5, N'Bàn 5', N'có người')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (6, N'Bàn 6', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (7, N'Bàn 7', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (8, N'Bàn 8', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (9, N'Bàn 9', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (10, N'Bàn 10', N'có người')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (11, N'Bàn 11', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (12, N'Bàn 12', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (13, N'Bàn 13', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (14, N'Bàn 14', N'trống')
GO
INSERT [dbo].[tablefood] ([id], [name], [status]) VALUES (15, N'Bàn 15', N'trống')
GO
SET IDENTITY_INSERT [dbo].[tablefood] OFF
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([idaccount])
REFERENCES [dbo].[account] ([id])
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([idtable])
REFERENCES [dbo].[tablefood] ([id])
GO
ALTER TABLE [dbo].[billinfo]  WITH CHECK ADD FOREIGN KEY([idbill])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[billinfo]  WITH CHECK ADD FOREIGN KEY([idfood])
REFERENCES [dbo].[food] ([id])
GO
ALTER TABLE [dbo].[food]  WITH CHECK ADD FOREIGN KEY([idcategory])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[nhapsanpham]  WITH CHECK ADD FOREIGN KEY([idncc])
REFERENCES [dbo].[nhacungcap] ([id])
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD FOREIGN KEY([idaccount])
REFERENCES [dbo].[account] ([id])
GO
/****** Object:  StoredProcedure [dbo].[add_bill]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[add_bill]
    @datecheckin DATETIME ,
    @datecheckout DATETIME ,
    @status NVARCHAR(20) ,
    @idaccount INT ,
    @idtable INT
AS
    BEGIN
        INSERT  dbo.bill
                ( datecheckin ,
                  datecheckout ,
                  status ,
                  idaccount ,
                  idtable
   	            )
        VALUES  ( @datecheckin ,
                  @datecheckout ,
                  @status ,
                  @idaccount ,
                  @idtable
                )
    END


GO
/****** Object:  StoredProcedure [dbo].[add_billinfo]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[add_billinfo]
@idbill INT,
@idfood INT,
@count INT
AS
BEGIN
	INSERT dbo.billinfo
	        ( idbill, idfood, count )
	VALUES  ( @idbill, -- idbill - int
	          @idfood, -- idfood - int
	          @count  -- count - int
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[add_product]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[add_product]
			@name NVARCHAR(50),
			@price FLOAT,
			@idcategory INT,
			@image NVARCHAR(50)
				--@parameter_name AS scalar_data_type ( = default_value ), ...
			-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
			AS
			BEGIN
				INSERT dbo.food
				        ( name, price, idcategory, image )
				VALUES  ( @name, -- name - nvarchar(50)
				          @price, -- price - float
				          @idcategory, -- idcategory - int
				          @image  -- image - nvarchar(50)
				          )
			END
				--	statements

GO
/****** Object:  StoredProcedure [dbo].[addproduct]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addproduct]
@name NVARCHAR(50),
@price FLOAT ,
@idcategory INT,
@image NVARCHAR(50)
	--@parameter_name AS scalar_data_type ( = default_value ), ...
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
BEGIN
	INSERT dbo.food
	        ( name, price, idcategory, image )
	VALUES  ( @name, -- name - nvarchar(50)
	          @price, -- price - float
	          @idcategory, -- idcategory - int
	          @image  -- image - nvarchar(50)
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[Addstaffaccount]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Addstaffaccount]
@name NVARCHAR(50),
@status NVARCHAR(20),
@position NVARCHAR(50),
@email NVARCHAR(50),
@idaccount INT,
@username VARCHAR(20),
@password VARCHAR(20),
@type NVARCHAR(20)
AS BEGIN

INSERT dbo.account
        ( username, password, type )
VALUES  ( @username ,@password,@type  )

INSERT dbo.staff
        ( name ,
          status ,
          position ,
          email ,
          idaccount
        )
VALUES  ( @name,@status,@position,@email,@idaccount)

END

GO
/****** Object:  StoredProcedure [dbo].[Addstaffaccountlatest]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Addstaffaccountlatest]
@name NVARCHAR(50),
@status NVARCHAR(20),
@position NVARCHAR(50),
@email NVARCHAR(50),
@idaccount INT,
@username VARCHAR(20),
@password VARCHAR(20),
@type NVARCHAR(20)
AS BEGIN

DECLARE @count INT = @idaccount;
SET @count = @idaccount -1;


DBCC CHECKIDENT ('dbo.account', RESEED, @count )
DBCC CHECKIDENT ('dbo.staff', RESEED, @count )

INSERT dbo.account
        ( username, password, type )
VALUES  ( @username ,@password,@type  )

INSERT dbo.staff
        ( name ,
          status ,
          position ,
          email ,
          idaccount
        )
VALUES  ( @name,@status,@position,@email,@idaccount)

END

GO
/****** Object:  StoredProcedure [dbo].[customer_table]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[customer_table]
@id INT
AS
BEGIN
	UPDATE dbo.tablefood SET status=N'có người' WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[delete_billinfo]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delete_billinfo]
@idbill INT
AS
BEGIN
DELETE FROM dbo.billinfo WHERE idbill=@idbill
END

GO
/****** Object:  StoredProcedure [dbo].[delete_billinfo_idfood]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[delete_billinfo_idfood]
@idfood INT,
@idbill INT
AS
BEGIN
DELETE FROM dbo.billinfo WHERE idfood=@idfood AND idbill=@idbill
END

GO
/****** Object:  StoredProcedure [dbo].[delete_product]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
			CREATE PROCEDURE [dbo].[delete_product]
			@idproduct INT
				--@parameter_name AS scalar_data_type ( = default_value ), ...
			-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
			AS
			BEGIN
				DELETE dbo.food WHERE id=@idproduct
			END
				--	statements

GO
/****** Object:  StoredProcedure [dbo].[deletestaffaccount]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deletestaffaccount] @id INT
AS
    BEGIN
        DELETE  FROM dbo.staff
        WHERE   idstaff = @id
        DELETE  FROM dbo.account
        WHERE   id = @id
    END

GO
/****** Object:  StoredProcedure [dbo].[empty_table]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[empty_table]
@id INT
AS
BEGIN
	UPDATE dbo.tablefood SET status=N'trống' WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[filter_food]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[filter_food]
@idcategory int
AS
BEGIN
	SELECT  idcategory ,
        category.name AS 'Name Category',
        food.id ,
        dbo.food.name ,
        price ,
        image
FROM    dbo.category
        LEFT JOIN dbo.food ON food.idcategory = category.id
WHERE   category.id = @idcategory
END

GO
/****** Object:  StoredProcedure [dbo].[filter_food_2]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[filter_food_2] @idcategory INT
AS
    BEGIN
        SELECT  idcategory ,
                category.name AS 'Name Category' ,
                food.id ,
                dbo.food.name ,
                price ,
                image
        FROM    dbo.category
                LEFT JOIN dbo.food ON food.idcategory = category.id
        WHERE   category.id = @idcategory
    END

GO
/****** Object:  StoredProcedure [dbo].[get_info_product]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
			CREATE PROCEDURE [dbo].[get_info_product]
			@idproduct INT
				--@parameter_name AS scalar_data_type ( = default_value ), ...
			-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
			AS
			BEGIN
				
			SELECT dbo.food.id,dbo.food.name,price,idcategory,image,category.name AS nameCg FROM dbo.food LEFT JOIN dbo.category ON category.id = food.idcategory WHERE dbo.food.id=@idproduct
			END
				--	statements

GO
/****** Object:  StoredProcedure [dbo].[get_receipt]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_receipt]
	--@parameter_name AS scalar_data_type ( = default_value ), ...
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
BEGIN
	SELECT dbo.bill.id,datecheckout,dbo.bill.idaccount,idtable,Tongtien,type,name FROM dbo.bill LEFT JOIN dbo.account ON account.id = bill.idaccount LEFT JOIN dbo.staff ON staff.idaccount = account.id WHERE dbo.bill.status='1'
END
	--	statements

GO
/****** Object:  StoredProcedure [dbo].[top10bestsell]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[top10bestsell]
	--@parameter_name AS scalar_data_type ( = default_value ), ...
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
	BEGIN
		SELECT  f.id
FROM    dbo.food f ,
        ( SELECT TOP ( 10 )
                    *
          FROM      ( SELECT    SUM(c.count) AS TREND ,
                                c.idfood
                      FROM      ( SELECT    a.idfood ,
                                            a.count
                                  FROM      dbo.billinfo a ,
                                            ( SELECT    id
                                              FROM      dbo.bill WHERE status='1'
                                            ) b
                                  WHERE     a.idbill = b.id
                                ) c
                      GROUP BY  c.idfood
                    ) d
          ORDER BY  d.TREND DESC
        ) e
WHERE   e.idfood = f.id
	END

GO
/****** Object:  StoredProcedure [dbo].[update_product]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[update_product]
			@idproduct INT,
			@name NVARCHAR(50),
			@price FLOAT,
			@idcategory INT,
			@image NVARCHAR(50)

				--@parameter_name AS scalar_data_type ( = default_value ), ...
			-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
			AS
			BEGIN
						UPDATE dbo.food SET name=@name,price=@price,idcategory=@idcategory,image=@image WHERE id=@idproduct
			END
				--	statements

GO
/****** Object:  StoredProcedure [dbo].[updateimageproduct]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateimageproduct]
@id INT,
@image NVARCHAR(50)
	--@parameter_name AS scalar_data_type ( = default_value ), ...
-- WITH ENCRYPTION, RECOMPILE, EXECUTE AS CALLER|SELF|OWNER| 'user_name'
AS
BEGIN
UPDATE dbo.food SET image=@image WHERE id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[updatestaff]    Script Date: 6/26/2020 10:27:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updatestaff]
    @id INT ,
    @name NVARCHAR(50) ,
    @status NVARCHAR(20) ,
    @position NVARCHAR(50) ,
    @email NVARCHAR(50) ,
    @idaccount INT
AS
    BEGIN
        UPDATE  dbo.staff
        SET     name = @name ,
                status = @status ,
                position = @position ,
                email = @email ,
                idaccount = @idaccount
        WHERE   idstaff = @id
    END

GO
