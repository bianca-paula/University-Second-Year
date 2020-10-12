Create database ArtGalleryManagement
go
use ArtGalleryManagement
go

CREATE TABLE Gallery
(
Gid INT PRIMARY KEY IDENTITY,
Location varchar(50),
Name varchar(50)
)

CREATE TABLE Manager
(Mid INT FOREIGN KEY REFERENCES Gallery(Gid),
Name varchar(50) NOT NULL,
Phone varchar(50) NOT NULL,
Experience INT,
CONSTRAINT pk_GalleryManager PRIMARY KEY(Mid)
)


CREATE TABLE Exhibition(
Eid INT PRIMARY KEY IDENTITY,
StartDate Date,
EndDate Date
)

CREATE TABLE Room
(
Rid INT PRIMARY KEY IDENTITY,
RoomNo INT,
Name varchar(50),
Gid int FOREIGN KEY REFERENCES Gallery(Gid),
Eid int FOREIGN KEY REFERENCES Exhibition(Eid)
)

CREATE TABLE Artist(
Aid INT PRIMARY KEY IDENTITY,
Name varchar(50) NOT NULL,
Birthplace varchar(50),
DateOfBirth Date,
Style varchar(50)
)


CREATE TABLE Artwork(
ArtId INT PRIMARY KEY IDENTITY,
Type varchar(50),
Price FLOAT(10),
Aid INT FOREIGN KEY REFERENCES Artist(Aid)

)

CREATE TABLE Sculpture(
Sid INT PRIMARY KEY IDENTITY,
Title varchar(50),
Year INT,
Description varchar(50),
Style varchar(50),
ArtId int FOREIGN KEY REFERENCES Artwork(ArtId)
)

CREATE TABLE Painting(
Pid INT PRIMARY KEY  IDENTITY,
Title varchar(50),
Year INT,
Description varchar(50),
Style varchar(50),
ArtId int FOREIGN KEY REFERENCES Artwork(ArtId)
)



CREATE TABLE ExhibitionArtwork(
Eid INT FOREIGN KEY REFERENCES Exhibition(Eid),
ArtId INT FOREIGN KEY REFERENCES Artwork(ArtId),
CONSTRAINT pk_Artworks PRIMARY KEY (Eid, ArtId)
)




CREATE TABLE Client(
Cid INT PRIMARY KEY  IDENTITY,
Name varchar(50),
Phone varchar(50),
Email varchar(50)
)


CREATE TABLE Purchase(
 PurchaseDate Date,
 Price FLOAT(10),
 Cid INT FOREIGN KEY REFERENCES Client(Cid),
 ArtId INT FOREIGN KEY REFERENCES Artwork(ArtId),
 CONSTRAINT pk_Purchases PRIMARY KEY (Cid, ArtId)
)


