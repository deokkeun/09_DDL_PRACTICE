CREATE TABLE NUM(
	NUM1 NUMBER
);

INSERT INTO NUM VALUES(4);
UPDATE NUM SET NUM1 = 3 WHERE NUM1 = 4; 

SELECT NUM1 FROM NUM;

ROLLBACK;

SELECT DENSE_RANK() OVER(ORDER BY NUM1)
FROM NUM;


CREATE TABLE EMP_TEST AS (SELECT * FROM EMPLOYEE);

SELECT * FROM EMP_TEST;


ALTER TABLE EMP_TEST ADD CONSTRAINT EMP_NAEM_U 
UNIQUE(EMP_NAME);

ALTER TABLE EMP_TEST ADD CONSTRAINT EMP_ID_U UNIQUE(EMP_ID);

ALTER TABLE EMP_TEST RENAME CONSTRAINT EMP_NAEM_U TO EMP_NAME_U;

ALTER TABLE EMP_TEST DROP CONSTRAINT EMP_NAME_U;

ALTER TABLE EMP_TEST DROP CONSTRAINT EMP_ID_U;

ALTER TABLE EMP_TEST RENAME TO EMP_COPY;


SELECT * FROM EMP_COPY;

ALTER TABLE EMP_COPY MODIFY EMP_ID NOT NULL;
ALTER TABLE EMP_COPY MODIFY EMP_ID NULL;




ALTER TABLE EMP_COPY ADD CONSTRAINT EMP_NO_U UNIQUE(EMP_NO);



-- CNAME VARCHAR2(30)
SELECT * FROM EMP_COPY;

ALTER TABLE EMP_COPY ADD(CNAME VARCHAR2(30));

SELECT * FROM EMP_COPY;

ALTER TABLE EMP_COPY MODIFY(CNAME VARCHAR2(20));

ALTER TABLE EMP_COPY DROP(CNAME);

SELECT * FROM EMP_COPY;





--LNAME '한국'

ALTER TABLE EMP_COPY ADD (LNAME VARCHAR2(30) DEFAULT '한국');
SELECT * FROM EMP_COPY;


ALTER TABLE EMP_COPY MODIFY LNAME DEFAULT 'KOREA';
SELECT * FROM EMP_COPY;



ALTER TABLE EMP_COPY ADD CONSTRAINT EMP_ID_PK PRIMARY KEY(EMP_ID);

ALTER TABLE EMP_COPY RENAME CONSTRAINT EMP_ID_PK TO EMP_ID_PRIMARY;

ALTER TABLE EMP_COPY MODIFY EMP_ID VARCHAR2(3);


ALTER TABLE EMP_COPY RENAME COLUMN EMP_ID TO EMP_NUM;


DROP TABLE EMP_COPY;


CREATE TABLE TB1(
	TB1_PK NUMBER PRIMARY KEY,
	TB1_COL NUMBER
);

CREATE TABLE TB2(
	TB2_PK NUMBER PRIMARY KEY,
	TB2_COL NUMBER,
	CONSTRAINT TB2_COL_FK FOREIGN KEY (TB2_COL) REFERENCES TB1
);

DROP TABLE TB2;

-- TB1에 샘플 데이터 삽입
INSERT INTO TB1 VALUES(1, 100);
INSERT INTO TB1 VALUES(2, 200);
INSERT INTO TB1 VALUES(3, 300);

COMMIT;


-- TB2에 샘플 데이터 삽입
INSERT INTO TB2 VALUES(11, 1);
INSERT INTO TB2 VALUES(12, 2);
INSERT INTO TB2 VALUES(13, 3);

SELECT * FROM TB1;
SELECT * FROM TB2;

ALTER TABLE TB2 RENAME COLUMN TB2_COL TO TB2_COLCOL;

DROP TABLE TB1 CASCADE CONSTRAINTS;

ROLLBACK;

COMMENT ON COLUMN TB2.TB2_PK IS '기본키';

COMMENT ON COLUMN TB2.TB2_COLCOL IS '콜콜';
