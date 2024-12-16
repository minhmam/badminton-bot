CREATE TABLE tbl_telegram_group(
    ID bigint(20) primary key
);

update tbl_message
set status = 'off'
where type = '/leave_8h';

INSERT INTO tbl_status values ('off', 'Đăng ký nghỉ cả ngày', 'off');

// update kiendev
// thêm bảng chứa ảnh (lưu theo định dạng base64) và lời chúc
CREATE table tbl_image (
    id INT (6)  UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    caption VARCHAR(255) NOT NULL,
    image text
)
// thêm cột ngày sinh nhật
alter table tbl_telegram_user add happy_birthday date;
