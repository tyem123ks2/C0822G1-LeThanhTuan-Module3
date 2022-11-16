use student_management_tables;

-- Thêm dữ liệu vào Class
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1),
	   (2, 'A2', '2008-12-22', 1),
       (3, 'B3', current_date, 0);
       
-- Thêm dữ liệu vào Student    
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1),
       ('Hoa', 'Hai phong',null, 1, 1),
       ('Manh', 'HCM', '0123123123', 0, 2);    
     
-- Thêm dữ liệu vào Subject      
INSERT INTO `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
-- Thêm dữ liệu vào Mark       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- Hiển thị thông tin tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student
where studentName like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select classID, className, startDate
from class
where startDate between '2008-12-01' AND '2008-12-31';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select subName, credit 
from `subject`
where credit between 3 AND 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên 'Hung' là 2
UPDATE `student_management_tables`.`student` SET `classID` = '2' WHERE (`studentID` = '1');

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.studentName, sb.subName, m.mark
from mark as m
inner join student as s on s.studentID = m.markID
inner join `subject` as sb on sb.subID = m.markID 
order by m.mark DESC, s.studentName ASC;