SELECT USER
FROM DUAL;
--==>> PROJECTORS

DESC USER_PIN;
/*
�̸�        ��?       ����           
--------- -------- ------------ 
PIN_NO    NOT NULL VARCHAR2(16) 
JOIN_DATE          DATE
*/
-- PIN_NO 5�� ����


DESC USERS;
/*
�̸�       ��?       ����            
-------- -------- ------------- 
USER_NO  NOT NULL VARCHAR2(16)  
PIN_NO            VARCHAR2(16)  
ID       NOT NULL VARCHAR2(100) 
PW       NOT NULL VARCHAR2(20)  
NICKNAME NOT NULL VARCHAR2(20)  
PHOTOURL NOT NULL VARCHAR2(400)
images/defaulfPhoto.jpg
*/
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||USERPINSEQ, TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||USERPINSEQ, TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||USERPINSEQ, TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||USERPINSEQ, TO_DATE('2023-06-30', 'YYYY-MM-DD'));
INSERT INTO USER_PIN (PIN_NO, JOIN_DATE)
VALUES ('UP'||USERPINSEQ, TO_DATE('2023-06-30', 'YYYY-MM-DD'));


----------------------------------------------------------------------------------------------------------- �� INSERT (ȸ������)
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (��������ȣ������(ö��), ���ɳѹ�(ö��), 'test999@test.com', '��ö��', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (��������ȣ������(����), ���ɳѹ�(����), 'test998@test.com', '�迵��', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (��������ȣ������(�μ�), ���ɳѹ�(�μ�), 'test997@test.com', '��μ�', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (��������ȣ������(����), ���ɳѹ�(����), 'test996@test.com', '�����', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (��������ȣ������(����), ���ɳѹ�(����), 'test995@test.com', '������', 'images/defaulfPhoto.jpg');


DESC PROFILE;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
PROFILE_NO    NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
POS_NO        NOT NULL NUMBER(2)    
SUB_REGION_NO NOT NULL NUMBER(3)    
PROFILE_DATE           DATE
*/

SELECT *
FROM USER_CONSTRAINTS
WHERE table_name = 'PROFILE';

DESC POSITION;

SELECT *
FROM POSITION;

/*
INSERT INTO POSITION VALUES (1, 'FRONTEND');
INSERT INTO POSITION VALUES (2, 'BACKEND');
INSERT INTO POSITION VALUES (3, 'FULLSTACK');
INSERT INTO POSITION VALUES (4, 'PUBLISHING');
INSERT INTO POSITION VALUES (5, 'DESIGN');
INSERT INTO POSITION VALUES (6, 'PLANNING');

COMMIT;
*/

SELECT *
FROM SUB_REGION;

----------------------------------------------------------------------------------------------------------- �� INSERT (�������ۼ�)
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (�������ʽ�����(ö��), ���ɳѹ�(ö��), 1, 76, SYSDATE);
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (�������ʽ�����(����), ���ɳѹ�(����), 2, 15, SYSDATE);
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (�������ʽ�����(�μ�), ���ɳѹ�(�μ�), 5, 2, SYSDATE);
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (�������ʽ�����(����), ���ɳѹ�(����), 1, 3, SYSDATE);
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (�������ʽ�����(����), ���ɳѹ�(����), 6, 991, SYSDATE);


DESC RECRUIT;
/*
�̸�           ��?       ����             
------------ -------- -------------- 
RECRUIT_NO   NOT NULL VARCHAR2(16)   
PIN_NO       NOT NULL VARCHAR2(16)   
DO_TYPE_NO   NOT NULL NUMBER(1)      
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(3000) 
CREATED_DATE          DATE           
PRJ_START    NOT NULL DATE           
PRJ_END      NOT NULL DATE 
*/

SELECT *
FROM RECRUIT;

SELECT *
FROM TOOL;

DESC RECRUIT_TOOL;

----------------------------------------------------------------------------------------------------------- �� INSERT (��������A ö��)
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES (����������(A)������, ���ɳѹ�(ö��), 0, 'ġŲ ���� ���ø����̼�', 'ġŲ���� ���ø����̼� ������Ʈ�� ���� �Ͻ� �������� �����մϴ�.'
     , TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_DATE('2023-08-20', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'));

INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(A)�����ǽ�����, ����������(A)��ȣ, 1);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(A)�����ǽ�����, ����������(A)��ȣ, 2);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(A)�����ǽ�����, ����������(A)��ȣ, 3);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(A)�����ǽ�����, ����������(A)��ȣ, 4);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(A)�����ǽ�����, ����������(A)��ȣ, 5);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(A)�����ǽ�����, ����������(A)��ȣ, 6);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(A)�����ǽ�����, ����������(A)��ȣ, 6);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(A)���������, ����������(A)��ȣ, 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(A)���������, ����������(A)��ȣ, 3);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(A)���������, ����������(A)��ȣ, 10);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(A)���������, ����������(A)��ȣ, 11);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(A)���������, ����������(A)��ȣ, 30);


----------------------------------------------------------------------------------------------------------- �� INSERT (��������B ����)
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES (����������(B)������, ���ɳѹ�(����), 1, '��ȭ �¼� ���� �� ����Ʈ', '��ȭ�� �¼��� �����ϴ� �ý����� ���� ����� ���� �������� �����մϴ�.'
     , TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));

INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(B)�����ǽ�����, ����������(B)��ȣ, 1);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(B)�����ǽ�����, ����������(B)��ȣ, 2);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (����������(B)�����ǽ�����, ����������(B)��ȣ, 5);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(B)���������, ����������(B)��ȣ, 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(B)���������, ����������(B)��ȣ, 3);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(B)���������, ����������(B)��ȣ, 10);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(B)���������, ����������(B)��ȣ, 11);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (����������(B)���������, ����������(B)��ȣ, 30);







DESC APPLY;
/*
�̸�             ��?       ����             
-------------- -------- -------------- 
APPLY_NO       NOT NULL VARCHAR2(16)   
RECRUIT_POS_NO NOT NULL VARCHAR2(20)   
PIN_NO         NOT NULL VARCHAR2(16)   
CONTENT        NOT NULL VARCHAR2(1500) 
APPLY_DATE              DATE           
CK_DATE                 DATE
*/


----------------------------------------------------------------------------------------------------------- �� INSERT (��������B ���� �μ�)
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES (��������ȣ������, ����������(B)�����ǽ�����, ���ɹ�ȣ(�μ�), '�ּ��� ���ϰڽ��ϴ�. :)', TO_DATE('2023-07-15', 'YYYY-MM-DD'));


----------------------------------------------------------------------------------------------------------- �� INSERT (��������B ���� ����)
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES (��������ȣ������, ����������(B)�����ǽ�����, ���ɹ�ȣ(����), '������ �ϰڽ��ϴ� ^^', TO_DATE('2023-07-16', 'YYYY-MM-DD'));


----------------------------------------------------------------------------------------------------------- �� INSERT (��������B 1�� �շ�)
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES (��1���շ���ȣ������, ��������ȣ, TO_DATE('2023-07-10', 'YYYY-MM-DD'));
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES (��1���շ���ȣ������, ��������ȣ, TO_DATE('2023-07-18', 'YYYY-MM-DD'));
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES (��1���շ���ȣ������, ��������ȣ, TO_DATE('2023-07-18', 'YYYY-MM-DD'));


----------------------------------------------------------------------------------------------------------- �� INSERT (��������B �����շ�)
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES (�������շ���ȣ������, ��1���շ���ȣ(����), TO_DATE('2023-07-24 12:34:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES (�������շ���ȣ������, ��1���շ���ȣ(�μ�), TO_DATE('2023-07-24 12:50:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES (�������շ���ȣ������, ��1���շ���ȣ(����), TO_DATE('2023-07-24 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));


----------------------------------------------------------------------------------------------------------- �� INSERT (��������B ������Ʈ ����)
INSERT INTO PROJECT (PRJ_NO, RECRUIT_NO, PRJ_DATE)
VALUES (��������Ʈ��ȣ������, �����������ȣ(B), TO_DATE('2023-07-24 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));






SELECT *
FROM PROJECT;

DESC PROJECT;
/*
�̸�         ��?       ����           
---------- -------- ------------ 
PRJ_NO     NOT NULL VARCHAR2(16) 
RECRUIT_NO NOT NULL VARCHAR2(16) 
PRJ_DATE            DATE
*/








