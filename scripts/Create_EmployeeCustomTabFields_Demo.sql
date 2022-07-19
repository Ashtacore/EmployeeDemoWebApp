/****** Object:  Table [dbo].[EmployeeCustomTabFields]    Script Date: 7/5/2022 5:15:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeCustomTabFields](
	[Employee] [varchar](20) NOT NULL,
	[CustService] [varchar](255) NULL,
	[CustTier] [varchar](255) NULL,
	[CustRole] [varchar](255) NULL,
	[CustTradeDiscipline] [varchar](255) NULL,
	[CustTechnical] [varchar](1) NULL,
	[CreateUser] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[ModUser] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
 CONSTRAINT [EmployeeCustomTabFieldsPK] PRIMARY KEY NONCLUSTERED 
(
	[Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] 
GO



ALTER TABLE [dbo].[EmployeeCustomTabFields] ADD  DEFAULT (getutcdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[EmployeeCustomTabFields] ADD  DEFAULT (getutcdate()) FOR [ModDate]
GO


ALTER TABLE [dbo].[EmployeeCustomTabFields]  WITH NOCHECK ADD  CONSTRAINT [FK_EmployeeCustomTabFields_Employee_EM] FOREIGN KEY([Employee])
REFERENCES [dbo].[EM] ([Employee])
GO

ALTER TABLE [dbo].[EmployeeCustomTabFields] CHECK CONSTRAINT [FK_EmployeeCustomTabFields_Employee_EM]
GO