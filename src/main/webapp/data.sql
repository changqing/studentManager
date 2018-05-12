drop table if exists t_lesson;

create table t_lesson (
  id int primary key auto_increment,
  name varchar(45),
  tid int,
  tname varchar(45),
  xueshi int,
  address  varchar(45),
  time varchar(45)
);
insert into t_lesson (name, tid, tname, xueshi, address, time) values('程序语言设计', 1, '张老师', 4, '16号教学楼', '周一第一、二节课');
insert into t_lesson (name, tid, tname, xueshi, address, time) values('数据结构', 2, '李老师', 4, '15号教学楼', '周二第三、四节课');
insert into t_lesson (name, tid, tname, xueshi, address, time) values('模拟电路', 3, '刘老师', 4, '15号教学楼', '周三第五、六节课');

drop table if exists t_student;

create table t_student (
  id int primary key auto_increment,
  username varchar(45),
  password varchar(45),
  truename varchar(45),
  sex varchar(45),
  phone  varchar(45),
  email varchar(45)
);
INSERT INTO t_student(username, password, truename, sex, phone, email) VALUES ('201421113001', '123456', '张三', '男', '16666666666', '980777047@qq.com');
INSERT INTO t_student(username, password, truename, sex, phone, email) VALUES ('201421113002', '666666', '李四', '女', '18888888888', '777766655@qq.com');
INSERT INTO t_student(username, password, truename, sex, phone, email) VALUES ('201421113003', '888888', '刘五', '男', '17777777777', '999988877@qq.com');

drop table if exists t_teacher;
create table t_teacher (
  id int primary key auto_increment,
  username varchar(45),
  password varchar(45),
  truename varchar(45),
  phone  varchar(45),
  email varchar(45),
  role VARCHAR(45)
);
INSERT INTO t_teacher(username, password, truename, phone, email, role) VALUES ('zhangsan', '123456', '张老师', '13827653445','zhangsan@163.com','2');
INSERT INTO t_teacher(username, password, truename, phone, email, role) VALUES ('lisi', '123456', '李老师', '13827653446','zlisi@163.com','2');
INSERT INTO t_teacher(username, password, truename, phone, email, role) VALUES ('1421113001', '123456', '黄老师', '13333333333', '777777777@qq.com', '2');
INSERT INTO t_teacher(username, password, truename, phone, email, role) VALUES ('1421112001', '123456', '余老师', '16666666666', '88888888@qq.com', '3');

drop table if exists t_stulesson;
create table t_stulesson (
  id int primary key auto_increment,
  sid int,
  sname varchar(45),
  lid int,
  lname  varchar(45),
  tid int,
  tname VARCHAR(45),
  score int,
  address VARCHAR(45),
  time VARCHAR(45)
);
INSERT INTO t_stulesson(sid, sname, lid, lname, tid, tname, score, address, time) VALUES (1, '张三', 1, '程序语言设计', 4211, '张老师', 85,'16号教学楼', '周一第一、二节课' );
INSERT INTO t_stulesson(sid, sname, lid, lname, tid, tname, score, address, time) VALUES (2, '李四', 2, '数据结构', 4212, '李老师', 79, '15号教学楼', '周二第三、四节课');
INSERT INTO t_stulesson(sid, sname, lid, lname, tid, tname, score, address, time) VALUES (3, '张三', 3, '模拟电路', 4213, '刘老师', 80, '15号教学楼', '周三第五、六节课');
INSERT INTO t_stulesson(sid, sname, lid, lname, tid, tname, score, address, time) VALUES (4, '李四', 4, '数字电路', 4214, '陈老师', 86, '15号教学楼', '周四第五、六节课');


drop table if exists t_leave;
create table t_leave (
  id int primary key auto_increment,
  sid int,
  sname varchar(45),
  title VARCHAR(45),
  content VARCHAR(45),
  status VARCHAR(45)
);
INSERT INTO t_leave(sid, sname, title, content, status) VALUES (1, '张三', '请假申请', '两天', '待批');
INSERT INTO t_leave(sid, sname, title, content, status) VALUES (2, '李四', '请假申请', '一天', '批准');

drop table if exists t_notice;
create table t_notice (
  id int primary key auto_increment,
  title varchar(45),
  content VARCHAR(45),
  tid int,
  tname VARCHAR(45),
  publishtime TIMESTAMP
);
INSERT INTO t_notice(title, content, tid, tname, publishtime) VALUES ('考试通知', '5月28日举行其中考试', 124, '张老师', '2018-05-03 00:00:01');
INSERT INTO t_notice(title, content, tid, tname, publishtime) VALUES ('放假通知', '6月1日放假', 125, '李老师', '2018-05-24 00:00:01');

