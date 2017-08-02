create table willbe_memo(
	memo_num number primary key,
	member_id varchar2(20),
	memo_contents varchar2(3000),
	CONSTRAINT memo_id foreign key(member_id) references willbe_member(id)	
);

CREATE SEQUENCE seq_willbeMemo
  START WITH 0    
  INCREMENT BY 1  
  MAXVALUE 1000   
  MINVALUE 0     
  CYCLE           
  CACHE 20;