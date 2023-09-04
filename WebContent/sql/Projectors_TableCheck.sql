SELECT USER
FROM DUAL;
--==>> PROJECTORS

-- ���� ���̺� Ȯ�� ���� ����

DESC WITHDRAW_TYPE;
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
WD_TYPE_NO      NOT NULL NUMBER(1)    
WD_TYPE_CONTENT NOT NULL VARCHAR2(50) 
*/

DESC WITHDRAW_USER;
/*
�̸�         ��?       ����            
---------- -------- ------------- 
WD_USER_NO NOT NULL NUMBER(8)     
PIN_NO     NOT NULL VARCHAR2(16)  
WD_DATE             DATE          
ID         NOT NULL VARCHAR2(100) 
WD_TYPE_NO NOT NULL NUMBER(1) 
*/

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
*/

SELECT DATA_DEFAULT
FROM USER_TAB_COLUMNS
;

DESC USER_TOOL;
/*
�̸�         ��?       ����           
---------- -------- ------------ 
UTOOL_NO   NOT NULL VARCHAR2(16) 
PROFILE_NO NOT NULL VARCHAR2(16) 
TOOL_NO    NOT NULL NUMBER(3) 
*/

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

DESC POSITION;
/*
�̸�       ��?       ����           
-------- -------- ------------ 
POS_NO   NOT NULL NUMBER(2)    
POS_NAME NOT NULL VARCHAR2(40) 
*/

DESC USER_PIN;
/*
�̸�        ��?       ����           
--------- -------- ------------ 
PIN_NO    NOT NULL VARCHAR2(16) 
JOIN_DATE          DATE 
*/

DESC QUESTION;
/*
�̸�           ��?       ����             
------------ -------- -------------- 
QUESTION_NO  NOT NULL VARCHAR2(12)   
PIN_NO       NOT NULL VARCHAR2(16)   
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(1000) 
CREATED_DATE          DATE
*/

DESC ANSWER;
/*
�̸�           ��?       ����             
------------ -------- -------------- 
ANSWER_NO    NOT NULL VARCHAR2(12)   
CONTENT      NOT NULL VARCHAR2(1000) 
QUESTION_NO  NOT NULL VARCHAR2(12)   
CREATED_DATE          DATE           
PIN_NO       NOT NULL VARCHAR2(16)
*/

DESC FAQ;
/*
�̸�      ��?       ����             
------- -------- -------------- 
FAQ_NO  NOT NULL NUMBER(3)      
TITLE   NOT NULL VARCHAR2(100)  
CONTENT NOT NULL VARCHAR2(1000)
*/

DESC ADMIN_NOTICE;
/*
�̸�              ��?       ����             
--------------- -------- -------------- 
ADMIN_NOTICE_NO NOT NULL VARCHAR2(8)    
TITLE           NOT NULL VARCHAR2(100)  
CONTENT         NOT NULL VARCHAR2(1000) 
PIN_NO          NOT NULL VARCHAR2(16)
*/

DESC ADMIN;
/*
�̸�       ��?       ����            
-------- -------- ------------- 
ADMIN_NO NOT NULL VARCHAR2(16)  
ADMIN_ID NOT NULL VARCHAR2(100) 
ADMIN_PW NOT NULL VARCHAR2(20)  
REG_DATE          DATE          
PIN_NO   NOT NULL VARCHAR2(16)
*/

DESC QUIT_ADMIN;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
QUIT_ADMIN_NO NOT NULL NUMBER(4)    
QUIT_DATE              DATE         
PIN_NO        NOT NULL VARCHAR2(16)
*/

DESC LOGIN_REC;
/*
�̸�         ��?       ����           
---------- -------- ------------ 
LOGIN_REC  NOT NULL NUMBER       
PIN_NO     NOT NULL VARCHAR2(16) 
LOGIN_DATE          DATE 
*/

DESC COMMENTS;
/*
�̸�           ��?       ����            
------------ -------- ------------- 
COMM_NO      NOT NULL NUMBER(10)    
RECRUIT_NO   NOT NULL VARCHAR2(16)  
PIN_NO       NOT NULL VARCHAR2(16)  
CREATED_DATE          DATE          
CONTENT      NOT NULL VARCHAR2(400) 
RECOMM_NO             NUMBER(10)
*/

DESC REPORT_COMM;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
REP_COMM_NO   NOT NULL NUMBER(10)   
COMM_NO       NOT NULL NUMBER(10)   
PIN_NO        NOT NULL VARCHAR2(16) 
REP_DATE               DATE         
REP_REASON_NO NOT NULL NUMBER(2)
*/

DESC DO_TYPE;
/*
�̸�           ��?       ����           
------------ -------- ------------ 
DO_TYPE_NO   NOT NULL NUMBER(1)    
DO_TYPE_NAME NOT NULL VARCHAR2(10)
*/

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

DESC RECRUIT_TOOL;
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
RECRUIT_TOOL_NO NOT NULL VARCHAR2(20) 
RECRUIT_NO      NOT NULL VARCHAR2(16) 
TOOL_NO         NOT NULL NUMBER(3)  
*/

DESC REP_RECRUIT;
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
REP_RECRUIT_NO NOT NULL VARCHAR2(16) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
PIN_NO         NOT NULL VARCHAR2(16) 
CREATED_DATE            DATE         
REP_REASON_NO  NOT NULL NUMBER(2) 
*/

DESC REP_RECRUIT_RESULT;
/*
�̸�                ��?       ����           
----------------- -------- ------------ 
RECRUIT_RESULT_NO NOT NULL VARCHAR2(16) 
REP_RECRUIT_NO    NOT NULL VARCHAR2(16) 
REP_RESULT_NO     NOT NULL NUMBER(2)    
REGU_NO           NOT NULL NUMBER(1)    
REGU_PERIOD_NO    NOT NULL NUMBER(1)    
PIN_NO            NOT NULL VARCHAR2(16) 
REGU_DATE                  DATE
*/

DESC DEL_RECRUIT;
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
DEL_RECRUIT_NO NOT NULL VARCHAR2(16) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
DEL_DATE                DATE
*/

DESC REPORT_REASON;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
REP_REASON_NO NOT NULL NUMBER(2)    
REASON        NOT NULL VARCHAR2(50)
*/

DESC REPORT_RESULT;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
REP_RESULT_NO NOT NULL NUMBER(2)    
RESULT        NOT NULL VARCHAR2(20)
*/

DESC REGULATION;
/*
�̸�      ��?       ����           
------- -------- ------------ 
REGU_NO NOT NULL NUMBER(1)    
CONTENT NOT NULL VARCHAR2(50)
*/

DESC REGULATION_PERIOD;
/*
�̸�             ��?       ����        
-------------- -------- --------- 
REGU_PERIOD_NO NOT NULL NUMBER(1) 
PERIOD         NOT NULL NUMBER(5)
*/

DESC RECRUIT_POS;
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
RECRUIT_POS_NO NOT NULL VARCHAR2(20) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
POS_NO         NOT NULL NUMBER(2) 
*/

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

DESC REPORT_APPLY;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
REP_APPLY_NO  NOT NULL VARCHAR2(16) 
APPLY_NO      NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
CREATED_DATE           DATE         
REP_REASON_NO NOT NULL NUMBER(2) 
*/

DESC REP_APPLY_RESULT;
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
APPLY_RESULT_NO NOT NULL VARCHAR2(16) 
REP_APPLY_NO    NOT NULL VARCHAR2(16) 
REP_RESULT_NO   NOT NULL NUMBER(2)    
REGU_NO         NOT NULL NUMBER(1)    
REGU_PERIOD_NO  NOT NULL NUMBER(1)    
PIN_NO          NOT NULL VARCHAR2(16) 
REGU_DATE                DATE
*/

DESC DEL_APPLY;
/*
�̸�           ��?       ����           
------------ -------- ------------ 
DEL_APPLY_NO NOT NULL VARCHAR2(16) 
APPLY_NO     NOT NULL VARCHAR2(16) 
DEL_DATE              DATE 
*/

DESC NOTE;
/*
�̸�        ��?       ����             
--------- -------- -------------- 
NOTE_NO   NOT NULL VARCHAR2(16)   
SENDER    NOT NULL VARCHAR2(16)   
READER    NOT NULL VARCHAR2(16)   
SEND_DATE          DATE           
READ_DATE          DATE           
TITLE     NOT NULL VARCHAR2(100)  
CONTENT   NOT NULL VARCHAR2(1000) 
SEND_DEL           DATE           
READ_DEL           DATE
*/

DESC REPORT_NOTE;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
REP_NOTE_NO   NOT NULL VARCHAR2(16) 
NOTE_NO       NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
REP_REASON_NO NOT NULL NUMBER(2)    
CREATED_DATE           DATE
*/

DESC REP_NOTE_RESULT;
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
NOTE_RESULT_NO NOT NULL VARCHAR2(16) 
REP_NOTE_NO    NOT NULL VARCHAR2(16) 
REP_RESULT_NO  NOT NULL NUMBER(2)    
REGU_NO        NOT NULL NUMBER(1)    
REGU_PERIOD_NO NOT NULL NUMBER(1)    
PIN_NO         NOT NULL VARCHAR2(16) 
REGU_DATE               DATE 
*/

DESC DEL_NOTE;
/*
�̸�          ��?       ����           
----------- -------- ------------ 
DEL_NOTE_NO NOT NULL VARCHAR2(16) 
NOTE_NO     NOT NULL VARCHAR2(16) 
DEL_DATE             DATE 
*/

DESC FINAL;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
FINAL_NO      NOT NULL VARCHAR2(16) 
FIRST_CK_NO   NOT NULL VARCHAR2(16) 
FINAL_CK_DATE          DATE   
*/

DESC FIRST_CK;
/*
�̸�          ��?       ����           
----------- -------- ------------ 
FIRST_CK_NO NOT NULL VARCHAR2(16) 
APPLY_NO    NOT NULL VARCHAR2(16) 
PASS_DATE            DATE 
*/

DESC PROJECT;
/*
�̸�         ��?       ����           
---------- -------- ------------ 
PRJ_NO     NOT NULL VARCHAR2(16) 
RECRUIT_NO NOT NULL VARCHAR2(16) 
PRJ_DATE            DATE
*/

DESC REPORT_PRJ;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
REP_PRJ_NO    NOT NULL VARCHAR2(16) 
PRJ_NO        NOT NULL VARCHAR2(16) 
FINAL_NO      NOT NULL VARCHAR2(16) 
REP_REASON_NO NOT NULL NUMBER(2)    
CREATED_DATE           DATE         
*/

DESC REP_PRJ_REASON;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
REP_REASON_NO NOT NULL NUMBER(2)    
REP_REASON    NOT NULL VARCHAR2(50)
*/

DESC PRJ_PRESULT;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
PRESULT_NO    NOT NULL VARCHAR2(16) 
REP_PRJ_NO    NOT NULL VARCHAR2(16) 
REP_RESULT_NO NOT NULL NUMBER(2)    
CREATED_DATE           DATE         
PIN_NO        NOT NULL VARCHAR2(16) 
*/

DESC DEL_REP_PRJ;
/*
�̸�         ��?       ����           
---------- -------- ------------ 
DEL_PRJ_NO NOT NULL VARCHAR2(16) 
PRESULT_NO NOT NULL VARCHAR2(16)
*/

DESC WORKSPACE;
/*
�̸�           ��?       ����             
------------ -------- -------------- 
WORKSPACE_NO NOT NULL VARCHAR2(16)   
FINAL_NO     NOT NULL VARCHAR2(16)   
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(2000) 
CREATED_DATE          DATE
*/

DESC WORKSPACE_COMM;
/*
�̸�                ��?       ����            
----------------- -------- ------------- 
WORKSPACE_COMM_NO NOT NULL NUMBER(10)    
WORKSPACE_NO      NOT NULL VARCHAR2(16)  
FINAL_NO          NOT NULL VARCHAR2(16)  
CONTENT           NOT NULL VARCHAR2(400) 
CREATED_DATE               DATE
*/

DESC SPACE_NOTICE;
/*
�̸�              ��?       ����             
--------------- -------- -------------- 
SPACE_NOTICE_NO NOT NULL VARCHAR2(16)   
PRJ_NO          NOT NULL VARCHAR2(16)   
TITLE           NOT NULL VARCHAR2(100)  
CONTENT         NOT NULL VARCHAR2(1000) 
CREATED_DATE             DATE
*/

DESC MEETING;
/*
�̸�           ��?       ����             
------------ -------- -------------- 
MEETING_NO   NOT NULL VARCHAR2(20)   
FINAL_NO     NOT NULL VARCHAR2(16)   
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(1000) 
FILEURL               VARCHAR2(400)  
CREATED_DATE          DATE           
MEETING_DATE          DATE 
*/

DESC FEED;
/*
�̸�           ��?       ����            
------------ -------- ------------- 
FEED_NO      NOT NULL NUMBER(10)    
FINAL_NO     NOT NULL VARCHAR2(16)  
CONTENT      NOT NULL VARCHAR2(100) 
CREATED_DATE          DATE 
*/

DESC PROJECT_STOP;
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
PRJ_STOP_NO    NOT NULL VARCHAR2(16) 
PRJ_NO         NOT NULL VARCHAR2(16) 
STOP_DATE               DATE         
STOP_REASON_NO NOT NULL NUMBER(1) 
*/

DESC MEMBER_OUT;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
MEM_OUT_NO    NOT NULL VARCHAR2(16) 
FINAL_NO      NOT NULL VARCHAR2(16) 
OUT_REASON_NO NOT NULL NUMBER(1)    
OUT_DATE               DATE 
*/

DESC PROJECT_RATE;
/*
�̸�           ��?       ����           
------------ -------- ------------ 
DONE_RATE_NO NOT NULL VARCHAR2(20) 
GIVER        NOT NULL VARCHAR2(16) 
RECEIVER     NOT NULL VARCHAR2(16) 
RATE_NO      NOT NULL NUMBER(1)    
RATE_DATE             DATE  
*/

DESC PROJECT_STOP_RATE;
/*
�̸�           ��?       ����           
------------ -------- ------------ 
STOP_RATE_NO NOT NULL VARCHAR2(20) 
PRJ_STOP_NO  NOT NULL VARCHAR2(16) 
RECEIVER     NOT NULL VARCHAR2(16) 
GIVER        NOT NULL VARCHAR2(16) 
RATE_NO      NOT NULL NUMBER(1)    
RATE_DATE             DATE 
*/

DESC PRJ_STOP_REASON;
/*
�̸�             ��?       ����           
-------------- -------- ------------ 
STOP_REASON_NO NOT NULL NUMBER(1)    
REASON         NOT NULL VARCHAR2(50)
*/

DESC MEM_OUT_RATE;
/*
�̸�          ��?       ����           
----------- -------- ------------ 
OUT_RATE_NO NOT NULL VARCHAR2(18) 
MEM_OUT_NO  NOT NULL VARCHAR2(16) 
GIVER       NOT NULL VARCHAR2(16) 
RATE_NO     NOT NULL NUMBER(1)    
RATE_DATE            DATE
*/

DESC MEM_OUT_REASON;
/*
�̸�            ��?       ����           
------------- -------- ------------ 
OUT_REASON_NO NOT NULL NUMBER(1)    
REASON        NOT NULL VARCHAR2(50) 
*/

DESC RATE_SELECT;
/*
RATE_NO NOT NULL NUMBER(1)    
CONTENT NOT NULL VARCHAR2(30) 
*/

SELECT TABLE_NAME, SEARCH_CONDITION
FROM  ALL_CONSTRAINTS
WHERE OWNER = 'PROJECTORS'
  AND CONSTRAINT_TYPE = 'C';