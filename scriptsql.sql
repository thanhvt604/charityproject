USE [master]
GO
/****** Object:  Database [final_project]    Script Date: 14/07/2022 10:58:36 CH ******/
CREATE DATABASE [final_project]
 

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [final_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [final_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [final_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [final_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [final_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [final_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [final_project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [final_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [final_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [final_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [final_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [final_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [final_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [final_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [final_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [final_project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [final_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [final_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [final_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [final_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [final_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [final_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [final_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [final_project] SET RECOVERY FULL 
GO
ALTER DATABASE [final_project] SET  MULTI_USER 
GO
ALTER DATABASE [final_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [final_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [final_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [final_project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [final_project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [final_project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'final_project', N'ON'
GO
ALTER DATABASE [final_project] SET QUERY_STORE = OFF
GO
USE [final_project]


GO
/****** Object:  Table [dbo].[Account]    Script Date: 14/07/2022 10:58:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_name] [nvarchar](50) NOT NULL,
	[User_mail] [nvarchar](50) NULL,
	[User_pass] [nvarchar](100) NOT NULL,
	[User_role] [nvarchar](10) NOT NULL,
	[Date_join] [date] NOT NULL,
	[User_status] [nvarchar](20) NOT NULL,
	[User_phone] [nvarchar](10) NOT NULL,
	[User_image] [nvarchar](100) NULL,
	[History_status] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 14/07/2022 10:58:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[Campaign_id] [nvarchar](4) NOT NULL,
	[Campaign_name] [nvarchar](500) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Start_Date] [date] NOT NULL,
	[End_Date] [date] NOT NULL,
	[Target] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Donated] [int] NOT NULL,
	[Donations] [int] NOT NULL,
	[Image] [nvarchar](100) NULL,
	[Content] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[Campaign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donate]    Script Date: 14/07/2022 10:58:36 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donate](
	[User_ID] [int] NOT NULL,
	[Campaign_id] [nvarchar](4) NOT NULL,
	[Amount] [int] NOT NULL,
	[Datetime_Donate] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (13, N'Nguyễn Minh Thành', N'thanhnguyen17111@gmail.com', N'ED23D361722D2FA621C45396808EC082', N'Admin', CAST(N'2022-07-12' AS Date), N'Pending', N'0399114547', N'd55efcc94b469ad21115c1d7fb9f0631.jpg', N'OFF')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (14, N'Nguyễn Văn Trung', N'beduy@gmail.com', N'E06D3788817B1125875460C78A11EB41', N'Admin', CAST(N'2022-05-29' AS Date), N'Active', N'0966114345', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (15, N'Nguyễn Hữu Thành', N'trungvannguyen@gmail.com', N'E06D3788817B1125875460C78A11EB41', N'Admin', CAST(N'2022-05-19' AS Date), N'Active', N'0955158714', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (16, N'Quế Duy Vỹ', N'duyvx@gmail.com', N'sdadasd', N'Admin', CAST(N'2022-05-30' AS Date), N'Active', N'03665454', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (17, N'Trần Duy Đông', N'dongtranxx@gmail.com', N'CD7B69C940F9EB2997AC77FBC334A0BD', N'User', CAST(N'2022-07-12' AS Date), N'NoActive', N'0355484778', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (18, N'Vũ Thị Phượng', N'phuonga7@gmail.com', N'FBE6174CD6CA384F77DA726D4BA56C2E', N'User', CAST(N'2022-05-29' AS Date), N'NoActive', N'0841461561', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (19, N'Lê Quang Tuấn', N'quangledd@gmail.com', N'7E46C059EFE38D5B1C038A97F5AB343E', N'User', CAST(N'2022-05-29' AS Date), N'Active', N'0658474747', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (20, N'Vũ Thế Thành', N'thanhthe@gmail.com', N'B1D893ED05909F4C75140B108DF2B6FE', N'User', CAST(N'2022-05-29' AS Date), N'Banned', N'0988441444', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (21, N'Dương Thiên Đông', N'dongdong@gmail.com', N'83C3D30118C8734D8858EF5DDB1B7953', N'User', CAST(N'2022-05-29' AS Date), N'Active', N'0351561616', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (22, N'Lê Quý Ly', N'lycite@gmail.com', N'5ED04C5701756FF403715CC3FB1A5B27', N'User', CAST(N'2022-07-12' AS Date), N'Active', N'0941471717', N'', N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (23, N'Phan Tú Quỳnh', N'tuquynh1812@gmail.com', N'0CD8CA434962D9DAA4B1994BE34BCD6B', N'User', CAST(N'2022-05-29' AS Date), N'Active', N'0815161615', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (24, N'Tường Vy', N'Vype@gmail.com', N'9E2BBE54987618F32E93D81B7B9F8425', N'User', CAST(N'2022-05-29' AS Date), N'NoActive', N'0911446515', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (25, N'Trần Tuấn Quang', N'quangle@gmail.com', N'3B4FF87CA60F655DBFE15E3ABCDB298E', N'User', CAST(N'2022-05-29' AS Date), N'NoActive', N'0369984147', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (26, N'Lê Minh Trần', N'tranle@gmail.com', N'F414F4E07EF21C2DD2A5CFB28B1DC657', N'User', CAST(N'2022-05-29' AS Date), N'Active', N'0355887985', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (27, N'Vũ Quế Anh', N'ahyrt@gmail.com', N'779B8A81F180C48E004217341D370D58', N'User', CAST(N'2022-05-29' AS Date), N'Active', N'0366998412', NULL, N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (64, N'Vân', N'soohee@gmail.com', N'2267709FD6E17B59132B51FFA26FC829', N'Admin', CAST(N'2022-07-12' AS Date), N'Pending', N'58741356', N'', N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (65, N'VVVV', N'VV@gmail.com', N'979F9AD1313AF4FA0C64E449BB6962E1', N'User', CAST(N'2022-07-12' AS Date), N'Pending', N'0399114540', N'', N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (66, N'trung trần', N'trungtran@gmail.com', N'066A7C1289AEFD55C8E108070C0B28CD', N'User', CAST(N'2022-07-12' AS Date), N'Active', N'0788941461', N'boy.jpg', N'ON')
INSERT [dbo].[Account] ([User_ID], [User_name], [User_mail], [User_pass], [User_role], [Date_join], [User_status], [User_phone], [User_image], [History_status]) VALUES (69, N'Nguyễn Văn Trung', N'chobancainha@gmail.com', N'7D47CCCE660319DF434F124CD4E700EE', N'Admin', CAST(N'2022-07-12' AS Date), N'Pending', N'0399114545', N'Screenshot (11).png', N'ON')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C01', N'Cùng chung tay quyên góp cho dự án Chiếc xe đa năng lần 2 hỗ trợ vận chuyển người và thực phẩm cho mái ấm, quán trọ.', N'Đã hoàn thành', CAST(N'2022-03-30' AS Date), CAST(N'2023-03-02' AS Date), 120000000, N'       Cùng nhau chung tay đóng góp để có thể giúp đỡ các mái ấm và quán trọ Trăng Khuyết có thêm một chiếc xe đa năng hỗ trợ y tế, vận chuyển các cụ, các em nhỏ và có thể vận chuyển thực phẩm.', 153099000, 10, N'momo-upload-api-220330105417-637842344573167217.png', N'	<strong>Chiếc xe đa năng - và hành trình cứu người còn dở dang </strong>
</p>

<p>
	Đối với một tổ chức từ thiện, việc có một chiếc xe đa năng để cứu trợ khẩn cấp cho những cụ già neo đơn, để chuyên chở lương thực là điều vô cùng cấp thiết. Việc mua xe dường như đã gần hoàn tất, nhưng những phát sinh bất ngờ bất buộc Trăng Khuyết phải đưa ra những chọn lựa mua xe trước hay cứu người trước. 
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105506-637842345069138820.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105519-637842345191051229.jpg" style="width:100%"/>
	<em>Đối với một tổ chức từ thiện, việc có một chiếc xe đa năng để cứu trợ khẩn cấp cho những cụ già neo đơn, để chuyên chở lương thực là điều vô cùng cấp thiết.</em>
</p>

<p>
	Việc mua xe là cần thiết, nhưng các cụ già đau yếu cần được chữa chạy ngay để có thể hồi phục, sinh mạng con người là quan trọng trên hết. Nên Trăng Khuyết đành gác lại việc mua xe mà lo cho sức khỏe các cụ trước, những khoản chi cho việc chữa bệnh, thuốc men để điều trị lâu dài đều không phải là con số nhỏ.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105631-637842345910799979.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105641-637842346014160148.jpg" style="width:100%"/>
	<em>Các cụ già cần được chạy chữa ngay để có thể giữ được tính mạng.</em>
</p>

<p>
	Các mẹ bầu đơn thân cần được hỗ trợ chi phí sinh con, các em bé mới sinh bị nhiễm trùng rốn,... và còn rất nhiều những phát sinh y tế cần Trăng Khuyết giúp đỡ. Vì thương các mẹ, thương các con quá nhỏ để chịu cảnh bệnh tật, nên những quyết định chi ngân sách cho việc cứu người quan trọng hơn trong thời điểm đó. 
</p>

<p style="text-align:center">
	  
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105706-637842346262251407.jpg" style="width:100%"/>
	<em>Còn rất nhiều hoàn cảnh khó khăn cần sự trợ giúp kịp thời.</em>
</p>

<p>
	Những khoản chi phát sinh khiến Trăng Khuyết đặt ra câu hỏi, liệu có bỏ dở chừng ước mơ có được một chiếc xe đa năng? Nhưng “cứu người như cứu hỏa” làm sao Trăng Khuyết bỏ mặc các cụ, các con đau ốm mà chỉ khăng khăng giữ nguồn quỹ để mua xe. Nên số tiền dành dụm để mua xe của Trăng Khuyết cứ thế hết hụt rồi lại thiếu. Chưa kể đến việc trục trặc hợp đồng và thỏa thuận với hãng xe, Trăng Khuyết lại phải đi tìm hãng xe khác. Cứ thế mà không hoàn thành được mong ước bấy lâu nay.
</p>

<p>
	<strong>Mong muốn có được một chiếc xe đa năng để những chuyến đi yêu thương không bị ngắt quãng</strong>
</p>

<p>
	Nếu nói đến khó khăn, thì chắc chắn khó khăn vẫn còn rất nhiều. Nhưng ngay lúc này Trăng Khuyết chỉ cầu mong đợt quyên góp lần 2 này đủ tiền để có thể đem chiếc xe đa năng về cho quán trọ, về cho mái ấm. Dù ước mơ có nhiều như thế nào thì việc mua xe vẫn còn là điều dang dở.  
</p>
')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C010', N'Cùng Thiện Chí chung tay hỗ trợ 280 hộ nghèo phát triển kinh tế sau dịch', N'Đang thực hiện', CAST(N'2022-03-10' AS Date), CAST(N'2023-12-01' AS Date), 200000000, N'              Lao đao, khó khăn vì dịch bệnh, những người nghèo ở tỉnh Bình Thuận đang rất cần sự giúp đỡ. Hãy cùng Thiện Chí hỗ trợ 280 hộ nghèo để họ có cuộc sống thoải mái hơn.', 3475005, 7, N'momo-upload-api-220311100203-637825897235138229.png', N'	<strong>Cùng Thiện Chí tâm sự về những vất vả, khó khăn của những người dân nghèo tỉnh Bình Thuận</strong>
</p>

<p>
	Khi liên hệ và làm việc cùng với cộng đồng người nghèo ở Tánh Linh, Đức Linh, Hàm Thuận Nam tỉnh Bình Thuận chúng ta sẽ càng trân quý cuộc sống đủ đầy ở hiện tại hơn rất nhiều. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220311100233-637825897535528946.jpg" style="width:100%"/>
	<em>Căn nhà lụp xụp của một hộ nghèo tại huyện Hàm Thuận Nam tỉnh Bình Thuận</em>
</p>

<p>
	Bạn sẽ rất ngạc nhiên khi đến thăm một gia đình nghèo ở vùng quê, họ đi làm nhưng nhà cửa mở toang. Họ nghèo đến nỗi mỗi lần ra khỏi nhà không cần phải đóng cửa bởi vì “Có gì đâu mà sợ mất”. Họ không đi khám bệnh vì họ nghĩ rằng khám nhỡ lại có bệnh thì tiền đâu mà chạy chữa, nên khi họ đau ốm thì lúc đó bệnh của họ đã ở giai đoạn cuối, rồi lại cố gắng vay mượn nợ và rồi vòng vay của cái nghèo, nợ nần vẫn vây lấy họ. Chiếc điện thoại mà chúng ta đang cầm có lẽ đó là một điều bình thường, nhưng đối với những người nghèo thì đó là một thứ công nghệ xa xỉ mà họ không thể chạm tới được, bởi vì họ còn phải chạy vạy cho bữa cơm gia đình hàng ngày thì làm sao họ dám nghĩ tới.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220311100258-637825897789847538.jpg" style="width:100%"/>
	<em>Cái cây, vườn rau là kế sinh nhai với nhiều bà con tại đây</em>
</p>

<p>
	Thứ mà họ hy vọng nhất có lẽ là vụ mùa mà họ sắp thu hoạch, những đứa con của họ sẽ có được bữa ăn có thịt, đứa lớn đang học trên thành phố có tiền để đóng phòng trọ, đứa con nhỏ có được bộ quần áo mới. Thế nhưng những người nghèo luôn gặp những điều không may mắn, họ không có nhiều vốn để mua phân bón, không đủ tiền cho các chi phí đầu tư, họ không thể cập nhật những kiến thức mới nhất nhờ mạng xã hội, vv… Nên vụ mùa không đạt năng xuất cao. Bên cạnh đó giá cả thị trường không ổn định, đặc biệt là dịch bệnh khắp nơi khiến cuộc sống mà họ luôn gắng càng thêm lao đao, vất vả. 
</p>

<p>
	<strong>Cùng Chí Thiện góp Heo Vàng giúp 280 hộ nghèo phát triển kinh tế sau dịch</strong>
</p>

<p>
	Hơn 15 năm làm việc với cộng đồng nghèo ở Bình Thuận, Thiện Chí hiểu rõ được thứ bà con đang cần là cái cần câu chứ không phải con cá.
</p>

<p>
	Thiện Chí tổ chức tập huấn cho bà con những kiến thức về trồng trọt và chăn nuôi hàng tháng, hỗ trợ vốn để họ có tiền mua phân bón, hạt giống để đầu tư cho vụ mùa của mình, sau khi hỗ trợ thì nhân viên Thiện Chí luôn bám sát từng hộ để hỗ trợ giúp hạn chế rủi ro.
</p>

<div>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220311100356-637825898361636005.jpg" style="width:100%"/>
</div>

<p style="text-align:center">
	<br/>
	  
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220311100406-637825898467371825.jpg" style="width:100%"/>
	<em>Những buổi tập huấn, hướng dẫn giúp người dân có kiến thức chăn nuôi để phát triển kinh tế</em>
</p>

<p>
	Với số vốn được hỗ trợ từ 3.000.000 VNĐ - 5.000.000 VNĐ trên một hộ dân, đàn gà của họ sẽ có thóc để ăn, vườn rau họ trồng sẽ có đủ phân bón, con heo họ nuôi sẽ có nhiều cám để tăng trọng. Mỗi năm có hàng trăm hộ phát triển kinh tế nhờ vào chương trình hỗ trợ vốn vay của Thiện Chí.
</p>

<p>
	Để làm được điều này, chúng tôi đặt mục tiêu 3.750.000 Heo Vàng quyên góp từ cộng đồng diễn ra trên Heo Đất MoMo. Số Heo Vàng này sẽ được Thiện Chí quy đổi thành 1.200.000.000 đồng tiền mặt để giúp đỡ cho 240 hộ nghèo. Bên cạnh đó, dự án kêu gọi quyên góp 200.000.000 đồng từ cộng đồng thông qua Trái Tim MoMo quyên góp cho 40 hộ nghèo khác. Dự án sẽ có tổng giá trị 1.400.000.000 đồng.
</p>

<p>
	Thiện Chí mong muốn mời người dùng Ví MoMo - các bạn yêu Heo Đất hãy cùng hỗ trợ để những người nghèo có thể vượt qua những khó khăn, vất vả. Mọi sự đóng góp, dù nhỏ bé, đều vô cùng đáng quý!
</p>

')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C012', N'Cùng chung tay gây quỹ xây Nhà Hạnh Phúc cho em Sùng Thị Mây ở thôn Choán Ván, Lào Cai', N'Đang thực hiện', CAST(N'2022-03-30' AS Date), CAST(N'2022-08-20' AS Date), 120000000, N'            Cùng xây Nhà Hạnh Phúc cho em Sùng Thị Mây ở thôn Choán Ván, TT Mường Khương, huyện Mường Khương - tỉnh Lào Cai.', 1125056, 4, N'momo-upload-api-220228115936-637816463768617472.png', N'	<strong>Xót xa trước hoàn cảnh khốn khó của cô bé Sùng Thị Mây</strong>
</p>

<p>
	Sùng Thị Mây - cô học trò nhỏ lớp 3A của trường tiểu học số 2 thị trấn Mường Khương, tỉnh Lào Cai. Cũng như bao đứa trẻ khác, mỗi ngày em Mây đều cắp sách đến trường để cùng học tập và vui chơi. Trên gương mặt của em luôn hiện lên vẻ tươi sáng trước từng con chữ, ước mơ của em chính là trở thành một cô giáo để có thế truyền đạt kiến thức cho tất cả mọi người. Thế nhưng ít ai biết được đằng sau gương mặt luôn rạng ngời ấy là một tuổi thơ cơ cực, thiếu thốn trăm bề.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228115350-637816460303424403.jpg" style="width:100%"/>
	<em>Cô bé nhỏ Sùng Thị Mây (áo khoác xanh nhạt) ấp ủ ước mơ trở thành một cô giáo.</em>
</p>

<p>
	Sinh ra trong một gia đình nghèo lại mồ côi bố từ nhỏ, Mây sống cùng mẹ và 4 người anh chị em tại thôn Choan Ván, Thị trấn Mường Khương, huyện Mường Khương, tỉnh Lào Cai. Ý thức được hoàn cảnh của gia đình nên từ nhỏ em đã rất chăm ngoan, Mây thường tự làm những việc nhỏ trong nhà để phụ giúp mẹ và các anh chị.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228115440-637816460806270513.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228115450-637816460907775058.jpg" style="width:100%"/>
	<em>Mồ côi cha từ nhỏ, em Mây hiện đang sống cùng mẹ và các anh chị trong một ngôi nhà nhỏ, cũ kỹ.</em>
</p>

<p>
	Hiện tại gia đình em Mây đang sống trong một ngôi nhà nhỏ, cũ kỹ đã qua nhiều năm sử dụng, được dựng tạm bởi những tấm ván gỗ mỏng. Đều là vật dụng được gom góp từ nhiều chỗ khác nhau, nên không ăn khớp với nhau tạo nên những khe hở lớn nhỏ. Các khe hở lấy ánh sáng vào nhà cho bớt u tối, nhưng cũng kèm theo những cơn mưa hắt ẩm ướt cùng gió lùa lạnh lẽo mỗi mùa mưa về. Bên ngoài căn nhà đã thô sơ, bên trong lại càng chẳng có gì, tất cả vật dụng sinh hoạt trong căn nhà nhỏ này chỉ là một chiếc bếp củi và vài cái tô cái chén cũ kỹ.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228115521-637816461219632592.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228115533-637816461335599260.jpg" style="width:100%"/>
	<em>Bên trong ngôi nhà chỉ có một chiếc bếp củi thô sơ cùng vài cái chén cái đũa.</em>
</p>

<p>
	Thu nhập chính của 6 miệng ăn trong nhà không có gì ngoài ruộng nương, và một khoản nhỏ trợ cấp dành cho thiếu nhi học tập và sinh sống tại vùng đặc biệt khó khăn (150.000đ/tháng). Mặc dù bữa đói bữa no, tuổi còn nhỏ mà chịu nhiều thiếu thốn, nhưng điều đó cũng không cản bước được Mây đến với lớp, với trường, với ước mơ về một tương lai tươi sáng hơn.
</p>

<p>
	<strong>Chung tay gây quỹ giúp gia đình em Sùng Thị Mây có ngôi nhà vững chãi</strong>
</p>

<p>
	Để cuộc sống mỗi ngày của em Mây bớt đi một chút khó khăn, thêm vào một chút ấm áp, Trái Tim MoMo kết hợp cùng Trung tâm tình nguyện Quốc gia (VVC) và dự án "Sức mạnh 2000" đã xây dựng kế hoạch xây Nhà Hạnh Phúc tặng Mây. Căn nhà khang trang, sạch sẽ và ấm áp rộng 54m2 gồm 3 gian phòng với chi phí xây dựng dự kiến là 130,000,000 đồng.
</p>

<p>
	Chi phí trên đã được địa phương hỗ trợ 50,000,000 đồng. Chúng tôi mong muốn kêu gọi thêm 80,000,000 đồng từ cộng đồng thông qua Trái Tim MoMo. Rất mong nhận được sự chung tay của các nhà hảo tâm để căn nhà sớm được khởi công và hoàn thành trước mùa mưa năm nay, để Mây và gia đình em được sống cùng nhau trong một căn nhà thật sự, để em biết rằng cuộc sống khó khăn này vẫn có những niềm vui, những điều tốt đẹp dành cho em.
</p>


	')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C014', N'Gây quỹ 4 ca phẫu thuật kỷ niệm hành trình 40 năm chữa lành nụ cười của Operation Smile.', N'Đã kết thúc', CAST(N'2022-02-09' AS Date), CAST(N'2022-04-30' AS Date), 40000000, N'  Chung tay gây quỹ phẫu thuật cho 4 em bé hở môi, hàm ếch đánh dấu kỷ niệm hành trình 40 năm hoạt động của Operation Smile toàn cầu', 3100000, 4, N'momo-upload-api-220304142457-637820006977670730.png', N'	<strong>Những đứa trẻ gặp điều không may mắn</strong>
</p>

<p>
	Khi được hỏi rằng câu chuyện nào mà bà ấn tượng nhất khi điều hành tổ chức Phẫu thuật Nụ Cười, bà Kathy Magee - đồng sáng lập và chủ tịch hiện tại của tổ chức đã kể về câu chuyện của một người mẹ ở Việt Nam.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220627105714-637919242342564461.jpg" style="width:100%"/>
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220627105805-637919242853684102.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<em>Hình ảnh một em nhỏ mắc dị tật môi hở, hàm ếch.</em>
</p>

<p>
	Lần đầu tiên Kathy và chồng bà, bác sĩ Bill Magee đến Việt Nam, bà chứng kiến hàng dài những người mẹ xếp hàng ở bệnh viện. Một trong số đó khiến bà chú ý hơn cả vì đôi mắt khẩn cầu tha thiết. Bế trên tay đứa con mới 07 ngày tuổi, bị hở hàm ếch, không thể ăn uống gì. Nếu tiếp tục tình trạng ấy, đứa bé có thể sẽ chết đói. Ở thời điểm 07 ngày tuổi, quá nhỏ để phẫu thuật. Bà và các cộng sự của mình đã thảo luận và đưa ra phương án đặt khí cụ (một dụng cụ chuyên biệt trong nha khoa) để giúp cải thiện tình trạng ăn uống của em bé. Một năm sau đó, bà Kathy gặp lại đứa bé lúc đó đã đủ sức khoẻ và sẵn sàng cho một ca mổ. 
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220627105849-637919243291038355.jpg" style="width:100%"/>
</p>
<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220627105900-637919243404786293.jpg" style="width:100%"/>
<br/>
 
<p style="text-align:center">
	<em>Trong suốt 40 năm hoạt động, Operation Smile đã đã mang đến hàng trăm ngàn ca mổ thay đổi cuộc đời.</em>
</p>

<p>
	Câu chuyện đó là một trong vô vàn những tình huống mà đội ngũ y tế của Operation Smile phải suy nghĩ và ra quyết định nhanh để cứu sống những đứa trẻ. 40 năm qua đi là 40 năm của hành trình chữa lành cho những em bé không may sinh ra mắc phải các dị tật hàm mặt. Tổ chức Phẫu thuật Nụ Cười cũng đã mang đến hàng trăm ngàn ca mổ thay đổi cuộc đời cho trẻ em trên toàn thế giới, trong đó có rất nhiều trẻ em Việt Nam nhận được điều trị y tế tốt nhất.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220627105919-637919243595393165.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<em>Các em nhỏ sau khi làm phẫu thuật đã có được một nụ cười tự tin như bao bạn bè.</em>
</p>

<p>
	<strong>Chung tay gây quỹ thực hiện 12 ca phẫu thuật cho các em bé hở môi, hàm ếch</strong>
</p>

<p>
	Để tiếp tục hành trình này và viết tiếp nhiều câu chuyện như thế, Operation Smile xin kêu gọi sự chung tay của cộng đồng Trái Tim trong chiến dịch gây quỹ 12 ca phẫu thuật cho các em bé sinh ra không may mang các dị tật hàm mặt bẩm sinh. 
</p>

<p>
	Để làm được điều này chúng tôi mong muốn kêu gọi được 120.000.000 VND từ cộng đồng người dùng Trái Tim MoMo. Sự đóng góp của cộng đồng Trái Tim MoMo là nguồn hỗ trợ thiết thực và là nguồn động viên quý giá cho các bệnh nhân và gia đình của các em. 
</p>
')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C015', N'Cùng chung tay gây quỹ xây dựng Nhà phao cộng đồng cho người dân gặp khó khăn tại Bãi Giữa Sông Hồng', N'Đang thực hiện', CAST(N'2022-02-24' AS Date), CAST(N'2023-07-30' AS Date), 50000000, N'    Một phút ghé qua là sự hỗ trợ cho hơn 30 hộ gia đình đang gặp khó tại Bãi Giữa sông Hồng. Cùng chung tay xây dựng Nhà phao cộng đồng an toàn, vượt qua mọi thách thức', 170000, 2, N'momo-upload-api-220225111647-637813846070559665.png', N'<strong>Xóm Phao -  Nơi cư ngụ của một cộng đồng nghèo</strong>
</p>

<p>
	Bãi giữa sông Hồng là khu vực nằm dưới cầu Long Biên, tiếp giáp với thành phố Hà Nội. Đây cũng là nơi sinh sống của một cộng đồng nhỏ với hơn 30 hộ gia đình có thu nhập thấp. Họ thường là những người nhập cư không có giấy tờ tùy thân hoặc không có việc làm ổn định, đang phải vật lộn để kiếm sống. 
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220225111754-637813846742727910.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220225111814-637813846941328286.jpg" style="width:100%"/>
	<em>Các gia đình phải sống trong những ngôi nhà xập xệ</em>
</p>

<p>
	Khu vực sinh sống của họ không có khả năng tiếp cận các dịch vụ công cộng như quản lý chất thải, nước sinh hoạt, điện và chăm sóc sức khỏe. Cư dân nơi đây xây dựng những ngôi nhà nổi bằng vật liệu phế liệu trôi nổi trên một nhánh của sông Hồng. Ván lát nối liền với bờ thì để tạm bợ, chông chênh gây nguy hiểm, mất an toàn. Chính bởi sự thiếu thốn về vật chất mà ngôi nhà cộng đồng nổi duy nhất cung cấp không gian cho hội họp, giáo dục và nơi trú ẩn khẩn cấp năm 2018 trở nên hư hỏng trầm trọng.
</p>
<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220225111856-637813847363765592.jpg" style="width:100%"/>
<p style="text-align:center">
	<br/>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220225111911-637813847518320258.jpg" style="width:100%"/>
	<em>Nhiều nhà tại Xóm Phao đã bị hư hỏng nặng</em>
</p>

<p>
	Năm 2021, Think Playgrounds đã phối hợp với các đối tác để khảo sát các ngôi nhà phao nổi của bà con tại khu vực này, để đưa ra các giải pháp cải tạo phù hợp đảm bảo chống chịu được với thời tiết khắc nghiệt, thân thiện và an toàn. Thông qua các hoạt động thiết kế cùng cộng đồng và các kiến trúc sư, một thiết kế Nhà phao cộng đồng đã được hoàn thiện. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220225111952-637813847926160679.jpg" style="width:100%"/>
	<em>Khu vực nhà bị đổ sẽ được Think Playgrounds khảo sát và xây dựng nhà cộng đồng mới</em>
</p>

<p>
	Ngôi nhà có diện tích 54m2 sẽ là nơi tổ chức các buổi họp, lớp học cho trẻ em và đặc biệt là nơi ở tạm cho các gia đình khi nhà của họ bị hỏng hóc. Bên cạnh đó việc xây dựng một nhà mẫu với các cấu trúc hợp lý sẽ góp phần nâng cao nhận thức và bà con sẽ có thể học hỏi để ứng dụng cho việc cải tạo hoặc xây dựng nhà của mình.
</p>

<p>
	<strong>Cùng chung tay xây dựng Nhà cộng đồng để thắt chặt tinh thần cộng đồng vượt qua mọi thách thức khó khăn</strong>
</p>

<p>
	Chúng tôi lên kế hoạch xây dựng Nhà phao cộng đồng an toàn, vượt qua mọi thách thức cho 30 hộ dân gặp khó khăn với tổng kinh phí là 190 triệu đồng. Để làm được điều này, Trái Tim MoMo đồng hành cùng Think Playgrounds, phối hợp với Live&Learn Việt Nam và chương trình Trợ cấp Đoàn kết của Atlantic Institute. Các nhà tài trợ đã cam kết tài trợ tổng số tiền 140 triệu thông qua Heo Đất MoMo. Chúng tôi mong muốn gây quỹ từ chương trình Trái Tim MoMo thêm 50 triệu đồng nhằm thực hiện các hạng mục:
</p>

<ul>
	<li aria-level="1">Ván vách gỗ bao quanh nhà</li>
	<li aria-level="1">Dựng vách ngăn chia các phòng trong nhà</li>
	<li aria-level="1">Bổ sung một số nội thất phục vụ cho nhà cộng đồng: giá sách, bàn…</li>
</ul>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220225112202-637813849222164533.jpg" style="width:100%"/>
	<em>Cùng chung tay xây dựng Nhà phao Bãi Giữa - nơi mọi người gắn kết </em>
</p>

<p>
	Để làm được điều này, chúng tôi rất mong muốn sự đóng góp từ các tấm lòng hảo tâm, mọi sự đóng góp dù lớn hay nhỏ đều có ý nghĩa rất quan trọng giúp dự án sớm ngày được thực hiện. </p>')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C017', N'Quyên góp 13', N'Tạm ngưng', CAST(N'2022-06-26' AS Date), CAST(N'2022-07-22' AS Date), 50000000, N'          Quyên góp cho trẻ vùng cao', 650060, 4, N'banner1.jpg', N'<p>
	<strong>Chiếc xe đa năng - và hành trình cứu người còn dở dang </strong>
</p>
<p>
	Đối với một tổ chức từ thiện, việc có một chiếc xe đa năng để cứu trợ khẩn cấp cho những cụ già neo đơn, để chuyên chở lương thực là điều vô cùng cấp thiết. Việc mua xe dường như đã gần hoàn tất, nhưng những phát sinh bất ngờ bất buộc Trăng Khuyết phải đưa ra những chọn lựa mua xe trước hay cứu người trước. 
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105506-637842345069138820.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105519-637842345191051229.jpg" style="width:100%"/>
	<em>Đối với một tổ chức từ thiện, việc có một chiếc xe đa năng để cứu trợ khẩn cấp cho những cụ già neo đơn, để chuyên chở lương thực là điều vô cùng cấp thiết.</em>
</p>

<p>
	Việc mua xe là cần thiết, nhưng các cụ già đau yếu cần được chữa chạy ngay để có thể hồi phục, sinh mạng con người là quan trọng trên hết. Nên Trăng Khuyết đành gác lại việc mua xe mà lo cho sức khỏe các cụ trước, những khoản chi cho việc chữa bệnh, thuốc men để điều trị lâu dài đều không phải là con số nhỏ.
</p>

<p>
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105631-637842345910799979.jpg" style="width:100%"/>
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105641-637842346014160148.jpg" style="width:100%"/>
	<em>Các cụ già cần được chạy chữa ngay để có thể giữ được tính mạng.</em>
</p>

<p>
	Các mẹ bầu đơn thân cần được hỗ trợ chi phí sinh con, các em bé mới sinh bị nhiễm trùng rốn,... và còn rất nhiều những phát sinh y tế cần Trăng Khuyết giúp đỡ. Vì thương các mẹ, thương các con quá nhỏ để chịu cảnh bệnh tật, nên những quyết định chi ngân sách cho việc cứu người quan trọng hơn trong thời điểm đó. 
</p>

<p style="text-align:center">
	  
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220330105706-637842346262251407.jpg" style="width:100%"/>
	<em>Còn rất nhiều hoàn cảnh khó khăn cần sự trợ giúp kịp thời.</em>
</p>

<p>
	Những khoản chi phát sinh khiến Trăng Khuyết đặt ra câu hỏi, liệu có bỏ dở chừng ước mơ có được một chiếc xe đa năng? Nhưng “cứu người như cứu hỏa” làm sao Trăng Khuyết bỏ mặc các cụ, các con đau ốm mà chỉ khăng khăng giữ nguồn quỹ để mua xe. Nên số tiền dành dụm để mua xe của Trăng Khuyết cứ thế hết hụt rồi lại thiếu. Chưa kể đến việc trục trặc hợp đồng và thỏa thuận với hãng xe, Trăng Khuyết lại phải đi tìm hãng xe khác. Cứ thế mà không hoàn thành được mong ước bấy lâu nay.
</p>

<p>
	<strong>Mong muốn có được một chiếc xe đa năng để những chuyến đi yêu thương không bị ngắt quãng</strong>
</p>

<p>
	Nếu nói đến khó khăn, thì chắc chắn khó khăn vẫn còn rất nhiều. Nhưng ngay lúc này Trăng Khuyết chỉ cầu mong đợt quyên góp lần 2 này đủ tiền để có thể đem chiếc xe đa năng về cho quán trọ, về cho mái ấm. Dù ước mơ có nhiều như thế nào thì việc mua xe vẫn còn là điều dang dở.  
</p>

<p>
	Để làm được điều này, Trăng Khuyết kêu gọi sự giúp đỡ từ những nhà hảo tâm và các mạnh thường quân với hy vọng gây quỹ cộng đồng 160.000.000 đồng thông qua Trái Tim MoMo. Trăng Khuyết sẽ bù vào khoản chi phí thâm hụt do phát sinh y tế để góp vào số tiền hiện có, sẽ là chi phí dùng để mua xe và vận hành trong 2 năm.
</p>

<p>
	Rất mong các mạnh thường quân, các nhà hảo tâm sẽ đồng hành đợt kêu gọi lần này của MoMo và Trăng Khuyết để có thể giúp đỡ các cụ kịp thời.  Dù số tiền có là bao nhiêu cũng đều đáng quý, bất kỳ đóng góp nào cũng đáng trân trọng để cùng nhau tạo nên điều kỳ diệu.
</p>


')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C02', N'Chung tay quyên góp xây trường mới tặng các bé Tiểu học bản Vàng Lếch, tỉnh Điện Biên', N'Đang thực hiện', CAST(N'2022-03-21' AS Date), CAST(N'2023-07-12' AS Date), 130000000, N'      Cùng xây mới điểm trường tiểu học Vàng Lếch - Nậm Pồ - Điện Biên để các bé không còn phải học trong lớp học xuống cấp và thiếu thốn.', 50325000, 6, N'momo-upload-api-220322100442-637835402826039867.png', N'     <strong>Không khỏi xót xa trước điều kiện học tập nóng nực và thiếu thốn của các bé tiểu học bản Vàng Lếch – tỉnh Điện Biên</strong>
</p>

<p>
	Bản Vàng Lếch là một bản vùng cao của người Mông, nằm ở phía Tây Bắc tỉnh Điện Biên. Bản là nơi cư trú 98 hộ dân, với hơn 500 nhân khẩu, chủ yếu sinh sống bằng công việc trồng trọt, làm nương rẫy. Tuy chăm chỉ lao động làm ăn, đời sống của nhân dân bản vẫn rất khó khăn với 100% thuộc hộ nghèo. Vì vậy, họ vẫn chưa ý thức được tầm quan trọng của giáo dục, và hành trình đến với con chữ của các bé vẫn còn nhiều hạn chế và trở ngại. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220322100516-637835403160882397.jpg" style="width:100%"/>
	<em>Toàn cảnh điểm trường Tiểu học Vàng Lếch – xã Nậm Tin – huyện Nậm Pồ - tỉnh Điện Biên.</em>
</p>

<p>
	Điểm trường Tiểu học Vàng Lếch là một trong những ngôi trường tạm thuộc trường PTTHBT Tiểu học Nậm Tin. Điểm trường cách trung tâm xã khoảng 2km đường bộ. Hiện nay, trường có 25 học sinh trải dài từ 6 -7 tuổi. Trải qua hơn 10 năm sử dụng, ngôi trường duy nhất của bản nay đã hư hại nhiều theo thời gian. Tuy được xây dựng khá kiên cố bằng cột sắt nhưng lớp học của các em đến nay vẫn bị ẩm mốc, mối mọt và xuống cấp phần lớn. Đặc biệt, mái tôn của phòng học bí và rất nóng. Vào những tháng mùa khô, các bé ngồi trong lớp mà không khác ngoài trời là bao vì nóng nực và khô hanh. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220322100551-637835403511809410.jpg" style="width:100%"/>
	<em>Sau hơn 1 thập kỷ xây dựng, phòng học đã xuống cấp nhiều điểm.</em>
</p>

<p>
	Không chỉ vậy, điểm trường cũng chưa có điện và nước sạch sinh hoạt, gây ra nhiều bất tiện cho sinh hoạt hằng ngày của trẻ tại trường. Trong tương lai, số lượng học sinh dự kiến sẽ ngày một tăng. Những khó khăn sẽ còn chồng chất hơn nữa khi số lượng bàn học, lớp học có hạn. Sân chơi của các em và đồ dùng học tập cũng còn nhiều thiếu thốn. Thật không khỏi lo lắng và xót xa cho những em nhỏ của bản Vàng Lếch. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220322100616-637835403762439870.jpg" style="width:100%"/>
	<em>Dù đời sống còn nhiều trở ngại, trẻ nhỏ vẫn luôn cố gắng chăm chỉ đến trường.</em>
</p>

<p>
	Dù khó khăn về mọi mặt nhưng thầy cô và các em học sinh nơi đây luôn luôn kiên trì, cố gắng với việc dạy và học. Thầy cô luôn quan tâm hết mức tới các em học sinh, thấu hiểu tấm lòng đó các em học sinh cũng vô cùng chăm chỉ học tập. Tất cả đều hướng đến một tương lai mà ở đó tri thức có thể giúp các em thoát khỏi cái nghèo, cái khổ.
</p>

<p>
	<strong>Chung tay quyên góp xây mới và cải tạo điểm trường Tiểu học bản Vàng Lếch – tỉnh Điện Biên</strong>
</p>

<p>
	Ngôi trường đang xuống cấp sẽ là mối nguy hiểm tiềm ẩn cho các em cũng như thầy cô giáo khi học tập tại đây. Thấu hiểu điều ấy, Trái Tim MoMo kết hợp cùng Trung tâm Tình nguyện quốc gia  và dự án "Sức mạnh 2000" và Dự án Nuôi Em đã lên kế hoạch làm mới và xây dựng thêm cơ sở vật chất cho trường. Chúng tôi dự định xây 02 phòng học, 01 phòng công vụ, 01 nhà bếp, 01 nhà vệ sinh và 01 téc nước inox.  
</p>

<p>
	Tổng chi phí cho kế hoạch trên là 359.400.000 VNĐ. Để hiện thực hóa dự án ấy, chúng tôi lên kế hoạch quyên góp thông qua Heo Đất MoMo và Trái tim MoMo. Ở Trái tim MoMo, chúng tôi kêu gọi quyên góp 130.000.000 VND từ cộng đồng và các mạnh thường quân. Thông qua Heo Đất MoMo, nhà tài trợ cam kết sẽ hỗ trợ 229.400.000 VNĐ. 
</p>

<p>
	Hãy góp sức cùng chúng tôi xây mới trường, cũng là mang lại chất lượng học tập đầy đủ và tiện lợi hơn cho các em nhỏ. Mọi sự đóng góp từ các bạn, dù nhỏ nhất, cũng đều góp phần không nhỏ trong nỗ lực cải thiện môi trường học tập của các em, để các em không phải học trong phòng học xuống cấp và bức bối, không còn phải đi gánh nước sinh hoạt mỗi ngày. </p>')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C03', N'Cùng quyên góp tặng “Thêm 1 Bữa No, Thêm 1 Nụ Cười” cho trẻ em và người già neo đơn tại các mái ấm và quán trọ Quý 1/2022', N'Đã kết thúc', CAST(N'2022-03-14' AS Date), CAST(N'2022-04-18' AS Date), 195000000, N' Chung tay góp đóng góp để tạo ra hàng ngàn bữa ăn dinh dưỡng, chất lượng cho các cụ già và trẻ em tại mái ấm, quán trọ trong quý 1/2022', 3500000, 2, N'momo-upload-api-220314112134-637828536941159507.png', N'<strong>Câu chuyện về tô cơm có thịt ở mái ấm</strong>
</p>

<p>
	Lâu ngày thành quen, chương trình “Thêm 1 bữa no - Thêm 1 nụ cười” dần trở nên quen thuộc đối với các mảnh đời ở mái ấm mà Trăng Khuyết hỗ trợ thực phẩm. Khi được các bạn TNV đến trao thực phẩm và hỗ trợ nấu ăn, ai cũng háo hức, bởi các cụ, các bé biết rằng hôm nay lại có “thêm một bữa no”.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220314111600-637828533601763665.jpg" style="width:100%"/>
	<em>Mỗi khi các bạn TNV  đến trao thực phẩm và hỗ trợ nấu ăn, ai cũng háo hức.</em>
</p>

<p>
	Đối với các cụ và các con sống ở mái ấm, thì điều mong muốn nhất là cơm đủ no ngày 3 bữa, được một chỗ ngủ không bị ướt mưa. Cầm trên tay tô cơm thịt khìa ngon lành mà ánh mắt các em nhỏ ở mái ấm lại ánh lên niềm vui sướng khôn tả. Đôi khi hạnh phúc đối với các con chỉ là được ăn một tô cơm ngon lành với món mà các con thích. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220314111626-637828533867369767.jpg" style="width:100%"/>
	<em>Một bữa ăn đầy đủ cá, thịt ngon lành đôi khi là niềm hạnh phúc đối với các em nhỏ và cụ già ở mái ấm.</em>
</p>

<p>
	Dù những kế hoạch đang ở giai đoạn triển khai gặp nhiều khó khăn, nhưng Trăng Khuyết vẫn luôn cố gắng duy trì chương trình “Thêm 1 bữa no - Thêm 1 nụ cười”. Đó giống như một điều ước nhỏ dành riêng tặng cho các cụ và các con với mong muốn bữa ăn không bị ngắt quãng. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220314111652-637828534124939320.jpg" style="width:100%"/>
	<em>Dù khó khăn nhưng Khăng Khuyết luôn cố gắng duy trì chương trình “Thêm 1 bữa no - Thêm 1 nụ cười” để mang lại niềm vui cho các em nhỏ.</em>
</p>

<p>
	Nhìn các cụ cười tươi khi nhìn nồi canh củ ngon lành, nhìn các con ăn ngon miệng với tô cơm đầy càng thôi thúc Trăng Khuyết phải kiên trì hơn nữa. Một bữa cơm ở mái ấm đơn giản lắm, chỉ vỏn vẹn 15 ngàn đồng chưa đầy được 1 ly trà sữa ngoài tiệm. Ấy vậy mà giá trị với những cụ già và em nhỏ là cả một niềm hạnh phúc vô bờ.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220314111715-637828534359622487.jpg" style="width:100%"/>
	<em>Mong ước của Trăng Khuyết là 1300 mảnh đời lớn nhỏ ở mái ấm luôn được no bụng, được khỏe mạnh. </em>
</p>

<p>
	Mong ước của Trăng Khuyết lúc này là chương trình “Thêm 1 bữa no - Thêm 1 nụ cười” vẫn luôn được duy trì, bếp cửa vẫn rực cháy, nồi cơm vẫn ấm, nồi canh, hay chảo cá kho vẫn dậy mùi. Để hơn 1300 mảnh đời lớn nhỏ ở mái ấm luôn được no bụng, được khỏe mạnh. Bởi số phận đã quá nghiệt ngã với những kiếp người nhỏ bé quá rồi.
</p>

<p>
	<strong>Góp “Thêm 1 bữa no - Thêm 1 nụ cười” -  chung tay vì những bữa ăn no cho các cụ già và các em nhỏ (Quý 1/2022)</strong>
</p>

<p>
	Để đóng góp nguồn lương thực, thực phẩm cho mái ấm và quán trọ, Heo Đất MoMo phối hợp với Quỹ Từ Thiện &amp; BTXH Trăng Khuyết kêu gọi sự chung tay hỗ trợ của các nhà hảo tâm thông qua chương trình “Thêm 1 bữa no – Thêm 1 nụ cười”  hỗ trợ kinh phí để mua: lương thực, thực phẩm và nhu yếu phẩm để đảm bảo các suất ăn dành cho các cụ và các con ở mái ấm được duy trì đủ trong Quý 1/2022.
</p>

<p>
	Với số kinh phí dự kiến là 645.000.000 đồng, chúng tôi kêu gọi 3.000.000 Heo Vàng từ cộng đồng người dùng Heo Đất MoMo. Số Heo Vàng sẽ được nhà tài trợ Trăng Khuyết quy đổi tương đương 450.000.000 VND. Ngoài ra Quỹ Từ Thiện &amp; BTXH Trăng Khuyết kêu gọi sự giúp đỡ từ những nhà hảo tâm và các mạnh thường quân với hy vọng gây quỹ cộng đồng 195.000.000 đồng thông qua Trái Tim MoMo.
</p>

<p>
	Chung tay quyên góp để những chuyến xe thực phẩm được đến mái ấm trong dịp này, để mong rằng những bữa cơm đầy không bị ngắt quãng.
</p>

')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C04', N'Đồng hành cùng OneSky nâng cao chất lượng giáo dục mầm non cho hàng nghìn trẻ em tại các Khu công nghiệp', N'Đã kết thúc', CAST(N'2022-02-27' AS Date), CAST(N'2022-04-05' AS Date), 100000000, N' Cùng OneSky chung tay cải thiện chất lượng giáo dục mầm non tại Khu công nghiệp để hàng nghìn trẻ em nghèo có cơ hội phát huy tối đa tiềm năng trong giai đoạn vàng 0-6 tuổi.', 4000000, 3, N'', N'<strong>Giáo dục mầm non – nền tảng “vàng” cho trẻ em nghèo tại các Khu Công Nghiệp</strong>
</p>

<p>
	Tại Việt Nam, các Khu Công Nghiệp (KCN) đang phát triển nhanh chóng với hơn 3,5 triệu công nhân nhà máy. Trong đó, có hơn 60% là phụ nữ trong độ tuổi sinh đẻ và 1,2 triệu trẻ em dưới 6 tuổi hiện đang sống cùng cha mẹ trong địa bàn các khu công nghiệp. Theo các chuyên gia, 0 – 6 tuổi là độ tuổi “vàng” để phát triển nhận thức cho trẻ. Ở thời điểm này, trường mầm non có vai trò quan trọng trong việc hỗ trợ trẻ xử lý thông tin, hình ảnh cũng như hình thành các khái niệm nền tảng giúp trẻ hình thành các nhận thức của riêng mình.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228090542-637816359423988559.jpg" style="width:100%"/>
	<em>Dưới 6 tuổi là thời điểm vàng cho não bộ của trẻ tự nhận thức và phát triển.</em>
</p>

<p>
	Tuy nhiên, do gặp trở ngại từ nhiều mặt mà phần lớn công nhân tại Khu Công Nghiệp lại không thể cung cấp cho các bé điều kiện giáo dục tốt nhất. Quyết định rời quê hương đi lao động xa nhà, cũng đồng nghĩa với việc các công nhân sẽ thiếu đi sự hỗ trợ trực tiếp từ gia đình trong việc nuôi dạy trẻ. Thêm vào đó, các trường mầm công lập thường ưu tiên cho trẻ em có hộ khẩu thường trú tại địa phương, dẫn đến việc công nhân lao động xa nhà gặp khó khăn khi xin học cho con vào các cơ sở công lập. Vì vậy, họ thường chấp nhận gửi con tại các cơ sở trông giữ trẻ có chi phí thấp nhưng chưa được qua tập huấn chuyên môn và thiếu hụt về cơ sở vật chất. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228090621-637816359812031416.jpg" style="width:100%"/>
	<em>Chất lượng giáo dục mầm non đạt chuẩn như thế này có thể nói là điều xa vời đối với các bé tại KCN.</em>
</p>

<p>
	Năm 2017, nhằm đưa ra một giải pháp an toàn, mang lại sự an tâm cho công nhân lao động và hỗ trợ tối đa phát triển khả năng cho trẻ, phối hợp với Sở Giáo Dục và Đào Tạo Đà Nẵng, OneSky đã thành lập Trung tâm Chăm sóc và Giáo Dục Mầm Non tại KCN Hòa Khánh - Đà Nẵng. Trung tâm tập trung nuôi dạy 250 trẻ em từ 6 tháng tới 6 tuổi, có cha mẹ là công nhân nghèo đang làm việc tại các nhà máy ở địa phương. 
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228090645-637816360059362159.jpg" style="width:100%"/>
	<em>Hình ảnh cô trò chơi đùa tại một lớp học của OneSky.</em>
</p>

<p>
	OneSky áp dụng phương pháp dạy học ứng đáp – cách thức giáo dục lấy trẻ làm trung tâm, tạo nên môi trường học tập đa dạng dựa vào nhu cầu và hứng thú của từng trẻ, để thúc đẩy sự phát triển toàn diện về thể chất, trí tuệ, ngôn ngữ và tình cảm xã hội. Với 17 lớp học và khu vui chơi được xây dựng trên khuôn viên rộng 3.800 m2, Trung tâm OneSky đem lại môi trường giáo dục mầm non chất lượng dành riêng cho con công nhân nghèo với học phí được tài trợ chỉ còn 800.000 đồng / tháng.
</p>

<p style="text-align:center">
	<img alt="" src="https://static.mservice.io/blogscontents/momo-upload-api-220228090735-637816360552838276.jpg" style="width:100%"/>
	<em>Trẻ được thỏa thích chơi đùa, sáng tạo trong môi trường an toàn và hiện đại – điều khó lòng tìm thấy tại hầu hết các KCN. </em>
</p>

<p>
	Ngoài ra, OneSky triển khai khóa tập huấn OneSky dành cho nhóm, lớp độc lập tư thục. Khoá tập huấn kéo dài 11 tháng, bao gồm 21 bài học với các chủ đề gần gũi, thực tế và phong phú như: tìm hiểu về não bộ, tâm lý và hành vi của trẻ; cách xử lý xung đột; xây dựng môi trường học tập hứng thú, an toàn…. Học viên cũng sẽ được Giảng viên OneSky trực tiếp tới thăm nhóm để hướng dẫn cách áp dụng các bài giảng vào thực tế và tham gia thảo luận chuyên môn trên nền tảng trực tuyến 1GiaĐìnhLớn.org. Hoàn thành khóa tập huấn, học viên sẽ được nhận chứng chỉ do OneSky và Sở GD </p>')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C05', N'Chung tay phục hồi mảng xanh, phủ xanh đất trống đồi trọc miền Trung, Quảng Trị', N'Tạm ngưng', CAST(N'2021-11-23' AS Date), CAST(N'2022-12-01' AS Date), 150000000, N'  Cùng Quỹ Hoa Chia Sẻ góp sức bảo vệ mảng xanh nhằm hạn chế biến đổi khí hậu và suy thoái môi trường, giảm thiểu thiên tai, hạn hán đối với các vùng đồng bào miền Trung nước ta.', 500000, 1, NULL, N'')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C051', N'C21', N'Chưa bắt đầu', CAST(N'2022-07-28' AS Date), CAST(N'2022-07-31' AS Date), 50000, N'd', 0, 0, N'', N'')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C06', N'Chung tay đóng góp để trồng cây bản địa và gây vườn rừng tại bản Cát Cát, Sapa', N'Đã kết thúc', CAST(N'2021-11-23' AS Date), CAST(N'2022-05-01' AS Date), 100000000, N'Với mỗi 30,000 VNĐ, bạn có thể đóng góp để trồng một cái cây tại vườn rừng rộng 2ha tại bản Cát Cát - Sapa. Mục tiêu của chúng tôi là trồng 3000 cây để gây rừng, tạo công ăn việc làm cho người dân và phát triển thế mạnh cây bản địa của địa phương.', 7150000, 2, NULL, NULL)
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C07', N'Dự án Xanh Hà Nội trồng 500 cây xanh đô thị vì một Hà Nội không nóng bức', N'Đã kết thúc', CAST(N'2021-11-23' AS Date), CAST(N'2022-05-01' AS Date), 100000000, N'Cùng chung tay trồng 500 cây xanh đô thị để tăng diện tích phủ xanh của thành phố để Hà Nội trở thành một nơi đáng sống cho tất cả mọi người', 1050000, 2, NULL, NULL)
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C08', N'Gây quỹ trồng 400 cây xanh trú nắng cho người dân Nại Nghĩa, Đà Nẵng', N'Đã kết thúc', CAST(N'2021-11-23' AS Date), CAST(N'2022-05-01' AS Date), 100000000, N'Những khoản đóng góp ý nghĩa từ bạn sẽ biến một khu đất trống, vốn là nơi tập kết rác thải, trở thành một mảng công viên xanh cho người dân Nại Nghĩa trú nóng giữa mùa hè Đà Nẵng bỏng rát. Công viên này cũng đồng thời là nơi vui chơi, học tập, trải nghiệm thiên nhiên cho các em nhỏ của khu dân cư', 100000, 1, NULL, NULL)
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C09', N'Chung tay vá rừng trên núi đá tại Hòa Bình – Sơn La', N'Đang thực hiện', CAST(N'2021-11-23' AS Date), CAST(N'2022-12-12' AS Date), 100000000, N'Hành lang núi đá vôi Sơn La - Hòa Bình với hệ động thực vật phong phú đang bị suy giảm. Đóng góp của bạn sẽ góp sức phục hồi rừng, bảo vệ nguồn nước, sinh kế và không gian văn hóa của bà con vùng cao.', 17000000, 2, NULL, NULL)
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'c127', N'tt', N'Đã hoàn thành', CAST(N'2022-06-24' AS Date), CAST(N'2022-07-21' AS Date), 123456, N'     xx', 17000000, 1, N'', N'')
INSERT [dbo].[Campaign] ([Campaign_id], [Campaign_name], [Status], [Start_Date], [End_Date], [Target], [Description], [Donated], [Donations], [Image], [Content]) VALUES (N'C77', N'nm', N'Tạm ngưng', CAST(N'2022-07-30' AS Date), CAST(N'2022-07-14' AS Date), 50000000, N' gg', 0, 0, N'', N'')
GO
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C012', 6, CAST(N'2022-07-10T21:11:15.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C012', 50, CAST(N'2022-07-10T21:47:46.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C010', 50000, CAST(N'2022-07-11T11:08:11.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C010', 200000, CAST(N'2022-07-11T11:08:34.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 50000, CAST(N'2022-07-11T11:09:04.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C012', 1000000, CAST(N'2022-07-11T11:09:35.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C010', 5, CAST(N'2022-07-11T11:09:42.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C017', 60, CAST(N'2022-07-11T11:14:32.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C017', 500000, CAST(N'2022-07-11T11:14:40.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 1000000, CAST(N'2022-07-11T18:07:45.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 1000000, CAST(N'2022-07-11T18:08:03.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C014', 1000000, CAST(N'2022-07-11T18:27:08.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C014', 700000, CAST(N'2022-07-11T18:48:42.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C014', 700000, CAST(N'2022-07-11T18:49:16.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C04', 1000000, CAST(N'2022-07-12T13:00:12.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C06', 150000, CAST(N'2022-07-12T13:05:42.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (69, N'C01', 150000000, CAST(N'2022-07-12T23:56:48.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C010', 50000, CAST(N'2022-07-11T11:08:22.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 23000, CAST(N'2022-07-11T11:24:25.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 20000, CAST(N'2022-07-11T11:24:42.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C017', 100000, CAST(N'2022-07-07T18:10:21.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (20, N'C02', 50000000, CAST(N'2022-03-08T13:00:00.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (14, N'C03', 2000000, CAST(N'2022-01-12T13:05:06.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (14, N'C07', 50000, CAST(N'2021-12-08T15:35:55.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (17, N'C08', 100000, CAST(N'2021-10-20T05:12:07.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (17, N'C09', 12000000, CAST(N'2022-02-20T17:56:01.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (22, N'C010', 3000000, CAST(N'2021-12-08T13:05:55.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (22, N'C09', 5000000, CAST(N'2021-11-14T13:07:11.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (22, N'C06', 7000000, CAST(N'2022-11-05T05:03:02.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (23, N'C07', 1000000, CAST(N'2022-02-21T09:05:03.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C05', 500000, CAST(N'2022-07-07T18:14:40.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (24, N'C03', 1500000, CAST(N'2022-02-28T19:01:01.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (19, N'C04', 1000000, CAST(N'2022-03-01T20:00:00.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (21, N'C04', 2000000, CAST(N'2022-01-12T13:05:06.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 50000, CAST(N'2022-06-20T12:17:51.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C02', 50000, CAST(N'2022-06-20T12:18:51.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C02', 125000, CAST(N'2022-06-20T12:33:15.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C02', 50000, CAST(N'2022-06-20T12:33:28.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C017', 50000, CAST(N'2022-06-27T20:35:17.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C012', 125000, CAST(N'2022-06-28T02:29:05.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C02', 50000, CAST(N'2022-06-20T13:25:40.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C02', 50000, CAST(N'2022-06-20T20:09:07.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 6000, CAST(N'2022-06-20T20:09:40.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C010', 25000, CAST(N'2022-07-07T18:19:22.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'c127', 17000000, CAST(N'2022-07-07T18:18:34.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C015', 100000, CAST(N'2022-07-11T11:17:31.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 800000, CAST(N'2022-07-11T11:30:53.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C01', 150000, CAST(N'2022-07-11T17:06:14.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C015', 70000, CAST(N'2022-07-11T17:19:56.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (13, N'C014', 700000, CAST(N'2022-07-11T17:45:25.000' AS DateTime))
INSERT [dbo].[Donate] ([User_ID], [Campaign_id], [Amount], [Datetime_Donate]) VALUES (69, N'C010', 150000, CAST(N'2022-07-13T00:16:49.000' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_email]    Script Date: 14/07/2022 10:58:37 CH ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[User_mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('ON') FOR [History_status]
GO
ALTER TABLE [dbo].[Campaign] ADD  CONSTRAINT [DF_Campaign_Donations]  DEFAULT ((0)) FOR [Donations]
GO
ALTER TABLE [dbo].[Donate]  WITH CHECK ADD  CONSTRAINT [FK_ID_CAMPAIGN] FOREIGN KEY([Campaign_id])
REFERENCES [dbo].[Campaign] ([Campaign_id])
GO
ALTER TABLE [dbo].[Donate] CHECK CONSTRAINT [FK_ID_CAMPAIGN]
GO
ALTER TABLE [dbo].[Donate]  WITH CHECK ADD  CONSTRAINT [FK_ID_USER] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Account] ([User_ID])
GO
ALTER TABLE [dbo].[Donate] CHECK CONSTRAINT [FK_ID_USER]
GO
USE [master]
GO
ALTER DATABASE [final_project] SET  READ_WRITE 
GO
