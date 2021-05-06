drop table if exists dbo.ProductPictures;
drop table if exists dbo.TaggedProducts;
drop table if exists dbo.OrderProducts;
create table dbo.OrderProducts
(
Id int not null primary key identity,
IsDeleted bit not null default (0),
ProductId int not null foreign key references dbo.Products(Id),
OrderId int not null foreign key references dbo.Orders(Id),
Quantity int not null default(1)

unique (ProductId, OrderId)
);
go

create table dbo.TaggedProducts
(
Id int not null primary key identity,
IsDeleted bit not null default (0),
ProductId int not null foreign key references dbo.Products(Id),
TagId int not null foreign key references dbo.Tags(Id),

unique (ProductId, TagId)
);
go

create table dbo.ProductPictures
(
Id int not null primary key identity,
IsDeleted bit not null default (0),
ProductId int not null foreign key references dbo.Products(Id),
[Image] varchar(1024) not null

unique ([Image], ProductId)
);
go

