# ĐỒ ÁN CƠ SỞ NGÀNH
# THIẾT KẾ CƠ SỞ DỮ LIỆU CHO HỆ THỐNG ĐẶT LỊCH TRỰC TUYẾN TẠI MỘT SỐ BỆNH VIỆN
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
*   **mabenhvien** (Hospital ID): varchar(10) `<pk>`
*   tenbenhvien (Hospital Name): varchar(50)

### CHUYENKHOA (Specialty)
*   **machuyenkhoa** (Specialty ID): varchar(10) `<pk>`
*   tenchuyenkhoa (Specialty Name): varchar(50)

### BENHNHAN (Patient)
*   **mabenhnhan** (Patient ID): varchar(10) `<pk>`
*   tenbenhnhan (Patient Name): varchar(50)
*   gioitinh (Gender): varchar(5)
*   sdt (Phone Number): char(10)
*   email (Email): char(50)
*   ngaysinh (Date of Birth): datetime
*   diachi (Address): varchar(100)

### BACSI (Doctor)
*   **mabacsi** (Doctor ID): varchar(10) `<pk>`
*   mahv (Degree ID): varchar(10) `<fk3>`
*   mabenhvien (Hospital ID): varchar(10) `<fk4>`
*   mahh (Academic Title ID): varchar(10) `<fk2>`
*   machuyenkhoa (Specialty ID): varchar(10) `<fk1>`
*   tenbacsi (Doctor Name): varchar(50)
*   namkinhnghiem (Years of Experience): int
*   gioithieu (Introduction): text

### HOCHAM (Academic Title)
*   **mahh** (Academic Title ID): varchar(10) `<pk>`
*   tenhh (Academic Title Name): varchar(50)

### HOCVI (Degree)
*   **mahv** (Degree ID): varchar(10) `<pk>`
*   tenhv (Degree Name): varchar(50)

### DICHVU (Service)
*   **madichvu** (Service ID): varchar(10) `<pk>`
*   tendichvu (Service Name): varchar(50)

### PHONGKHAM (Clinic/Room)
*   **maphongkham** (Clinic ID): varchar(10) `<pk>`
*   tenphongkham (Clinic Name): varchar(50)
*   vitri (Location): varchar(50)

### DANGKY (Registration)
*    **madangky** (Registration ID): varchar(10) `<pk>`
*    malich (Appointment ID): varchar(10) `<fk2>`
*   mabenhnhan (Patient ID): varchar(10) `<fk3>`
*   madichvu (Service ID): varchar(10) `<fk4>`
*   mabacsi (Doctor ID): varchar(10) `<fk1>`

### LICHKHAM (Appointment)
*   **malich** (Appointment ID): varchar(10) `<pk>`
*   maphongkham (Clinic ID): varchar(10) `<fk>`
*   ngay (Date): datetime
*   giobatdau (Start Time): datetime
*   gioketthuc (End Time): datetime

### Ký hiệu
*   Khóa chính được ký hiệu bằng `<pk>`
*   Khóa ngoại được ký hiệu bằng `<fk>` 

## Cài đặt và thêm dữ liệu
### Tạo cơ sở dữ liệu
```sql
CREATE DATABASE CSN_DKKB;
USE CSN_DKKB;
-- Thực thi các lệnh tạo bảng và các ràng buộc như trong file `DB_DKKB.sql`
```
## Kiểm thử
### Quá trình nghiên cứu và thiết kế cơ sở dữ liệu cho hệ thống đặt lịch khám trực tuyến đã đạt được những kết quả đáng kể:

*   **Xây dựng thành công một cấu trúc cơ sở dữ liệu:** Đáp ứng được các yêu cầu cơ bản của một hệ thống đặt lịch khám trực tuyến, bao gồm quản lý thông tin bệnh nhân, bác sĩ, lịch khám, và các thông tin liên quan khác.
*   **Đảm bảo tính toàn vẹn và bảo mật dữ liệu:** Các ràng buộc và cơ chế bảo mật đã được thiết lập để bảo vệ thông tin cá nhân của bệnh nhân và đảm bảo tính chính xác của dữ liệu.
## Thông tin liên hệ
*   Số điện thoại: 0383778804
*   Email: 110122188@st.tvu.edu.vn
  
