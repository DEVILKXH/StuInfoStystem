USE [coursemanagement]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 07/03/2016 22:18:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Tno] [char](9) NOT NULL,
	[Tname] [char](20) NULL,
	[Tsex] [char](2) NULL,
	[Tcourse] [char](20) NULL,
	[Tpwd] [varchar](20) NULL,
	[images] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Tno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Tname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 07/03/2016 22:18:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Sno] [char](9) NOT NULL,
	[Sname] [char](20) NULL,
	[Ssex] [char](2) NULL,
	[Sage] [smallint] NULL,
	[Sgrade] [char](20) NULL,
	[Spwd] [varchar](20) NULL,
	[images] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Sno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Sname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 07/03/2016 22:18:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Cno] [char](9) NOT NULL,
	[Cname] [char](20) NULL,
	[Ctime] [char](20) NULL,
	[Cplace] [smallint] NULL,
	[Cmaterial] [char](20) NULL,
	[Tname] [char](20) NULL,
	[Tno] [char](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Cname] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sel]    Script Date: 07/03/2016 22:18:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sel](
	[SNO] [char](9) NULL,
	[Cno] [char](9) NULL,
	[Tno] [char](9) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__Course__Tno__0AD2A005]    Script Date: 07/03/2016 22:18:02 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([Tno])
REFERENCES [dbo].[Teacher] ([Tno])
GO
/****** Object:  ForeignKey [FK__Sel__Cno__1A14E395]    Script Date: 07/03/2016 22:18:02 ******/
ALTER TABLE [dbo].[Sel]  WITH CHECK ADD FOREIGN KEY([Cno])
REFERENCES [dbo].[Course] ([Cno])
GO
/****** Object:  ForeignKey [FK__Sel__SNO__1920BF5C]    Script Date: 07/03/2016 22:18:02 ******/
ALTER TABLE [dbo].[Sel]  WITH CHECK ADD FOREIGN KEY([SNO])
REFERENCES [dbo].[Student] ([Sno])
GO
/****** Object:  ForeignKey [FK__Sel__Tno__1B0907CE]    Script Date: 07/03/2016 22:18:02 ******/
ALTER TABLE [dbo].[Sel]  WITH CHECK ADD FOREIGN KEY([Tno])
REFERENCES [dbo].[Teacher] ([Tno])
GO
