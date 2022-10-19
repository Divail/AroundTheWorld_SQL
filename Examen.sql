Create database AroundTheWorld
go

use AroundTheWorld
go

create table Employee
(
id int identity( 1,1 ) Primary key not null,
Name nvarchar( 65 ) not null check (Name<>''),
Surname nvarchar( 50 ) not null check (Surname<>''),
Sallary nvarchar ( 50 ) not null check (Sallary<>''),
Phone nvarchar( 50 ) Unique not null check (Phone<>''),
Email nvarchar( 50 ) Unique not null check (Email<>''),
DateEmployement date not null check (DateEmployement <= GETDATE()),
);

GO

create table Countries
(
id int identity( 1,1 ) Primary key not null,
Country nvarchar(50) Unique not null check ( Country <> '' ),
)

GO


create table Cities
(
id int identity( 1,1 ) Primary key not null,
City nvarchar(50) Unique not null check ( City <> '' ),
CountryID int not null, constraint fkCities_Countries foreign key(CountryID) references Countries(id)
)

GO

create table Transport
(
id int identity(1,1) Primary key not null,
Transport nvarchar( 50 ) not null check ( Transport <> '' ),
)

GO

create table Tours
(
id int identity(1,1) Primary key not null,
Name nvarchar(100) not null check (name<>''),
Price money not null Check (price > 0),
StartDate date not null, check (startDate >= getdate()), 
EndDate date not null,
MaxTourists int not null,
TransportID int not null, constraint fkTransport foreign key(TransportID) references Transport(id),
);

GO

create table Tourists
(
id int identity( 1,1 ) Primary key not null,
Name nvarchar( 65 ) not null check (Name<>''),
Surname nvarchar( 50 ) not null check (Surname<>''),
Phone nvarchar( 50 ) Unique not null check (Phone<>''),
Email nvarchar( 50 ) Unique not null check (Email<>''),
BirthDate date not null check (BirthDate < getdate()),
FutureToursID int not null, constraint fkFutureToursID_Tourists foreign key (FutureToursID) references Tours(id),
PastToursID int, constraint fkPastToursID_Tourists foreign key (PastToursID) references PastTours(id)
);

Go

create table Hotels
(
id int identity(1,1) Primary key not null,
Name nvarchar(100) Unique not null check (name<>''),
CityID int not null, constraint fkCity_Hotel foreign key(CityID) references Cities(id),
Picture image,
)

Go

create table Sights
( 
id int identity(1,1) Primary key not null,
Name nvarchar(100) Unique not null check (name<>''),
SightForMoney char(1) not null, check (SightForMoney = 'Y' or SightForMoney = 'N'),
Payment money, 
Picture image,
CityID int not null, constraint fkCity_Sights foreign key(CityID) references Cities(id),
)

GO

create table PastTours
(
id int identity(1,1) Primary key not null,
Name nvarchar(100) not null check (name<>''),
Price money not null Check (price > 0),
StartDate date not null,
EndDate date not null, check (EndDate < getdate()),
MaxTourists int not null,		
TransportID int not null, constraint fkTransport_LastTours foreign key(TransportID) references Transport(id),
); 

Go

create table ToursCities
(
TourID int not null, constraint fkTour_City foreign key(TourID) references Tours(id),
CityID int not null, constraint fkCity_Tour foreign key(CityID) references Cities(id),
)

Go

create table ToursHotels
(
TourID int not null, constraint fkTour_Hotel foreign key(TourID) references Tours(id),
HotelID int not null, constraint fkHotel_Tour foreign key(HotelID) references Hotels(id),
)

Go


create table ToursSight
(
TourID int not null, constraint fkTour_Sight foreign key(TourID) references Tours(id),
SightID int not null, constraint fkSight_Tour foreign key(SightID) references Sights(id),
)

Go

create table TouristTour
(
TourID int not null, constraint fkTour_Tourist foreign key(TourID) references Tours(id),
TouristID int not null, constraint fkTourist_Tour foreign key(TouristID) references Tourists(id),
Ticket char(1) not null, check (Ticket = 'Y' or Ticket = 'N'),
)

GO

create table Resposible
(
EmployeeID int not null, constraint fkEmployee_Resposible foreign key(EmployeeID) references Employee(id),
TourID int not null, constraint fkResponsible_Tour foreign key (TourID) references Tours(id) 
)

GO

create table TicketsBought
(
TourID int not null, constraint fkTour_Tickets foreign key(TourID) references Tours(id),
Tickets int not null
)

GO

create table InteresteadInTour
(
TourID int not null, constraint fkTour_Interestead foreign key(TourID) references Tours(id),
TouristID int not null, constraint fkInterestead_Tour foreign key(TouristID) references Tourists(id),
)

Go


insert into Countries
values('Ukraine')
insert into Countries
values('Russia')
insert into Countries
values('Germany')
insert into Countries
values('Italy')

Go

insert into Cities
values('Kherson', 1)
insert into Cities
values('Kiev', 1)

insert into Cities
values('Moscow', 2)
insert into Cities
values('Peterburg', 2)

insert into Cities
values('Berlin', 3)
insert into Cities
values('Gamburg', 3)

insert into Cities
values('Rome', 4)
insert into Cities
values('Florence', 4)

Go

insert into Sights
values ('St. Catherine''s Cathedral', 'N', null, null, 1)
insert into Sights
values ('Fabrika', 'Y', 1000, null, 1)

insert into Sights
values ('Kyivo-Pechers''ka Lavra', 'N', null, null, 2)
insert into Sights
values ('Zoo', 'Y', 100 , null, 2)

insert into Sights
values ('Moscow Kremlin and Red Square', 'N', null, null, 3)
insert into Sights
values ('Museum-Reserve Tsaritsyno', 'Y', 100 , null, 3)

insert into Sights
values ('Peterhof', 'N', null, null, 4)
insert into Sights
values ('Museum-Reserve Pavlovsk', 'Y', 100 , null, 4)

insert into Sights
values ('Reichstag building', 'N', null, null, 5)
insert into Sights
values ('Museum Island', 'Y', 50 , null, 5)

insert into Sights
values ('Old Elbe Tunnel', 'N', null, null, 6)
insert into Sights
values ('Hamburg History Museum', 'Y', 50 , null, 6)

insert into Sights
values ('Appian Way in Rome', 'N', null, null, 7)
insert into Sights
values ('Borghese Gallery', 'Y', 50 , null, 7)

insert into Sights
values ('Appian Way in Rome', 'N', null, null, 7)
insert into Sights
values ('Borghese Gallery', 'Y', 50 , null, 7)

insert into Sights
values ('Santa Maria del Fiore', 'N', null, null, 8)
insert into Sights
values ('Uffizi Gallery', 'Y', 50 , null, 8)

GO

insert into Transport
values ('Bus')

insert into Transport
values ('Train')

insert into Transport
values ('bicycle')

GO

insert into Hotels
values ('Raziotel Kherson', 1, null) -- Kherson
insert into Hotels
values ('Hotel Ukraine', 2, null) -- Kiev
insert into Hotels
values ('Hotel Izmailovo Beta', 3, null) -- Moscow
insert into Hotels
values ('Hotel St Petersburg', 4, null) -- Peterburg
insert into Hotels
values ('Hotel Berlin', 5, null) -- Berlin
insert into Hotels
values ('Hotel Gamburg', 6, null) -- Gamburg
insert into Hotels
values ('Hotel Rome', 7, null) -- Rome
insert into Hotels
values ('Raziotel Kherson', 8, null) -- Florence

Go

insert into Employee
values ('Vasya', 'Pupkin', '5000', '+380992412588', 'VasyaPipkin@gmail.com', '2020-02-02')
insert into Employee
values ('Petya', 'Pupkin', '5000', '+380992412577', 'PetyaPipkin@gmail.com', '2020-02-02')

GO

insert into Tours 
values ('Ukrain', 15000, '2020-04-06', '2020-04-25', 20, 1)

GO

insert into ToursCities
values (1, 1)
insert into ToursCities
values (1, 2)

Go

insert into Tourists
values ('Vasya', 'Pupkin', '+380992412588', 'VasyaPipkin@gmail.com', '1994-02-02', 1, null)
insert into Tourists
values ('Petya', 'Pupkin', '+380992412577', 'PetyaPipkin@gmail.com', '1997-02-02', 1, null)

GO

insert into TouristTour
values (1, 1, 'Y')























Go

create trigger StarEnd
On Tours
for insert
as
begin
	declare @Start date, 
			@End   date
	select @Start = StartDate,
		   @End = EndDate
	from inserted

	if DATEDIFF( dd, @Start, @End) = 0
	begin 
		raiserror ('EndDate should be bigger than StartDate', 0, 1)
		rollback tran
	end
end

Go

create trigger PastStarEnd
On PastTours
for insert
as
begin
	declare @Start date, 
			@End   date

	select @Start = StartDate,
		   @End = EndDate
	from inserted

	if DATEDIFF( dd, @Start, @End)  = 0
	begin 
		raiserror ('EndDate must be bigger than StartDate', 0, 1)
		rollback tran
	end
end

Go

drop trigger SightsPayment
create trigger SightsPayment
On Sights
for insert 
as 
begin
	declare @sign char(1),
			@Payment money

	select  @sign = SightForMoney,
			@Payment = payment
	from inserted

	if @sign = 'Y'
	begin
		if @Payment = null or @Payment = 0
		begin
			raiserror ('Payment must be bigger than 0', 0, 1)
			rollback tran
		end
	end
end

GO

drop trigger Tickets_Bought
create trigger Tickets_Bought
on TouristTour
for insert
AS
BEGIN
	declare @Ticket char(1),
			@TourID int

	select  @Ticket = Ticket,
			@TourID = TourID
	from inserted

	if @Ticket = 'Y'
	begin
		INSERT INTO TicketsBought (TourID)
		SELECT TourID from inserted;
		update TicketsBought
		set Tickets += 1
		where TourID = @TourID
	end
end