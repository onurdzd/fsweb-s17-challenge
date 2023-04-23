-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.

CREATE TABLE [dbo].[ilanlar](
	[ilan_id] [int] NOT NULL,
	[ilan_ad] [nvarchar](50) NOT NULL,
	[ilan_tarih] [date] NOT NULL,
	[ilan_aciklama] [nvarchar](50) NOT NULL,
	[ilan_sure] [int] NOT NULL,
	[kullanici_id] [nchar](10) NOT NULL,
	[kategori_id] [int] NOT NULL,
     CONSTRAINT [PK_ilanlar] PRIMARY KEY CLUSTERED 
)

CREATE TABLE [dbo].[kullanicilar](
	[kullanici_id] [nchar](10) NOT NULL,
	[ad] [nvarchar](50) NOT NULL,
	[soyad] [nvarchar](50) NOT NULL,
	[adres] [nvarchar](50) NOT NULL,
	[kayit_tarih] [date] NOT NULL,
     CONSTRAINT [PK_kullanicilar] PRIMARY KEY CLUSTERED
)

CREATE TABLE [dbo].[kategori](
	[kategori_id] [int] NOT NULL,
	[kategori_tur] [nvarchar](50) NOT NULL,
     CONSTRAINT [PK_kategori] PRIMARY KEY CLUSTERED 
)

CREATE TABLE [dbo].[ilanlar_ilan_ozellik](
	[ilanlar_ilan_ozellik_id] [int] NOT NULL,
	[ilan_ozellik_id] [int] NOT NULL,
	[ilan_id] [int] NOT NULL,
    CONSTRAINT [PK_ilanlar_ilan_ozellik] PRIMARY KEY CLUSTERED 
)

CREATE TABLE [dbo].[ilan_ozellik](
	[ilan_ozellik_id] [int] NOT NULL,
	[ilan_id] [int] NOT NULL,
	[ilan_ozellik_tur] [nvarchar](50) NOT NULL,
    CONSTRAINT [PK_ilan_ozellik] PRIMARY KEY CLUSTERED 
)

CREATE TABLE [dbo].[favoriler](
	[favori_id] [nchar](10) NOT NULL,
	[ilan_id] [int] NOT NULL,
	[kullanici_id] [nchar](10) NOT NULL,
    CONSTRAINT [PK_favoriler] PRIMARY KEY CLUSTERED 
)

ALTER TABLE [dbo].[favoriler]  WITH CHECK ADD  CONSTRAINT [FK_favoriler_ilanlar] FOREIGN KEY([ilan_id])
REFERENCES [dbo].[ilanlar] ([ilan_id])

ALTER TABLE [dbo].[favoriler] CHECK CONSTRAINT [FK_favoriler_ilanlar]

ALTER TABLE [dbo].[favoriler]  WITH CHECK ADD  CONSTRAINT [FK_favoriler_kullanicilar] FOREIGN KEY([kullanici_id])
REFERENCES [dbo].[kullanicilar] ([kullanici_id])

ALTER TABLE [dbo].[favoriler] CHECK CONSTRAINT [FK_favoriler_kullanicilar]

ALTER TABLE [dbo].[ilan_ozellik]  WITH CHECK ADD  CONSTRAINT [FK_ilan_ozellik_ilanlar_ilan_ozellik] FOREIGN KEY([ilan_id])
REFERENCES [dbo].[ilanlar_ilan_ozellik] ([ilanlar_ilan_ozellik_id])

ALTER TABLE [dbo].[ilan_ozellik] CHECK CONSTRAINT [FK_ilan_ozellik_ilanlar_ilan_ozellik]

ALTER TABLE [dbo].[ilanlar]  WITH CHECK ADD  CONSTRAINT [FK_ilanlar_kategori] FOREIGN KEY([kategori_id])
REFERENCES [dbo].[kategori] ([kategori_id])

ALTER TABLE [dbo].[ilanlar] CHECK CONSTRAINT [FK_ilanlar_kategori]

ALTER TABLE [dbo].[ilanlar]  WITH CHECK ADD  CONSTRAINT [FK_ilanlar_kullanicilar] FOREIGN KEY([kullanici_id])
REFERENCES [dbo].[kullanicilar] ([kullanici_id])

ALTER TABLE [dbo].[ilanlar] CHECK CONSTRAINT [FK_ilanlar_kullanicilar]

ALTER TABLE [dbo].[ilanlar_ilan_ozellik]  WITH CHECK ADD  CONSTRAINT [FK_ilanlar_ilan_ozellik_ilanlar] FOREIGN KEY([ilan_id])
REFERENCES [dbo].[ilanlar] ([ilan_id])

ALTER TABLE [dbo].[ilanlar_ilan_ozellik] CHECK CONSTRAINT [FK_ilanlar_ilan_ozellik_ilanlar]