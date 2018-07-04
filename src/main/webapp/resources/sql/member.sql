-- CREATE --
CREATE TABLE blog_member(
    num INT NOT NULL PRIMARY KEY,
    email VARCHAR2(50) NOT NULL,
    pwd VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    gender INT,
    birthday VARCHAR2(20),
    joindate DATE NOT NULL,
    profile VARCHAR2(100)
);

CREATE SEQUENCE blog_memberseq
    START WITH 1
    INCREMENT BY 1
    NOMAXVALUE;

COMMIT;    

-- SELECT --
SELECT * FROM blog_member;
SELECT blog_memberseq.nextval from dual;

-- DELETE --
DROP TABLE blog_member;
DROP SEQUENCE blog_membersql;
TRUNCATE TABLE blog_member;
DELETE FROM blog_member WHERE email = 'admin@naver.com';

-- INSERT --
INSERT INTO blog_member(num,email,pwd,name,gender,birthday,joindate)
 VALUES(blog_memberseq.nextval,'xodgl@daum.net','1234','유성희',NULL,NULL,sysdate);

INSERT INTO blog_member(num,email,pwd,name,gender,birthday,joindate)
 VALUES(blog_memberseq.nextval,'admin@naver.com','1234','관리자',0,sysdate,sysdate);

INSERT INTO blog_member(num,email,pwd,name,gender,birthday,joindate)
 VALUES(blog_memberseq.nextval,'xodgl@daum.net','1234','유성희',1,sysdate,sysdate);
 COMMIT;
 





