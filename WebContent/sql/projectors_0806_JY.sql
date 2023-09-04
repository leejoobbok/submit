SELECT USER
FROM DUAL;
--==>> PROJECTORS

DESC USER_PIN;
/*
이름        널?       유형           
--------- -------- ------------ 
PIN_NO    NOT NULL VARCHAR2(16) 
JOIN_DATE          DATE
*/
-- PIN_NO 5개 생성


DESC USERS;
/*
이름       널?       유형            
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


----------------------------------------------------------------------------------------------------------- ★ INSERT (회원가입)
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (▶유저번호시퀀스(철수), ▶핀넘버(철수), 'test999@test.com', '김철수', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (▶유저번호시퀀스(영수), ▶핀넘버(영수), 'test998@test.com', '김영수', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (▶유저번호시퀀스(민수), ▶핀넘버(민수), 'test997@test.com', '김민수', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (▶유저번호시퀀스(민지), ▶핀넘버(민지), 'test996@test.com', '김민지', 'images/defaulfPhoto.jpg');
INSERT INTO USERS (USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES (▶유저번호시퀀스(은정), ▶핀넘버(은정), 'test995@test.com', '이은정', 'images/defaulfPhoto.jpg');


DESC PROFILE;
/*
이름            널?       유형           
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

----------------------------------------------------------------------------------------------------------- ★ INSERT (프로필작성)
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (▶프로필시퀀스(철수), ▶핀넘버(철수), 1, 76, SYSDATE);
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (▶프로필시퀀스(영수), ▶핀넘버(영수), 2, 15, SYSDATE);
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (▶프로필시퀀스(민수), ▶핀넘버(민수), 5, 2, SYSDATE);
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (▶프로필시퀀스(민지), ▶핀넘버(민지), 1, 3, SYSDATE);
INSERT INTO PROFILE (PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO,PROFILE_DATE)
VALUES (▶프로필시퀀스(은정), ▶핀넘버(은정), 6, 991, SYSDATE);


DESC RECRUIT;
/*
이름           널?       유형             
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

----------------------------------------------------------------------------------------------------------- ★ INSERT (모집공고A 철수)
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES (▶모집공고(A)시퀀스, ▶핀넘버(철수), 0, '치킨 맛집 어플리케이션', '치킨맛집 어플리케이션 프로젝트를 같이 하실 팀원들을 모집합니다.'
     , TO_DATE('2023-07-28', 'YYYY-MM-DD'), TO_DATE('2023-08-20', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'));

INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(A)포지션시퀀스, ▶모집공고(A)번호, 1);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(A)포지션시퀀스, ▶모집공고(A)번호, 2);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(A)포지션시퀀스, ▶모집공고(A)번호, 3);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(A)포지션시퀀스, ▶모집공고(A)번호, 4);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(A)포지션시퀀스, ▶모집공고(A)번호, 5);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(A)포지션시퀀스, ▶모집공고(A)번호, 6);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(A)포지션시퀀스, ▶모집공고(A)번호, 6);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(A)기술시퀀스, ▶모집공고(A)번호, 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(A)기술시퀀스, ▶모집공고(A)번호, 3);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(A)기술시퀀스, ▶모집공고(A)번호, 10);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(A)기술시퀀스, ▶모집공고(A)번호, 11);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(A)기술시퀀스, ▶모집공고(A)번호, 30);


----------------------------------------------------------------------------------------------------------- ★ INSERT (모집공고B 영수)
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES (▶모집공고(B)시퀀스, ▶핀넘버(영수), 1, '영화 좌석 예매 웹 사이트', '영화관 좌석을 예매하는 시스템을 같이 만들어 보실 팀원들을 모집합니다.'
     , TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'));

INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(B)포지션시퀀스, ▶모집공고(B)번호, 1);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(B)포지션시퀀스, ▶모집공고(B)번호, 2);
INSERT INTO RECRUIT_POS (RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (▶모집공고(B)포지션시퀀스, ▶모집공고(B)번호, 5);

INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(B)기술시퀀스, ▶모집공고(B)번호, 1);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(B)기술시퀀스, ▶모집공고(B)번호, 3);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(B)기술시퀀스, ▶모집공고(B)번호, 10);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(B)기술시퀀스, ▶모집공고(B)번호, 11);
INSERT INTO RECRUIT_TOOL (RECRUIT_TOOL_NO, RECRUIT_NO, TOOL_NO)
VALUES (▶모집공고(B)기술시퀀스, ▶모집공고(B)번호, 30);







DESC APPLY;
/*
이름             널?       유형             
-------------- -------- -------------- 
APPLY_NO       NOT NULL VARCHAR2(16)   
RECRUIT_POS_NO NOT NULL VARCHAR2(20)   
PIN_NO         NOT NULL VARCHAR2(16)   
CONTENT        NOT NULL VARCHAR2(1500) 
APPLY_DATE              DATE           
CK_DATE                 DATE
*/


----------------------------------------------------------------------------------------------------------- ★ INSERT (모집공고B 지원 민수)
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES (▶지원번호시퀀스, ▶모집공고(B)포지션시퀀스, ▶핀번호(민수), '최선을 다하겠습니다. :)', TO_DATE('2023-07-15', 'YYYY-MM-DD'));


----------------------------------------------------------------------------------------------------------- ★ INSERT (모집공고B 지원 민지)
INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE)
VALUES (▶지원번호시퀀스, ▶모집공고(B)포지션시퀀스, ▶핀번호(민지), '열심히 하겠습니다 ^^', TO_DATE('2023-07-16', 'YYYY-MM-DD'));


----------------------------------------------------------------------------------------------------------- ★ INSERT (모집공고B 1차 합류)
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES (▶1차합류번호시퀀스, ▶지원번호, TO_DATE('2023-07-10', 'YYYY-MM-DD'));
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES (▶1차합류번호시퀀스, ▶지원번호, TO_DATE('2023-07-18', 'YYYY-MM-DD'));
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES (▶1차합류번호시퀀스, ▶지원번호, TO_DATE('2023-07-18', 'YYYY-MM-DD'));


----------------------------------------------------------------------------------------------------------- ★ INSERT (모집공고B 최종합류)
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES (▶최종합류번호시퀀스, ▶1차합류번호(영수), TO_DATE('2023-07-24 12:34:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES (▶최종합류번호시퀀스, ▶1차합류번호(민수), TO_DATE('2023-07-24 12:50:56', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO FINAL (FINAL_NO, FIRST_CK_NO, FINAL_CK_DATE)
VALUES (▶최종합류번호시퀀스, ▶1차합류번호(민지), TO_DATE('2023-07-24 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));


----------------------------------------------------------------------------------------------------------- ★ INSERT (모집공고B 프로젝트 시작)
INSERT INTO PROJECT (PRJ_NO, RECRUIT_NO, PRJ_DATE)
VALUES (▶프로젝트번호시퀀스, ▶모집공고번호(B), TO_DATE('2023-07-24 14:34:56', 'YYYY-MM-DD HH24:MI:SS'));






SELECT *
FROM PROJECT;

DESC PROJECT;
/*
이름         널?       유형           
---------- -------- ------------ 
PRJ_NO     NOT NULL VARCHAR2(16) 
RECRUIT_NO NOT NULL VARCHAR2(16) 
PRJ_DATE            DATE
*/








