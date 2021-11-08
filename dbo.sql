/*
 Navicat Premium Data Transfer

 Source Server         : Soluciones UN
 Source Server Type    : SQL Server
 Source Server Version : 13005026
 Source Host           : 192.168.10.30:1433
 Source Catalog        : PanaderiaDB
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 13005026
 File Encoding         : 65001

 Date: 05/11/2021 14:29:23
*/


-- ----------------------------
-- Table structure for ajuste
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[ajuste]') AND type IN ('U'))
	DROP TABLE [dbo].[ajuste]
GO

CREATE TABLE [dbo].[ajuste] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [fecha] date  NOT NULL,
  [usuario] int  NOT NULL
)
GO

ALTER TABLE [dbo].[ajuste] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for articulo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[articulo]') AND type IN ('U'))
	DROP TABLE [dbo].[articulo]
GO

CREATE TABLE [dbo].[articulo] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [Codigo] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [Descripcion] varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [cantidad] int  NOT NULL,
  [precio] decimal(18,2)  NOT NULL
)
GO

ALTER TABLE [dbo].[articulo] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for cliente
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[cliente]') AND type IN ('U'))
	DROP TABLE [dbo].[cliente]
GO

CREATE TABLE [dbo].[cliente] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[cliente] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for compra
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[compra]') AND type IN ('U'))
	DROP TABLE [dbo].[compra]
GO

CREATE TABLE [dbo].[compra] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [fecha] date  NOT NULL,
  [idProveedor] int  NOT NULL,
  [usuario] int  NOT NULL
)
GO

ALTER TABLE [dbo].[compra] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for detalleAjuste
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[detalleAjuste]') AND type IN ('U'))
	DROP TABLE [dbo].[detalleAjuste]
GO

CREATE TABLE [dbo].[detalleAjuste] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [idAjuste] int  NOT NULL,
  [articulo] int  NOT NULL,
  [cantidad] int  NOT NULL
)
GO

ALTER TABLE [dbo].[detalleAjuste] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for detalleCompra
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[detalleCompra]') AND type IN ('U'))
	DROP TABLE [dbo].[detalleCompra]
GO

CREATE TABLE [dbo].[detalleCompra] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [idCompra] int  NOT NULL,
  [articulo] int  NOT NULL,
  [cantidad] int  NOT NULL,
  [precio] decimal(18,2)  NOT NULL
)
GO

ALTER TABLE [dbo].[detalleCompra] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for detalleDevolucion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[detalleDevolucion]') AND type IN ('U'))
	DROP TABLE [dbo].[detalleDevolucion]
GO

CREATE TABLE [dbo].[detalleDevolucion] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [IdDevolcion] int  NOT NULL,
  [articulo] int  NOT NULL,
  [cantidad] int  NOT NULL
)
GO

ALTER TABLE [dbo].[detalleDevolucion] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for devolucion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[devolucion]') AND type IN ('U'))
	DROP TABLE [dbo].[devolucion]
GO

CREATE TABLE [dbo].[devolucion] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [fecha] date  NOT NULL,
  [cliente] int  NOT NULL,
  [usuario] int  NOT NULL,
  [observaciones] varchar(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[devolucion] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[proveedor]') AND type IN ('U'))
	DROP TABLE [dbo].[proveedor]
GO

CREATE TABLE [dbo].[proveedor] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nombre] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [nit] varchar(18) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [direccion] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[proveedor] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for usuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario]') AND type IN ('U'))
	DROP TABLE [dbo].[usuario]
GO

CREATE TABLE [dbo].[usuario] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [username] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [clave] varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [tipo] int  NOT NULL
)
GO

ALTER TABLE [dbo].[usuario] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Auto increment value for ajuste
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[ajuste]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table ajuste
-- ----------------------------
ALTER TABLE [dbo].[ajuste] ADD CONSTRAINT [PK__ajuste__3213E83FC8426373] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for articulo
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[articulo]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table articulo
-- ----------------------------
ALTER TABLE [dbo].[articulo] ADD CONSTRAINT [PK__articulo__3213E83FFB741EFD] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for cliente
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[cliente]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table cliente
-- ----------------------------
ALTER TABLE [dbo].[cliente] ADD CONSTRAINT [PK__cliente__3213E83F604EA6A9] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for compra
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[compra]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table compra
-- ----------------------------
ALTER TABLE [dbo].[compra] ADD CONSTRAINT [PK__compra__3213E83FF2B99F3F] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for detalleAjuste
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[detalleAjuste]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table detalleAjuste
-- ----------------------------
ALTER TABLE [dbo].[detalleAjuste] ADD CONSTRAINT [PK__detalleA__3213E83F8785023F] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for detalleCompra
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[detalleCompra]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table detalleCompra
-- ----------------------------
ALTER TABLE [dbo].[detalleCompra] ADD CONSTRAINT [PK__detalleC__3213E83F77A8BA1F] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for detalleDevolucion
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[detalleDevolucion]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table detalleDevolucion
-- ----------------------------
ALTER TABLE [dbo].[detalleDevolucion] ADD CONSTRAINT [PK__detalleD__3213E83F31AE9E3F] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for devolucion
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[devolucion]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table devolucion
-- ----------------------------
ALTER TABLE [dbo].[devolucion] ADD CONSTRAINT [PK__devoluci__3213E83F25FA8244] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for proveedor
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[proveedor]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table proveedor
-- ----------------------------
ALTER TABLE [dbo].[proveedor] ADD CONSTRAINT [PK__proveedo__3213E83FA4218257] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for usuario
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[usuario]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table usuario
-- ----------------------------
ALTER TABLE [dbo].[usuario] ADD CONSTRAINT [PK__usuario__3213E83F01433142] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table ajuste
-- ----------------------------
ALTER TABLE [dbo].[ajuste] ADD CONSTRAINT [FK_ajuste_Usuario] FOREIGN KEY ([usuario]) REFERENCES [dbo].[usuario] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table compra
-- ----------------------------
ALTER TABLE [dbo].[compra] ADD CONSTRAINT [FK_compra_Proveedor] FOREIGN KEY ([idProveedor]) REFERENCES [dbo].[proveedor] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[compra] ADD CONSTRAINT [FK_compra_Usuario] FOREIGN KEY ([usuario]) REFERENCES [dbo].[usuario] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table detalleAjuste
-- ----------------------------
ALTER TABLE [dbo].[detalleAjuste] ADD CONSTRAINT [FK_DetAjuste_Ajuste] FOREIGN KEY ([idAjuste]) REFERENCES [dbo].[ajuste] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[detalleAjuste] ADD CONSTRAINT [FK_DETAJUSTE_Articulo] FOREIGN KEY ([articulo]) REFERENCES [dbo].[articulo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table detalleCompra
-- ----------------------------
ALTER TABLE [dbo].[detalleCompra] ADD CONSTRAINT [FK_DETCOMPRA_COMPRA] FOREIGN KEY ([idCompra]) REFERENCES [dbo].[compra] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[detalleCompra] ADD CONSTRAINT [FK_DETCOMPRA_ARTICULO] FOREIGN KEY ([articulo]) REFERENCES [dbo].[articulo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table detalleDevolucion
-- ----------------------------
ALTER TABLE [dbo].[detalleDevolucion] ADD CONSTRAINT [FK_DetDevolucion_Devolucion] FOREIGN KEY ([IdDevolcion]) REFERENCES [dbo].[devolucion] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[detalleDevolucion] ADD CONSTRAINT [FK_DetDevolucion_articulo] FOREIGN KEY ([articulo]) REFERENCES [dbo].[articulo] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table devolucion
-- ----------------------------
ALTER TABLE [dbo].[devolucion] ADD CONSTRAINT [FK_Devolucion_Compra] FOREIGN KEY ([cliente]) REFERENCES [dbo].[cliente] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[devolucion] ADD CONSTRAINT [FK_Devolucion_Usuario] FOREIGN KEY ([usuario]) REFERENCES [dbo].[usuario] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

