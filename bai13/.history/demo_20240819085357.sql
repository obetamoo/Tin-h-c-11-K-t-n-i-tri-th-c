-- các câu lệnh SQL để tạo ra cơ sở dữ liệu quản lý học sinh như trong ví dụ trên, bao gồm các bảng Students, Classes, Teachers, và Grades. Mỗi bảng sẽ có các trường cần thiết, và mình cũng sẽ thêm một số dữ liệu mẫu vào các bảng.

-- 1. Tạo cơ sở dữ liệu
CREATE DATABASE SchoolManagement;
USE SchoolManagement;

-- 2. Tạo bảng Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(100),
    Subject VARCHAR(50)
);
-- 3. Tạo bảng Classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
-- 4. Tạo bảng Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    Address VARCHAR(255),
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);


-- 5. Tạo bảng Grades
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    StudentID INT,
    Subject VARCHAR(50),
    Grade DECIMAL(3, 1),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
-- 6. Thêm dữ liệu mẫu vào bảng Teachers
INSERT INTO Teachers (TeacherID, TeacherName, Subject) VALUES 
(201, 'Lê Văn C', 'Toán'),
(202, 'Phạm Thị D', 'Văn');
-- 7. Thêm dữ liệu mẫu vào bảng Classes
INSERT INTO Classes (ClassID, ClassName, TeacherID) VALUES 
(101, '10A1', 201),
(102, '10A2', 202);
-- 8. Thêm dữ liệu mẫu vào bảng Students
INSERT INTO Students (StudentID, Name, DateOfBirth, Address, ClassID) VALUES 
(1, 'Nguyễn Văn A', '2005-06-15', 'Hà Nội', 101),
(2, 'Trần Thị B', '2006-09-10', 'TP.HCM', 102);
-- 9. Thêm dữ liệu mẫu vào bảng Grades
INSERT INTO Grades (GradeID, StudentID, Subject, Grade) VALUES 
(1, 1, 'Toán', 8.5),
(2, 1, 'Văn', 7.0),
(3, 2, 'Toán', 9.0),
(4, 2, 'Văn', 8.0);
/*
10. Truy vấn thử nghiệm
Bạn có thể thực hiện các truy vấn thử nghiệm để kiểm tra dữ liệu đã được nhập đúng hay chưa. Ví dụ:
Truy vấn tất cả học sinh và lớp học của họ: */

SELECT Students.Name, Classes.ClassName
FROM Students
JOIN Classes ON Students.ClassID = Classes.ClassID; 
-- Truy vấn tất cả điểm số của một học sinh:
 SELECT Students.Name, Grades.Subject, Grades.Grade
FROM Students
JOIN Grades ON Students.StudentID = Grades.StudentID
WHERE Students.StudentID = 1;