SELECT USER
FROM DUAL;
--==>> PROJECTORS


-------======================================================= 쿼리문 짜기 ===========================================================-----------
---------------------------------------------------------------------------------------------------------------- ● 모집공고 INSERT
-- ○ 모집공고 내용 INSERT
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE,	PRJ_START, PRJ_END)
            VALUES (RECRUITSEQ, 회원식별번호, 대면/비대면, 제목, 내용, SYSDATE
                  , TO_DATE(프로젝트 시작일,'YYYY-MM-DD'), TO_DATE(프로젝트 종료일,'YYYY-MM-DD'))

-- ○ 모집공고 필요 기술 INSERT
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
                 VALUES (RECRUITTOOLSEQ, 모집공고번호, 도구번호)

-- ○ 모집공고 필요 포지션 INSERT
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO) 
                VALUES (RECRUITPOSITIONSEQ, 모집공고번호, 포지션번호)



---------------------------------------------------------------------------------------------------------------- ● 모집공고 Lists
--    보여져야 하는 것: 작성자(모집자), 모집마감일, D-DAY, 모집시작일, 모집종료일
--                     공고제목, 공고내용, 대면/비대면, 지역명, 상세지역명 (모집자 지역)
--    필요한 것 : 게시물 번호
-- ○ 모집공고 리스트 출력 (뷰)
CREATE OR REPLACE VIEW RECRUITVIEW
AS
SELECT RECRUIT_NO AS RECRUITNO
     , PIN_NO AS PINNO
     , TO_CHAR(TO_DATE(CREATED_DATE,'YYYY-MM-DD') + 14, 'YYYY.MM.DD') AS DEADLINEDATE
     , (TO_DATE(CREATED_DATE,'YYYY.MM.DD') + 14) - TO_DATE(SYSDATE,'YYYY.MM.DD') AS DDAY
     , TO_CHAR(PRJ_START, 'YYYY.MM.DD') AS PRJSTART
     , TO_CHAR(PRJ_END, 'YYYY.MM.DD') AS PRJEND
     , TITLE AS TITLE
     , CONTENT AS CONTENT
     , (SELECT DO_TYPE_NAME
        FROM DO_TYPE
        WHERE DO_TYPE_NO = RECRUIT.DO_TYPE_NO) AS DOTYPENAME
     , (SELECT REGION_NAME
        FROM REGION 
        WHERE REGION_NO = (SELECT REGION_NO
                          FROM SUB_REGION
                          WHERE SUB_REGION_NO = (SELECT SUB_REGION_NO
                                                FROM PROFILE
                                                WHERE PIN_NO = RECRUIT.PIN_NO))) AS REGIONNAME
     , (SELECT SUB_REGION_NAME
        FROM SUB_REGION
        WHERE SUB_REGION_NO = (SELECT SUB_REGION_NO
                              FROM PROFILE
                              WHERE PIN_NO = RECRUIT.PIN_NO)) AS SUBREGIONNAME
FROM RECRUIT
WHERE RECRUIT_NO NOT IN (SELECT REP_RECRUIT_NO FROM REP_RECRUIT_RESULT WHERE REP_RESULT_NO = 1)
  AND RECRUIT_NO NOT IN (SELECT DEL_APPLY_NO FROM DEL_APPLY);
  
  
--○ RECRUITVIEW 전체 리스트 출력
SELECT RECRUITNO, PINNO, DEADLINEDATE, DDAY, PRJSTART, PRJEND, TITLE, CONTENT
        , DOTYPENAME, REGIONNAME, SUBREGIONNAME
FROM RECRUITVIEW
WHERE DDAY >= 0;
  
  
  	private int regionNo, subRegionNo, posNo, toolNo, doTypeNo;
	private String regionName, subRegionName, posName, toolName, doTypeName;
	private int countAll, countPos;
	private String recruitNo, pinNo, deadlineDate, dDay, prjStart, prjEnd, title, content;
  
--○ JOIN 버전
SELECT A.RECRUIT_NO AS RECRUIT_NO
     , A.PIN_NO AS RECRUITER
     , TO_DATE(A.CREATED_DATE,'YYYY-MM-DD') + 14 AS DEADLINE_DATE
     , (TO_DATE(A.CREATED_DATE,'YYYY-MM-DD') + 14) - TO_DATE(SYSDATE,'YYYY-MM-DD') AS DDAY
     , A.PRJ_START AS PRJ_START
     , A.PRJ_END AS PRJ_END
     , A.TITLE AS TITLE
     , A.CONTENT AS CONTENT
     , A.DO_TYPE_NO AS DO_TYPE_NO
     , D.REGION_NAME AS REGION_NAME
     , C.SUB_REGION_NAME AS SUB_REGION_NAME
FROM RECRUIT A 
    LEFT JOIN PROFILE B ON A.PIN_NO = B.PIN_NO
    LEFT JOIN SUB_REGION C ON B.SUB_REGION_NO = C.SUB_REGION_NO
    LEFT JOIN REGION D ON C.REGION_NO = D.REGION_NO;


--○ 사용언어랑 합친 버전
SELECT A.RECRUIT_NO AS RECRUITNO
     , A.PIN_NO AS PINNO
     , TO_DATE(A.CREATED_DATE,'YYYY-MM-DD') + 14 AS DEADLINEDATE
     , (TO_DATE(A.CREATED_DATE,'YYYY-MM-DD') + 14) - TO_DATE(SYSDATE,'YYYY-MM-DD') AS DDAY
     , A.PRJ_START AS PRJSTART
     , A.PRJ_END AS PRJEND
     , A.TITLE AS TITLE
     , A.CONTENT AS CONTENT
     , A.DO_TYPE_NO AS DO_TYPE_NO
     , D.REGION_NAME AS REGION_NAME
     , C.SUB_REGION_NAME AS SUB_REGION_NAME
     , F.TOOL_NAME AS TOOL_NAME
FROM RECRUIT A 
    LEFT JOIN PROFILE B ON A.PIN_NO = B.PIN_NO
    LEFT JOIN SUB_REGION C ON B.SUB_REGION_NO = C.SUB_REGION_NO
    LEFT JOIN REGION D ON C.REGION_NO = D.REGION_NO
    LEFT JOIN RECRUIT_TOOL E ON A.RECRUIT_NO IN E.RECRUIT_NO
    LEFT JOIN TOOL F ON E.TOOL_NO = F.TOOL_NO;



--○ RECRUITVIEW 하나의 모집공고
SELECT RECRUIT_NO, RECRUITER, DEADLINE_DATE, DDAY, PRJ_START, PRJ_END, TITLE, CONTENT
        , DO_TYPE_NO, REGION_NAME, SUB_REGION_NAME
FROM RECRUITVIEW
WHERE RECRUIT_NO = 'RC6';


--    보여져야 하는 것: 사용언어들(여러개)
--    필요한 것 : 게시물 번호(RECRUIT_NO)
-- ○ 모집공고 사용언어 리스트 출력 (뷰)
-- CREATE OR REPLACE VIEW RECRUITTOOLVIEW
-- AS
SELECT TOOL_NAME
FROM TOOL
WHERE TOOL_NO IN (SELECT TOOL_NO
                 FROM RECRUIT_TOOL
                 WHERE RECRUIT_NO = 'RC1');
--    보여져야 하는 것: 모집포지션(여러개) 각포지션별 뽑힌사람
--    필요한 것 : 게시물 번호(RECRUIT_NO)
-- ○ 모집공고 모집포지션 리스트 출력 (뷰)
CREATE OR REPLACE VIEW RECRUITPOSITIONVIEW
AS
SELECT A.RECRUIT_POS_NO
     , (SELECT POS_NAME
        FROM POSITION
        WHERE POS_NO = A.POS_NO) AS POS_NAME
     , COUNT(*)
     , (SELECT COUNT(*)
        FROM FIRST_CK
        WHERE APPLY_NO IN (SELECT APPLY_NO
                            FROM APPLY
                            WHERE RECRUIT_POS_NO = A.RECRUIT_POS_NO)) AS COUNTPOS
     , A.RECRUIT_NO AS RECRUITNO
FROM RECRUIT_POS A
WHERE A.RECRUIT_NO = 'RC6'
GROUP BY A.RECRUIT_POS_NO, A.POS_NO, A.RECRUIT_NO;

SELECT *
FROM RECRUITPOSITIONVIEW;



---------------------------------------------------------------------------------------------------------------- ● 모집공고 검색
SELECT REGION_NAME AS REGIONNAME
FROM REGION;

SELECT POS_NAME AS POSNAME
FROM POSITION;

SELECT DO_TYPE_NAME AS DOTYPENAME
FROM DO_TYPE;

-- ○ 지역코드으로 그 지역에 해당하는 상세지역명 찾기 (VALUE 값으로 지역 번호 넘어올 예정)
SELECT SUB_REGION_NAME
FROM SUB_REGION
WHERE REGION_NO = '2';


--○ 검색결과 출력 리스트
SELECT RECRUIT_NO, RECRUITER, DEADLINE_DATE, DDAY, PRJ_START, PRJ_END, TITLE, CONTENT
        , DO_TYPE_NO, REGION_NAME, SUB_REGION_NAME
FROM RECRUITVIEW
WHERE REGION_NAME IN (SELECT REGION_NAME
                      FROM REGION 
                      WHERE REGION_NO LIKE '%%')
  AND SUB_REGION_NAME IN (SELECT SUB_REGION_NAME
                         FROM SUB_REGION 
                         WHERE SUB_REGION_NO LIKE '%%')
  AND RECRUIT_NO IN (SELECT RECRUIT_NO
                     FROM RECRUIT_POS 
                     WHERE POS_NO LIKE '%%')
  AND RECRUIT_NO IN (SELECT RECRUIT_NO
                     FROM RECRUIT_TOOL 
                     WHERE TOOL_NO LIKE '%%');
                         
                         

---------------------------------------------------------------------------------------------------------------- ● 모집공고 DELETE
-- ○ 모집공고삭제 시퀀스  RECRUITDELSEQ (삭제가 아니라, 삭제 테이블에 삽입)

-- ○ 모집공고 삭제
INSERT INTO DEL_RECRUIT(DEL_RECRUIT_NO, RECRUIT_NO, DEL_DATE)
VALUES (RECRUITDELSEQ, 모집공고번호, SYSDATE);





DESC TOOL;
/*
이름        널?       유형           
--------- -------- ------------ 
TOOL_NO   NOT NULL NUMBER(3)    
TOOL_NAME NOT NULL VARCHAR2(40)
*/
DESC REGION;
/*
이름          널?       유형           
----------- -------- ------------ 
REGION_NO   NOT NULL NUMBER(3)    
REGION_NAME NOT NULL VARCHAR2(40)
*/
DESC SUB_REGION;
/*
이름              널?       유형           
--------------- -------- ------------ 
SUB_REGION_NO   NOT NULL NUMBER(3)    
REGION_NO       NOT NULL NUMBER(3)    
SUB_REGION_NAME NOT NULL VARCHAR2(40)
*/
DESC POSITION;
/*
이름       널?       유형           
-------- -------- ------------ 
POS_NO   NOT NULL NUMBER(2)    
POS_NAME NOT NULL VARCHAR2(40) 
*/
DESC DO_TYPE;
/*
이름           널?       유형           
------------ -------- ------------ 
DO_TYPE_NO   NOT NULL NUMBER(1)    
DO_TYPE_NAME NOT NULL VARCHAR2(10)
*/


SELECT *
FROM RECRUITVIEW;

















