-- 테스트용 테이블 생성
CREATE TABLE TB_TEST(
TEST_NO NUMBER PRIMARY KEY,
TEST_TITLE VARCHAR2(100) NOT NULL,
TEST_CONTENT VARCHAR2(500) NOT NULL
);


SELECT * FROM TB_TEST;

UPDATE TB_TEST SET
TEST_NO = '1', TEST_TITLE = '제목', TEST_CONTENT = '내용'
WHERE TEST_NO = 1;