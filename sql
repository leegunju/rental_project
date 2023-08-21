<<<<<<< HEAD
=======
2023-06-27
dbname: springproject
id: springuser
pw: mysql

create table product(
pno int auto_increment,
type_a varchar(100) not null,
pname varchar(100) not null,
price int not null,
content text,
count int default 0,
primary key(pno));

2023-06-28
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
create table customer(
cid varchar(100) not null,
cname varchar(10) not null,
cpw varchar(100) not null,
cage int not null,
cgender varchar(5) not null,
cnick_name varchar(10) not null,
cemail varchar(50) not null,
ctel int not null,
cadd varchar(100) not null,
cdate datetime default now(),
<<<<<<< HEAD
primary key(cid))

create table rentals(
rno int not null,
rdate datetime default now(),
ramount int not null default 1,
primary key(rno))

create table admin(
aid varchar(100) not null,
apw varchar(100) not null,
aname varchar(10) not null,
aadd varchar(100) not null,
aemail varchar(50) not null,
atel varchar(15) not null,
primary key(aid))
=======
primary key(cid));
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62

create table file(
uuid varchar(256) not null,
save_dir varchar(256) not null,
file_name varchar(256) not null,
file_type tinyint(1) default 0,
file_size int,
pno int,
<<<<<<< HEAD
primary key(uuid))

create table product(
pno int auto_increment,
type_a varchar(100) not null,
pname varchar(100) not null,
price int not null,
content text,
count int default 0,
primary key(pno))

create table comment(
cno int not null auto_increment,
pno int not null,
writer varchar(100) not null,
content text,
creg_date datetime default now(),
cmod_date datetime,
rate int,
primary key(cno))

create table consult(
csno int auto_increment not null,
csid varchar(100),
cscontent text,
csdate datetime default current_timestamp,
cstype varchar(100),
csname varchar(10),
cstel varchar(15),
primary key(csno));

insert into customer(cid, cname, cpw, cage, cgender, cnick_name, cemail, ctel, cadd)
values("gudfo", "gudfo", "gudfo", 1, "man", "gudfo", "gudfo@gudfo.com", "010-3239-5471", "gudfo")

CREATE TABLE admin_calendarevent(
  event_num int NOT NULL AUTO_INCREMENT,
  date date NOT NULL,
  time time NOT NULL,
  request_term text,
  cid varchar(100),
  status varchar(50),
  admin_confirmation tinyint(1) DEFAULT 0,
  type_a varchar(100),
  pno int,
  admin_comments text,
  PRIMARY KEY(event_num),
  FOREIGN KEY(cid) REFERENCES customer(cid),
  FOREIGN KEY(pno) REFERENCES product(pno)
);

CREATE TABLE calendarevent(
  event_num int NOT NULL AUTO_INCREMENT,
  date date NOT NULL,
  time time NOT NULL,
  request_term text,
  cid varchar(100),
  status varchar(50),
  admin_confirmation tinyint(1) DEFAULT 0,
  type_a varchar(100),
  pno int,
  PRIMARY KEY(event_num),
  FOREIGN KEY(cid) REFERENCES customer(cid),
  FOREIGN KEY(pno) REFERENCES product(pno)
);

=======
primary key(uuid));

2023-06-30
create table consult(
csno int not null auto_increment,
cscontent text,
csdate datetime default now(),
primary key(csno));
>>>>>>> 763658bbd707cf8f6210e039ed0846155792dc62
