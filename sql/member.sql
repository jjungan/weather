DROP TABLE PICTURE;
DROP TABLE MEMBER;
DROP SEQUENCE NO_SEQ;

CREATE TABLE  "MEMBER" 
   (
	"EMAIL" VARCHAR2(200), 
	"PASSWORD" VARCHAR2(200), 
	"NAME" VARCHAR2(200), 
	"GENDER" VARCHAR2(100), 
	"LOCATION" VARCHAR2(400), 
	 CONSTRAINT "MEMBER_PK" PRIMARY KEY ("EMAIL") ENABLE
   );


insert into member 
values('test@test.test', 'test', '테스트', 'female', null);

commit;

