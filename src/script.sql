
CREATE TABLE tbl_agenda (
                            id bigint(20) NOT NULL AUTO_INCREMENT,
                            type varchar(20) not null,
                            from_time datetime DEFAULT NULL,
                            to_time datetime DEFAULT NULL,
                            note varchar(250) CHARACTER SET utf8 DEFAULT NULL,
                            view_modes int(11) DEFAULT '0',
                            owner_id bigint(20) default null,
                            owner_name nvarchar(50) not null,
                            created_time datetime DEFAULT NULL,
                            modified_time datetime DEFAULT NULL,
                            PRIMARY KEY (id)
);


create table tbl_telegram_user(
                                  telegram_name nvarchar(50) primary key,
                                  full_name nvarchar(50) not null,
                                  role_id int default 2
);

create table tbl_role_user(
                              role_id int primary key,
                              role_detail varchar(10) not null
);

alter table tbl_telegram_user add constraint user_role_id_fk
    foreign key (role_id) references tbl_role_user(role_id);

INSERT INTO tbl_role_user VALUES (1, 'admin');
INSERT INTO tbl_role_user VALUES (2, 'member');


create table tbl_message(
                            type varchar(20) not null primary key,
                            message nvarchar(50) not null,
                            status varchar(20) not null
);

INSERT INTO tbl_message values ('/leave_2h_am', 'xin nghỉ nửa buổi sáng','leave');
INSERT INTO tbl_message values ('/leave_2h_pm', 'xin nghỉ nửa buổi chiều','leave');
INSERT INTO tbl_message values ('/leave_4h_am', 'xin nghỉ buổi sáng','leave');
INSERT INTO tbl_message values ('/leave_4h_pm', 'xin nghỉ buổi chiều','leave');
INSERT INTO tbl_message values ('/leave_8h', 'xin nghỉ cả ngày','leave');

INSERT INTO tbl_message values ('/late_15', 'xin đến muộn 15p','late');
INSERT INTO tbl_message values ('/late_30', 'xin đến muộn 30p','late');
INSERT INTO tbl_message values ('/late_45', 'xin đến muộn 45p','late');

INSERT INTO tbl_message values ('/onsite_mc', 'Đăng ký làm việc Onsite dự án MCredit','onsite');
INSERT INTO tbl_message values ('/onsite_vtnet', 'Đăng ký làm việc Onsite dự án Viettel Networkt','onsite');
INSERT INTO tbl_message values ('/onsite_vtt', 'Đăng ký làm việc Onsite dự án Viettel Telecom','onsite');
INSERT INTO tbl_message values ('/onsite_vcc', 'Đăng ký làm việc Onsite dự án Viettel Construction','onsite');
INSERT INTO tbl_message values ('/onsite_viettelimex', 'Đăng ký làm việc Onsite dự án Viettelimex','onsite');


-- INSERT INTO tbl_telegram_user values (N'Le Cuong', N'Lê Cao Cường',1);


-- /onsite - Đăng ký làm việc Onsite => list danh sách các lệnh onsite
-- /onsite_mc - Đăng lý làm việc Onsite dự án MCredit
-- /onsite_vtnet- Đăng lý làm việc Onsite dự án Viettel Network
-- /onsite_vtt - Đăng lý làm việc Onsite dự án Viettel Telecom
-- /onsite_vcc - Đăng lý làm việc Onsite dự án Viettel Construction
-- /onsite_viettelimex - Đăng lý làm việc Onsite dự án Viettelimex

INSERT INTO tbl_status (status, status_info, status_type)
VALUES ('long_leave', 'Đăng ký nghỉ dài hạn', 'other');

INSERT INTO tbl_message (type, message, status)
VALUES ('/long_leave_custom', 'Đăng ký nghỉ dài hạn', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/leave_dead_3d', 'Đăng ký nghỉ đám ma', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/leave_pregnant_man_10d', 'Đăng ký nghỉ thai sản cho nam (Vợ sinh đôi thường)', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/leave_pregnant_man_14d', 'Đăng ký nghỉ thai sản cho nam (vợ sinh đôi mổ)', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/leave_pregnant_man_5d', 'Đăng ký nghỉ thai sản cho nam (vợ sinh thường)', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/leave_pregnant_man_7d', 'Đăng ký nghỉ thai sản cho nam (vợ sinh mổ)', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/leave_pregnant_women_6m', 'Đăng ký nghỉ thai sản cho nữ', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/leave_wedding_1d', 'Đăng ký nghỉ đám cưới con cái', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/leave_wedding_self_3d', 'Đăng ký nghỉ đám cưới bản thân', 'long_leave');

INSERT INTO tbl_message (type, message, status)
VALUES ('/long_leave_custom', 'Đăng ký nghỉ dài hạn', 'long_leave');

