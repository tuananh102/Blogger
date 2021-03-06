USE [Shopee]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/05/2022 04:01:17 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[Value] [money] NOT NULL,
	[IsMultiple] [bit] NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Coupons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](100) NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalesOrderId] [int] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SubTotal] [money] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[ShortDescription] [nvarchar](max) NOT NULL,
	[FullDescription] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[SalePrice] [money] NULL,
	[IsDeleted] [bit] NULL,
	[IsPublished] [bit] NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesOrders]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrders](
	[SalesOrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Total] [money] NOT NULL,
	[CouponId] [int] NOT NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_SalesOrders] PRIMARY KEY CLUSTERED 
(
	[SalesOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
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
	[Name] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Birthday] [datetime2](7) NULL,
	[Sex] [nvarchar](max) NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 17/05/2022 04:01:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220501121252_DbInit', N'6.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220501140451_AddFieldToUserTable', N'6.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220501153217_SetNullableToAppUserTable', N'6.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220502155529_EditUserFieldAndAuthorization', N'6.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220516175809_EditUserTable', N'6.0.3')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (1, N'Điện thoại', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (2, N'Laptop', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (3, N'PC - Lắp ráp', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (4, N'Tablet', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (5, N'Đồng hồ thông minh', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (6, N'Thiết bị thông minh', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (7, N'Phụ kiện', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (8, N'Tivi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (9, N'Âm thanh', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (10, N'Hàng cũ', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (11, N'Iphone', 1)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (12, N'Android', 1)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (13, N'Pin dự phòng', 7)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Images] ([Id], [Title], [ImageUrl], [ProductId]) VALUES (N'0d3a3ed0-49ac-47b3-983f-0bc22b07af74', N'_0005_laye223432206.jpg', N'https://localhost:7047/images/_0005_laye223432206.jpg', N'2512d5e3-00c6-4da8-af33-08da2e0d7ea7')
INSERT [dbo].[Images] ([Id], [Title], [ImageUrl], [ProductId]) VALUES (N'7f76fe32-eef2-41db-9f1b-7756734bbe23', N'layer_20223742481.jpg', N'https://localhost:7047/images/layer_20223742481.jpg', N'887af5ee-f916-4b7a-af34-08da2e0d7ea7')
INSERT [dbo].[Images] ([Id], [Title], [ImageUrl], [ProductId]) VALUES (N'657469cd-21bc-4317-8438-7b403e3f5706', N'oppo_reno6222927253.jpg', N'https://localhost:7047/images/oppo_reno6222927253.jpg', N'ea933abe-c5dc-4f6a-279a-08da36e3e5f7')
INSERT [dbo].[Images] ([Id], [Title], [ImageUrl], [ProductId]) VALUES (N'ae1c1547-cf24-4e31-a833-83ca802380b3', N'layer_20223432252.jpg', N'https://localhost:7047/images/layer_20223432252.jpg', N'2512d5e3-00c6-4da8-af33-08da2e0d7ea7')
INSERT [dbo].[Images] ([Id], [Title], [ImageUrl], [ProductId]) VALUES (N'67b8e9a2-03a0-4066-892e-9898add950dc', N'6376133287222927200.jpg', N'https://localhost:7047/images/6376133287222927200.jpg', N'ea933abe-c5dc-4f6a-279a-08da36e3e5f7')
INSERT [dbo].[Images] ([Id], [Title], [ImageUrl], [ProductId]) VALUES (N'a53a79c4-d9ab-40a2-bbb8-9e95f7634ea6', N'_0005_laye223742479.jpg', N'https://localhost:7047/images/_0005_laye223742479.jpg', N'887af5ee-f916-4b7a-af34-08da2e0d7ea7')
INSERT [dbo].[Images] ([Id], [Title], [ImageUrl], [ProductId]) VALUES (N'30c56f23-1e55-4d14-a008-d4a83c50390f', N'6376133287222927243.jpg', N'https://localhost:7047/images/6376133287222927243.jpg', N'ea933abe-c5dc-4f6a-279a-08da36e3e5f7')
INSERT [dbo].[Images] ([Id], [Title], [ImageUrl], [ProductId]) VALUES (N'2c3dcbf3-192f-4c89-b4f5-e62d21d6a5bd', N'layer_20222927248.jpg', N'https://localhost:7047/images/layer_20222927248.jpg', N'ea933abe-c5dc-4f6a-279a-08da36e3e5f7')
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (1, N'Apple')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (2, N'Samsung')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (3, N'Xiaomi')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (4, N'Redmi')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (5, N'Realme')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (6, N'Oppo')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (7, N'Nokia')
INSERT [dbo].[Manufacturers] ([Id], [Name]) VALUES (8, N'Huawei')
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([Id], [ProductId], [CategoryId]) VALUES (1, N'2512d5e3-00c6-4da8-af33-08da2e0d7ea7', 1)
INSERT [dbo].[ProductCategories] ([Id], [ProductId], [CategoryId]) VALUES (2, N'2512d5e3-00c6-4da8-af33-08da2e0d7ea7', 11)
INSERT [dbo].[ProductCategories] ([Id], [ProductId], [CategoryId]) VALUES (3, N'887af5ee-f916-4b7a-af34-08da2e0d7ea7', 1)
INSERT [dbo].[ProductCategories] ([Id], [ProductId], [CategoryId]) VALUES (4, N'887af5ee-f916-4b7a-af34-08da2e0d7ea7', 11)
INSERT [dbo].[ProductCategories] ([Id], [ProductId], [CategoryId]) VALUES (5, N'ea933abe-c5dc-4f6a-279a-08da36e3e5f7', 2)
INSERT [dbo].[ProductCategories] ([Id], [ProductId], [CategoryId]) VALUES (6, N'ea933abe-c5dc-4f6a-279a-08da36e3e5f7', 3)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [FullDescription], [Price], [SalePrice], [IsDeleted], [IsPublished], [StockQuantity], [ManufacturerId]) VALUES (N'2512d5e3-00c6-4da8-af33-08da2e0d7ea7', N'iPhone 13 Pro Max 128GB | Chính hãng VN/A', N'Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao
Không gian hiển thị sống động - Màn hình 6.7" Super Retina XDR độ sáng cao, sắc nét
Trải nghiệm điện ảnh đỉnh cao - Cụm 3 camera kép 12MP, hỗ trợ ổn định hình ảnh quang học
Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút', N'<p><strong>iPhone 13&nbsp;Pro Max</strong> chắc chắn sẽ là chiếc smartphone cao cấp được quan tâm nhiều nhất trong năm 2021. Dòng <a href="https://cellphones.com.vn/mobile/apple/iphone-13.html">iPhone 13 series</a>&nbsp;được ra mắt vào ngày 14 tháng 9 năm 2021 tại sự kiện "California Streaming" diễn ra trực tuyến tương tự năm ngoái cùng với 3 phiên bản khác là iPhone 13, 13 mini và 13 Pro. Vậy điện thoại 13 Pro Max giá bao nhiêu? Có gì nổi bật? Cùng tìm hiểu ngay nhé!</p><h2><strong>Đánh giá iPhone 13 Pro Max – Hiệu năng vô đối, camera cực đỉnh</strong></h2><p>iPhone 12 ra mắt cách đây chưa lâu, thì những tin đồn mới nhất về iPhone 13 Pro Max đã khiến bao tín đồ công nghệ ngóng chờ. Cụm camera được nâng cấp, màu sắc mới, đặc biệt là màn hình 120Hz với phần notch được làm nhỏ gọn hơn chính là những điểm làm cho&nbsp;thu hút mọi sự chú ý trong năm nay.</p><h3><strong>Thiết kế cạnh phẳng sang trọng, nhiều màu sắc nổi bật</strong></h3><p>Dòng iPhone 12 được Apple áp dụng ngôn ngữ thiết kế tương tự iPhone 12 năm ngoái với phần cạnh viền máy được dát phẳng sang trọng cùng bốn góc được làm bo cong nhẹ, đây có thể được xem là một thiết kế hoài cổ từ dòng iPhone 5 trước đó. Vì thế mà iPhone 13 Pro Max nói riêng, cũng như dòng <a href="https://cellphones.com.vn/iphone-13.html">điện thoại iPhone 13</a> nói chung, cũng sẽ đi theo ngôn ngữ thiết kế này.</p><p>Điểm thay đổi lớn trên 13 Pro Max có thể là phần nhô của cụm camera. Trong khi đó mặt trước của thiết bị được phủ một lớp Ceramic Shield, loại vật liệu cứng hơn bất kỳ loại kính điện thoại thông minh nào hiện có trên thị trường, giúp bảo vệ màn hình iPhone hiệu quả.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/IPHONE-13-PRO-MAX-1.jpg" alt="Thiết kế cạnh phẳng sang trọng, nhiều màu sắc nổi bật"></p><p>Xét về chất liệu, iPhone 13 Pro Max vẫn áp dụng chất liệu thép không gỉ như thế hệ trước đó. Mặt này cũng được phủ một lớp kính mờ giúp hạn chế bám bụi bẩn và vân tay. Ngoài ra, điện thoại cũng sẽ đảm bảo được khả năng chống bụi / nước chuẩn IP68.</p><p>Về màu sắc, iPhone 13 phiên bản Pro Max sẽ được ra mắt với nhiều tùy chọn màu sắc khác nhau. Trong đó gồm một số màu nổi bật như: vàng, bạc, xanh, đen,...</p><h3><strong>Màn hình với tai nhỏ nhỏ hơn, tốc độ làm tươi 120 Hz</strong></h3><p>Một trong những yếu tố khiến iPhone 13 Pro Max đáng mong chờ đó là thiết kế notch "tai thỏ" được thu gọn lại. Ngoài kích cỡ màn hình 6.7 inch với tấm nền Super Retina XDR OLED, máy sẽ có thiết kế notch được thu hẹp lại, giúp tăng tỷ lệ hiển thị trên màn hình điện thoại. Tất nhiên, những cảm biến quan trọng như TrueDepth, Face ID hoặc camera selfie đều sẽ giữ nguyên vị trí.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/IPHONE-13-PRO-MAX-2.jpg" alt="Màn hình notch thu nhỏ với tốc độ làm tươi 120 Hz"></p><p>Rất nhiều nguồn tin cho biết iPhone 13 Pro Max sẽ tăng cường trải nghiệm hình ảnh lên rất nhiều thông qua ProMotion - tích năng giúp đẩy tốc độ làm tươi màn ảnh lên 120 Hz. Đây cũng là chiếc iPhone đầu tiên có tốc độ làm tươi cao lên đến 120Hz, giúp hình ảnh chuyển động mượt mà hơn.</p><p>Ngoài ra, những tính năng bổ trợ khác như Dolby Vision, True-tone hoặc gam màu rộng chuẩn HDR10 vẫn sẽ được tích hợp vào iP 13 Pro Max.&nbsp;&nbsp;</p><h3><strong>Camera nâng cấp, chụp ảnh chất lượng, quay phim chuyên nghiệp</strong></h3><p>Như mọi chiếc iPhone mới khác, camera luôn là yếu tố được người dùng quan tâm nhất, và <strong>13 Pro Max</strong> sẽ không làm người dùng thất vọng.&nbsp;Giống với ngôn ngữ thiết kế cho thân máy, ngôn ngữ thiết kế cho camera thường không xảy ra trong thời gian ngắn. Đó là lý do chiếc điện thoại này vẫn sẽ có bộ camera 3 ống kính xếp xen kẽ thành một cụm vuông, đặt ở góc trên bên trái của lưng máy.&nbsp;&nbsp;</p><p>Thay đổi lớn về camera đầu tiên nằm ở cảm biến. Máy được trang bị camera góc siêu rộng cải tiến lớn với ống kính khẩu độ f/1.8 và len 6P. Camera siêu rộng hiện tại trên iPhone 12 Pro Max đang ở khẩu độ f/2.4 và len 5P, nên nâng cấp trên sẽ cải thiện ảnh chụp thiếu sáng rất nhiều.</p><p>Cảm biến LiDAR vẫn sẽ hiện diện trên iPhone 13 Pro Max. Tuy nhiên Apple dự kiến mang cảm biến này lên cả gia đình iPhone 13 và không dành riêng chỉ cho các máy Pro. Điều này được cho là nhằm mang đến trải nghiệm thực tế tăng cường (AR) tốt nhất cho tất cả người dùng.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/IPHONE-13-PRO-MAX-3.jpg" alt="Camera nâng cấp đáng kể về cảm biến lẫn tính năng chụp ảnh"></p><p>Camera selfie không thay đổi so với model tiền nhiệm. Có thể iPhone 13 Pro Max sẽ chụp ảnh selfie góc rộng hơn một chút, nhưng còn lại phần lớn ở camera selfie đều giữ nguyên như trước. Và những tính năng như selfie slow-mo, memoji và animoji cũng sẽ hiện diện như nhiều tin đồn cho biết.</p><h3><strong>Vi xử lý nâng cấp, dung lượng pin cải thiện</strong></h3><p>Giống với nhiều thế hệ iPhone mới, vi xử lý dự đoán sẽ được nâng cấp lên một bậc với hiệu năng cải thiện đáng kể cùng khả năng hỗ trợ mạng 5G. Trong trường hợp này, iPhone 13 Pro Max sẽ mang trong mình chip Apple A15 Bionic với nhiều nâng cấp khác nhau, cả về hiệu năng xử lý lẫn kết nối internet tốc độ cao.</p><p>Theo nhà sản xuất công bố, chip A15 thế hệ mới này cho hiệu năng đồ họa nhanh hơn tới 50% so với các thiết bị smartphone khác. Ngoài ra, khả năng kết nối 5G cũng được cải thiện đáng kể, cùng với đó là chế độ dữ liệu thông minh, giảm tốc độ khi không cần thiết để tiết kiệm điện năng.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/IPHONE-13-PRO-MAX-4.jpg" alt="Vi xử lý nâng cấp hiệu năng, loại bỏ hoàn toàn cổng kết nối"></p><p>iPhone 13 Pro Max cũng được trang bị viên pin dung lượng lớn hơn, cho thời gian sử dụng tăng lên khoảng 2,5 giờ so với thế hệ trước đó. Máy cũng sẽ được trang bị công nghệ sạc nhanh và sạc nhanh không dây.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/IPHONE-13-PRO-MAX-5.jpg" alt="viên pin dung lượng lớn"></p><h2><strong>Điện thoại iPhone 13 Pro Max giá bao nhiêu?</strong></h2><p>Với giá bán dao động từ 35 triệu ~ 50 triệu VNĐ (tùy theo RAM và bộ nhớ trong), Khách hàng có thể mua iPhone 13 Pro Max chính hãng VN/A tại CellphoneS để nhận ngay mức giá tốt nhất cùng nhiều ưu đãi hấp dẫn qua tổng đài tư vấn 1800.2097.</p><p>Dưới đây là mức giá tương ứng cho từng phiên bản bộ nhớ, các bạn có thể tham khảo:</p><p>- Phiên bản 128GB: Khoảng 29 - 30 triệu đồng</p><p>- Phiên bản 256GB: Khoảng 32 - 33 triệu đồng</p><p>- Phiên bản 512GB: Khoảng 39 - 40 triệu đồng</p><p>- Phiên bản 1TB: Khoảng 44 - 45 triệu đồng.</p>', 34990000.0000, 29800000.0000, NULL, 0, 50, 1)
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [FullDescription], [Price], [SalePrice], [IsDeleted], [IsPublished], [StockQuantity], [ManufacturerId]) VALUES (N'887af5ee-f916-4b7a-af34-08da2e0d7ea7', N'iPhone 11 64GB I Chính hãng VN/A', N'Màu sắc phù hợp cá tính - 6 màu sắc bắt mắt để lựa chọn
Hiệu năng mượt mà, ổn định - Chip A13, RAM 4GB
Bắt trọn khung hình - Camera kép hỗ trợ góc rộng, chế độ Night Mode
Yên tâm sử dụng - Kháng nước, kháng bụi IP68, kính cường lực Gorilla', N'<p>Apple luôn làm hài lòng tín đồ iFan với các dòng iPhone trong từng phân khúc giá. Đặc biệt, phiên bản&nbsp;<strong>iPhone 11</strong>&nbsp;vừa ra mắt nhưng đã chiếm lĩnh được thị trường smartphone trên toàn thế giới với giá cả phải chăng. Cùng tìm hiểu chi tiết rõ hơn qua bài viết sau đây để có quyết định có nên mua hay không nhé!</p><h2><strong>Tin tức mới nhất về điện thoại iPhone 11</strong></h2><p>(Cập nhật ngày 20/4/2022)</p><p>Đầu quý 2 năm 2022, thị trường công nghệ bắt đầu nhộn nhịp trở lại, các đại lý bán lẻ đặc biệt là CellphoneS tung ra nhiều chương trình ưu đãi giảm giá hấp dẫn. Trong đó không thể không nhắc đến chính là iPhone 11 giảm cực sốc so với thời điểm trước đó.</p><p>Cụ thể, giá iPhone 11 đã giảm về mức chỉ quanh 12 triệu đồng, khiến nhu cầu mua sắm tăng chóng mặt so với các tháng trước.&nbsp;Không những vậy, khách hàng còn nhận được ưu đãi hấp dẫn khi thu cũ lên đời tại CellphoneS, đồng thời còn được giảm giá thêm khi thanh toán qua ví Moca hay thẻ tín dụng VP Bank.&nbsp;</p><h2><strong>iPhone 11 được nâng cấp gì so với iPhone XR?</strong></h2><p>So với iPhone XR thì siêu phẩm Apple năm 2019 có nhiều nâng cấp đáng giá, trong đó nổi bật là con chip xử lý, bộ nhớ RAM, dung lượng pin, đặc biệt là camera trước và sau. Dưới đây là bảng so sánh thông số kỹ thuật của iPhone 11 và XR bạn có thể tham khảo:</p><figure class="table"><table><tbody><tr><td>&nbsp;</td><td><strong>iPhone 11</strong></td><td><strong>iPhone XR</strong></td></tr><tr><td><strong>Màn hình</strong></td><td>IPS LCD 6.1 inch</td><td>IPS LCD 6.1 inch</td></tr><tr><td><strong>Độ phân giải</strong></td><td>828 x 1792 pixel</td><td>828 x 1792 pixel</td></tr><tr><td><strong>Mật độ điểm ảnh</strong></td><td>326PPI</td><td>326PPI</td></tr><tr><td><strong>Tần số quét</strong></td><td>60Hz</td><td>60Hz</td></tr><tr><td><strong>Chip xử lý</strong></td><td><strong>A13 Bionic</strong></td><td>A12 Bionic</td></tr><tr><td><strong>Dung lượng RAM</strong></td><td><strong>4GB</strong></td><td>3GB</td></tr><tr><td><strong>Bộ nhớ trong</strong></td><td>64GB, 128GB, 256GB</td><td>64GB, 128GB, 256GB</td></tr><tr><td><strong>Dung lượng pin</strong></td><td><strong>3110 mAh</strong></td><td>2942 mAh</td></tr><tr><td><strong>Camera trước</strong></td><td><strong>12MP</strong></td><td>7MP</td></tr><tr><td><strong>Camera sau</strong></td><td><strong>12MP + 12MP</strong></td><td>12MP</td></tr><tr><td><strong>Màu sắc</strong></td><td>6 màu</td><td>6 màu</td></tr></tbody></table></figure><h2><strong>Đánh giá iPhone 11 - Camera nâng cấp, màu sắc trẻ trung</strong><br>&nbsp;</h2><p>Điện thoại iPhone 11 tuy sở hữu mức giá phải chăng nhưng lại được trang bị cấu hình khủng, camera ấn tượng đi kèm những tính năng hiện đại. Sau đây hãy cùng CellphoneS đánh giá chi tiết sản phẩm trước khi đưa ra quyết định có nên mua hay không nhé!</p><h3><strong>Thiết kế sang trọng, kế thừa iPhone XR</strong></h3><p>Cụm camera phía sau đã được sắp xếp lại giống với Huawei Mate 20 Pro. Màn hình điện thoại iPhone 11 sở hữu notch rộng dài như các phiên bản tiền nhiệm và giữ nguyên thiết kế như iPhone XR. Notch tích hợp Face ID, loa âm thanh và camera selfie.</p><p>Tấm nền IPS LCD không có cải tiến về độ sáng và tương phản. Tấm nền được bao bọc bởi lớp kính Gorilla Glass cao cấp, cạnh viền có góc độ cong khá nhỏ. Điện thoại trọng lượng nhẹ, dễ dàng cầm nắm chỉ với 194 gram. Kích thước chi tiết lần lượt là 5.94H x 2.98W x 0.33 D (inch).</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-anh-3.jpg" alt="Đánh giá thiết kế iPhone 11"></p><h3><strong>Màn hình 6.1 inch, công nghệ màn hình HD Retina lỏng</strong></h3><p>Apple ứng dụng công nghệ màn hình HD Retina lỏng cùng màn hình cảm ứng đa điểm LCD kích thước toàn màn hình là 6.1 inch với 326 ppi cho iPhone 11. Màn hình có độ phân giải thực tế là 828x1792 pixel vừa đủ dùng. Bên cạnh đó, công nghệ True Wireless được tích hợp trong khi chuẩn tỉ lệ tương phản video HDR chỉ được hiển thị trên màn hình Oled.</p><p>Độ trễ màn hình gần như bằng 0, tốc độ làm mới màn hình nằm ở mức 60 Hz. Độ chính xác màu đạt đến mức tối đa, điểm DeltaE trung bình đạt 1.1, độ lệch tối đa 2.4 RGB. Ngay cả khi độ sáng giảm xuống mức 2.3 nit độ chính xác này vẫn được giữ nguyên.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-anh-11.jpg" alt="Đánh giá màn hình iPhone 11"></p><h3><strong>Chipset A13 mạnh mẽ, hiệu năng vượt trội</strong></h3><p>iPhone 11 sử dụng Chipset Apple A13 Bionic cùng Ram 4GB. Con chip này được đánh giá là tiết kiệm điện và chạy nhanh hơn so với thế hệ A12. Với bộ xử lý 6 nhân 2x2.65 GHz Lightning và CPU thunder 4x1.8 GHz. Neural Engine thế hệ 3 có 8 nhân phụ trách tính năng xử lý hình ảnh như Night Mode và Deep Fusion.<br>H3: Hệ điều hành</p><p>Hệ điều hành iOS 13 được sử dụng cho iPhone 11, nếu muốn cài đặt lên các phiên bản cao hơn, bạn cần phải update hệ thống. Tính năng FaceID được ứng dụng gia tăng độ bảo mật của điện thoại. Tính năng 3D Touch đã được thay thế bằng Haptic Touch. Những phiên bản về sau có thể sẽ ứng dụng Haptic Touch vào.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-anh-13.jpg" alt="Đánh giá cấu hình iPhone 11"></p><h3><strong>Camera sau ấn tượng, công nghệ chống rung quang học</strong></h3><p>iPhone 11 có tổng cộng 2 camera sau: 2 camera sau và 1 đèn flash. Camera chính có độ phân giải 12 MP được tích hợp công nghệ chống rung quang học OIS, 1 camera góc rộng 12 MP.</p><p>Camera chính với tiêu cự 28mm, khẩu độ là f/1.8, có Dual Pixel AF, chống rung quang học và chế độ Night Mode có sẵn trên camera. Camera góc rộng 13mm không có khả năng lấy nét, không có chống rung quang học.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-anh-2.jpg" alt="Đánh giá camera sau iPhone 11"></p><p>Chất lượng ảnh độ noise thấp, chi tiết sắc nét với dải màu động cực kỳ ấn tượng. Vì màu sắc chân thực, rõ nét nên không tránh khỏi tình trạng nhạt nhòa, thiếu sức sống. Camera góc rộng hỗ trợ giúp ảnh trở nên chi tiết, màu sắc, độ tương phản và giải màu động thì tương phản với camera chính.</p><p>Khi chụp trong môi trường thiếu sáng, ban đêm thì chế độ chụp đêm Night Mode là cứu tinh trong lúc này. Chất lượng ảnh nhiều chi tiết, rõ nét, đủ thấy rõ, ấn tương là không bị mờ nhòe. Trong trường hợp chụp chân dung, các hiệu ứng ánh sáng khác nhau mở rộng cho bạn sự lựa chọn. Với chip xử lý 13, việc tách chủ thể và phông nền trở nên đơn giản hơn bao giờ hết.</p><h3><strong>Camera selfie chân thực với dải màu rộng</strong></h3><p>Camera selfie iPhone 11 có độ phân giải là 12MP, tiêu cự 22mm, f/2.2. Tính năng smart HDR giúp ảnh chi tiết, chân thật, sắc nét hơn rất nhiều với dải màu rộng. Với nhu cầu “tự sướng” bình thường, bạn đã có thể bắt trọn những khoảnh khắc vui vẻ bên cạnh bạn bè, người thân.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-anh-10.jpg" alt="Đánh giá camera trước iPhone 11"></p><h3><strong>Pin trâu, tương thích sạc không dây Qi</strong></h3><p>So với iPhone XR, iPhone 11 sở hữu pin dung lượng lên đến 3110 mAh đủ cho bạn thực hiện những tác vụ thông thường trong thời gian dài. Bạn có thể xem video thoải mái lên đến 17 giờ, nghe nhạc phát lại lên đến 65 giờ, phát lại video trực tuyến đến 10 giờ.</p><p>Điện thoại hỗ trợ sạc không dây tương thích Qi, trong vòng 30 phút bạn có thể sạc được khoảng 50% pin với bộ sạc 20 W trở lên. Ngoài ra, bạn cũng có thể sạc qua USB vào hệ thống máy tính hoặc adapter.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-anh-9.jpg" alt="Đánh giá pin iPhone 11"></p><h3><strong>Công nghệ nhận diện TrueDepth, chống nước chuẩn IP68</strong></h3><p>iPhone 11 sở hữu công nghệ nhận diện khuôn mặt TrueDepth. Ngoài ra, khi thanh toán tại các cửa hàng, ứng dụng khác nhau hay trên trình duyệt web, bạn hoàn toàn có thể thanh toán bằng Face ID.</p><p>Bên cạnh đó, về khả năng chống nước và chống bụi, smartphone đến từ nhà Apple đạt xếp hạng IP68 theo chuẩ IEC 60529, tức là chịu nước ở độ sâu tối đa 2 mét trong vòng 30 phút.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-anh-6.jpg" alt="Các tính năng khác của iPhone 11"></p><h2><strong>Điện thoại iPhone 11 có mấy màu?</strong></h2><p>Phiên bản của dòng sản phẩm <strong>iPhone 11</strong> thường bao gồm 6 tùy chọn màu sắc chủ yếu: Đen, xanh mint, vàng, tím pastel, đỏ và trắng tha hồ cho bạn lựa chọn phù hợp với phong cách của bản thân.</p><h3><strong>Màu tím pastel</strong></h3><p>iPhone đã bắt kịp trend màu sắc tím nhẹ nhàng, mộng mơ, độc đáo nhưng không kém phần sang trọng, đem lại sự tươi mới cho tín đồ nhà Táo khuyết. Theo thống kê năm 2019, khi vừa mới ra mắt, phiên bản này đã được đặt mua và cháy hàng rất nhanh trên toàn thế giới. Chính màu sắc nhã nhặn, thanh lịch mà nó đã chiễm trọn trái tim của người dùng.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-mau-tim.jpg" alt="iPhone 11 màu tím pastel"></p><h3><strong>Màu xanh mint (Xanh ngọc)</strong></h3><p>Mang đến cảm giác tươi mát, đầy sảng khoái, pha chút dịu dàng, phiên bản iPhone 11 màu xanh mint thích hợp cho những người yêu thích sự đổi mới, nhẹ nhàng và có chút lãng mạn. Màu sắc sang trọng kết hợp với thiết kế tinh tế khiến chiếc smartphone này trở nên sang trọng hơn bao giờ hết.</p><p><img src="https://cdn.cellphones.com.vn/media/wysiwyg/mobile/apple/iphone-11-anh-1.jpg" alt="iPhone 11 màu xanh mint"></p><h3><strong>Màu trắng (White)</strong></h3><p>Chưa dừng lại ở 2 màu nhẹ nhàng, tươi mới trên, iPhone tiếp tục làm chao đảo người dùng khó tính nhất với màu trắng tinh khôi. Vẻ đẹp thời thượng của smartphone cùng màu sắc thanh thuần rất hợp cho những bạn theo chủ nghĩa tối giản hoặc thích màu đơn giản như trắng hoặc đen. Bạn có thể thoải mái lựa chọn những phụ kiện ốp lưng trong suốt, phụ kiện hoặc sticker đính kèm lên iPhone.</p>', 18000000.0000, 11800000.0000, NULL, 0, 50, 1)
INSERT [dbo].[Products] ([Id], [Name], [ShortDescription], [FullDescription], [Price], [SalePrice], [IsDeleted], [IsPublished], [StockQuantity], [ManufacturerId]) VALUES (N'ea933abe-c5dc-4f6a-279a-08da36e3e5f7', N'iPhone 13 Pro Max 128GB | Chính hãng VN/A', N'sdsd', N'<p>sdfsd</p>', 15000000.0000, 120000.0000, NULL, 0, 1, 2)
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'026f51c4-a0da-4bd1-a536-19731490d0f7', N'Admin', N'ADMIN', N'cbe39d24-0b2a-4b63-b821-918bafeba0e9')
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'220af869-797f-405a-b813-dc52e0209d6e', N'User', N'USER', N'7d3c6f0a-7b0a-44a7-9e40-63250c21cc6c')
GO
INSERT [dbo].[UserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'108493005291746826443', N'Google', N'a38a1052-cc5b-431f-a7c3-ad3f4a5cbbde')
INSERT [dbo].[UserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'109006872294547722499', N'Google', N'cc0b4989-d375-4adc-9408-05c051465a48')
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'0c891839-d377-4e91-8c9c-5ff8a4dc7b1d', N'026f51c4-a0da-4bd1-a536-19731490d0f7')
INSERT [dbo].[UserRoles] ([UserId], [RoleId]) VALUES (N'83ef88ad-3b04-48e7-b39f-29bce4138a12', N'026f51c4-a0da-4bd1-a536-19731490d0f7')
GO
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Image], [Birthday], [Sex], [IsLocked]) VALUES (N'0c891839-d377-4e91-8c9c-5ff8a4dc7b1d', N'user@example.com', N'USER@EXAMPLE.COM', N'user@example.com', N'USER@EXAMPLE.COM', 0, N'AQAAAAEAACcQAAAAEOBW0rphNJ+bsHfLWOtW+E3nujbGRpcwXj4ECZj0BeZiUZGyGqe/RZtcK7nyhdainA==', N'V2ZRJGLAT44HEF4VAVKLMLOKAOGXV7JD', N'42366bb1-e7f0-4dbd-a192-5b84e7b3ae01', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Image], [Birthday], [Sex], [IsLocked]) VALUES (N'83ef88ad-3b04-48e7-b39f-29bce4138a12', N'admin@hitu.com', N'ADMIN@HITU.COM', N'admin@hitu.com', N'ADMIN@HITU.COM', 0, N'AQAAAAEAACcQAAAAEMbWrO4xIQgUVeflZPCKw9jPJQr4ImtTLbH+1ciRNZC+FKQ3Kd++xd4bfRRH78QEBQ==', N'Y3AQSGDX5RWYV63OLTF3WCAFVT5KRRJB', N'7a5a44eb-bb4e-4b6c-8eac-01977a4d079f', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Image], [Birthday], [Sex], [IsLocked]) VALUES (N'a38a1052-cc5b-431f-a7c3-ad3f4a5cbbde', N'trannhu.tuananh.96@gmail.com', N'TRANNHU.TUANANH.96@GMAIL.COM', N'trannhu.tuananh.96@gmail.com', N'TRANNHU.TUANANH.96@GMAIL.COM', 1, NULL, N'ID2KIEH23VMPA4MTFB2O3VIXC3642C5N', N'584e11f6-9824-4d6d-8b94-6a83e68e47cd', NULL, 0, 0, NULL, 1, 0, NULL, N'https://lh3.googleusercontent.com/a-/AOh14GiJbdMAFgthMO2G2eF5t0iznzFWEZA6y1Gkb9ooTg=s96-c', NULL, NULL, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Name], [Image], [Birthday], [Sex], [IsLocked]) VALUES (N'cc0b4989-d375-4adc-9408-05c051465a48', N'tuananhthanhthu2806@gmail.com', N'TUANANHTHANHTHU2806@GMAIL.COM', N'tuananhthanhthu2806@gmail.com', N'TUANANHTHANHTHU2806@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEGwsM/ZY+92StbfXcxf8bsLRmmXCzXi0c7pBxWG7JMcezTS7LWbIFxdWRlLcZ8xqZQ==', N'FTW3WH4MVTNS4JKVPHYCYTEOLBNAH53S', N'd02ba3eb-9982-47ef-9cda-36ad74597180', N'0962183008', 0, 0, NULL, 1, 0, N'Trần Như Tuấn Anh', N'https://localhost:7047/images/beauty_202220858417.jpg', CAST(N'2022-04-30T00:00:00.0000000' AS DateTime2), N'male', NULL)
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_SalesOrders_SalesOrderId] FOREIGN KEY([SalesOrderId])
REFERENCES [dbo].[SalesOrders] ([SalesOrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_SalesOrders_SalesOrderId]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Manufacturers_ManufacturerId] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Manufacturers_ManufacturerId]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Coupons_CouponId] FOREIGN KEY([CouponId])
REFERENCES [dbo].[Coupons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Coupons_CouponId]
GO
ALTER TABLE [dbo].[SalesOrders]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SalesOrders] CHECK CONSTRAINT [FK_SalesOrders_Users_UserId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_Users_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users_UserId]
GO
