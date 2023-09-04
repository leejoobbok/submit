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
FROM RECRUIT
WHERE RECRUIT_NO NOT IN (SELECT DEL_APPLY_NO FROM DEL_REP_APPLY)
  AND RECRUIT_NO NOT IN (SELECT DEL_APPLY_NO FROM DEL_APPLY);

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
     , F.TOOL_NAME AS TOOL_NAME
FROM RECRUIT A 
    LEFT JOIN PROFILE B ON A.PIN_NO = B.PIN_NO
    LEFT JOIN SUB_REGION C ON B.SUB_REGION_NO = C.SUB_REGION_NO
    LEFT JOIN REGION D ON C.REGION_NO = D.REGION_NO
    LEFT JOIN RECRUIT_TOOL E ON A.RECRUIT_NO IN E.RECRUIT_NO
    LEFT JOIN TOOL F ON E.TOOL_NO = F.TOOL_NO;



--�� RECRUITVIEW ��ü ����Ʈ ���
SELECT RECRUIT_NO, RECRUITER, DEADLINE_DATE, DDAY, PRJ_START, PRJ_END, TITLE, CONTENT
        , DO_TYPE_NO, REGION_NAME, SUB_REGION_NAME
FROM RECRUITVIEW;


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
                 WHERE RECRUIT_NO = 'RC6');
--    �������� �ϴ� ��: ����������(������) �������Ǻ� �������
--    �ʿ��� �� : �Խù� ��ȣ(RECRUIT_NO)
-- �� �������� ���������� ����Ʈ ��� (��)
-- CREATE OR REPLACE VIEW RECRUITPOSITIONVIEW
-- AS
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
FROM RECRUIT_POS A
WHERE A.RECRUIT_NO = 'RC6'
GROUP BY A.RECRUIT_POS_NO, A.POS_NO;





---------------------------------------------------------------------------------------------------------------- �� �������� �˻�

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



























