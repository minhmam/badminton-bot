Changed
Fixed
[1.0.0] - 2021-05-16
Here we would have the update steps for 1.0.0 for people to follow.

Added
-Thêm vào 2 lựa chọn work_from_home và đăng ký onsite tại mb.

Changed

Fixed
-Sửa lỗi khi người dùng đổi tên.

Removed
-Tính năng thêm user từ phía quản trị viên tạm thời bị xóa.
-Tính năng thay đổi role user tạm thời bị xóa.
-Tính năng tự động đăng ký làm việc tại văn phòng khi người dùng đăng kí leave hoặc đến muộn
mà chưa có bản ghi worklocation bị xóa.

Fixed
[1.0.1] - 2021-05-17

Fixed
-Thay đổi múi giờ theo Asia/Ho_Chi_Minh (UTC+07:00)
-Sửa lỗi hiển thị của báo cáo hàng ngày.

-Lưu ý: Những người chưa từng giao tiếp với bot kể từ bản update 1.0.0 sẽ không xuất hiện trong báo cáo hàng ngày.

Added
Fixed
Changed
[1.0.2] - 2021-05-18
Added
-Tính năng tự động nhắc nhở đăng ký (checkin) địa điểm làm việc 
khi user chưa chấm công trước 9h30.
-Tự động thông báo danh sách người dùng chưa checkin vào 18h00 hàng ngày 
(T2-T6).

Fixed
-Lỗi hiển thị trong báo cáo khi người dùng đăng ký xin nghỉ cả ngày.

Changed
-Command /leave_8h - xin nghỉ cả ngày không còn xuất hiện khi gõ /leave
(Chỉ xuất hiện khi gõ /help, tuy nhiên vẫn hoạt động bình thường).

-Lưu ý: Bot không thể tự động tạo hội thoại, vì vậy những người không có cửa 
sổ hội thoại với bot sẽ không có chức năng nhắc nhở điểm danh cá nhân hàng ngày.
