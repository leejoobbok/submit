SELECT USER
FROM DUAL;
--==>> PROJECTORS


-------======================================================= ������ ¥�� ===========================================================-----------
---------------------------------------------------------------------------------------------------------------- �� �������� INSERT
-- �� �������� ���� INSERT
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE,	PRJ_START, PRJ_END)
            VALUES (RECRUITSEQ, ȸ���ĺ���ȣ, ���/����, ����, ����, SYSDATE
                  , TO_DATE(������Ʈ ������,'YYYY-MM-DD'), TO_DATE(������Ʈ ������,'YYYY-MM-DD'))

-- �� �������� �ʿ� ��� INSERT
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
                 VALUES (RECRUITTOOLSEQ, ���������ȣ, ������ȣ)

-- �� �������� �ʿ� ������ INSERT
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO) 
                VALUES (RECRUITPOSITIONSEQ, ���������ȣ, �����ǹ�ȣ)



---------------------------------------------------------------------------------------------------------------- �� �������� Lists
--    �������� �ϴ� ��: �ۼ���(������), ����������, D-DAY, ����������, ����������
--                     ��������, ������, ���/����, ������, �������� (������ ����)
--    �ʿ��� �� : �Խù� ��ȣ
-- �� �������� ����Ʈ ��� (��)
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
  
  
--�� RECRUITVIEW ��ü ����Ʈ ���
SELECT RECRUITNO, PINNO, DEADLINEDATE, DDAY, PRJSTART, PRJEND, TITLE, CONTENT
        , DOTYPENAME, REGIONNAME, SUBREGIONNAME
FROM RECRUITVIEW
WHERE DDAY >= 0;
  
  
  	private int regionNo, subRegionNo, posNo, toolNo, doTypeNo;
	private String regionName, subRegionName, posName, toolName, doTypeName;
	private int countAll, countPos;
	private String recruitNo, pinNo, deadlineDate, dDay, prjStart, prjEnd, title, content;
  
--�� JOIN ����
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


--�� ������ ��ģ ����
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



--�� RECRUITVIEW �ϳ��� ��������
SELECT RECRUIT_NO, RECRUITER, DEADLINE_DATE, DDAY, PRJ_START, PRJ_END, TITLE, CONTENT
        , DO_TYPE_NO, REGION_NAME, SUB_REGION_NAME
FROM RECRUITVIEW
WHERE RECRUIT_NO = 'RC6';


--    �������� �ϴ� ��: ������(������)
--    �ʿ��� �� : �Խù� ��ȣ(RECRUIT_NO)
-- �� �������� ����� ����Ʈ ��� (��)
-- CREATE OR REPLACE VIEW RECRUITTOOLVIEW
-- AS
SELECT TOOL_NAME
FROM TOOL
WHERE TOOL_NO IN (SELECT TOOL_NO
                 FROM RECRUIT_TOOL
                 WHERE RECRUIT_NO = 'RC1');
--    �������� �ϴ� ��: ����������(������) �������Ǻ� �������
--    �ʿ��� �� : �Խù� ��ȣ(RECRUIT_NO)
-- �� �������� ���������� ����Ʈ ��� (��)
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



---------------------------------------------------------------------------------------------------------------- �� �������� �˻�
SELECT REGION_NAME AS REGIONNAME
FROM REGION;

SELECT POS_NAME AS POSNAME
FROM POSITION;

SELECT DO_TYPE_NAME AS DOTYPENAME
FROM DO_TYPE;

-- �� �����ڵ����� �� ������ �ش��ϴ� �������� ã�� (VALUE ������ ���� ��ȣ �Ѿ�� ����)
SELECT SUB_REGION_NAME
FROM SUB_REGION
WHERE REGION_NO = '2';


--�� �˻���� ��� ����Ʈ
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
                         
                         

---------------------------------------------------------------------------------------------------------------- �� �������� DELETE
-- �� ����������� ������  RECRUITDELSEQ (������ �ƴ϶�, ���� ���̺� ����)

-- �� �������� ����
INSERT INTO DEL_RECRUIT(DEL_RECRUIT_NO, RECRUIT_NO, DEL_DATE)
VALUES (RECRUITDELSEQ, ���������ȣ, SYSDATE);





DESC TOOL;
/*
�̸�        ��?       ����           
--------- -------- ------------ 
TOOL_NO   NOT NULL NUMBER(3)    
TOOL_NAME NOT NULL VARCHAR2(40)
*/
DESC REGION;
/*
�̸�          ��?       ����           
----------- -------- ------------ 
REGION_NO   NOT NULL NUMBER(3)    
REGION_NAME NOT NULL VARCHAR2(40)
*/
DESC SUB_REGION;
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
SUB_REGION_NO   NOT NULL NUMBER(3)    
REGION_NO       NOT NULL NUMBER(3)    
SUB_REGION_NAME NOT NULL VARCHAR2(40)
*/
DESC POSITION;
/*
�̸�       ��?       ����           
-------- -------- ------------ 
POS_NO   NOT NULL NUMBER(2)    
POS_NAME NOT NULL VARCHAR2(40) 
*/
DESC DO_TYPE;
/*
�̸�           ��?       ����           
------------ -------- ------------ 
DO_TYPE_NO   NOT NULL NUMBER(1)    
DO_TYPE_NAME NOT NULL VARCHAR2(10)
*/


SELECT *
FROM RECRUITVIEW;

















