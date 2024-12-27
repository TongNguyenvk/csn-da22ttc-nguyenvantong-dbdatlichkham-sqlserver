create database CSN_DKKB
go
use CSN_DKKB
go
create table BENHVIEN(
	mabenhvien varchar(10) not null,
	tenbenhvien nvarchar(50)

	primary key (mabenhvien)
)
go
create table CHUYENKHOA(
	machuyenkhoa varchar(10) not null,
	tenchuyenkhoa nvarchar(50)

	primary key(machuyenkhoa)
)
go
create table HOCHAM(
	mahocham varchar(10),
	tenhocham nvarchar(50)

	primary key(mahocham)
)
go
create table HOCVI(
	mahocvi varchar(10) not null,
	tenhocvi nvarchar(50)

	primary key(mahocvi)
)
go
create table DICHVU(
	madichvu varchar(10) not null,
	tendichvu nvarchar(50)

	primary key(madichvu)
)
go
create table BACSI(
	mabacsi varchar(10) not null,
	tenbacsi nvarchar(50),
	gioithieu ntext,
	namkinhnghiem int,
	machuyenkhoa varchar(10),
	mabenhvien varchar(10),
	mahocham varchar(10),
	mahocvi varchar(10)

	primary key(mabacsi)	
)

ALTER TABLE BACSI ADD CONSTRAINT FK_BACSI_BENHVIEN
	FOREIGN KEY (mabenhvien) REFERENCES BENHVIEN(mabenhvien)
ALTER TABLE BACSI ADD CONSTRAINT FK_BACSI_CHUYENKHOA
	FOREIGN KEY (machuyenkhoa) REFERENCES CHUYENKHOA(machuyenkhoa)
ALTER TABLE BACSI ADD CONSTRAINT FK_BACSI_HOCHAM
	FOREIGN KEY (mahocham) REFERENCES HOCHAM(mahocham)
ALTER TABLE BACSI ADD CONSTRAINT FK_BACSI_HOCVI1
	FOREIGN KEY (mahocvi) REFERENCES HOCVI(mahocvi)

go
create table PHONGKHAM(
	maphongkham varchar(10) not null,
	tenphongkham nvarchar(50),
	vitri nvarchar(50)

	primary key (maphongkham)
)
go
create table LICHKHAM(
	malich varchar(10) not null,
	ngay date,
	giobatdau time,
	gioketthuc time,
	maphongkham varchar(10)

	primary key (malich)
	CONSTRAINT FK_LICHKHAM_PHONGKHAM
	FOREIGN KEY (maphongkham) REFERENCES PHONGKHAM(maphongkham)

)
go
create table BENHNHAN(
	mabenhnhan varchar(10) not null,
	tenbenhnhan nvarchar(50),
	gioitinh nvarchar(5),
	sdt char(10),
	email varchar(50),
	ngaysinh date,
	diachi nvarchar(100)

	primary key (mabenhnhan)

)
go
create table DANGKY(
	madangky varchar(10) not null,
	mabacsi varchar(10) ,
	mabenhnhan varchar(10) ,
	malich varchar(10) ,
	madichvu varchar(10) 

	primary key(madangky)

)

ALTER TABLE DANGKY ADD CONSTRAINT FK_DANGKY_BACSI
	FOREIGN KEY (mabacsi) REFERENCES BACSI(mabacsi)
ALTER TABLE DANGKY ADD CONSTRAINT FK_DANGKY_BENHNHAN
	FOREIGN KEY (mabenhnhan) REFERENCES BENHNHAN(mabenhnhan)
ALTER TABLE DANGKY ADD CONSTRAINT FK_DANGKY_DICHVU
	FOREIGN KEY (madichvu) REFERENCES DICHVU(madichvu)
ALTER TABLE DANGKY ADD CONSTRAINT FK_DANGKY_LICH
	FOREIGN KEY (malich) REFERENCES LICHKHAM(malich)
go
INSERT INTO BENHVIEN (mabenhvien, tenbenhvien) 
VALUES 
	('bv01', N'Bệnh viện An Việt'),
	('bv02', N'Bệnh viện Vạn Hạnh'),
	('bv03', N'Bệnh viện Tâm Đức'),
	('bv04', N'Bệnh viện Thiên Ân'),
	('bv05', N'Bệnh viện Minh Tâm');

INSERT INTO CHUYENKHOA (machuyenkhoa, tenchuyenkhoa) 
VALUES 
  ('ck01', N'Cơ xương khớp'),
  ('ck02', N'Thần kinh'),
  ('ck03', N'Tiêu hóa'),
  ('ck04', N'Tim mạch'),
  ('ck05', N'Tai mũi họng'),
  ('ck06', N'Y học cổ truyền'),
  ('ck07', N'Sản - Nhi'),
  ('ck08', N'Mắt'),
  ('ck09', N'Nha khoa'),
  ('ck10', N'Nội tổng hợp'),
  ('ck11', N'Ngoại tổng hợp');

 INSERT INTO HOCHAM (mahocham, tenhocham) 
VALUES 
  ('hh01', N'Giáo sư'),
  ('hh02', N'Phó giáo sư'),
  ('hh03', null)

INSERT INTO HOCVI (mahocvi, tenhocvi) 
VALUES 
  ('hv01', N'Bác sĩ đa khoa'),
  ('hv02', N'Bác sĩ chuyên khoa I'),
  ('hv03', N'Bác sĩ chuyên khoa II'),
  ('hv04', N'Thạc sĩ'),
  ('hv05', N'Tiến sĩ');

  INSERT INTO BACSI (mabacsi, tenbacsi, namkinhnghiem, gioithieu, mabenhvien, machuyenkhoa, mahocham, mahocvi)
VALUES
  ('bs01', N'Nguyễn Thanh Tùng', 3, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv01', 'ck01', 'hh03', 'hv01'),
  ('bs02', N'Nguyễn Mạnh Hùng', 5, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv01', 'ck01', 'hh03', 'hv02'),
  ('bs03', N'Trần Thanh Tâm', 10, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv03', 'ck01', 'hh03', 'hv05'),
  ('bs04', N'Bùi Ngọc Hằng', 6, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv02', 'ck01', 'hh03', 'hv03'),
  ('bs05', N'Lê Quỳnh Như', 15, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv05', 'ck01', 'hh02', 'hv05'),
  ('bs06', N'Trần Thị Hương', 20, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv01', 'ck02', 'hh02', 'hv05'),
  ('bs07', N'Trần Hồng Quang', 12, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv02', 'ck02', 'hh03', 'hv03'),
  ('bs08', N'Phạm Văn Vinh', 20, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv04', 'ck02', 'hh02', 'hv04'),
  ('bs09', N'Nguyễn Hồng Thanh', 30, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv01', 'ck02', 'hh01', 'hv05'),
  ('bs10', N'Trần Văn Quyết', 14, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv05', 'ck03', 'hh02', 'hv04'),
  ('bs11', N'Nguyễn Văn Mạnh', 9, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv03', 'ck03', 'hh03', 'hv03'),
  ('bs12', N'Phan Văn Nam', 17, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv02', 'ck03', 'hh02', 'hv04'),
  ('bs13', N'Lê Thị Hạnh', 21, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv04', 'ck03', 'hh01', 'hv05'),
  ('bs14', N'Nguyễn Hoài An', 19, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv02', 'ck04', 'hh02', 'hv05'),
  ('bs15', N'Nguyễn Phúc Vinh', 15, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv01', 'ck04', 'hh02', 'hv04'),
  ('bs16', N'Đặng Thị Thu', 8, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv03', 'ck04', 'hh03', 'hv02'),
  ('bs17', N'Vũ Ngọc Anh', 12, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv04', 'ck04', 'hh02', 'hv03'),
  ('bs18', N'Hoàng Văn Tuấn', 15, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv01', 'ck05', 'hh01', 'hv04'),
  ('bs19', N'Lê Thị Minh', 20, N'Bác sĩ có chuyên môn tốt, có mục tiêu phát triển chuyên môn', 'bv02', 'ck05', 'hh02', 'hv05'),
  ('bs20', N'Trần Quốc Huy', 18, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm lâm sàng phong phú', 'bv05', 'ck05', 'hh03', 'hv03'),
  ('bs21', N'Nguyễn Thị Lan', 25, N'Bác sĩ có chuyên môn tốt, luôn cập nhật kiến thức mới', 'bv03', 'ck05', 'hh01', 'hv05'),
  ('bs22', N'Phạm Văn Thành', 11, N'Bác sĩ có chuyên môn tốt, có kỹ năng giao tiếp tốt', 'bv04', 'ck06', 'hh02', 'hv04'),
  ('bs23', N'Bùi Thị Hương', 14, N'Bác sĩ có chuyên môn tốt, tận tâm với bệnh nhân', 'bv01', 'ck06', 'hh03', 'hv02'),
  ('bs24', N'Đỗ Minh Tuấn', 19, N'Bác sĩ có chuyên môn tốt, có khả năng làm việc độc lập', 'bv02', 'ck06', 'hh01', 'hv03'),
  ('bs25', N'Vũ Thị Hằng', 16, N'Bác sĩ có chuyên môn tốt, có tinh thần trách nhiệm cao', 'bv05', 'ck07', 'hh02', 'hv04'),
  ('bs26', N'Hoàng Văn Nam', 22, N'Bác sĩ có chuyên môn tốt, có khả năng giải quyết vấn đề tốt', 'bv03', 'ck07', 'hh01', 'hv05'),
  ('bs27', N'Lê Thị Ngọc', 13, N'Bác sĩ có chuyên môn tốt, có khả năng làm việc nhóm tốt', 'bv04', 'ck07', 'hh03', 'hv03'),
  ('bs28', N'Trần Văn Minh', 17, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm giảng dạy', 'bv01', 'ck07', 'hh01', 'hv04'),
  ('bs29', N'Nguyễn Thị Thu', 21, N'Bác sĩ có chuyên môn tốt, có khả năng nghiên cứu khoa học', 'bv02', 'ck08', 'hh02', 'hv05'),
  ('bs30', N'Phạm Ngọc Anh', 10, N'Bác sĩ có chuyên môn tốt, có tinh thần cầu tiến', 'bv05', 'ck08', 'hh03', 'hv03'),
  ('bs31', N'Lê Văn Đức', 12, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv02', 'ck08', 'hh02', 'hv03'),
  ('bs32', N'Trần Thị Mỹ Linh', 15, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv01', 'ck08', 'hh02', 'hv05'),
  ('bs33', N'Nguyễn Ngọc Anh', 18, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv04', 'ck09', 'hh03', 'hv04'),
  ('bs34', N'Phạm Quang Huy', 20, N'Bác sĩ có chuyên môn tốt, có kinh nghiệm trong chuyên khoa của mình', 'bv03', 'ck09', 'hh02', 'hv02'),
  ('bs35', N'Bùi Thị Thu Hà', 10, N'Bác sĩ trẻ đầy nhiệt huyết, có kiến thức vững vàng về thần kinh học', 'bv05', 'ck09', 'hh03', 'hv03');
  update bacsi set mahocham = 'hh02' where mabacsi = 'bs02'
INSERT INTO DICHVU (madichvu, tendichvu) 
VALUES 
  ('dv01', N'Khám bảo hiểm'),
  ('dv02', N'Khám dịch vụ');

  INSERT INTO BENHNHAN (mabenhnhan, tenbenhnhan, gioitinh, sdt, email, ngaysinh, diachi)
VALUES
    ('bn01', N'Trần Văn Anh', N'nam', '0123456789', 'anhtran@gmail.com', '1977-01-01', N'Trà Vinh'),
    ('bn02', N'Nguyễn Thị Hương', N'nữ', '0987665432', 'huongnguyen@gmail.com', '1984-01-01', N'Vĩnh Long'),
    ('bn03', N'Trần Nguyên Vũ', N'nam', '032456789', 'vunguyen@gmail.com', '2004-02-01', N'Trà Vinh'),
    ('bn04', N'Trần Huyền Trân', N'nữ', '0912345678', 'trantran@gmail.com', '2003-04-03', N'Bến Tre'),
    ('bn05', N'Lê Ngọc Hằng', N'nữ', '0923446635', 'hangle@gmail.com', '2006-02-04', N'Vĩnh Long'),
    ('bn06', N'Nguyễn Duy Nhật', N'nam', '0357237457', 'nhatnguyen@gmail.com', '1997-04-01', N'Hồ Chí Minh'),
    ('bn07', N'Trần Thị Diễm', N'nữ', '0738295233', 'diemtran@gmail.com', '1990-04-01', N'Hồ Chí Minh'),
    ('bn08', N'Nguyễn Văn Tòng', N'Nam', '038377804', 'tongnguyen@gmail.com', '2003-12-13', N'Trà Vinh'),
    ('bn09', N'Lê Thị Lê', N'Nữ', '094735735', 'lele@gmail.com', '2002-12-04', N'Bến Tre'),
    ('bn10', N'Nguyễn Thị Mộng Mơ', N'nữ', '057397456', 'monguyen@gmail.com', '1999-11-23', N'Trà Vinh'),
	('bn11', N'Phan Văn Minh', N'nam', '0987654321', 'minhpham@gmail.com', '1985-05-15', N'Cần Thơ'),
    ('bn12', N'Trần Thị Thanh Thủy', N'nữ', '0123456789', 'thuytran@gmail.com', '1990-08-20', N'Hậu Giang'),
    ('bn13', N'Nguyễn Văn Nam', N'nam', '0345678912', 'namnguyen@gmail.com', '2002-11-05', N'Sóc Trăng'),
    ('bn14', N'Lê Thị Kim Ngân', N'nữ', '0987654321', 'nganle@gmail.com', '1995-03-10', N'Bạc Liêu'),
    ('bn15', N'Đặng Văn Tài', N'nam', '0123456789', 'taidang@gmail.com', '1978-07-25', N'Cà Mau'),
    ('bn16', N'Nguyễn Thị Thu Thảo', N'nữ', '0345678912', 'thaonguyen@gmail.com', '1992-12-01', N'Hồ Chí Minh'),
    ('bn17', N'Trần Văn Quang', N'nam', '0987654321', 'quangtran@gmail.com', '2000-04-15', N'Bình Dương'),
    ('bn18', N'Lê Thị Diễm My', N'nữ', '0123456789', 'myle@gmail.com', '1998-09-28', N'Đồng Nai'),
    ('bn19', N'Nguyễn Văn Hùng', N'nam', '0345678912', 'hungnguyen@gmail.com', '1980-02-12', N'Tây Ninh'),
    ('bn20', N'Trần Thị Ngọc Anh', N'nữ', '0987654321', 'ngocanhtran@gmail.com', '1994-06-20', N'Bình Phước');

	INSERT INTO PHONGKHAM (maphongkham, tenphongkham, vitri)
VALUES
    ('phong01', N'Phòng 1', N'Lầu 1 khu A'),
    ('phong02', N'Phòng 2', N'Lầu 1 khu A'),
    ('phong03', N'Phòng 3', N'Lầu 1 khu B'),
    ('phong04', N'Phòng 4', N'Lầu 1 khu B'),
    ('phong05', N'Phòng 5', N'Lầu 2 khu A'),
    ('phong06', N'Phòng 6', N'Lầu 2 khu A'),
    ('phong07', N'Phòng 7', N'Lầu 2 khu B'),
    ('phong08', N'Phòng 8', N'Lầu 2 khu B');

INSERT INTO LICHKHAM (malich, ngay, giobatdau, gioketthuc, maphongkham)
VALUES
    ('lk01', '2024-11-19', '07:00:00', '09:00:00', 'phong01'),
    ('lk02', '2024-11-19', '09:00:00', '11:00:00', 'phong01'),
    ('lk03', '2024-11-19', '13:00:00', '15:00:00', 'phong02'),
    ('lk04', '2024-11-19', '15:00:00', '17:00:00', 'phong02'),
    ('lk05', '2024-11-20', '07:00:00', '09:00:00', 'phong04'),
    ('lk06', '2024-11-20', '09:00:00', '11:00:00', 'phong04'),
    ('lk07', '2024-11-20', '13:00:00', '15:00:00', 'phong01'),
    ('lk08', '2024-11-20', '15:00:00', '17:00:00', 'phong01'),
    ('lk09', '2024-11-21', '07:00:00', '09:00:00', 'phong08'),
    ('lk10', '2024-11-21', '09:00:00', '11:00:00', 'phong08'),
    ('lk11', '2024-11-21', '13:00:00', '15:00:00', 'phong07'),
    ('lk12', '2024-11-21', '15:00:00', '17:00:00', 'phong07'),
    ('lk13', '2024-11-22', '07:00:00', '09:00:00', 'phong02'),
    ('lk14', '2024-11-22', '09:00:00', '11:00:00', 'phong02'),
    ('lk15', '2024-11-22', '13:00:00', '15:00:00', 'phong03'),
    ('lk16', '2024-11-22', '15:00:00', '17:00:00', 'phong03');

INSERT INTO DANGKY (madangky, mabacsi, mabenhnhan, malich, madichvu)
VALUES
    ('dk01','bs01', 'bn05', 'lk02', 'dv01'),
    ('dk02','bs01', 'bn03', 'lk02', 'dv02'),
    ('dk03','bs04', 'bn01', 'lk04', 'dv01'),
    ('dk04','bs04', 'bn02', 'lk06', 'dv02'),
    ('dk05','bs04', 'bn06', 'lk06', 'dv01'),
    ('dk06','bs03', 'bn08', 'lk01', 'dv02'),
    ('dk07','bs09', 'bn04', 'lk04', 'dv01'),
    ('dk08','bs02', 'bn07', 'lk05', 'dv02'),
    ('dk09','bs15', 'bn10', 'lk01', 'dv01'),
    ('dk10','bs10', 'bn09', 'lk02', 'dv02'),
	('dk11','bs10', null, 'lk02', null),
	('dk12','bs10', null, 'lk01', null),
	('dk13','bs10', null, 'lk05', null),
	('dk14','bs10', null, 'lk06', null),
	('dk15','bs09', null, 'lk03', null),
	('dk16','bs09', null, 'lk04', null),
	('dk17','bs09', null, 'lk05', null),
	('dk18','bs09', null, 'lk06', null),
	('dk19','bs03', null, 'lk14', null),
	('dk20','bs03', null, 'lk13', null),
	('dk21','bs07', null, 'lk16', null),
	('dk22','bs07', null, 'lk15', null),
	('dk23','bs10', 'bn09', 'lk02', 'dv02'),
	('dk24','bs10', null, 'lk02', null),
	('dk25', 'bs11', null, 'lk03', null),
    ('dk26', 'bs12', null, 'lk04', null),
    ('dk27', 'bs13', null, 'lk05', null),
    ('dk28', 'bs14', 'bn14', 'lk06', 'dv02'),
    ('dk29', 'bs15', 'bn15', 'lk01', 'dv01'),
    ('dk30', 'bs16', 'bn16', 'lk02', 'dv02'),
    ('dk31', 'bs17', 'bn17', 'lk03', 'dv01'),
    ('dk32', 'bs18', 'bn18', 'lk04', 'dv02'),
    ('dk33', 'bs19', 'bn19', 'lk05', 'dv01'),
    ('dk34', 'bs20', null, 'lk06', null),
    ('dk35', 'bs21', 'bn01', 'lk07', 'dv01'),
    ('dk36', 'bs22', null, 'lk08', null),
    ('dk37', 'bs23', null, 'lk09', null),
    ('dk38', 'bs24', null, 'lk10', null),
    ('dk39', 'bs25', 'bn05', 'lk11', 'dv01'),
    ('dk40', 'bs26', null, 'lk12', null),
    ('dk41', 'bs27', 'bn07', 'lk13', 'dv01'),
    ('dk42', 'bs28', 'bn08', 'lk14', 'dv02'),
    ('dk43', 'bs29', null, 'lk15', null),
    ('dk44', 'bs30', null, 'lk16', null);
	delete benhnhan
--truy vấn các đăng ký theo mã bệnh nhân
CREATE  PROCEDURE sp_getDKbymaBN 
@mabenhnhan varchar(10)
AS
BEGIN
    select b.tenbenhnhan as 'Tên bệnh nhân', c.tenbacsi as 'Tên bác sĩ' , d.ngay as 'Ngày khám' , d.giobatdau as 'Giờ khám' , h.tenchuyenkhoa as 'Chuyên khoa',e.tenphongkham as 'Phòng khám', e.vitri as 'Vị trí', tendichvu as 'Dịch vụ', g.tenbenhvien as 'Bệnh viện'
	from dangky a, benhnhan b, bacsi c, lichkham d, phongkham e, dichvu f, benhvien g, chuyenkhoa h
	where a.mabenhnhan = b.mabenhnhan and a.mabenhnhan = @mabenhnhan and a.mabacsi = c.mabacsi and a.malich = d.malich
	and d.maphongkham = e.maphongkham and a.madichvu = f.madichvu and c.mabenhvien = g.mabenhvien and c.machuyenkhoa = h.machuyenkhoa
END

 sp_getDKbymaBN 'bn01'

-- truy vấn các đăng ký theo mã bác sĩ
CREATE PROCEDURE sp_getDKbymaBS
@mabacsi varchar(10)
AS
BEGIN
    select c.tenbacsi as 'Tên bác sĩ', b.tenbenhnhan as 'Tên bệnh nhân', h.tenchuyenkhoa as 'Tên chuyên khoa', d.ngay as 'Ngày khám', d.giobatdau as 'Giờ khám', e.tenphongkham as 'Phòng khám', e.vitri as 'Vị trí', tendichvu as 'Dịch vụ', g.tenbenhvien as 'Bệnh viện'
	from dangky a, benhnhan b, bacsi c, lichkham d, phongkham e, dichvu f, benhvien g, chuyenkhoa h
	where a.mabenhnhan = b.mabenhnhan and a.mabacsi = @mabacsi and a.mabacsi = c.mabacsi and a.malich = d.malich
	and d.maphongkham = e.maphongkham and a.madichvu = f.madichvu and c.mabenhvien = g.mabenhvien and c.machuyenkhoa = h.machuyenkhoa
END
sp_getDKbymaBS 'bs01'
-- truy vấn thông tin bác sĩ bằng mã bác sĩ
CREATE PROCEDURE sp_getBSbymaBS
@mabacsi varchar(10)
AS
BEGIN
    select a.tenbacsi as 'Tên bác sĩ',  d.tenhocvi, e.tenchuyenkhoa, b.tenbenhvien,c.tenhocham, a.namkinhnghiem, a.gioithieu, h.ngay, h.giobatdau, h.gioketthuc, k.tenphongkham
	from bacsi a, benhvien b, hocham c, hocvi d, chuyenkhoa e, dangky f, LICHKHAM h, PHONGKHAM k
	where a.mabenhvien = b.mabenhvien and a.mahocham = c.mahocham and a.machuyenkhoa = e.machuyenkhoa and a.mahocvi = d.mahocvi 
	and a.mabacsi = @mabacsi and a.mabacsi = f.mabacsi and f.malich = h.malich and k.maphongkham = h.maphongkham
END

sp_getBSbymaBS 'bs09'


--truy vấn các bác sĩ thuộc bệnh viện bằng mã bệnh viện
CREATE PROCEDURE sp_getBSbymaBV
@mabenhvien varchar(10)
AS
BEGIN
    select a.tenbacsi as 'Tên bác sĩ',   d.tenhocvi as 'Học vị', e.tenchuyenkhoa as 'Chuyên khoa', c.tenhocham as 'Học hàm' ,b.tenbenhvien as 'Bệnh viện', h.ngay as 'Ngày khám', h.giobatdau 'Giờ khám', g.tenphongkham as 'Phòng khám', vitri as 'Vị trí'
	from bacsi a, benhvien b, hocham c, hocvi d, chuyenkhoa e, dangky f, phongkham g, lichkham h
	where a.mabenhvien = b.mabenhvien and a.mahocham = c.mahocham and a.machuyenkhoa = e.machuyenkhoa and a.mahocvi = d.mahocvi and a.mabacsi = f.mabacsi
	and f.malich = h.malich and h.maphongkham = g.maphongkham and a.mabenhvien = @mabenhvien
END

sp_getBSbymaBV 'bv01'
--truy vấn các bác sĩ thuộc chuyên khoa bằng mã chuyên khoa
CREATE PROCEDURE sp_getBSbymaCK
@machuyenkhoa varchar(10)
AS
BEGIN
    select a.tenbacsi as 'Tên bác sĩ',   d.tenhocvi as 'Học vị', e.tenchuyenkhoa as 'Tên chuyên khoa', c.tenhocham as 'Học hàm' ,b.tenbenhvien as 'Bệnh viện', h.ngay as 'Ngày', h.giobatdau as 'Giờ khám', g.tenphongkham as 'Phòng khám'
	from bacsi a, benhvien b, hocham c, hocvi d, chuyenkhoa e, dangky f, phongkham g, lichkham h
	where a.mabenhvien = b.mabenhvien and a.mahocham = c.mahocham and a.machuyenkhoa = e.machuyenkhoa and a.mahocvi = d.mahocvi and a.mabacsi = f.mabacsi
	and f.malich = h.malich and h.maphongkham = g.maphongkham  and a.machuyenkhoa = @machuyenkhoa
END
sp_getBSbymack 'ck01'



CREATE PROCEDURE sp_getBNbyMaBN 'bn01'
@mabenhnhan varchar(10)
AS
BEGIN
	select * 
	from benhnhan
	where mabenhnhan = @mabenhnhan
END


-- Đếm số lượng đăng ký theo ngày của bác sĩ
create PROCEDURE sp_countDKbyNgay 
@ngay date,
@mabacsi varchar(10)
AS
BEGIN
	select count(a.madangky) as 'Số lượng đăng ký'
	from DANGKY a, LICHKHAM b, BACSI c
	where  a.malich = b.malich and a.mabacsi = c.mabacsi and b.ngay = @ngay and a.mabacsi = @mabacsi and a.mabenhnhan is not null
END
sp_countDKbyNgay '2024-11-19','bs01'

-- Đếm số lượng đăng ký theo tháng của bác sĩ
create PROCEDURE sp_countDKbyThang
@thang int,
@nam int,
@mabacsi varchar(10)
AS
BEGIN
	select count(a.madangky) as 'Số lượng đăng ký'
	from DANGKY a, LICHKHAM b, BACSI c
	where  a.malich = b.malich and a.mabacsi = c.mabacsi and MONTH(b.ngay) = @thang and Year(b.ngay) = @nam and a.mabacsi = @mabacsi and a.mabenhnhan is not null
END
sp_countDKbyThang 11,2024,'bs01'

-- Đếm số lượng đăng ký theo năm của bác sĩ
create PROCEDURE sp_countDKbyNam
@nam int,
@mabacsi varchar(10)
AS
BEGIN
	select count(a.madangky) as 'Số lượng đăng ký'
	from DANGKY a, LICHKHAM b, BACSI c
	where  a.malich = b.malich and a.mabacsi = c.mabacsi and Year(b.ngay) = @nam and a.mabacsi = @mabacsi and a.mabenhnhan is not null
END
sp_countDKbyNam 2024 ,'bs01'
-- Đếm số lượng đăng ký theo ngày của các chuyên khoa
create  PROCEDURE sp_countDKbyNgay_CK
@ngay date

AS
BEGIN
	select d.tenchuyenkhoa as 'Tên chuyên khoa', count(a.madangky) as 'Số lượng đăng ký'
	from DANGKY a, LICHKHAM b, BACSI c, CHUYENKHOA d
	where  a.malich = b.malich and a.mabacsi = c.mabacsi and b.ngay = @ngay and  c.machuyenkhoa = d.machuyenkhoa and a.mabenhnhan is not null
	group by d.tenchuyenkhoa
END
sp_countDKbyNgay_CK '2024-11-19'

-- Đếm số lượng đăng ký theo tháng của chuyên khoa
create  PROCEDURE sp_countDKbyThang_CK
@thang int,
@nam int

AS
BEGIN
	select d.tenchuyenkhoa as 'Tên chuyên khoa', count(a.madangky) as 'Số lượng đăng ký'
	from DANGKY a, LICHKHAM b, BACSI c, CHUYENKHOA d
	where  a.malich = b.malich and a.mabacsi = c.mabacsi and MONTH( b.ngay) = @thang and YEAR(b.ngay) = @nam and c.machuyenkhoa = d.machuyenkhoa  and a.mabenhnhan is not null
	group by d.tenchuyenkhoa
END
sp_countDKbyThang_CK 11, 2024

-- Đếm số lượng đăng ký theo năm của chuyên khoa
create PROCEDURE sp_countDKbyNam_CK
@nam int

AS
BEGIN
	select d.tenchuyenkhoa as 'Tên chuyên khoa', count(a.madangky) as 'Số lượng đăng ký'
	from DANGKY a, LICHKHAM b, BACSI c, CHUYENKHOA d
	where  a.malich = b.malich and a.mabacsi = c.mabacsi  and YEAR(b.ngay) = @nam and c.machuyenkhoa = d.machuyenkhoa  and a.mabenhnhan is not null
	group by d.tenchuyenkhoa
END
sp_countDKbyNam_CK 2024

--hien thi bs truc buoi nao 
--them ck vao dk 
--them 10 bs 


	select a.tenbacsi,   d.tenhocvi, e.tenchuyenkhoa, c.tenhocham ,b.tenbenhvien, a.namkinhnghiem, a.gioithieu, h.ngay, h.giobatdau, h.gioketthuc, g.tenphongkham 
	from bacsi a, benhvien b, hocham c, hocvi d, chuyenkhoa e, dangky f, phongkham g, lichkham h
	where a.mabenhvien = b.mabenhvien and a.mahocham = c.mahocham and a.machuyenkhoa = e.machuyenkhoa and a.mahocvi = d.mahocvi and a.mabacsi = f.mabacsi
	and f.malich = h.malich and h.maphongkham = g.maphongkham
	

select * from bacsi

sp_getdkbymabn 'bn01'

sp_getDKbymaBS 'bs01'

sp_getBSbymaCK 'ck01'

sp_getBSbymaBV 'bv01'


select mabacsi as 'Mã bác sĩ', tenbacsi as 'Tên bác sĩ', gioithieu as 'Giới thiệu', namkinhnghiem as 'Năm kinh nghiệm', machuyenkhoa as 'Mã chuyên khoa', mabenhvien as 'Mã bệnh viện', mahocham as 'Mã học hàm', mahocvi as 'Mã học vị'
from bacsi


select mabenhnhan  as 'Mã bệnh nhân', tenbenhnhan as 'Tên bệnh nhân', gioitinh as 'Giới tính', sdt as 'Số điện thoại', email as 'Email', ngaysinh as 'Ngày sinh', diachi as 'Địa chỉ' 
from benhnhan

select madangky as 'Mã đăng ký', mabacsi as 'Mã bác sĩ', mabenhnhan as 'Mã bệnh nhân', malich as 'Mã lịch khám', madichvu as 'Mã dịch vụ'
from dangky




	select count(a.madangky)
	from DANGKY a, LICHKHAM b, BACSI c
	where  a.malich = b.malich and a.mabacsi = c.mabacsi and b.ngay = '2024-11-19'