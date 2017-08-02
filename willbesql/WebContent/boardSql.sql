

create table togetherBoard(
board_num number primary key,
member_id varchar2(20),
board_title varchar2(50),
board_contents varchar2(3000),
board_date Timestamp default sysdate,
board_readcount number,
board_like number, 
board_file varchar2(50),
CONSTRAINT member_id foreign key(member_id) references willbe_member(id)
);

create table questionBoard(
board_num number primary key, 
member_id varchar2(20), 
board_title varchar2(50), 
board_contents varchar2(3000),
board_date Timestamp default sysdate,
board_readcount number, 
board_file varchar2(50),
CONSTRAINT questionMember_id foreign key(member_id) references willbe_member(id)
);

CREATE SEQUENCE seq_togetherBoard
  START WITH 0  
  INCREMENT BY 1
  MAXVALUE 1000 
  MINVALUE 0    
  CYCLE        
  CACHE 20;
  
CREATE SEQUENCE seq_questionBoard
  START WITH 0
  INCREMENT BY 1
  MAXVALUE 1000   
  MINVALUE 0      
  CYCLE         
  CACHE 20;


create table togetherReply(
reply_num number primary key,
board_num number,
member_id varchar2(20),
reply_contents varchar2(1000), 
reply_date Timestamp default sysdate,
reply_like number default 0, 
CONSTRAINT reply_member_id foreign key(member_id) references willbe_member(id),
CONSTRAINT reply_board_num foreign key(board_num) references togetherBoard(board_num)
);

create table questionReply(
reply_num number primary key,
board_num number, 
member_id varchar2(20), 
reply_contents varchar2(1000),
reply_date Timestamp default sysdate,
CONSTRAINT reply_question_id foreign key(member_id) references willbe_member(id),
CONSTRAINT reply_question_num foreign key(board_num) references togetherBoard(board_num)
);



CREATE SEQUENCE seq_reply
   START WITH 0   
   INCREMENT BY 1 
   MAXVALUE 1000   
   MINVALUE 0      
   CYCLE 
   CACHE 20;
  
CREATE SEQUENCE seq_qeustionReply
   START WITH 0 
   INCREMENT BY 1
   MAXVALUE 1000
   MINVALUE 0 
   CYCLE      
   CACHE 20;


create table togetherBoard_like(
like_id varchar2(20),
board_num number references togetherBoard(board_num)
);

create table questionBoard(
board_num number primary key,
member_id varchar2(20),
board_title varchar2(50),
board_contents varchar2(3000),
board_date Timestamp default sysdate,
board_readcount number, 
board_file varchar2(50), 
CONSTRAINT questionMember_id foreign key(member_id) references willbe_member(id)
);

CREATE SEQUENCE seq_questionBoard
  START WITH 0   
  INCREMENT BY 1 
  MAXVALUE 1000   
  MINVALUE 0     
  CYCLE       
  CACHE 20;
  
  
create table questionReply(
reply_num number primary key, 
board_num number, 
member_id varchar2(20), 
reply_contents varchar2(1000),
reply_date Timestamp default sysdate,
CONSTRAINT reply_question_id foreign key(member_id) references willbe_member(id),
CONSTRAINT reply_question_num foreign key(board_num) references questionBoard(board_num)
);

CREATE SEQUENCE seq_qeustionReply
   START WITH 0   
   INCREMENT BY 1  
   MAXVALUE 1000
   MINVALUE 0      
   CYCLE        
   CACHE 20;