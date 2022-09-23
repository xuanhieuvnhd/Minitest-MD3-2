create database QuanLyDuLich;
use QuanLyDuLich;

create table Tour(
    tID int not null auto_increment primary key ,
    idTour varchar(20),
    ttID int,
    tPrice int,
    idStartDate date,
    idEndDate date
);

create table TourType(
    ttID int not null auto_increment primary key ,
    idType varchar(20),
    nameType varchar(50)
);

create table Address(
    aID int not null auto_increment primary key ,
    aName varchar(50) not null ,
    description varchar(250),
    averagePrice int,
    ciID int
);

create table City(
    ciID int not null auto_increment primary key ,
    ciName varchar(50) not null
);

create table Customer(
    cID int not null auto_increment primary key ,
    cName varchar(50) not null ,
    idNumber varchar(50),
    yearOfBirth year,
    ciID int
);


create table Oder(
    odID int not null auto_increment primary key ,
    tID int,
    cID int,
    status boolean
);

#Thêm 2 loại tour
insert into TourType values (1,'Loại 2','Trọn gói'),(2,'Loại 2','Theo ngày');

#Thêm 15 tour
insert into Tour values (1,'T1',1,2000000,'2022/3/21','2022/3/23');
insert into Tour values (2,'T2',1,2000000,'2022/3/24','2022/3/26');
insert into Tour values (3,'T3',1,2000000,'2022/3/26','2022/3/29');
insert into Tour values (4,'T4',1,2000000,'2022/3/29','2022/4/1');
insert into Tour values (5,'T5',1,2000000,'2022/4/1','2022/4/3');
insert into Tour values (6,'T6',1,2000000,'2022/4/3','2022/4/5');
insert into Tour values (7,'T7',1,2000000,'2022/4/5','2022/4/7');
insert into Tour values (8,'T8',2,500000,'2022/4/7','2022/4/8');
insert into Tour values (9,'T9',2,500000,'2022/4/8','2022/4/9');
insert into Tour values (10,'T10',2,500000,'2022/4/9','2022/4/10');
insert into Tour values (11,'T11',2,500000,'2022/4/11','2022/4/12');
insert into Tour values (12,'T12',2,500000,'2022/4/12','2022/4/13');
insert into Tour values (13,'T13',2,500000,'2022/4/13','2022/4/14');
insert into Tour values (14,'T14',2,500000,'2022/4/14','2022/4/15');
insert into Tour values (15,'T15',2,500000,'2022/4/15','2022/4/16');

#Thêm 5 điểm đến
insert into Address values (1,'Sầm Sơn','tỉnh Thanh Hoá',600000,1);
insert into Address values (2,'Đồ Sơn','tỉnh Hải Phòng',600000,2);
insert into Address values (3,'Hạ long','tỉnh Quảng Ninh',600000,3);
insert into Address values (4,'Quất Lâm','tỉnh Nam Định',600000,4);
insert into Address values (5,'Đền Hùng','tỉnh Phú Thọ',600000,5);

#Thêm 5 thành phố
insert into City values (1,'Thanh Hoá'),(2,'Hải Phòng'),(3,'Quảng Ninh'),(4,'Nam Định'),(5,'Phú Thọ');

#Thêm 10 khách hàng
insert into Customer values (1,'Hiểu','175678356','1987',1);
insert into Customer values (2,'Hùng','187546835','1999',4);
insert into Customer values (3,'Kiều Anh','175678358','1995',5);
insert into Customer values (4,'Linh','175688356','1998',2);
insert into Customer values (5,'Yến','123678356','2003',2);
insert into Customer values (6,'Trung','175678306','2000',4);
insert into Customer values (7,'Phong','177678356','1997',1);
insert into Customer values (8,'Lương','175678309','1998',3);
insert into Customer values (9,'Hân','175038356','1995',5);
insert into Customer values (10,'Thương','175678946','1999',4);

#Thêm 10 hoá đơn đặt tuor
insert into Oder values (1,2,1,true);
insert into Oder values (2,5,4,true);
insert into Oder values (3,3,2,false);
insert into Oder values (4,5,5,false);
insert into Oder values (5,7,6,true);
insert into Oder values (6,1,3,false);
insert into Oder values (7,8,7,false);
insert into Oder values (8,10,9,true);
insert into Oder values (9,12,10,false);
insert into Oder values (10,14,8,true);
#Thống kê tất cả các khách hàng
select * from City join Customer C on City.ciID = C.ciID join Oder O on C.cID = O.cID;
#Thống kê số lượng tour của các thành phố
select ciName'Tên tỉnh',count(odID)'Số lượng' from City join Customer C on City.ciID = C.ciID 
join Oder O on C.cID = O.cID group by ciName;
#Tính số tour có ngày bắt đầu trong tháng 3 năm 2022 (dùng count)
select count(idTour)'Mã tour' from Tour where month(idStartDate)=3;
#Tính số tour có ngày kết thúc trong tháng 4 năm 2022
select count(idTour)'Mã tour' from Tour where month(idEndDate)=4;