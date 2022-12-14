SELECT * FROM "MEMBER";

SELECT * FROM BOARD_TYPE;

-- 게시판 이름 목록 조회 순서대로
SELECT * FROM BOARD_TYPE
ORDER BY 1;

SELECT * FROM BOARD_IMG;


-- BOARD_CODE
SELECT * FROM "BOARD"
WHERE BOARD_CODE = 2
ORDER BY 1 DESC;

-- 601, 602, 603, 604

-- 게시글 이미지 삽입
INSERT INTO BOARD_IMG
VALUES(SEQ_IMG_NO.NEXTVAL, '경로',
	'파일이름', '파일이름변경', 1, 게시글번호);

-- 특정 게시글 목록 조회
-- 게시글 번호, 제목, 작성자닉네임, 조회수, 작성일
-- + 댓글 수, 좋아요 수 , 썸네일

SELECT BOARD_NO, BOARD_TITLE, MEMBER_NICKNAME, READ_COUNT,
CASE 
	WHEN SYSDATE - B_CREATE_DATE < 1/24/60
	THEN FLOOR( (SYSDATE - B_CREATE_DATE) * 24 * 60 * 60 ) || '초 전'
	WHEN SYSDATE - B_CREATE_DATE < 1/24
	THEN FLOOR( (SYSDATE - B_CREATE_DATE) * 24 * 60) || '분 전'
	WHEN SYSDATE - B_CREATE_DATE < 1
	THEN FLOOR( (SYSDATE - B_CREATE_DATE) * 24) || '시간 전'		
	ELSE TO_CHAR(B_CREATE_DATE, 'YYYY-MM-DD')
END B_CREATE_DATE,
(SELECT COUNT(*) FROM "COMMENT" C
WHERE C.BOARD_NO = B.BOARD_NO) COMMENT_COUNT,
(SELECT COUNT(*) FROM BOARD_LIKE L
WHERE L.BOARD_NO = B.BOARD_NO) LIKE_COUNT
FROM BOARD B
JOIN MEMBER USING(MEMBER_NO)
WHERE BOARD_CODE = 2
AND BOARD_DEL_FL = 'N'
ORDER BY BOARD_NO DESC;

-- 댓글 수
SELECT COUNT(*) FROM "COMMENT"
WHERE BOARD_NO = 601;

-- 좋아요 수
SELECT COUNT(*) FROM BOARD_LIKE L
WHERE L.BOARD_NO = 601;

SELECT * FROM "COMMENT";
SELECT * FROM BOARD_LIKE;

-- 썸네일 이미지 조회
SELECT * FROM BOARD_IMG
WHERE IMG_ORDER = 1
AND BOARD_NO = 500;