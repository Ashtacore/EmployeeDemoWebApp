/****** Object:  Table [dbo].[EM]    Script Date: 7/5/2022 5:10:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EM](
	[Employee] [varchar](20) NOT NULL,
	[LastName] [varchar](30) NULL,
	[FirstName] [varchar](25) NULL,
	[MiddleName] [varchar](30) NULL,
	[HireDate] [datetime] NULL,
	[Status] [varchar](1) NULL,
	[Type] [varchar](1) NULL,
	[Org] [varchar](14) NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[Address3] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](10) NULL,
	[ZIP] [varchar](10) NULL,
	[Country] [varchar](2) NULL,
	[EmployeePhoto] [varchar](255) NULL,
	[HomePhone] [varchar](24) NULL,
	[EMail] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Supervisor] [varchar](20) NULL,
	[WorkPhone] [varchar](24) NULL,
	[WorkPhoneExt] [varchar](8) NULL,
	[MobilePhone] [varchar](24) NULL,
	[CreateUser] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
	[ModUser] [varchar](20) NULL,
	[ModDate] [datetime] NULL,
 CONSTRAINT [EMPK] PRIMARY KEY NONCLUSTERED 
(
	[Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] 
GO


ALTER TABLE [dbo].[EM] ADD  DEFAULT (getutcdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[EM] ADD  DEFAULT (getutcdate()) FOR [ModDate]
GO
