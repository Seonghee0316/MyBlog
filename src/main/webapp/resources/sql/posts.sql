CREATE table blog_posts(
    posts_num INT PRIMARY KEY,
    board_num INT NOT NULL,
    writer VARCHAR2(50) NOT NULL,
    subject VARCHAR2(200) ,
    content VARCHAR2(3000),
    filename VARCHAR2(100),
    filesize INT,
    regdate date not null,
    ref int,
    re_step int,
    re_level int
);   

CREATE SEQUENCE blog_postsseq
   start with 1
   increment by 1;