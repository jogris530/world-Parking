USE [master]
GO
/****** Object:  Database [Parking]    Script Date: 2017/09/04 7:20:24 p.m. ******/
CREATE DATABASE [Parking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Parking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Parking.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Parking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Parking_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Parking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Parking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Parking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Parking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Parking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Parking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Parking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Parking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Parking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Parking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Parking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Parking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Parking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Parking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Parking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Parking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Parking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Parking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Parking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Parking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Parking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Parking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Parking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Parking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Parking] SET RECOVERY FULL 
GO
ALTER DATABASE [Parking] SET  MULTI_USER 
GO
ALTER DATABASE [Parking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Parking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Parking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Parking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Parking] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Parking]
GO
/****** Object:  Table [dbo].[bahias]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bahias](
	[idBahias] [int] IDENTITY(1,1) NOT NULL,
	[TipoBahia] [int] NOT NULL,
	[EstadoBahia] [bit] NOT NULL,
 CONSTRAINT [PK_bahias_idBahias] PRIMARY KEY CLUSTERED 
(
	[idBahias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[colorvehiculo]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colorvehiculo](
	[idColorVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[ColorVehiculo] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_colorvehiculo_idColorVehiculo] PRIMARY KEY CLUSTERED 
(
	[idColorVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[facturacion]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturacion](
	[NumeroFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdVehiculo] [int] NOT NULL,
	[IdPersona] [int] NOT NULL,
	[Fecha_enrtada] [datetime] NOT NULL,
	[Fecha_salida] [datetime] NOT NULL,
	[Entrada] [bit] NOT NULL,
	[Bahia] [int] NOT NULL,
	[FacturaPermanente] [bit] NOT NULL,
 CONSTRAINT [PK_facturacion_NumeroFactura] PRIMARY KEY CLUSTERED 
(
	[NumeroFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [facturacion$IdFactura_UNIQUE] UNIQUE NONCLUSTERED 
(
	[NumeroFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historicoactpersonas]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historicoactpersonas](
	[idHistoricoActPersonas] [int] IDENTITY(1,1) NOT NULL,
	[idPersonas] [int] NOT NULL,
	[FechaEdicion] [datetime] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Documento] [nvarchar](15) NOT NULL,
	[Correo] [nvarchar](45) NOT NULL,
	[Direccion] [nvarchar](60) NOT NULL,
	[TipoDocumento] [int] NOT NULL,
	[Rol] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Sexo] [int] NOT NULL,
 CONSTRAINT [PK_historicoactpersonas_idHistoricoActPersonas] PRIMARY KEY CLUSTERED 
(
	[idHistoricoActPersonas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [historicoactpersonas$idHistoricoPersonas_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idHistoricoActPersonas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historicofacturacion]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historicofacturacion](
	[idHistoricoFacturacion] [int] IDENTITY(1,1) NOT NULL,
	[NumeroFactura] [int] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
	[IdPersona] [int] NOT NULL,
	[FechaEntrada] [datetime] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[Bahia] [int] NOT NULL,
	[FacturaPermanente] [int] NOT NULL,
	[ValorPagado] [float] NOT NULL,
 CONSTRAINT [PK_historicofacturacion_idHistoricoFacturacion] PRIMARY KEY CLUSTERED 
(
	[idHistoricoFacturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [historicofacturacion$idHistoricoRegistros_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idHistoricoFacturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[historicotelefonos]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historicotelefonos](
	[idHistoricoTelefonos] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[FechaEdicion] [datetime] NOT NULL,
	[TipoTelefono] [int] NOT NULL,
	[NumeroTelefono] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_historicotelefonos_idHistoricoTelefonos] PRIMARY KEY CLUSTERED 
(
	[idHistoricoTelefonos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [historicotelefonos$idHistoricoTelefonos_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idHistoricoTelefonos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marcasvehiculo]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcasvehiculo](
	[idMarcasVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[MarcasVehiculo] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_marcasvehiculo_idMarcasVehiculo] PRIMARY KEY CLUSTERED 
(
	[idMarcasVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[personas]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas](
	[idPersonas] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Documento] [nvarchar](15) NOT NULL,
	[Correo] [nvarchar](45) NOT NULL,
	[Direccion] [nvarchar](60) NOT NULL,
	[TipoDocumento] [int] NOT NULL,
	[Rol] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[CodSexo] [int] NOT NULL,
 CONSTRAINT [PK_personas_idPersonas] PRIMARY KEY CLUSTERED 
(
	[idPersonas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [personas$Documento_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionRol] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_roles_IdRol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sexo]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sexo](
	[idSexo] [int] IDENTITY(1,1) NOT NULL,
	[Sexo] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_sexo_idSexo] PRIMARY KEY CLUSTERED 
(
	[idSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [sexo$idSexo_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [sexo$Sexo_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Sexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taifaperiodica]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taifaperiodica](
	[idTaifaPeriodica] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](25) NOT NULL,
	[ValorPleno] [real] NOT NULL,
 CONSTRAINT [PK_taifaperiodica_idTaifaPeriodica] PRIMARY KEY CLUSTERED 
(
	[idTaifaPeriodica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [taifaperiodica$Descripcion_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tarifasminuto]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tarifasminuto](
	[idTarifasMin] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](25) NOT NULL,
	[ValorMinuto] [real] NOT NULL,
 CONSTRAINT [PK_tarifasminuto_idTarifasMin] PRIMARY KEY CLUSTERED 
(
	[idTarifasMin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [tarifasminuto$Descripcion_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [tarifasminuto$idTarifas_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idTarifasMin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[telefonodetalle]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefonodetalle](
	[idTelefonoDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[TipoTelefono] [int] NOT NULL,
	[NumeroTelefono] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_telefonodetalle_idTelefonoDetalle] PRIMARY KEY CLUSTERED 
(
	[idTelefonoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [telefonodetalle$idTelefonoDetalle_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idTelefonoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipobahia]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipobahia](
	[idTipoBahia] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_tipobahia_idTipoBahia] PRIMARY KEY CLUSTERED 
(
	[idTipoBahia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [tipobahia$Descripcion_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipodocumento]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipodocumento](
	[idTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[TipoDocumento] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_tipodocumento_idTipoDocumento] PRIMARY KEY CLUSTERED 
(
	[idTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipotelefono]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipotelefono](
	[idTipoTelefono] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_tipotelefono_idTipoTelefono] PRIMARY KEY CLUSTERED 
(
	[idTipoTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [tipotelefono$Descripcion_UNIQUE] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [tipotelefono$idTipoTelefono_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idTipoTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipovehiculo]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipovehiculo](
	[idTipoVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](35) NOT NULL,
	[Tarifa] [int] NOT NULL,
	[TarifaPeriodica] [int] NOT NULL,
 CONSTRAINT [PK_tipovehiculo_idTipoVehiculo] PRIMARY KEY CLUSTERED 
(
	[idTipoVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vehiculos]    Script Date: 2017/09/04 7:20:25 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculos](
	[idVehiculos] [int] IDENTITY(1,1) NOT NULL,
	[Placa] [nvarchar](15) NOT NULL,
	[Color] [int] NOT NULL,
	[Modelo] [int] NOT NULL,
	[Marca] [int] NOT NULL,
	[TipoVehiculo] [int] NOT NULL,
 CONSTRAINT [PK_vehiculos_idVehiculos] PRIMARY KEY CLUSTERED 
(
	[idVehiculos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IdTipoBahia_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdTipoBahia_idx] ON [dbo].[bahias]
(
	[TipoBahia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdBahia_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdBahia_idx] ON [dbo].[facturacion]
(
	[Bahia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdPersona_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdPersona_idx] ON [dbo].[facturacion]
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdVehiculo_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdVehiculo_idx] ON [dbo].[facturacion]
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [CodSexo_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [CodSexo_idx] ON [dbo].[personas]
(
	[CodSexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [TipoDoc_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [TipoDoc_idx] ON [dbo].[personas]
(
	[TipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [TipoRol_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [TipoRol_idx] ON [dbo].[personas]
(
	[Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdPersonaTd_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdPersonaTd_idx] ON [dbo].[telefonodetalle]
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdTipoTelefono_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdTipoTelefono_idx] ON [dbo].[telefonodetalle]
(
	[TipoTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdTarifaVeh_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdTarifaVeh_idx] ON [dbo].[tipovehiculo]
(
	[Tarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdTarifaVehPer_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdTarifaVehPer_idx] ON [dbo].[tipovehiculo]
(
	[TarifaPeriodica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdColorVeh_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdColorVeh_idx] ON [dbo].[vehiculos]
(
	[Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdMarca_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdMarca_idx] ON [dbo].[vehiculos]
(
	[Marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IdTipoVeh_idx]    Script Date: 2017/09/04 7:20:25 p.m. ******/
CREATE NONCLUSTERED INDEX [IdTipoVeh_idx] ON [dbo].[vehiculos]
(
	[TipoVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bahias] ADD  DEFAULT ((0)) FOR [EstadoBahia]
GO
ALTER TABLE [dbo].[facturacion] ADD  DEFAULT (getdate()) FOR [Fecha_enrtada]
GO
ALTER TABLE [dbo].[facturacion] ADD  DEFAULT (getdate()) FOR [Fecha_salida]
GO
ALTER TABLE [dbo].[facturacion] ADD  DEFAULT ((0)) FOR [FacturaPermanente]
GO
ALTER TABLE [dbo].[historicoactpersonas] ADD  DEFAULT (getdate()) FOR [FechaEdicion]
GO
ALTER TABLE [dbo].[historicofacturacion] ADD  DEFAULT (getdate()) FOR [FechaEntrada]
GO
ALTER TABLE [dbo].[historicofacturacion] ADD  DEFAULT (getdate()) FOR [FechaSalida]
GO
ALTER TABLE [dbo].[historicotelefonos] ADD  DEFAULT (getdate()) FOR [FechaEdicion]
GO
ALTER TABLE [dbo].[personas] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[bahias]  WITH CHECK ADD  CONSTRAINT [bahias$IdTipoBahia] FOREIGN KEY([TipoBahia])
REFERENCES [dbo].[tipobahia] ([idTipoBahia])
GO
ALTER TABLE [dbo].[bahias] CHECK CONSTRAINT [bahias$IdTipoBahia]
GO
ALTER TABLE [dbo].[facturacion]  WITH CHECK ADD  CONSTRAINT [facturacion$IdBahia] FOREIGN KEY([Bahia])
REFERENCES [dbo].[bahias] ([idBahias])
GO
ALTER TABLE [dbo].[facturacion] CHECK CONSTRAINT [facturacion$IdBahia]
GO
ALTER TABLE [dbo].[facturacion]  WITH CHECK ADD  CONSTRAINT [facturacion$IdPersona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[personas] ([idPersonas])
GO
ALTER TABLE [dbo].[facturacion] CHECK CONSTRAINT [facturacion$IdPersona]
GO
ALTER TABLE [dbo].[facturacion]  WITH CHECK ADD  CONSTRAINT [facturacion$IdVehiculo] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[vehiculos] ([idVehiculos])
GO
ALTER TABLE [dbo].[facturacion] CHECK CONSTRAINT [facturacion$IdVehiculo]
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [personas$CodSexo] FOREIGN KEY([CodSexo])
REFERENCES [dbo].[sexo] ([idSexo])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [personas$CodSexo]
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [personas$TipoDoc] FOREIGN KEY([TipoDocumento])
REFERENCES [dbo].[tipodocumento] ([idTipoDocumento])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [personas$TipoDoc]
GO
ALTER TABLE [dbo].[personas]  WITH CHECK ADD  CONSTRAINT [personas$TipoRol] FOREIGN KEY([Rol])
REFERENCES [dbo].[roles] ([IdRol])
GO
ALTER TABLE [dbo].[personas] CHECK CONSTRAINT [personas$TipoRol]
GO
ALTER TABLE [dbo].[telefonodetalle]  WITH CHECK ADD  CONSTRAINT [telefonodetalle$IdPersonaTd] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[personas] ([idPersonas])
GO
ALTER TABLE [dbo].[telefonodetalle] CHECK CONSTRAINT [telefonodetalle$IdPersonaTd]
GO
ALTER TABLE [dbo].[telefonodetalle]  WITH CHECK ADD  CONSTRAINT [telefonodetalle$IdTipoTelefono] FOREIGN KEY([TipoTelefono])
REFERENCES [dbo].[tipotelefono] ([idTipoTelefono])
GO
ALTER TABLE [dbo].[telefonodetalle] CHECK CONSTRAINT [telefonodetalle$IdTipoTelefono]
GO
ALTER TABLE [dbo].[tipovehiculo]  WITH CHECK ADD  CONSTRAINT [tipovehiculo$IdTarifaVeh] FOREIGN KEY([Tarifa])
REFERENCES [dbo].[tarifasminuto] ([idTarifasMin])
GO
ALTER TABLE [dbo].[tipovehiculo] CHECK CONSTRAINT [tipovehiculo$IdTarifaVeh]
GO
ALTER TABLE [dbo].[tipovehiculo]  WITH CHECK ADD  CONSTRAINT [tipovehiculo$IdTarifaVehPer] FOREIGN KEY([TarifaPeriodica])
REFERENCES [dbo].[taifaperiodica] ([idTaifaPeriodica])
GO
ALTER TABLE [dbo].[tipovehiculo] CHECK CONSTRAINT [tipovehiculo$IdTarifaVehPer]
GO
ALTER TABLE [dbo].[vehiculos]  WITH CHECK ADD  CONSTRAINT [vehiculos$IdColorVeh] FOREIGN KEY([Color])
REFERENCES [dbo].[colorvehiculo] ([idColorVehiculo])
GO
ALTER TABLE [dbo].[vehiculos] CHECK CONSTRAINT [vehiculos$IdColorVeh]
GO
ALTER TABLE [dbo].[vehiculos]  WITH CHECK ADD  CONSTRAINT [vehiculos$IdMarcaVeh] FOREIGN KEY([Marca])
REFERENCES [dbo].[marcasvehiculo] ([idMarcasVehiculo])
GO
ALTER TABLE [dbo].[vehiculos] CHECK CONSTRAINT [vehiculos$IdMarcaVeh]
GO
ALTER TABLE [dbo].[vehiculos]  WITH CHECK ADD  CONSTRAINT [vehiculos$IdTipoVeh] FOREIGN KEY([TipoVehiculo])
REFERENCES [dbo].[tipovehiculo] ([idTipoVehiculo])
GO
ALTER TABLE [dbo].[vehiculos] CHECK CONSTRAINT [vehiculos$IdTipoVeh]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.bahias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'bahias'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.colorvehiculo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'colorvehiculo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.facturacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'facturacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.historicoactpersonas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'historicoactpersonas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.historicofacturacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'historicofacturacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.historicotelefonos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'historicotelefonos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.marcasvehiculo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'marcasvehiculo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.personas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'personas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.roles' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'roles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.sexo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sexo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.taifaperiodica' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'taifaperiodica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.tarifasminuto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tarifasminuto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.telefonodetalle' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'telefonodetalle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.tipobahia' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipobahia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.tipodocumento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipodocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.tipotelefono' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipotelefono'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.tipovehiculo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tipovehiculo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'parking.vehiculos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'vehiculos'
GO
USE [master]
GO
ALTER DATABASE [Parking] SET  READ_WRITE 
GO
