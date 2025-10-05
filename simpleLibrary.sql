create database db_library;
use db_library;

create table Books
(
	bookID int not null primary key,
	author nvarchar(30),
	genre nvarchar(20),
	isbn nvarchar(100),
	additionalDetail nvarchar(max),
	publicationDate date ,
	title nvarchar(20)
)
create table Copies
(
	copyID int not null primary key,
	availabilityStauts nvarchar(20),
	bookID int not null foreign key references Books(bookID)
)
create table Users
(
	userID int not null primary key,
	firstName nvarchar(30),
	lastName nvarchar(30),
	cardNumber nvarchar(20),
	phone nvarchar(20)
)
create table Borrowings
(
	borrowID int not null primary key,
	borrowDate date not null,
	dueDate date not null,
	returnDate date null,
	userID int not null foreign key references Users(userID),
	copyID int not null foreign key references Copies(copyID)
)
create table Reservations
(
	reservationID int not null primary key,
	reservationDate date not null,
	userID int not null foreign key references Users(userID),
	copyID int not null foreign key references Copies(copyID)
)
create table Payments
(
	paymentID int not null primary key,
	paymentAmount smallmoney not null ,
	paymentStatus nvarchar(20) not null , 
)
create table Fines
(
	fineID int not null primary key,
	numberOfLateDays date not null,
	paymentID int not null foreign key references Payments(paymentID),
	userID int not null foreign key references Users(userID),
	borrowID int not null foreign key references Borrowings(borrowID)
)
create table Settings 
(
	settingID int not null primary key,
	finePerDay int not null,
	borrowDays int not null,
)
