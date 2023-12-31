USE [ASM]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Picture] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[BookId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 12/16/2023 12:02:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231205135117_intialCreate', N'6.0.23')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'AD', N'ADMIN', N'ADMIN', N'ADMIN')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'CU', N'CUS', N'CUS', N'CUS')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'423ad4e3-851b-4c1c-bb8b-359b6f31aa81', N'AD')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'38d76fa1-2f72-4b5f-b824-2402078031e5', N'CU')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b30d0579-ce00-429a-9616-75ed8ebe4a9e', N'CU')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd696a48d-c07a-4e1b-a835-288871283f11', N'CU')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'38d76fa1-2f72-4b5f-b824-2402078031e5', N'cus3@gmail.com', N'CUS3@GMAIL.COM', N'cus3@gmail.com', N'CUS3@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEPFiqBmM80If/ISPVId3VcvhJzUFCsAt0IFy7YNN3fZw1QVlSn5K/aUT2ehNwhZz6Q==', N'TTRSPBVOV55ROWZOSIZZ54RXMQUXPNMC', N'd845d3c5-6798-43ce-bbc2-05c0dfd1478c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'423ad4e3-851b-4c1c-bb8b-359b6f31aa81', N'admin@gmail.com', N'ADMIN@GMAIL.COM', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEA6zWJuB+8nUJ9n+t6zWXI4ioBBWAbxBhs5QeVFnESZcbPiW8ObKX/Xy0IJwFTshSA==', N'AP76CI2BKTXALDFJEBTDL3YLJKBVPB6P', N'ef36a620-a096-4a1f-983a-798f271af146', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'b30d0579-ce00-429a-9616-75ed8ebe4a9e', N'cus1@gmail.com', N'CUS1@GMAIL.COM', N'cus1@gmail.com', N'CUS1@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEFnVw4lIJjCKuk12ZDVf1Qh6+CIFS5SHE3uiTgID9hvF06wWpMxh+M2iMZkg5HSg5Q==', N'S74HPX5S4SLKHDUQPEOJHA3CXAIR443E', N'03074fcc-823d-40f3-b50a-19a308e7bc31', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd696a48d-c07a-4e1b-a835-288871283f11', N'cus2@gmail.com', N'CUS2@GMAIL.COM', N'cus2@gmail.com', N'CUS2@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEOqhqUZriKIt4KjL6PzKzaA7inM3QRq+jjR6qylpOJqOvhEV1oOnebVWtWAORkoXgQ==', N'3FBW57NUDXHOXXNVPQTBDWAUSHTSM5V7', N'6f34bab2-8ac9-4fbe-a24b-af87aaa2bdc8', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Title], [Detail], [Price], [Picture], [CategoryId]) VALUES (3, N'The Heaven & Earth Grocery Store', N'"A murder mystery locked inside a Great American Novel . . . Charming, smart, heart-blistering, and heart-healing." --Danez Smith, The New York Times Book Review "We all need--we all deserve--this vibrant, love-affirming novel that bounds over any difference that claims to separate us." --Ron Charles, The Washington Post From James McBride, author of the bestselling Oprah''s Book Club pick Deacon King Kong and the National Book Award-winning The Good Lord Bird, a novel about small-town secrets and the people who keep them In 1972, when workers in Pottstown, Pennsylvania, were digging the foundations for a new development, the last thing they expected to find was a skeleton at the bottom of a well. Who the skeleton was and how it got there were two of the long-held secrets kept by the residents of Chicken Hill, the dilapidated neighborhood where immigrant Jews and African Americans lived side by side and shared ambitions and sorrows. Chicken Hill was where Moshe and Chona Ludlow lived when Moshe integrated his theater and where Chona ran the Heaven & Earth Grocery Store. When the state came looking for a deaf boy to institutionalize him, it was Chona and Nate Timblin, the Black janitor at Moshe''s theater and the unofficial leader of the Black community on Chicken Hill, who worked together to keep the boy safe. As these characters'' stories overlap and deepen, it becomes clear how much the people who live on the margins of white, Christian America struggle and what they must do to survive. When the truth is finally revealed about what happened on Chicken Hill and the part the town''s white establishment played in it, McBride shows us that even in dark times, it is love and community--heaven and earth--that sustain us. Bringing his masterly storytelling skills and his deep faith in humanity to The Heaven & Earth Grocery Store, James McBride has written a novel as compassionate as Deacon King Kong and as inventive as The Good Lord Bird.', CAST(26.00 AS Decimal(18, 2)), N'1bfd2c8e-1c16-46c3-ba1b-46f59b10762e_9780593422946.webp', 4)
INSERT [dbo].[Book] ([Id], [Title], [Detail], [Price], [Picture], [CategoryId]) VALUES (4, N'Flores and Miss Paula', N'A wry, tender novel about a Peruvian immigrant mother and a millennial daughter who have one final chance to find common ground  Thirtysomething Flores and her mother, Paula, still live in the same Brooklyn apartment, but that may be the only thing they have in common. It''s been nearly three years since they lost beloved husband and father Martín, who had always been the bridge between them. One day, cleaning beneath his urn, Flores discovers a note written in her mother''s handwriting: Perdóname si te falle. Recuerda que siempre te quise. ("Forgive me if I failed you. Remember that I always loved you.") But what would Paula need forgiveness for?  Now newfound doubts and old memories come flooding in, complicating each woman''s efforts to carve out a good life for herself--and to support the other in the same. Paula thinks Flores should spend her evenings meeting a future husband, not crunching numbers for a floundering aquarium startup. Flores wishes Paula would ask for a raise at her DollaBills retail job, or at least find a best friend who isn''t a married man.  When Flores and Paula learn they will be forced to move, they must finally confront their complicated past--and decide whether they share the same dreams for the future. Spirited and warm-hearted, Melissa Rivero''s new novel showcases the complexities of the mother-daughter bond with fresh insight and empathy.', CAST(27.00 AS Decimal(18, 2)), N'5a267dd3-be90-42e6-bad1-886b13513066_9780063272491.webp', 4)
INSERT [dbo].[Book] ([Id], [Title], [Detail], [Price], [Picture], [CategoryId]) VALUES (5, N'Holly', N'In King''s new novel, Holly is on her own, and up against a pair of unimaginably depraved and brilliantly disguised adversaries. When Penny Dahl calls the Finders Keepers detective agency hoping for help locating her missing daughter, Holly is reluctant to accept the case. Her partner, Pete, has Covid. Her (very complicated) mother has just died. And Holly is meant to be on leave. But something in Penny Dahl''s desperate voice makes it impossible for Holly to turn her down. Mere blocks from where Bonnie Dahl disappeared live Professors Rodney and Emily Harris. They are the picture of bourgeois respectability: married octogenarians, devoted to each other, and semi-retired lifelong academics. But they are harboring an unholy secret in the basement of their well-kept, book-lined home, one that may be related to Bonnie''s disappearance. And it will prove nearly impossible to discover what they are up to: they are savvy, they are patient, and they are ruthless. Holly must summon all her formidable talents to outthink and outmaneuver the shockingly twisted professors in this chilling new masterwork from Stephen King. "I could never let Holly Gibney go. She was supposed to be a walk-on character in Mr. Mercedes and she just kind of stole the book and stole my heart. Holly is all her." --STEPHEN KING', CAST(28.00 AS Decimal(18, 2)), N'1d245b82-9787-46ab-999b-1ed4c85ff9c2_9781668016138.webp', 5)
INSERT [dbo].[Book] ([Id], [Title], [Detail], [Price], [Picture], [CategoryId]) VALUES (6, N'Pride and Prejudice', N'Pride and Prejudice By Jane Austen follows Elizabeth Bennet and her four sisters, who must marry well in order to ensure their financial security.  Wealthy bachelors Mr. Bingley and Mr. Darcy arrive in Netherfield, much to the excitement of the Bennet daughters. While Bingley is charming and affable, Darcy is cold and prideful, and Elizabeth immediately dislikes him. When Elizabeth unexpectedly encounters Mr. Darcy again, and he proposes marriage to her. Shocked and offended by his manners and behavior, Elizabeth rejects him.  Darcy writes Elizabeth a letter explaining his behavior, and she comes to realize she has severely misjudged his character..', CAST(23.00 AS Decimal(18, 2)), N'1f8cfd4e-57d8-4a1b-bead-7a23e17e58d6_9781912714032.webp', 6)
INSERT [dbo].[Book] ([Id], [Title], [Detail], [Price], [Picture], [CategoryId]) VALUES (7, N'Haruki Murakami', N'Haruki Murakami Manga Stories 1 is the first of three volumes, which will present a total of 9 short stories from Murakami''s bestselling collections. With their trademark mix of realism and fantasy, centering around Murakami''s characteristic themes of loss, remorse and confusion, the four stories in this volume are: "Super-Frog Saves Tokyo" A few days after an earthquake, Katagiri discovers a giant frog in this home. The frog promises to save Tokyo from another earthquake, but Katagiri must help him. Is this real, or is Katagiri dreaming? "[This story has] such an engaging mix of realism and fantasy that it takes a while for you to realize what a sad undertow the story has and how much it says about Katagiri''s solitary life, his feelings of powerlessness and his dread of another quake." --The New York Times', CAST(19.00 AS Decimal(18, 2)), N'218585fa-44a2-4a93-b63f-69150ebd2d78_9784805317648.webp', 6)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [BookId]) VALUES (4, N'Literary', NULL)
INSERT [dbo].[Category] ([Id], [Name], [BookId]) VALUES (5, N'Horror', NULL)
INSERT [dbo].[Category] ([Id], [Name], [BookId]) VALUES (6, N'Manga', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (1, N'423ad4e3-851b-4c1c-bb8b-359b6f31aa81', CAST(N'2023-12-05T21:46:14.3095620' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (2, N'423ad4e3-851b-4c1c-bb8b-359b6f31aa81', CAST(N'2023-12-05T21:50:25.3176305' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (3, N'423ad4e3-851b-4c1c-bb8b-359b6f31aa81', CAST(N'2023-12-05T21:51:42.9413649' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (4, N'38d76fa1-2f72-4b5f-b824-2402078031e5', CAST(N'2023-12-06T12:50:30.9259613' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (5, N'b30d0579-ce00-429a-9616-75ed8ebe4a9e', CAST(N'2023-12-06T13:21:34.7695326' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (6, N'd696a48d-c07a-4e1b-a835-288871283f11', CAST(N'2023-12-06T13:24:04.6323060' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (7, N'b30d0579-ce00-429a-9616-75ed8ebe4a9e', CAST(N'2023-12-07T13:01:07.0062124' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (8, N'b30d0579-ce00-429a-9616-75ed8ebe4a9e', CAST(N'2023-12-07T13:01:20.3126468' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (9, N'b30d0579-ce00-429a-9616-75ed8ebe4a9e', CAST(N'2023-12-14T13:17:35.1491739' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (10, N'b30d0579-ce00-429a-9616-75ed8ebe4a9e', CAST(N'2023-12-16T11:14:24.9999991' AS DateTime2))
INSERT [dbo].[Order] ([Id], [UserId], [OrderDate]) VALUES (11, N'b30d0579-ce00-429a-9616-75ed8ebe4a9e', CAST(N'2023-12-16T11:21:13.1561372' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([Id], [BookId], [Quantity], [Price], [OrderId]) VALUES (11, 3, 3, CAST(26.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[OrderItem] ([Id], [BookId], [Quantity], [Price], [OrderId]) VALUES (12, 4, 2, CAST(27.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[OrderItem] ([Id], [BookId], [Quantity], [Price], [OrderId]) VALUES (13, 5, 3, CAST(28.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[OrderItem] ([Id], [BookId], [Quantity], [Price], [OrderId]) VALUES (14, 3, 1, CAST(26.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[OrderItem] ([Id], [BookId], [Quantity], [Price], [OrderId]) VALUES (15, 4, 2, CAST(27.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[OrderItem] ([Id], [BookId], [Quantity], [Price], [OrderId]) VALUES (16, 5, 3, CAST(28.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[OrderItem] ([Id], [BookId], [Quantity], [Price], [OrderId]) VALUES (17, 5, 1, CAST(28.00 AS Decimal(18, 2)), 11)
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Book_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Book_BookId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Book_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Book_BookId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order_OrderId]
GO
