USE [master]
GO
/****** Object:  Database [CareerDB]    Script Date: 9/11/2020 7:07:37 AM ******/
CREATE DATABASE [CareerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CareerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CareerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CareerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CareerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CareerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CareerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CareerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CareerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CareerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CareerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CareerDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CareerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CareerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CareerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CareerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CareerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CareerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CareerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CareerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CareerDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CareerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CareerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CareerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CareerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CareerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CareerDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CareerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CareerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CareerDB] SET  MULTI_USER 
GO
ALTER DATABASE [CareerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CareerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CareerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CareerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CareerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CareerDB] SET QUERY_STORE = OFF
GO
USE [CareerDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/11/2020 7:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 9/11/2020 7:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ConfirmPassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Admins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/11/2020 7:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/11/2020 7:07:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[imageUrl] [nvarchar](max) NULL,
	[CatId] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202008251941440_InitialCreate', N'ShopingCart.Models.MyDbcontext', 0x1F8B0800000000000400D559DB6EE336107D2FD07F10F4D416592B171468037B17A9931446378911258BBE05B434768852A44A52818DA25FD6877E527FA1A3BB445AB6ECDC5AE425A2E63E678633F23F7FFD3DFCB48C98F3045251C147EED1E0D075800722A47C3172133DFFF083FBE9E3D75F0D2FC268E97C29E94E523AE4E46AE43E6A1D9F7A9E0A1E21226A10D1400A25E67A1088C823A1F08E0F0F7FF48E8E3C40112ECA729CE16DC2358D207BC0C7B1E001C43A21EC4A84C054718E6FFC4CAA734D2250310960E4FA8F2246E3C644EA414EED3A678C12B4C40736771DC2B9D044A39DA7F70A7C2D055FF8311E1076B78A01E9E6842928EC3FADC9FBBA72789CBAE2D58CA5A820515A443B0A3C3A2962E399EC7B45D8AD6287D1BBC028EB55EA7516C1913B261A1642AE5CC754763A6632255C17E041C976E0345E1E547040D4A47F07CE38613A9130E2906849D881334D668C06BFC0EA4EFC067CC413C69A06A289F8AE758047532962907A750BF3DAEC49E83A5E9BD533792BCE365BEED684EB9363D7B94613C88C41858246087C2D24FC0C1C24FA1B4E89D62031899310B2385A06D8EAB228A54FA556841F86CB75AEC8F233F0857EC41AFB1E6BE7922E212C4F0A4BEE39C5C243262D135863A9A1FD9A3CD14566B861472C4598041AEBE2165846A01E699C97C7605ABC7CA8A1702945742B5245D6CB873B2217A0D11BD145E18B4406867543AF46DE463C4E2B5377C263C9F65E78DC078C6F89C43742A0A195466401F7926DD08CFFF6D2BCB5D0B647B36FB5D475F0FC6A296BA1BB5ACA7AEA532D674A8980662619E5529BD376F28287CE56DBF2DC34BDC31461A1D0184B03CD18B9DF59D1DB24B86A11B5E03A5A6DC147AE595B37FC1C186870CE82FCC61C131590D0CE1FC6286C9F6039824CEB81309C1F141638E5DAAE5DCA031A13B6CD7C83B1FF3594DA566931DF9C430C3C2DDA6D697996FA4A8B11B26D111A7A0D88D97D1A793472802CF45FADCE67019EC152AFE9D7386B152D5B15556C422895E9836ED71D05845F8D7F0B401610DB52EABBCE9251A3DB90D170BA16B4A6D21B749DEDC0CC459F0AAC7C689A6F65B54FC9352435C369964EDBE1359DA7CA743D787BF9E45D4EE85EC7883EBC22717A013746F6E2C4F1F3797DFCC1DF7D908D72195EA0D6CCB395B59526BC2DF1EA31DEA26AB4F4924AA5CF89263392DE0AE330B2C89AB8EE405BA9C982AE9DB51285254BFA7FCEB661B05E53FF05FF257A16A50D241B09EC84AF61CDD626C2885C7F6D8E054B22BEB1A56C94D198710D518D37B6C4A1677864B5312B76D60DD0CE46AF5C5515F6CC4C4D3BE4F4C854376B5794CD34ED96233B375D39E992504F724D29F5E94E78E98DB9574588D5EA4C924A7BD5F28CD6362CDACCF64F1456DFC9495C0783F344C3B4E7F82BA5211AA40403FF77366614FDAD09AE08A773503A5F53DCE3C3A363E32BC77FE78B83A754C87A7E7678A7DD9FA6B1DDBA53EDB8EEAC5BF7F91391C12391F6BAB551F8EEFBF29B2FADAF12C21708DDF635B414FC4D4496DF36A5EDBC6A6631B006DF098EDECB91FB47C671EA4C7E7DC8980E9C1B89957CEA1C3A7FEE99FEE72C80F518FBD67B993DB8EEB974EEB5E06D98A85E73A1FB5F2C70F63CDC6B455B6D5CD0F2BB6DE486338179CE31BE611931754CFB2C70EB74BCF37A67C6A63D93F759E75A9C9DDEBCC8F2664F2E88ADC64F30086B4517B588F407190E410B5515CD84CF45896DC3A292C468A257A04988903B939ACE49A0F175004A651F07BF109620C945348370C26F121D271A5D8668C65A614C8B6493FE6C436DDB3CBC89B3CF792FE1029A49D105B8E13F25948595DD976BBA798788B4FA8ABB33CDA54EEFD0C5AA92742D784F4145F8AAA6710751CC5098BAE13E79827D6CBB57F019162458950368B790ED8968877D784EC942924815326A7E7C440C87D1F2E3BFFE1F719C891C0000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202008261235260_Migration-Add-Price', N'ShopingCart.Models.MyDbcontext', 0x1F8B0800000000000400D559DB6EE336107D2FD07F10F4D416592B171468037B17A9931446378911258BBE05B434768852A44A52818DA25FD6877E527FA1A3BB445AB6ECDC5AE4252239F733C319FA9FBFFE1E7E5A46CC7902A9A8E023F76870E83AC0031152BE18B9899E7FF8C1FDF4F1EBAF861761B474BE94E74ED27348C9D5C87DD43A3EF53C153C4244D420A281144ACCF52010914742E11D1F1EFEE81D1D79802C5CE4E538C3DB846B1A41F6819F63C103887542D8950881A9621D77FC8CAB734D2250310960E4FA8F2246E5C644EA417EDA75CE1825A8890F6CEE3A8473A189463D4FEF15F85A0ABEF0635C20EC6E15039E9B13A6A0D0FFB43EDED794C3E3D414AF262C590589D222DA91E1D149E11BCF24DFCBC36EE53BF4DE057A59AF52AB330F8EDC31D1B01072E53AA6B0D33193E9C1750E1E9464074E63F3A08203A226FD3B70C609D389841187444BC20E9C69326334F8055677E237E0239E30D6541055C4BDD6022E4DA58841EAD52DCC6BB527A1EB786D52CFA4AD28DB64B95913AE4F8E5DE71A55203306150A1A2EF0B590F0337090686F38255A83C4204E42C8FC6829608BCBBC947E9552117EE82ED7B922CBCFC017FA1173EC7BCC9D4BBA84B05C2934B9E714130F89B44C608DA686F46BF2441799E2861EB114611268CC8B5B60D901F548E33C3D06D362F3A186C2A514D1AD4805599B0F77442E40A335A2EB842F121918DA0DBD1A791BF138AD54DD098F25D97BE1711F30BE2512DF088186D4A9A44125F65CA0AB77E73189C802EE25DBA03DFEDB4BFBADC9BA3D227D33AECEA5E7675C994FDD1957E6649F8C3B534A043453C948B95A9DB691173C74B6EA96C7A6691D8608938DC6985EA8C6C8FDCEF2DE26C65599A919D7DE6A333E72CDFCBCE1E7C040837316E4B7EE98A8808476FCD047617B05531A649A5384610FA2B04850AEEDFCA73CA03161DBD43708FB5F65A96E951473E71C62E069E26F0BCBB3C457520C976DF3D0D06B40CCAEF548A391026421FF6A753E0B700D967A4DCDC77EAD28FBAAC8621342294F1F743BEF2820FC6AFC5B00B280D8E652DF97168F1ADD068F86D135A33599DE38D7590ECC58F4C9C0CA86A6FA5654FBA45C8353D39D66EAB40D5E5379AA48D7CDBB9777EF6597EF75B4F9C32B12A79778A3ED2F561C3FEFF9C71FFCDD9BE128E7E1056A4D4F5C695B49C21B17AF1E631745A3A697542A7D4E349991F45618879175AC89EB0EB495922CE8DA512B515892A4FFE7641B9AF335F95FD05FA265515A40B2B6C20EF81AD26CF4228CC8F5D7E658B024E21B4BCA461E8D3ED960D5D8B1390E3DC322AB8C59BEB36E8076347AC5AACAB067466ADAC1A747A4BA49BBBC6C8669B718D9B1E98A491787A21B6CB22896FAF3A8BBC19625D5EA4E98EB8DDB574599552ECD2395F4AA6C1AE5715894AAED4F2556EDCA8FB80E3AE7898669DDF2574A4334480F0CFCDFD99851B4B73E7045389D83D2F9B8E41E1F1E1D1BAF2DFF9D970F4FA990F57CFE78A737089AFA76EB6CB7E3C8B4EED9813F11193C12698F7D1B99EF3EB7BFF9F0FC2A2E7C01D76D1987E74C10FDEC69B8D4ED9B882CBF6D72DB79E2CDDC68F5DF139C009623F78F8CE2D499FCFA90111D3837128BC1A973E8FCB927829E3387D6DDF45B8F8776FFBCE7ECBBD79CB9A1B17BCDB9F27F3147DA6D79AF4971B5714ECCAFC7911BCE04C639C7F88699C89431ED3347AE93F1CE53A6E99BF668D067AA6C51765AF32233A4DDFC20B61ABF2621AC155DD42CD2DF9638042D545567267C2E4A6C1B1A95478C227A059A8408B933A9E99C041AB703502A7BA3FC425882472EA21984137E93E838D168324433D672639A249BE46783725BE7E14D9CBD2ABE8409A8264513E086FF945016567A5FAEA9E61D2CD2EC2BAEDF34963ABD8617AB8AD3B5E03D1915EEAB8AC61D44314366EA86FBE409F6D1ED5EC16758906055F6B0DD4CB607A2EDF6E139250B492255F0A8E9F113311C46CB8FFF02527F2846541D0000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202008271948089_Migration-Add-Admin', N'ShopingCart.Models.MyDbcontext', 0x1F8B0800000000000400D55ACB6EE33614DD17E83F085AB545C6CA0305DAC09E41EA24853193C4883383EE025AA21DA214A992546AA3E89775D14FEA2FF4526F91922DD989D362366392F7DCCBFB2279947FFEFA7BF8611552E7190B49381BB9278363D7C1CCE70161CB911BABC5BB1FDC0FEFBFFE6A7815842BE74BBEEE4CAF03492647EE9352D1B9E749FF0987480E42E20B2EF9420D7C1E7A28E0DEE9F1F18FDEC9898701C2052CC719DEC74C9110273FE0E798331F472A46F4860798CA6C1C666609AA738B422C23E4E3913B7BE211183746420DD2D5AE734109024B66982E5C0731C6155260E7F96789674A70B69C453080E8C33AC2B06E81A8C499FDE7E5F2AE5B393ED55BF14AC11CCA8FA5E2614FC093B3CC379E29BE9387DDC277E0BD2BF0B25AEB5D271E1CB963A4F0928BB5EB98CACEC754E8854D0E1EE462474E65F2A84807C81AFDEFC819C754C5028F188E9540F4C899C6734AFC8F78FDC07FC56CC4624AAB06828930571B80A1A9E011166A7D8F17A5D993C075BCBAA867CA169275B1745B13A6CE4E5DE7164C40738A8B2CA8B860A6B8C03F638605EC379822A5B080204E029CF8D132C056977849FFCAB542FA81BB5CE706AD3E61B6544F5063DF43ED5C93150EF291CC92CF8C40E1819012316EB0D4D07E8B9EC93231DCB023123C887D0575718F69B2403E91282D8FC1349B7C2C53E15AF0F09E6B45D6E4E303124BAC6037BC6DC58CC7C237AC1B7A65E66DCCC769616AAF7CCCC5DE2A1F7749C64366E28132D0D03A15C42FD45E7270757F8C498896F8B3A01BAC87FF76B27E6BB16E8F48D78A2B6B69FF8ACBEBA9BDE2F29ADCA9E22E8290B09EE596C8BC55ADC1192E76A9B75CEE5035774D84545B0AAF6BEAF62C9A4FE8AD345F8588BC44ADF654AB63FB361B9E22297FE72238BC66B8232F88080F65405B43B99092FB24A918E30C2FFB5B7D1F572C70B636BB742FD576095B828E4222E82160C6C8FDCE72D026E0E2DE520297EDB70E7CE29A4DE88E5D628A15762EFCF41A3F46D247811D22F051501F81BE85856E188842C0247442C294DDE408F34984E836F30DC1EE77636D5BA1C59CB9C41166BAAB6D0BCB5EEA0B2D86CBB67968E85552CC3ECA404681041699FE9BF5E5DC8731BC520DA71A348AEC609359D69B29A4316758D50F728221FDCAFCB712C84AC43A4A7901B730CAECDE82A15B5C1340767E1BD2159795100D178FCABAD6DB8919C92EF55B585FDDBC95135D0AB682540D865978F50D37F4AD224F4A2EC14BC9849C74F05A5887E10D8AF43DA7C2426423CE2CA520C6EF66FDDFE6618AE1F9B2E1895E585B6882CB08DC848D597D0A0438B9695C2285E64877ED71105ACBAA55D19267B9262BF1EDA8E529988BE8FFA7621BB88286EE91C95FC3CE42DD7E921B971DF006D18409421489E65BFC98D338641B1BD2468CCAB3DD80AACCD88843CFD891D5042DDF59E7473D1A9D625554D89E919AB6E0748854BB689B97CD30F58B911D9BB698B421648FD32A4436D41DA37C9CD676528CF6CAB9CE79FB4659961E407BA6587A5AF5CFAF16B93677E66FBDAA3F9BDF8D9B502A2FB82A5065B83B56F924AB4295A3DD91B2275615261BEA8E51BE974C0FF52EA3E2F951ABA462B4470998EF995A319893072E0BEB16612E29B417B709E3D630CC4EF0ED1F34AC233D5DE23AE0B06712E8E37CB6960A8703BD6030FB8D8E2981FD960B6E10230B2C554AB4B8A7C727A7C63791FFCEF7094FCA8076FC48F1465F0A88F6ED5636A8EFF3BDE1E3007B46C27F42C22667777A9AB7B3EB07A7B85FC5852FE0BA2DA4F58272A4F6E6AC73DBBE09D1EADB2A5A6F5E3A71A3F5A89DC0B37A3572FF4824CE9DC92F8F89D0917327A0199C3BC7CE9F2F95410DE7F02159DB5749238BA86D8DD74EE4EB7E683542753F289324DD0FCDE41DF7436B2133FB80BE064159122587E60D6D6A64475274270272C39BFD3509C7FF05C168332E9D28C4F5460231BDE28DDC60CE21CE698E6FA0BB4C1DD32E0463938ECEF4634633B6D18F4DD8C9948D7C186AD2F47A9D4FEA4245D6245BFDF422C4A3FD3480ACADFC4514148C24CB1242FF7D14C37E2D5F8B3513B6E079D51816E54B8CE67B83150A20992F84220BE42B98F6B194C967A42F88C6C93134C7C184DDC52A8A156C1987735A73A32EBF4DFA1376B56EF3F02E4ABE8CBFC416C04C025BC077ECA798D0A0B0FBBAE19C6881D0759DDD2A742C95BE5D2CD705D22D671D8132F715EDE8018711053079C766E819EF621B1CDD9FF012F9EBFC85D70EB23D1075B70F2F095A0A14CA0CA394879F90C341B87AFF2FD7BF056418280000, N'6.4.4')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202009021510258_Migration Add-EmailModel', N'ShopingCart.Models.MyDbcontext', 0x1F8B0800000000000400D55ACB6EE33614DD17E83F085AB545C6CA0305DAC09E41EA24853193C4883383EE025AA21DA214A992546AA3E89775D14FEA2FF4526F91922DD989D362366392F7DCCBFB2279947FFEFA7BF8611552E7190B49381BB9278363D7C1CCE70161CB911BABC5BB1FDC0FEFBFFE6A7815842BE74BBEEE4CAF03492647EE9352D1B9E749FF0987480E42E20B2EF9420D7C1E7A28E0DEE9F1F18FDEC9898701C2052CC719DEC74C9110273FE0E798331F472A46F4860798CA6C1C666609AA738B422C23E4E3913B7BE211183746420DD2D5AE734109024B66982E5C0731C6155260E7F96789674A70B69C453080E8C33AC2B06E81A8C499FDE7E5F2AE5B393ED55BF14AC11CCA8FA5E2614FC093B3CC379E29BE9387DDC277E0BD2BF0B25AEB5D271E1CB963A4F0928BB5EB98CACEC754E8854D0E1EE462474E65F2A84807C81AFDEFC819C754C5028F188E9540F4C899C6734AFC8F78FDC07FC56CC4624AAB06828930571B80A1A9E011166A7D8F17A5D993C075BCBAA867CA169275B1745B13A6CE4E5DE7164C40738A8B2CA8B860A6B8C03F638605EC379822A5B080204E029CF8D132C056977849FFCAB542FA81BB5CE706AD3E61B6544F5063DF43ED5C93150EF291CC92CF8C40E1819012316EB0D4D07E8B9EC93231DCB023123C887D0575718F69B2403E91282D8FC1349B7C2C53E15AF0F09E6B45D6E4E303124BAC6037BC6DC58CC7C237AC1B7A65E66DCCC769616AAF7CCCC5DE2A1F7749C64366E28132D0D03A15C42FD45E7270757F8C498896F8B3A01BAC87FF76B27E6BB16E8F48D78A2B6B69FF8ACBEBA9BDE2F29ADCA9E22E8290B09EE596C8BC55ADC1192E76A9B75CEE5035774D84545B0AAF6BEAF62C9A4FE8AD345F8588BC44ADF654AB63FB361B9E22297FE72238BC66B8232F88080F65405B43B99092FB24A918E30C2FFB5B7D1F572C70B636BB742FD576095B828E4222E82160C6C8FDCE72D026E0E2DE520297EDB70E7CE29A4DE88E5D628A15762EFCF41A3F46D247811D22F051501F81BE85856E188842C0247442C294DDE408F34984E836F30DC1EE77636D5BA1C59CB9C41166BAAB6D0BCB5EEA0B2D86CBB67968E85552CC3ECA404681041699FE9BF5E5DC8731BC520DA71A348AEC609359D69B29A4316758D50F728221FDCAFCB712C84AC43A4A7901B730CAECDE82A15B5C1340767E1BD2159795100D178FCABAD6DB8919C92EF55B585FDDBC95135D0AB682540D865978F50D37F4AD224F4A2EC14BC9849C74F05A5887E10D8AF43DA7C2426423CE2CA520C6EF66FDDFE6618AE1F9B2E1895E585B6882CB08DC848D597D0A0438B9695C2285E64877ED71105ACBAA55D19267B9262BF1EDA8E529988BE8FFA7621BB88286EE91C95FC3CE42DD7E921B971DF006D18409421489E65BFC98D338641B1BD2468CCAB3DD80AACCD88843CFD891D5042DDF59E7473D1A9D625554D89E919AB6E0748854BB689B97CD30F58B911D9BB698B421648FD32A4436D41DA37C9CD676528CF6CAB9CE79FB4659961E407BA6587A5AF5CFAF16B93677E66FBDAA3F9BDF8D9B502A2FB82A5065B83B56F924AB4295A3DD91B2275615261BEA8E51BE974C0FF52EA3E2F951ABA462B4470998EF995A319893072E0BEB16612E29B417B709E3D630CC4EF0ED1F34AC233D5DE23AE0B06712E8E37CB6960A8703BD6030FB8D8E2981FD960B6E10230B2C554AB4B8A7C727A7C63791FFCEF7094FCA8076FC48F1465F0A88F6ED5636A8EFF3BDE1E3007B46C27F42C22667777A9AB7B3EB07A7B85FC5852FE0BA2DA4F58272A4F6E6AC73DBBE09D1EADB2A5A6F5E3A71A3F5A89DC0B37A3572FF4824CE9DC92F8F89D0917327A0199C3BC7CE9F2F95410DE7F02159DB5749238BA86D8DD74EE4EB7E683542753F289324DD0FCDE41DF7436B2133FB80BE064159122587E60D6D6A64475274270272C39BFD3509C7FF05C168332E9D28C4F5460231BDE28DDC60CE21CE698E6FA0BB4C1DD32E0463938ECEF4634633B6D18F4DD8C9948D7C186AD2F47A9D4FEA4245D6245BFDF422C4A3FD3480ACADFC4514148C24CB1242FF7D14C37E2D5F8B3513B6E079D51816E54B8CE67B83150A20992F84220BE42B98F6B194C967A42F88C6C93134C7C184DDC52A8A156C1987735A73A32EBF4DFA1376B56EF3F02E4ABE8CBFC416C04C025BC077ECA798D0A0B0FBBAE19C6881D0759DDD2A742C95BE5D2CD705D22D671D8132F715EDE8018711053079C766E819EF621B1CDD9FF012F9EBFC85D70EB23D1075B70F2F095A0A14CA0CA394879F90C341B87AFF2FD7BF056418280000, N'6.4.4')
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [ConfirmPassword]) VALUES (1, N'Oregbemi', N'Afolabi', N'oregbemiafolabi@gmail.com', N'Afoore', N'Paswword50.', N'Password50.')
INSERT [dbo].[Admins] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [ConfirmPassword]) VALUES (3, N'Gbenga ', N'Anjorin', N'gaj@firstbanknigeria.com', N'Gbengus', N'Password', N'Password')
INSERT [dbo].[Admins] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [ConfirmPassword]) VALUES (4, N'Akin', N'Ade', N'kade@gmail.com', N'Kade', N'yusuf', N'yusuf')
INSERT [dbo].[Admins] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [ConfirmPassword]) VALUES (5, N'Akin', N'Ade', N'kade@gmail.com', N'Kade', N'yusuf', N'yusuf')
INSERT [dbo].[Admins] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [ConfirmPassword]) VALUES (6, N'Blessing', N'Awodele', N'bawodele@gmail.com', N'bawdle', N'FBNGI', N'fbngi')
INSERT [dbo].[Admins] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [ConfirmPassword]) VALUES (7, N'James', N'Aderemi', N'Ader@gmail.com', N'Adr', N'7777', N'7777')
INSERT [dbo].[Admins] ([UserId], [FirstName], [LastName], [Email], [UserName], [Password], [ConfirmPassword]) VALUES (8, N'Abdulraheed', N'Ahmad', N'Ahmad@Yahoo.com', N'Abd', N'9987', N'9987')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatId], [CategoryName]) VALUES (1, N'Swallow')
INSERT [dbo].[Categories] ([CatId], [CategoryName]) VALUES (2, N'Non-Swallow')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [imageUrl], [CatId], [Price]) VALUES (1, N'Ofada Rice', N'Ofada small banner.jpg', 2, 2000)
INSERT [dbo].[Products] ([Id], [Name], [imageUrl], [CatId], [Price]) VALUES (2, N'Yam Porrage', N'YAMCOPY.jpg', 2, 400)
INSERT [dbo].[Products] ([Id], [Name], [imageUrl], [CatId], [Price]) VALUES (3, N'Spaggethi', N'SPAGETTI.jpg', 1, 600)
INSERT [dbo].[Products] ([Id], [Name], [imageUrl], [CatId], [Price]) VALUES (4, N'Semo', N'semovitaa.jpg', 1, 800)
INSERT [dbo].[Products] ([Id], [Name], [imageUrl], [CatId], [Price]) VALUES (5, N'porrage', N'porragecopy.jpg', 2, 600)
INSERT [dbo].[Products] ([Id], [Name], [imageUrl], [CatId], [Price]) VALUES (6, N'Beans', N'beanscopy.jpg', 2, 900)
INSERT [dbo].[Products] ([Id], [Name], [imageUrl], [CatId], [Price]) VALUES (7, N'Pounded Yam', N'poundedyam.jpg', 1, 1200)
INSERT [dbo].[Products] ([Id], [Name], [imageUrl], [CatId], [Price]) VALUES (8, N'Amala', N'amalaedit.jpg', 1, 700)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_CatId]    Script Date: 9/11/2020 7:07:37 AM ******/
CREATE NONCLUSTERED INDEX [IX_CatId] ON [dbo].[Products]
(
	[CatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CatId] FOREIGN KEY([CatId])
REFERENCES [dbo].[Categories] ([CatId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CatId]
GO
USE [master]
GO
ALTER DATABASE [CareerDB] SET  READ_WRITE 
GO
