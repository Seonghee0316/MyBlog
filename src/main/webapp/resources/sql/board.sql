CREATE table blog_board(
    board_num INT PRIMARY KEY,
    board_name VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE blog_boardseq
   start with 1
   increment by 1;