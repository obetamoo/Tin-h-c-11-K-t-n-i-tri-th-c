#DROP DATABASE studentdb;

/*
Tóm Tắt Cơ Sở Dữ Liệu
Students: Lưu trữ thông tin sinh viên hoặc học sinh.
Courses: Lưu trữ thông tin về các khóa học.
Enrollments: Theo dõi các khóa học mà sinh viên đã đăng ký.
*/

/*
# Tạo Cơ Sở Dữ Liệu
CREATE DATABASE StudentDB;
USE StudentDB;

# Tạo Bảng Sinh Viên
# Chúng ta sẽ tạo bảng Students để lưu trữ thông tin về sinh viên.
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Nam', 'Nữ') NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    EnrollmentDate DATE
);

#Thêm Dữ Liệu Vào Bảng Sinh Viên
#Chèn một số bản ghi mẫu vào bảng Students.
INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, Email, PhoneNumber, EnrollmentDate)
VALUES
('A', 'Nguyễn Văn', '2007-05-15', 'Nam', 'john.doe@example.com', '123-456-7890', '2020-08-01'),
('Linh', 'Nguyễn Thùy', '2007-07-22', 'Nữ', 'jane.smith@example.com', '987-654-3210', '2021-09-01'),
('Hiếu', 'Phùng Trọng', '2006-11-30', 'Nữ', 'alice.johnson@example.com', '456-789-0123', '2020-08-01'),
('Thủy', 'Thu', '2008-03-14', 'Nữ', 'bob.brown@example.com', '654-321-0987', '2021-09-01');

#Tạo Bảng Các Khóa Học
#Để quản lý các khóa học mà sinh viên đăng ký, chúng ta cần một bảng Courses.
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CourseCode VARCHAR(10) UNIQUE NOT NULL,
    Credits INT NOT NULL
);

# Thêm Dữ Liệu Vào Bảng Các Khóa Học
# Chèn một số bản ghi mẫu vào bảng Courses.
INSERT INTO Courses (CourseName, CourseCode, Credits)
VALUES
('Toán kết nối tri thức', 'CS101', 3),
('Văn', 'CS202', 4),
('Vật lý cánh diều', 'CS303', 3),
('Hóa chân trời sáng tạo', 'CS404', 3);

# Tạo Bảng Đăng Ký Khóa Học
# Chúng ta cũng cần một bảng Enrollments để theo dõi các khóa học mà sinh viên đã đăng ký.
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

#Thêm Dữ Liệu Vào Bảng Đăng Ký Khóa Học
#Chèn một số bản ghi mẫu vào bảng Enrollments.
INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, '2020-08-15'),
(1, 2, '2020-08-15'),
(2, 3, '2021-09-10'),
(3, 1, '2020-08-20'),
(4, 4, '2021-09-15'),
(4, 3, '2021-09-15');
*/



# Lấy thông tin tất cả sinh viên:
SELECT * FROM Students;

/*
# Lấy danh sách các khóa học mà sinh viên John Doe đã đăng ký:
SELECT c.CourseName, e.EnrollmentDate
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE s.FirstName = 'John' AND s.LastName = 'Doe';

# Lấy danh sách sinh viên đăng ký khóa học "Database Systems":
SELECT s.FirstName, s.LastName, e.EnrollmentDate
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Database Systems';
