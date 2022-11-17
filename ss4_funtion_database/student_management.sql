create database student_management_tables;
use student_management_tables;

-- Tạo bảng Class
create table class (
classID int not null auto_increment primary key,
className varchar(45) not null,
startDate datetime not null,
`status` bit
);

-- Tạo bảng Student
create table student (
studentID int not null auto_increment primary key,
studentName varchar(45) not null,
address varchar(45),
phone varchar(45),
`status` bit,
classID int,
foreign key(classID) references class(classID)
);

-- Tạo bảng Subject
create table `subject` (
subID int not null auto_increment primary key,
subName varchar(45) not null,
credit int not null default 1 check (credit >=1),
`status` bit default 1
);

-- Tạo bảng Mark
create table mark (
markID int not null auto_increment primary key,
subID int not null,
studentID int not null,
mark float default 0 check (mark between 0 and 100),
examTimes int default 1,
unique (subID,studentID),
foreign key(subID) references `subject`(subID),
foreign key(studentID) references student(studentID)
);