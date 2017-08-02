Create table willbe_member(
id varchar2(20) primary key,
pass varchar2(20),
name varchar2(20),
sex varchar2(5),
phone varchar2(20),
email varchar2(40)
);

Create table willbe_schedule(
id varchar2(20) references willbe_member(id),
year varchar2(10),
month varchar2(10),
day varchar2(10),
time varchar2(30),
Title varchar2(30),
content varchar2(500)
);

Create table willbe_diary(
id varchar2(20) references willbe_member(id),
year varchar2(10),
month varchar2(10),
day varchar2(10),
time varchar2(10),
Title varchar2(20),
content varchar2(2000)
);


create table willbe_wallet(
id varchar2(20) references willbe_member(id),
no NUMBER(20),   
inout VARCHAR2(20), 
year VARCHAR2(20), 
month VARCHAR2(20), 
day VARCHAR2(20), 
moneyinout VARCHAR2(40), 
content VARCHAR2(50), 
moneysum VARCHAR2(50) );

create sequence wallet_seq
  start with 1
  increment by 1
  maxvalue 100000;