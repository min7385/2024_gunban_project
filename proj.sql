CREATE TABLE members(
     mem_id VARCHAR2(100)
    ,mem_pw VARCHAR2(100)
    ,mem_nm VARCHAR2(100)
);

INSERT INTO members(mem_id, mem_pw, mem_nm)
VALUES ('admin', 'admin', '관리자');

--
CREATE TABLE boards(
                 board_no NUMBER GENERATED ALWAYS AS IDENTITY
                ,board_title VARCHAR2(1000)
                ,mem_id VARCHAR2(100)
                ,board_content VARCHAR2(2000)
                ,create_dt DATE
                ,update_dt DATE
                ,use_yn VARCHAR2(1) DEFAULT 'Y'
                ,PRIMARY KEY(board_no)
);

ALTER TABLE members ADD CONSTRAINT pk_member PRIMARY KEY(mem_id);
ALTER TABLE boards ADD CONSTRAINT fk_board FOREIGN KEY(mem_id) REFERENCES members(mem_id);
ALTER TABLE boards ADD hit NUMBER;
ALTER TABLE boards ADD mem_nm VARCHAR2(1000);

COMMIT;

INSERT INTO boards(board_title, mem_nm, board_content, create_dt, hit)
VALUES(3, 'asdf', 'asdfasdf', sysdate, 1);

--
CREATE TABLE replys(
     reply_no NUMBER
    ,board_no NUMBER(10)
    ,mem_id VARCHAR2(100)
    ,reply_content VARCHAR2(1000)
    ,reply_date DATE DEFAULT SYSDATE
    ,del_yn VARCHAR2(1) DEFAULT 'N'
    ,PRIMARY KEY(reply_no)
    ,CONSTRAINT fk_board_no FOREIGN KEY (board_no) REFERENCES boards(board_no)
    ON DELETE CASCADE   -- board 삭제 시 관련 replys도 삭제    
);

--
CREATE TABLE list(
                no NUMBER
                ,name VARCHAR2(100)
                ,address VARCHAR2(500)
                ,openingDate DATE DEFAULT sysdate
                ,status VARCHAR2(100)
);

SELECT no, name, address, openingdate, status
FROM list;


SELECT a.board_no
		     , a.board_title
		     , b.mem_id
		     , a.board_content
		     , b.mem_nm
		FROM boards a, members b
		ORDER BY a.board_no DESC;
        
    
SELECT a.board_no
    ,a.board_title
    ,a.mem_id
    ,a.board_content
    ,b.mem_nm
FROM boards a, members b;

-- 게시글 상세 보기
		
		 SELECT a.board_no
	         , a.board_title
	         , a.board_content
	         , a.mem_id
	         , b.mem_nm
	         , a.update_dt
	     FROM boards a, members b
	     WHERE a.board_no = 1;

SELECT * FROM boards;



---------------
SELECT update_dt
FROM boards;


SELECT a.board_no
		     , a.board_title
		     , a.board_content
		     , b.mem_id
		     , b.mem_nm
		FROM boards a, members b
		ORDER BY a.board_no DESC;