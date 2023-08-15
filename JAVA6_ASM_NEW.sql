drop database JAVA6_ASM_NEW

create database JAVA6_ASM_NEW
go
use JAVA6_ASM_NEW
go

CREATE TABLE Accounts (
    [Username] [varchar](20) NOT NULL PRIMARY KEY,
    [Password] [nvarchar](50) NOT NULL,
    [Fullname] [nvarchar](50) NOT NULL,
    [Email] [nvarchar](50) NOT NULL,
    [Phone] [nvarchar](50) NOT NULL,
    [GoogleID] [nvarchar](50) NULL
);

CREATE TABLE Roles (
    [Id] VARCHAR(10) PRIMARY KEY NOT NULL,
    [Name] NVARCHAR(50) NOT NULL
);

CREATE TABLE Authorities (
    [Id] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [Username] [varchar](20) NOT NULL,
    [RoleID] VARCHAR(10) NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Roles(Id),
    FOREIGN KEY (Username) REFERENCES Accounts(Username)
);

CREATE TABLE KindHouse (
    [Id] [varchar](4) NOT NULL PRIMARY KEY,
    [Name] [nvarchar](50) NOT NULL
);

CREATE TABLE Location (
    [Id] [nvarchar](20) NOT NULL PRIMARY KEY,
    [Name] [nvarchar](50) NOT NULL
);


CREATE TABLE Products (
    [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Title] [nvarchar](200) NOT NULL,
    [ImageMain] [nvarchar](50) NOT NULL,
    [ImageOne] [nvarchar](50) NOT NULL,
    [ImageTwo] [nvarchar](50) NOT NULL,
    [ImageThree] [nvarchar](50) NOT NULL,
    [Price] [float] NOT NULL,
    [CreateDate] [date] NOT NULL,
    [Available] [bit],
    [KindHouseId] [varchar](4) NOT NULL,
    [LocationId] [nvarchar](20) NOT NULL,
    [UserNameId] [varchar](20) NOT NULL,
    [Address] [nvarchar](100) NOT NULL,
    [Description] [nvarchar](max) NOT NULL,
    [ViewCount] [int] NULL DEFAULT 0,
    [GoogleAdId] [bigint] NULL,
    FOREIGN KEY (KindHouseId) REFERENCES KindHouse(Id),
    FOREIGN KEY (UserNameId) REFERENCES Accounts(Username),
    FOREIGN KEY (LocationId) REFERENCES Location(Id),

);


CREATE TABLE GoogleAds (
    [Id] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [AdText] [nvarchar](200) NOT NULL,
    [AdLink] [nvarchar](200) NOT NULL,
    [StartDate] [datetime] NOT NULL,
    [EndDate] [datetime] NOT NULL,
    [ProductID] [int] NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(Id)
);


CREATE TABLE Comments (
    [Id] [bigint] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [ProductID] [int] NOT NULL,
    [Username] [varchar](20) NOT NULL,
    [Comment] [nvarchar](max) NOT NULL,
    [CommentDate] [datetime] NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(Id),
    FOREIGN KEY (Username) REFERENCES Accounts(Username)
);


-- Thêm dữ liệu mẫu vào bảng Accounts
-- Thêm dữ liệu mẫu vào bảng Accounts
INSERT INTO Accounts ([Username], [Password], [Fullname], [Email], [Phone], [GoogleID])
VALUES
    ('hao', '123', 'Nguyễn Văn Hảo', 'nguyenvanhao@example.com', '1234567890', NULL),
    ('xuan', '123', 'Trần Thị Xuân', 'tranthixuan@example.com', '9876543210', NULL),
    ('tu', '123', 'Lê Minh Tú', 'leminhtu@example.com', '5555555555', NULL),
    ('linh', '123', 'Phạm Hoàng Linh', 'phamhoanglinh@example.com', '6666666666', NULL),
    ('ngoc', '123', 'Hoàng Thị Ngọc', 'hoangthingoc@example.com', '7777777777', NULL),
    ('dung', '123', 'Vũ Quang Dũng', 'vuquangdung@example.com', '8888888888', NULL),
    ('thao', '123', 'Trịnh Thị Thảo', 'trinhthithao@example.com', '9999999999', NULL),
    ('phuc', '123', 'Mai Văn Phúc', 'maivanphuc@example.com', '1111111111', NULL),
    ('long', '123', 'Đinh Văn Long', 'dinhvanlong@example.com', '2222222222', NULL),
    ('my', '123', 'Lý Thị Mỹ', 'lythimy@example.com', '3333333333', NULL);


-- Thêm dữ liệu mẫu vào bảng Roles
INSERT INTO Roles (Id, Name)
VALUES
    ('ADMIN', 'Administrators'),
    ('GUEST', 'Customer'),
    ('USER', 'Staff');

-- Thêm dữ liệu mẫu vào bảng Authorities
INSERT INTO Authorities (Username, RoleID)
VALUES
    ('hao', 'ADMIN'),
	('hao', 'USER'),
	('hao', 'GUEST'),

    ('xuan', 'USER'),
	('xuan', 'GUEST'),

    ('tu', 'USER'),
	('tu', 'GUEST'),

    ('linh', 'GUEST'),
    ('ngoc', 'GUEST'),
    ('dung', 'GUEST'),
    ('thao', 'GUEST'),
    ('phuc', 'GUEST'),
    ('long', 'GUEST'),
    ('my', 'GUEST');


-- Thêm dữ liệu mẫu vào bảng KindHouse
INSERT INTO KindHouse (Id, Name)
VALUES
    ('KH1', N'nhà đất'),
    ('KH2', N'chung cư'),
    ('KH3', N'căn hộ'),
    ('KH4', N'biệt thự'),
    ('KH5', N'nhà mặt phố');

-- Thêm dữ liệu mẫu vào bảng Location
INSERT INTO Location (Id, Name)
VALUES
    ('t1', N'TP HCM'),
    ('t2', N'Hà Nội'),
    ('t3', N'Cần Thơ'),
    ('t4', N'Đà Nẵng'),
    ('t5', N'Bình Dương'),
    ('t6', N'Long An'),
    ('t7', N'Bình Phước');

-- Thêm dữ liệu mẫu vào bảng Products
INSERT INTO Products ([Title], [ImageMain], [ImageOne], [ImageTwo], [ImageThree], [Price], [CreateDate], [Available], [KindHouseId], [LocationId], [UserNameId], [Address], [Description], [ViewCount], [GoogleAdId])
VALUES
    (N'Nhà Đất', 'img1.jpg', 'img2.jpg', 'img3.jpg', 'img4.jpg', 10.99, '2023-08-01', 1, 'KH1', 't1', 'hao', N'Số 25, Đường Nguyễn Văn Cừ, Quận 1, Thành phố Hồ Chí Minh', N'Nhà phố 2 tầng có diện tích 80m2, nằm trong khu dân cư yên tĩnh và gần trung tâm thành phố.', 0, NULL),
    (N'Chung cư', 'img2.jpg', 'img3.jpg', 'img4.jpg', 'img5.jpg', 15.99, '2023-08-02', 1, 'KH2', 't2', 'xuan', N'Số 12, Đường Lê Lợi, Quận Hoàn Kiếm, Hà Nội', N'Description for Product 2', 0, NULL),
    (N'Căn hộ', 'img3.jpg', 'img6.jpg', 'img7.jpg', 'img8.jpg', 20.99, '2023-08-03', 1, 'KH3', 't3', 'tu', N'Số 10, Đường Nguyễn Văn Linh, Quận Thanh Khê, Cần Thơ', N'Description for Product 3', 0, NULL),
	(N'Nhà Đất', 'img3.jpg', 'img2.jpg', 'img1.jpg', 'img4.jpg', 10.99, '2023-08-01', 1, 'KH1', 't1', 'linh', N'Số 25, Đường Nguyễn Văn Cừ, Quận 1, Thành phố Hồ Chí Minh', N'Nhà phố 2 tầng có diện tích 80m2, nằm trong khu dân cư yên tĩnh và gần trung tâm thành phố.', 0, NULL),
    (N'Chung cư', 'img4.jpg', 'img3.jpg', 'img2.jpg', 'img5.jpg', 15.99, '2023-08-02', 1, 'KH2', 't2', 'ngoc', N'Số 12, Đường Lê Lợi, Quận Hoàn Kiếm, Hà Nội', N'Description for Product 2', 0, NULL),
    (N'Căn hộ', 'img7.jpg', 'img6.jpg', 'img5.jpg', 'img8.jpg', 20.99, '2023-08-03', 1, 'KH3', 't3', 'dung', N'Số 10, Đường Nguyễn Văn Linh, Quận Thanh Khê, Cần Thơ', N'Description for Product 3', 0, NULL);

-- Thêm dữ liệu mẫu vào bảng GoogleAds
INSERT INTO GoogleAds ([AdText], [AdLink], [StartDate], [EndDate], [ProductID])
VALUES
    (N'Ad Text 1', 'https://adlink1.com', '2023-08-01', '2023-08-31', 1),
    (N'Ad Text 2', 'https://adlink2.com', '2023-08-02', '2023-08-31', 2),
    (N'Ad Text 3', 'https://adlink3.com', '2023-08-03', '2023-08-31', 3);

-- Thêm dữ liệu mẫu vào bảng Comments
INSERT INTO Comments ([ProductID], [Username], [Comment], [CommentDate])
VALUES
    (1, 'linh', N'Comment 1 for Product 1', '2023-08-01'),
    (2, 'ngoc', N'Comment 1 for Product 2', '2023-08-02'),
    (3, 'dung', N'Comment 1 for Product 3', '2023-08-03');

----------------------------------------------------------------
SELECT * FROM Accounts;
SELECT * FROM Roles;
SELECT * FROM Authorities;
SELECT * FROM KindHouse;
SELECT * FROM Location;
SELECT * FROM Products;
SELECT * FROM GoogleAds;
SELECT * FROM Comments;

SELECT A.Username, A.Fullname, COUNT(P.Id) AS TotalProducts
FROM Accounts A
JOIN Products P ON A.Username = P.UserNameId
GROUP BY A.Username, A.Fullname
ORDER BY TotalProducts DESC;