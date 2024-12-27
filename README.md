# ĐỒ ÁN CƠ SỞ NGÀNH: THIẾT KẾ CƠ SỞ DỮ LIỆU CHO HỆ THỐNG ĐẶT LỊCH TRỰC TUYẾN TẠI MỘT SỐ BỆNH VIỆN
      Giáo viên hướng dẫn : Phan Thị Phương Nam

      
      Sinh viên thực hiện: Nguyễn Văn Tổng
# CÁC BƯỚC THỰC HIỆN
## Mô tả bài toán
Người dùng truy cập hệ thống và cung cấp thông tin cá nhân bao gồm họ tên, giới tính, địa chỉ, số điện thoại và email để có thể đăng ký.
Hệ thống hiển thị danh sách các bệnh viện, thông tin cơ bản của bệnh viện bao gồm: mã bệnh viện và tên bệnh viện, giúp người dùng dễ dàng lựa chọn địa điểm khám phù hợp.
Sau khi chọn bệnh viện, người dùng sẽ được cung cấp danh sách các bác sĩ đang hành nghề tại đó, kèm theo thông tin chi tiết về học hàm, học vị và chuyên khoa. Mỗi bác sĩ chỉ trực thuộc một bệnh viện duy nhất.
Người dùng tiếp tục chọn lịch khám phù hợp từ danh sách các khung giờ trống của từng bác sĩ. Mỗi lịch khám được phân bổ cho một hoặc nhiều bác sĩ và có thể thuộc nhiều dịch vụ khám khác nhau.
Cuối cùng, người dùng chọn dịch vụ khám mong muốn và hoàn tất quá trình đặt lịch. Hệ thống sẽ gửi thông tin xác nhận lịch hẹn đến email và số điện thoại đã đăng ký. Người dùng có thể kiểm tra lại và chỉnh sửa thông tin đặt lịch bất kỳ lúc nào.


## Thiết kế cơ sở dữ liệu
### BENHVIEN (Hospital)
*   **mabenhvien** (Hospital ID): Variable characters (10), Primary Key, Mandatory
*   tenbenhvien (Hospital Name): Variable characters (50)

### CHUYENKHOA (Specialty)
*   **machuyenkhoa** (Specialty ID): Variable characters (10), Primary Key, Mandatory
*   tenchuyenkhoa (Specialty Name): Variable characters (50)

### BENHNHAN (Patient)
*   **mabenhnhan** (Patient ID): Variable characters (10), Primary Key, Mandatory
*   tenbenhnhan (Patient Name): Variable characters (50)
*   gioitinh (Gender): Variable characters (5)
*   sdt (Phone Number): Characters (10)
*   email (Email): Characters (50)
*   ngaysinh (Date of Birth): Date
*   diachi (Address): Variable characters (100)

### BACSI (Doctor)
*   **mabacsi** (Doctor ID): Variable characters (10), Primary Key, Mandatory
*   tenbacsi (Doctor Name): Variable characters (50)
*   namkinhnghiem (Years of Experience): Integer
*   gioithieu (Introduction): Text

### HOCHAM (Academic Title)
*   **mahh** (Academic Title ID): Variable characters (10), Primary Key, Mandatory
*   tenhh (Academic Title Name): Variable characters (50)

### HOCVI (Degree)
*   **mahy** (Degree ID): Variable characters (10), Primary Key, Mandatory
*   tenhv (Degree Name): Variable characters (50)

### DICHVU (Service)
*   **madichvu** (Service ID): Variable characters (10), Primary Key, Mandatory
*   tendichvu (Service Name): Variable characters (50)

### PHONGKHAM (Clinic/Room)
*   **maphongkham** (Clinic ID): Variable characters (10), Primary Key, Mandatory
*   tenphongkham (Clinic Name): Variable characters (50)
*   vitri (Location): Variable characters (50)

### LICHKHAM (Appointment)
*    **malich** (Appointment ID): Variable characters (10), Primary Key, Mandatory
*    ngay (Date): Date
*    giobatdau (Start Time): Time
*    gioketthuc (End Time): Time

### DANGKY (Registration)
*    **madangky** (Registration ID): Variable characters (10), Primary Key, Mandatory

### Relationships

*   **BENHVIEN** 1,n - GOM (Contains)
*   **CHUYENKHOA** 1,n - THUOC (Belongs To)
*   **BENHNHAN** 1,n - DANGKY (Registers)
*    **BACSI** 1,1 - DAT (Has)
*    **BACSI** 1,n - KHAM (Examines)
*  **HOCHAM** 1,n - DAT (Has)
* **HOCVI** 1,n - CO (Has)
* **LICHKHAM** 1,1 - CUA (Of)
* **PHONGKHAM** 1,1 - O (At)
*   **DANGKY** 1,1 - CUA (Of)
*  **DICHVU** 1,n - SU_DUNG (Uses)
*  **DANGKY** 1,1 - SU_DUNG (Uses)
