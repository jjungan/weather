DROP TABLE PICTURE;

CREATE TABLE  "PICTURE" 
   (	
   "NO" NUMBER, 
	"EMAIL" VARCHAR2(200), 
	"TITLE" VARCHAR2(200), 
	"IMAGE" VARCHAR2(200), 
	"CONTENT" VARCHAR2(2000), 
	"TIME" VARCHAR2(200), 
	"SEASON" VARCHAR2(200), 
	"WEATHER" VARCHAR2(200), 
	"LOCATION" VARCHAR2(400), 
	"REGDATE" DATE, 
	"LIKES" NUMBER, 
	 CONSTRAINT "PICTURE_PK" PRIMARY KEY ("NO") ENABLE, 
	 CONSTRAINT "PICTURE_FK" FOREIGN KEY ("EMAIL")
	  REFERENCES  "MEMBER" ("EMAIL") ENABLE
   );
   
CREATE SEQUENCE   "PICTURE_NO_SEQ"  
MINVALUE 1 
MAXVALUE 9999999999999999 
INCREMENT BY 1 
START WITH 1 
NOCACHE  
NOORDER  
NOCYCLE;

insert into picture(no, title, image) 
values(picture_no_seq.nextval, 'koala', 'Koala.jpg');
insert into picture(no, title, image) 
values(picture_no_seq.nextval, 'desert', 'Desert.jpg');

insert into picture
values(picture_no_seq.nextval, '123', '등대', 'Lighthouse.jpg', '등대가 보이는 바다, 그리고 하늘!', null, '여름', null, null, sysdate, 0);
commit;

delete from picture;

select * from picture;

select * from picture where content like '%busan%' order by likes desc