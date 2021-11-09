CREATE TABLE test.dbo.Users (
	UserID int NOT NULL IDENTITY(1,1),
	Email varchar(255) NOT NULL,
	Password varchar(100) NOT NULL,
	Username varchar(100) NOT NULL,
	Name varchar(100) NOT NULL,
	CONSTRAINT Users_PK PRIMARY KEY (UserID),
	CONSTRAINT Users_UN_Email UNIQUE (Email),
	CONSTRAINT Users_UN_Username UNIQUE (Username)
);