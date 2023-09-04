SELECT USER
FROM DUAL;
--==>> PROJECTORS


-- �� ��� ���̺� ���� ��ȸ
SELECT *
FROM TAB;


--�� ���̺� Ȯ��
DESC TOOL;
/*
�̸�        ��?       ����           
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


-------========================= ������ ¥�� =============================-----------
-- �� 

-- �� FindPassword.jsp
-- �� ��й�ȣ ã�� �޼ҵ� (�ش��̸����� �����ϸ�(1) �� �̸��Ϸ� ��й�ȣ ��߼� / �������� ������(0) ���� ����)
-- �� FindId.jsp
-- �� ���̵� ã�� �޼ҵ� (�ش��̸����� �����ϸ�(1) �����Ѵٰ� �ȳ� / �������� ������(0) �������� �ʴ´ٰ� �ȳ�)
SELECT COUNT(*)
FROM USERS
WHERE ID = ȸ���̸���;





-- �� �������� INSERT

--�� �������� ������ ����
CREATE SEQUENCE RECRUITSEQ
NOCACHE;

-- �� �������� ���� INSERT
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE,	PRJ_START, PRJ_END)
            VALUES (RECRUITSEQ, ȸ���ĺ���ȣ, ���/����, ����, ����, SYSDATE
                  , TO_DATE(������Ʈ ������,'YYYY-MM-DD'), TO_DATE(������Ʈ ������,'YYYY-MM-DD'))

-- �� �������� �ʿ� ��� ������ ����
CREATE SEQUENCE RECRUITTOOLSEQ
NOCACHE;

-- �� �������� �ʿ� ��� INSERT
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
                 VALUES (RECRUITTOOLSEQ, ���������ȣ, ������ȣ)

-- �� �������� �ʿ� ������ ������ ����
CREATE SEQUENCE RECRUITPOSITIONSEQ
NOCACHE;

-- �� �������� �ʿ� ������ INSERT
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO) 
                VALUES (RECRUITPOSITIONSEQ, ���������ȣ, �����ǹ�ȣ)






-- �� PostLists.jsp
-- �� �����ڵ����� �� ������ �ش��ϴ� �������� ã�� (VALUE ������ ���� ��ȣ �Ѿ�� ����)
SELECT SUB_REGION_NAME
FROM SUB_REGION
WHERE REGION_NO = '2';





-- �� �������� ����Ʈ ���
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
FROM RECRUIT;
-- ������ ���� �����ؾ��� (<>)


--    �������� �ϴ� ��: ������(������)
--    �ʿ��� �� : �Խù� ��ȣ(RECRUIT_NO)
-- �� �������� ����� ����Ʈ ��� (��)
CREATE OR REPLACE VIEW RECRUITTOOLVIEW
AS
SELECT TOOL_NAME
FROM TOOL
WHERE TOOL_NO = (SELECT TOOL_NO
                 FROM RECRUIT_TOOL
                 WHERE RECRUIT_NO = ���������ȣ);
--    �������� �ϴ� ��: ����������(������) �������Ǻ� �������
--    �ʿ��� �� : �Խù� ��ȣ(RECRUIT_NO)
-- �� �������� ���������� ����Ʈ ��� (��)
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
-- ��Ƽ���� �̻� ����µ� �����Ͱ� ��� �������� �� ���� �մ��. �� ���� �ɰ��� �۵��Ǵ� ����
/*
�������ֽ� ������ ���������δ� ������ ���� ���Դϴ�. 
�� ������ RECRUIT_POS ���̺��� RECRUIT_NO�� '1'�� ��쿡 ���� RECRUIT_POS_NO�� �������� �׷�ȭ�ϰ�, 
������ �׷쿡�� POS_NAME�� �������� COUNT�� ������ ����� ��ȸ�մϴ�. 
����, �ش� RECRUIT_POS_NO�� ���� COUNTPOS�� ����ϴ� ���������� ���ԵǾ� �ֽ��ϴ�.
*/


-- �� ����������� ������ ����
CREATE SEQUENCE RECRUITDELETESEQ
NOCACHE;


-- �� �������� ����
INSERT INTO DEL_RECRUIT(DEL_RECRUIT_NO, RECRUIT_NO, DEL_DATE)
VALUES (RECRUITDELETESEQ, ���������ȣ, SYSDATE);




-- �� 







-- �� 







-- �� 





-- �� 



























