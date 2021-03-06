USE [DiaFreeDB]
GO
/****** Object:  Table [dbo].[DiabetesType]    Script Date: 13.5.2020. 15:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiabetesType](
	[IDTipDijabetesa] [int] IDENTITY(1,1) NOT NULL,
	[TipDijabetesa] [nvarchar](50) NULL,
 CONSTRAINT [PK_TipDijabetesa] PRIMARY KEY CLUSTERED 
(
	[IDTipDijabetesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FizicalActivity]    Script Date: 13.5.2020. 15:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FizicalActivity](
	[IDFizickaAktivnost] [int] IDENTITY(1,1) NOT NULL,
	[RazinaFizickeAktivnosti] [nvarchar](50) NULL,
 CONSTRAINT [PK_FizickaAktivnost] PRIMARY KEY CLUSTERED 
(
	[IDFizickaAktivnost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 13.5.2020. 15:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[IDNamirnice] [int] IDENTITY(1,1) NOT NULL,
	[Namirnica] [nvarchar](50) NOT NULL,
	[Energija_kJ] [int] NULL,
	[Energija_kcal] [int] NULL,
	[TipNamirnice] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Namirnice] PRIMARY KEY CLUSTERED 
(
	[IDNamirnice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal]    Script Date: 13.5.2020. 15:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[IDObrok] [int] IDENTITY(1,1) NOT NULL,
	[NazivObroka] [nvarchar](50) NOT NULL,
	[DatumIzrade] [date] NULL,
 CONSTRAINT [PK_Meal] PRIMARY KEY CLUSTERED 
(
	[IDObrok] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MealIngredients]    Script Date: 13.5.2020. 15:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MealIngredients](
	[ObrokID] [int] NOT NULL,
	[NamirnicaID] [int] NOT NULL,
	[KlicinaID] [int] NULL,
 CONSTRAINT [PK_MealIngredients] PRIMARY KEY CLUSTERED 
(
	[ObrokID] ASC,
	[NamirnicaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 13.5.2020. 15:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[IDKolicina] [int] IDENTITY(1,1) NOT NULL,
	[Gram] [int] NULL,
	[Komad] [int] NULL,
	[Zlica] [int] NULL,
	[Salica] [int] NULL,
 CONSTRAINT [PK_Kolicina] PRIMARY KEY CLUSTERED 
(
	[IDKolicina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMeals]    Script Date: 13.5.2020. 15:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMeals](
	[IDKorisnik] [int] NOT NULL,
	[IDObrok] [int] NOT NULL,
 CONSTRAINT [PK_UserMeals] PRIMARY KEY CLUSTERED 
(
	[IDKorisnik] ASC,
	[IDObrok] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13.5.2020. 15:44:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDKorisnik] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NULL,
	[Prezime] [nvarchar](50) NULL,
	[DatumRodenja] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[KorisnickoIme] [nvarchar](50) NULL,
	[Zaporka] [nvarchar](50) NULL,
	[TipDijabetesaID] [int] NULL,
	[FizickaAktivnostID] [int] NULL,
	[Tezina] [decimal](18, 0) NULL,
	[Visina] [decimal](18, 0) NULL,
	[Spol] [nvarchar](5) NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[IDKorisnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MealIngredients]  WITH CHECK ADD  CONSTRAINT [FK_MealIngredients_Ingredient] FOREIGN KEY([NamirnicaID])
REFERENCES [dbo].[Ingredient] ([IDNamirnice])
GO
ALTER TABLE [dbo].[MealIngredients] CHECK CONSTRAINT [FK_MealIngredients_Ingredient]
GO
ALTER TABLE [dbo].[MealIngredients]  WITH CHECK ADD  CONSTRAINT [FK_MealIngredients_Meal] FOREIGN KEY([ObrokID])
REFERENCES [dbo].[Meal] ([IDObrok])
GO
ALTER TABLE [dbo].[MealIngredients] CHECK CONSTRAINT [FK_MealIngredients_Meal]
GO
ALTER TABLE [dbo].[MealIngredients]  WITH CHECK ADD  CONSTRAINT [FK_MealIngredients_Measurement] FOREIGN KEY([KlicinaID])
REFERENCES [dbo].[Measurement] ([IDKolicina])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MealIngredients] CHECK CONSTRAINT [FK_MealIngredients_Measurement]
GO
ALTER TABLE [dbo].[UserMeals]  WITH CHECK ADD  CONSTRAINT [FK_UserMeals_Meal] FOREIGN KEY([IDObrok])
REFERENCES [dbo].[Meal] ([IDObrok])
GO
ALTER TABLE [dbo].[UserMeals] CHECK CONSTRAINT [FK_UserMeals_Meal]
GO
ALTER TABLE [dbo].[UserMeals]  WITH CHECK ADD  CONSTRAINT [FK_UserMeals_Users] FOREIGN KEY([IDKorisnik])
REFERENCES [dbo].[Users] ([IDKorisnik])
GO
ALTER TABLE [dbo].[UserMeals] CHECK CONSTRAINT [FK_UserMeals_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Korisnik_FizickaAktivnost] FOREIGN KEY([FizickaAktivnostID])
REFERENCES [dbo].[FizicalActivity] ([IDFizickaAktivnost])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Korisnik_FizickaAktivnost]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Korisnik_TipDijabetesa] FOREIGN KEY([TipDijabetesaID])
REFERENCES [dbo].[DiabetesType] ([IDTipDijabetesa])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Korisnik_TipDijabetesa]
GO

--- INSERT INTO ::::
insert into DiabetesType(TipDijabetesa) values('Tip1')
insert into DiabetesType(TipDijabetesa) values('Tip2')

insert into FizicalActivity(RazinaFizickeAktivnosti) values('Slaba')
insert into FizicalActivity(RazinaFizickeAktivnosti) values('Umjerena')
insert into FizicalActivity(RazinaFizickeAktivnosti) values('Intenzivna')

--- INSERT INTO ::::


/****** Object:  StoredProcedure [dbo].[DeleteIngredient]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteIngredient]
	@namirnicaID int
as
begin 
	delete from Ingredient
	where IDNamirnice=@namirnicaID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteMeal]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteMeal]
	@idObrok int
as
delete  from Meal
where IDObrok=@idObrok
GO
/****** Object:  StoredProcedure [dbo].[DeleteMealForUser]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteMealForUser]
	@idKorisnik int,
	@idObrok int
as
delete from UserMeals
where IDKorisnik=@idKorisnik and IDObrok=@idObrok
GO
/****** Object:  StoredProcedure [dbo].[DeleteMeasurement]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteMeasurement]
	@obrokID int
as
delete from Measurement 
where IDKolicina in 
(
select mi.KlicinaID from MealIngredients as mi
join Measurement as m on mi.KlicinaID=m.IDKolicina
where mi.ObrokID=@obrokID
)
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteUser]
	@idKorsnik int
as
begin
	delete from Users
	where IDKorisnik=@idKorsnik
end
GO
/****** Object:  StoredProcedure [dbo].[DeletIngredient]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DeletIngredient]
	@namirnicaID int
as
begin 
	delete from Ingredient
	where IDNamirnice=@namirnicaID
end
GO
/****** Object:  StoredProcedure [dbo].[DelteFromMealIngredients]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DelteFromMealIngredients]
	@obrokID int
as
delete  from MealIngredients
where ObrokID=@obrokID
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAllUsers]
as
begin
	select k.IDKorisnik, k.Ime,k.Prezime,k.DatumRodenja,k.Email,k.KorisnickoIme,
		   k.Zaporka,k.Tezina,k.Visina,k.Spol,dt.TipDijabetesa,fa.RazinaFizickeAktivnosti
	from Users as k
	inner join DiabetesType as dt
	on k.TipDijabetesaID=dt.IDTipDijabetesa
	inner join FizicalActivity as fa
	on k.FizickaAktivnostID=fa.IDFizickaAktivnost
end
GO
/****** Object:  StoredProcedure [dbo].[GetIngredientForMeal]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetIngredientForMeal]
	@obrokID int
as
select i.IDNamirnice,i.Namirnica,i.Energija_kcal,i.Energija_kJ,i.TipNamirnice,me.Gram,me.Komad,me.Zlica,me.Salica from Meal as m
 join MealIngredients as mi
on m.IDObrok=mi.ObrokID
 join Ingredient as i
on i.IDNamirnice=mi.NamirnicaID
join Measurement as me
on me.IDKolicina=mi.KlicinaID
where  m.IDObrok=@obrokID
GO
/****** Object:  StoredProcedure [dbo].[GetIngredientForMealTest]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetIngredientForMealTest]
	@obrokID int
as
select i.IDNamirnice,i.Namirnica,i.Energija_kcal,i.Energija_kJ,i.TipNamirnice,me.Gram,me.Komad,me.Zlica,me.Salica from Meal as m
 join MealIngredients as mi
on m.IDObrok=mi.ObrokID
 join Ingredient as i
on i.IDNamirnice=mi.NamirnicaID
join Measurement as me
on me.IDKolicina=mi.KlicinaID
where  m.IDObrok=1
GO
/****** Object:  StoredProcedure [dbo].[GetIngredients]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetIngredients]
	@tipNamirnice nvarchar(50)
as
begin
	if	@tipNamirnice='Sve'
	begin
		select * from Ingredient
	end
	else if @tipNamirnice='Bjelančevine'
	begin
		select * from Ingredient
		where TipNamirnice=@tipNamirnice
	end
	else if @tipNamirnice='Ugljikohidrati'
	begin
		select * from Ingredient
		where TipNamirnice=@tipNamirnice
	end
	else if @tipNamirnice='Masti'
	begin
		select * from Ingredient
		where TipNamirnice=@tipNamirnice
	end
end
GO
/****** Object:  StoredProcedure [dbo].[GetMeal]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetMeal]
as
select * from Meal
GO
/****** Object:  StoredProcedure [dbo].[GetMealsForUser]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetMealsForUser]
	@idKorisnik int
as
select m.* from Users as u
join UserMeals as um on u.IDKorisnik=um.IDKorisnik
join Meal as m on m.IDObrok=um.IDObrok
where um.IDKorisnik=@idKorisnik
GO
/****** Object:  StoredProcedure [dbo].[GetNumberOfMeals]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetNumberOfMeals]
as
select COUNT(*) from Meal  
GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetUserById]
	@IDKorisnik int
as
begin
	select k.IDKorisnik, k.Ime,k.Prezime,k.DatumRodenja,k.Email,k.KorisnickoIme,
		  k.Tezina,k.Visina,k.Spol,td.TipDijabetesa,fa.RazinaFizickeAktivnosti
	from Users as k
	inner join DiabetesType as td
	on k.TipDijabetesaID=td.IDTipDijabetesa
	inner join FizicalActivity as fa
	on k.FizickaAktivnostID=fa.IDFizickaAktivnost
	where k.IDKorisnik=@IDKorisnik
end
GO
/****** Object:  StoredProcedure [dbo].[InsertIngredient]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertIngredient]
	@naziv nvarchar(50),
	@energija_kJ int,
	@energija_kcal int,
	@tipNamirnice nvarchar(50)
	
as
begin
	insert into Ingredient values(@naziv,@energija_kJ,@energija_kcal,@tipNamirnice)
end

GO
/****** Object:  StoredProcedure [dbo].[InsertIntoMelaIngredients]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertIntoMelaIngredients]
	@obrokID int,
	@namirnicaID int,
	@kolicinaID int
as
insert into MealIngredients (ObrokID,NamirnicaID,KlicinaID) values (@obrokID,@namirnicaID,@kolicinaID)
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoUserMeals]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertIntoUserMeals]
	@idKorisnik int,
	@idObrok int
as
insert into UserMeals (IDKorisnik,IDObrok) values (@idKorisnik,@idObrok)
GO
/****** Object:  StoredProcedure [dbo].[InsertMeal]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertMeal]
	@naziv nvarchar(50),
	@datumIzrade date
	--@id int out
as
	set nocount on
	insert into Meal (NazivObroka,DatumIzrade) values (@naziv,@datumIzrade)
	--set @id=SCOPE_IDENTITY()
	select SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[InsertMeasurementForIngredient]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertMeasurementForIngredient]
	@grami int,
	@komad int,
	@zlica int,
	@salica int
as
	set nocount on
	insert into Measurement (Gram,Komad,Zlica,Salica) values (@grami,@komad,@zlica,@salica)
	--set @id=SCOPE_IDENTITY()
	select SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertUser]
	@ime nvarchar(50),
	@prezime nvarchar(50),
	@datumRodenja date,
	@email nvarchar(50),
	@korisnickoIme nvarchar(50),
	@zaporka nvarchar(50),
	@tipDijabetesa int,
	@razinaFizAkt int,
	@tezina decimal,
	@visina decimal,
	@spol nvarchar(5)
as
begin
insert into Users (Ime, Prezime, DatumRodenja, Email, KorisnickoIme, Zaporka, TipDijabetesaID, FizickaAktivnostID, Tezina, Visina, Spol) values (@ime,@prezime,@datumRodenja,@email,@korisnickoIme,@zaporka,@tipDijabetesa,@razinaFizAkt,@tezina,@visina,@spol)
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateIngredients]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateIngredients]
	@idNamirnica int,
	@nazivNamirnice nvarchar(50),
	@energija_kJ int,
	@energija_kcal int,
	@tipNamirnice nvarchar(50)
	
as
begin
	update Ingredient set Namirnica=@nazivNamirnice,Energija_kJ=@energija_kJ,Energija_kcal=@energija_kcal,TipNamirnice=@tipNamirnice
	where IDNamirnice=@idNamirnica
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 13.5.2020. 15:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateUser] 
	@id int,
	@ime nvarchar(50),
	@prezime nvarchar(50),
	@email nvarchar(50),
	@datumRodenja date,
	@korisnickoIme nvarchar(50),
	@tezina decimal,
	@razinaFizAkt int,
	@visina decimal,
	@tipDijabetesa int,
	@spol nvarchar(5)
AS
BEGIN
	update Users set Ime=@ime, Prezime=@prezime, Email=@email, DatumRodenja=@datumRodenja, KorisnickoIme=@korisnickoIme,
						Tezina=@tezina, FizickaAktivnostID=@razinaFizAkt, Visina=@visina,TipDijabetesaID=@tipDijabetesa,Spol=@spol	
	where IDKorisnik=@id 
END
GO
