SELECT USER
FROM DUAL;
--==>> PROJECTORS


-- ○ 모든 테이블 정보 조회
SELECT *
FROM TAB;


--○ 테이블 확인
DESC TOOL;
/*
이름        널?       유형           
--------- -------- ------------ 
TOOL_NO   NOT NULL NUMBER(3)    
TOOL_NAME NOT NULL VARCHAR2(40)
*/

/*
INSERT INTO TOOL VALUES (1, 'JavaScript');
INSERT INTO TOOL VALUES (2, 'Python');
INSERT INTO TOOL VALUES (3, 'Java');
INSERT INTO TOOL VALUES (4, 'C#');
INSERT INTO TOOL VALUES (5, 'PHP');
INSERT INTO TOOL VALUES (6, 'C++');
INSERT INTO TOOL VALUES (7, 'Ruby');
INSERT INTO TOOL VALUES (8, 'Swift');
INSERT INTO TOOL VALUES (9, 'Kotlin');
INSERT INTO TOOL VALUES (10, 'TypeScript');
INSERT INTO TOOL VALUES (11, 'React');
INSERT INTO TOOL VALUES (12, 'Angular');
INSERT INTO TOOL VALUES (13, 'Vue.js');
INSERT INTO TOOL VALUES (14, 'Django');
INSERT INTO TOOL VALUES (15, 'Ruby on Rails');
INSERT INTO TOOL VALUES (16, 'Spring Boot');
INSERT INTO TOOL VALUES (17, 'Express.js');
INSERT INTO TOOL VALUES (18, 'Flask');
INSERT INTO TOOL VALUES (19, 'jQuery');
INSERT INTO TOOL VALUES (20, 'TensorFlow');
INSERT INTO TOOL VALUES (21, 'Visual Studio Code');
INSERT INTO TOOL VALUES (22, 'Git');
INSERT INTO TOOL VALUES (23, 'Docker');
INSERT INTO TOOL VALUES (24, 'Node.js');
INSERT INTO TOOL VALUES (25, 'Jupyter Notebook');
INSERT INTO TOOL VALUES (26, 'Android Studio');
INSERT INTO TOOL VALUES (27, 'Xcode');
INSERT INTO TOOL VALUES (28, 'Eclipse');
INSERT INTO TOOL VALUES (29, 'PostgreSQL');
INSERT INTO TOOL VALUES (30, 'MySQL');
*/


SELECT *
FROM TOOL;
/*
1	JavaScript
2	Python
3	Java
4	C#
5	PHP
6	C++
7	Ruby
8	Swift
9	Kotlin
10	TypeScript
11	React
12	Angular
13	Vue.js
14	Django
15	Ruby on Rails
16	Spring Boot
17	Express.js
18	Flask
19	jQuery
20	TensorFlow
21	Visual Studio Code
22	Git
23	Docker
24	Node.js
25	Jupyter Notebook
26	Android Studio
27	Xcode
28	Eclipse
29	PostgreSQL
30	MySQL
*/


-------========================= 쿼리문 짜기 =============================-----------
-- ※ 

-- ● FindPassword.jsp
-- ○ 비밀번호 찾는 메소드 (해당이메일이 존재하면(1) 그 이메일로 비밀번호 재발송 / 존재하지 않으면(0) 에러 문구)
-- ● FindId.jsp
-- ○ 아이디 찾는 메소드 (해당이메일이 존재하면(1) 존재한다고 안내 / 존재하지 않으면(0) 존재하지 않는다고 안내)
SELECT COUNT(*)
FROM USERS
WHERE ID = 회원이메일;





-- ● 모집공고 INSERT

--○ 모집공고 시퀀스 생성
CREATE SEQUENCE RECRUITSEQ
NOCACHE;

-- ○ 모집공고 내용 INSERT
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE,	PRJ_START, PRJ_END)
            VALUES (RECRUITSEQ, 회원식별번호, 대면/비대면, 제목, 내용, SYSDATE
                  , TO_DATE(프로젝트 시작일,'YYYY-MM-DD'), TO_DATE(프로젝트 종료일,'YYYY-MM-DD'))

-- ○ 모집공고 필요 기술 시퀀스 생성
CREATE SEQUENCE RECRUITTOOLSEQ
NOCACHE;

-- ○ 모집공고 필요 기술 INSERT
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
                 VALUES (RECRUITTOOLSEQ, 모집공고번호, 도구번호)

-- ○ 모집공고 필요 포지션 시퀀스 생성
CREATE SEQUENCE RECRUITPOSITIONSEQ
NOCACHE;

-- ○ 모집공고 필요 포지션 INSERT
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO) 
                VALUES (RECRUITPOSITIONSEQ, 모집공고번호, 포지션번호)






-- ● PostLists.jsp
-- ○ 지역코드으로 그 지역에 해당하는 상세지역명 찾기 (VALUE 값으로 지역 번호 넘어올 예정)
SELECT SUB_REGION_NAME
FROM SUB_REGION
WHERE REGION_NO = '2';





-- ● 모집공고 리스트 출력
--    보여져야 하는 것: 작성자(모집자), 모집마감일, D-DAY, 모집시작일, 모집종료일
--                     공고제목, 공고내용, 대면/비대면, 지역명, 상세지역명 (모집자 지역)
--    필요한 것 : 게시물 번호
-- ○ 모집공고 리스트 출력 (뷰)
CREATE OR REPLACE VIEW RECRUITVIEW
AS
SELECT RECRUIT_NO AS RECRUIT_NO
     , PIN_NO AS RECRUITER
     , TO_DATE(CREATED_DATE,'YYYY-MM-DD') + 14 AS DEADLINE_DATE
     , (TO_DATE(CREATED_DATE,'YYYY-MM-DD') + 14) - TO_DATE(SYSDATE,'YYYY-MM-DD') AS DDAY
     , PRJ_START AS PRJ_START
     , PRJ_END AS PRJ_END
     , TITLE AS TITLE
     , CONTENT AS CONTENT
     , DO_TYPE_NO AS DO_TYPE_NO
     , (SELECT REGION_NAME
        FROM REGION 
        WHERE REGION_NO = (SELECT REGION_NO
                          FROM SUB_REGION
                          WHERE SUB_REGION_NO = (SELECT SUB_REGION_NO
                                                FROM PROFILE
                                                WHERE PIN_NO = RECRUIT.PIN_NO))) AS REGION_NAME
     , (SELECT SUB_REGION_NAME
        FROM SUB_REGION
        WHERE SUB_REGION_NO = (SELECT SUB_REGION_NO
                              FROM PROFILE
                              WHERE PIN_NO = RECRUIT.PIN_NO)) AS SUB_REGION_NAME
FROM RECRUIT;
-- 삭제된 공고 제외해야함 (<>)


--    보여져야 하는 것: 사용언어들(여러개)
--    필요한 것 : 게시물 번호(RECRUIT_NO)
-- ○ 모집공고 사용언어 리스트 출력 (뷰)
CREATE OR REPLACE VIEW RECRUITTOOLVIEW
AS
SELECT TOOL_NAME
FROM TOOL
WHERE TOOL_NO = (SELECT TOOL_NO
                 FROM RECRUIT_TOOL
                 WHERE RECRUIT_NO = 모집공고번호);
--    보여져야 하는 것: 모집포지션(여러개) 각포지션별 뽑힌사람
--    필요한 것 : 게시물 번호(RECRUIT_NO)
-- ○ 모집공고 모집포지션 리스트 출력 (뷰)
CREATE OR REPLACE VIEW RECRUITPOSITIONVIEW
AS
SELECT A.RECRUIT_POS_NO
     , (SELECT POS_NAME
        FROM POSITION
        WHERE POS_NO = A.POS_NO) AS POS_NAME
     , COUNT(*) AS COUNTALL
     , (SELECT COUNT(*)
FROM FIRST_CK
WHERE APPLY_NO IN (SELECT APPLY_NO
                   FROM APPLY
                   WHERE RECRUIT_POS_NO = A.RECRUIT_POS_NO)) AS COUNTPOS
FROM RECRUIT_POS A
WHERE A.RECRUIT_NO = '1'
GROUP BY A.RECRUIT_POS_NO;
-- 피티쌤이 이상 없댔는데 데이터가 없어서 오류나는 걸 수도 잇대요. 다 따로 쪼개면 작동되는 구문
/*
제공해주신 쿼리도 문법적으로는 오류가 없어 보입니다. 
이 쿼리는 RECRUIT_POS 테이블에서 RECRUIT_NO가 '1'인 경우에 대해 RECRUIT_POS_NO를 기준으로 그룹화하고, 
각각의 그룹에서 POS_NAME을 가져오고 COUNT를 수행한 결과를 조회합니다. 
또한, 해당 RECRUIT_POS_NO에 대한 COUNTPOS를 계산하는 서브쿼리도 포함되어 있습니다.
*/


-- ○ 모집공고삭제 시퀀스 생성
CREATE SEQUENCE RECRUITDELETESEQ
NOCACHE;


-- ○ 모집공고 삭제
INSERT INTO DEL_RECRUIT(DEL_RECRUIT_NO, RECRUIT_NO, DEL_DATE)
VALUES (RECRUITDELETESEQ, 모집공고번호, SYSDATE);




-- ● 







-- ● 







-- ● 





-- ● 



























