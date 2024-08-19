-- Active: 1720597003956@@127.0.0.1@3306@studentmanagement
-- Tạo cơ sở dữ liệu studentManagement
CREATE DATABASE studentManagement;
USE studentManagement;

-- Tạo bảng Hocsinh
CREATE TABLE Hocsinh (
    HoTen VARCHAR(100),
    SoCCCD VARCHAR(12) UNIQUE,
    SoTheHocSinh VARCHAR(20) PRIMARY KEY,
    NgaySinh DATE,
    DiaChi VARCHAR(255)
);

-- Tạo bảng Monhoc
CREATE TABLE Monhoc (
    TenMon VARCHAR(100),
    MaMon VARCHAR(10) PRIMARY KEY
);

-- Tạo bảng Diem
CREATE TABLE Diem (
    SoTheHocSinh VARCHAR(20),
    MaMon VARCHAR(10),
    Nam INT,
    HocKi INT,
    LoaiDiem VARCHAR(50),
    Diem FLOAT,
    PRIMARY KEY (SoTheHocSinh, MaMon, Nam, HocKi, LoaiDiem),
    FOREIGN KEY (SoTheHocSinh) REFERENCES Hocsinh(SoTheHocSinh),
    FOREIGN KEY (MaMon) REFERENCES Monhoc(MaMon)
);


-- Dữ Liệu Mẫu
-- Nhập Dữ Liệu vào Bảng Hocsinh
INSERT INTO Hocsinh (HoTen, SoCCCD, SoTheHocSinh, NgaySinh, DiaChi) VALUES
('Nguyen Van A', '123456789012', 'HS001', '2005-05-15', '123 Nguyen Trai, Hanoi'),
('Tran Thi B', '987654321098', 'HS002','2005-08-22', '456 Le Loi, Ho Chi Minh City'),
('Le Van C', '111223344555', 'HS003','2006-03-30', '789 Hoang Hoa Tham, Da Nang'),
('Pham Thi D', '555666777888', 'HS004', '2006-12-12', '321 Vo Van Tan, Hanoi');

--  Nhập Dữ Liệu vào Bảng Monhoc
INSERT INTO Monhoc (TenMon, MaMon) VALUES
('Toan', 'MON001'),
('Van', 'MON002'),
('Ly', 'MON003'),
('Hoa', 'MON004');

-- Nhập Dữ Liệu vào Bảng Diem
INSERT INTO Diem (SoTheHocSinh, MaMon, Nam, HocKi, LoaiDiem, Diem) VALUES
('HS001', 'MON001', 2024, 1, 'ĐĐG thường xuyên', 8.5),
('HS001', 'MON001', 2024, 1, 'ĐĐG giữa kì', 9.0),
('HS001', 'MON001', 2024, 1, 'ĐĐG cuối kì', 8.0),
('HS002', 'MON002', 2024, 1, 'ĐĐG thường xuyên', 7.5),
('HS002', 'MON002', 2024, 1, 'ĐĐG giữa kì', 8.0),
('HS003', 'MON003', 2024, 1, 'ĐĐG cuối kì', 6.5),
('HS004', 'MON004', 2024, 1, 'ĐĐG giữa kì', 9.5);

-- Các Câu Lệnh SQL Truy Vấn

-- Truy vấn tất cả thông tin học sinh
SELECT * FROM Hocsinh;

-- Truy vấn thông tin học sinh cụ thể bằng số thẻ học sinh
SELECT * FROM Hocsinh WHERE SoTheHocSinh = 'HS001';


-- Truy vấn tất cả môn học
SELECT * FROM Monhoc;

-- Truy vấn thông tin môn học cụ thể bằng mã môn
SELECT * FROM Monhoc WHERE MaMon = 'MON003';

-- Truy vấn điểm của học sinh với số thẻ học sinh 'HS001'
SELECT * FROM Diem WHERE SoTheHocSinh = 'HS001';

-- Truy vấn điểm của học sinh với số thẻ học sinh 'HS001' và môn 'MON001'
SELECT * FROM Diem WHERE SoTheHocSinh = 'HS001' AND MaMon = 'MON001';

-- Truy vấn điểm của tất cả học sinh cho môn học 'MON002'
SELECT H.HoTen, D.Nam, D.HocKi, D.LoaiDiem, D.Diem
FROM Diem D
JOIN Hocsinh H ON D.SoTheHocSinh = H.SoTheHocSinh
WHERE D.MaMon = 'MON002';

-- Truy vấn điểm trung bình của học sinh với số thẻ học sinh 'HS002'
SELECT SoTheHocSinh, MaMon, AVG(Diem) AS DiemTrungBinh
FROM Diem
WHERE SoTheHocSinh = 'HS002'
GROUP BY SoTheHocSinh, MaMon;

SELECT * FROM hocsinh where `SoTheHocSinh` = "HS003";

