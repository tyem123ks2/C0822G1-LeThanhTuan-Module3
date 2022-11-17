use student_management_tables;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject` where credit 
= (select max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.subID, s.subName, s.credit, s.status, m.mark 
from `subject` as s
inner join mark as m on s.subID = m.markID
where m.mark 
= (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.studentID, s.studentName, s.address, s.phone, s.status, s.classID, AVG(mark) as AVG_Mark
from student as s
inner join mark as m on s.studentID = m.studentID 
group by s.studentID, s.studentName
order by AVG_Mark desc;
