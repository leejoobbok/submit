SELECT USER
FROM DUAL;
--==>> PROJECTORS

-- ■■■ 테이블 확인 절차 ■■■

DESC WITHDRAW_TYPE;
/*
이름              널?       유형           
--------------- -------- ------------ 
WD_TYPE_NO      NOT NULL NUMBER(1)    
WD_TYPE_CONTENT NOT NULL VARCHAR2(50) 
*/

DESC WITHDRAW_USER;
/*
이름         널?       유형            
---------- -------- ------------- 
WD_USER_NO NOT NULL NUMBER(8)     
PIN_NO     NOT NULL VARCHAR2(16)  
WD_DATE             DATE          
ID         NOT NULL VARCHAR2(100) 
WD_TYPE_NO NOT NULL NUMBER(1) 
*/

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
*/

SELECT DATA_DEFAULT
FROM USER_TAB_COLUMNS
;

DESC USER_TOOL;
/*
이름         널?       유형           
---------- -------- ------------ 
UTOOL_NO   NOT NULL VARCHAR2(16) 
PROFILE_NO NOT NULL VARCHAR2(16) 
TOOL_NO    NOT NULL NUMBER(3) 
*/

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

DESC POSITION;
/*
이름       널?       유형           
-------- -------- ------------ 
POS_NO   NOT NULL NUMBER(2)    
POS_NAME NOT NULL VARCHAR2(40) 
*/

DESC USER_PIN;
/*
이름        널?       유형           
--------- -------- ------------ 
PIN_NO    NOT NULL VARCHAR2(16) 
JOIN_DATE          DATE 
*/

DESC QUESTION;
/*
이름           널?       유형             
------------ -------- -------------- 
QUESTION_NO  NOT NULL VARCHAR2(12)   
PIN_NO       NOT NULL VARCHAR2(16)   
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(1000) 
CREATED_DATE          DATE
*/

DESC ANSWER;
/*
이름           널?       유형             
------------ -------- -------------- 
ANSWER_NO    NOT NULL VARCHAR2(12)   
CONTENT      NOT NULL VARCHAR2(1000) 
QUESTION_NO  NOT NULL VARCHAR2(12)   
CREATED_DATE          DATE           
PIN_NO       NOT NULL VARCHAR2(16)
*/

DESC FAQ;
/*
이름      널?       유형             
------- -------- -------------- 
FAQ_NO  NOT NULL NUMBER(3)      
TITLE   NOT NULL VARCHAR2(100)  
CONTENT NOT NULL VARCHAR2(1000)
*/

DESC ADMIN_NOTICE;
/*
이름              널?       유형             
--------------- -------- -------------- 
ADMIN_NOTICE_NO NOT NULL VARCHAR2(8)    
TITLE           NOT NULL VARCHAR2(100)  
CONTENT         NOT NULL VARCHAR2(1000) 
PIN_NO          NOT NULL VARCHAR2(16)
*/

DESC ADMIN;
/*
이름       널?       유형            
-------- -------- ------------- 
ADMIN_NO NOT NULL VARCHAR2(16)  
ADMIN_ID NOT NULL VARCHAR2(100) 
ADMIN_PW NOT NULL VARCHAR2(20)  
REG_DATE          DATE          
PIN_NO   NOT NULL VARCHAR2(16)
*/

DESC QUIT_ADMIN;
/*
이름            널?       유형           
------------- -------- ------------ 
QUIT_ADMIN_NO NOT NULL NUMBER(4)    
QUIT_DATE              DATE         
PIN_NO        NOT NULL VARCHAR2(16)
*/

DESC LOGIN_REC;
/*
이름         널?       유형           
---------- -------- ------------ 
LOGIN_REC  NOT NULL NUMBER       
PIN_NO     NOT NULL VARCHAR2(16) 
LOGIN_DATE          DATE 
*/

DESC COMMENTS;
/*
이름           널?       유형            
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
이름            널?       유형           
------------- -------- ------------ 
REP_COMM_NO   NOT NULL NUMBER(10)   
COMM_NO       NOT NULL NUMBER(10)   
PIN_NO        NOT NULL VARCHAR2(16) 
REP_DATE               DATE         
REP_REASON_NO NOT NULL NUMBER(2)
*/

DESC DO_TYPE;
/*
이름           널?       유형           
------------ -------- ------------ 
DO_TYPE_NO   NOT NULL NUMBER(1)    
DO_TYPE_NAME NOT NULL VARCHAR2(10)
*/

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

DESC RECRUIT_TOOL;
/*
이름              널?       유형           
--------------- -------- ------------ 
RECRUIT_TOOL_NO NOT NULL VARCHAR2(20) 
RECRUIT_NO      NOT NULL VARCHAR2(16) 
TOOL_NO         NOT NULL NUMBER(3)  
*/

DESC REP_RECRUIT;
/*
이름             널?       유형           
-------------- -------- ------------ 
REP_RECRUIT_NO NOT NULL VARCHAR2(16) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
PIN_NO         NOT NULL VARCHAR2(16) 
CREATED_DATE            DATE         
REP_REASON_NO  NOT NULL NUMBER(2) 
*/

DESC REP_RECRUIT_RESULT;
/*
이름                널?       유형           
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
이름             널?       유형           
-------------- -------- ------------ 
DEL_RECRUIT_NO NOT NULL VARCHAR2(16) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
DEL_DATE                DATE
*/

DESC REPORT_REASON;
/*
이름            널?       유형           
------------- -------- ------------ 
REP_REASON_NO NOT NULL NUMBER(2)    
REASON        NOT NULL VARCHAR2(50)
*/

DESC REPORT_RESULT;
/*
이름            널?       유형           
------------- -------- ------------ 
REP_RESULT_NO NOT NULL NUMBER(2)    
RESULT        NOT NULL VARCHAR2(20)
*/

DESC REGULATION;
/*
이름      널?       유형           
------- -------- ------------ 
REGU_NO NOT NULL NUMBER(1)    
CONTENT NOT NULL VARCHAR2(50)
*/

DESC REGULATION_PERIOD;
/*
이름             널?       유형        
-------------- -------- --------- 
REGU_PERIOD_NO NOT NULL NUMBER(1) 
PERIOD         NOT NULL NUMBER(5)
*/

DESC RECRUIT_POS;
/*
이름             널?       유형           
-------------- -------- ------------ 
RECRUIT_POS_NO NOT NULL VARCHAR2(20) 
RECRUIT_NO     NOT NULL VARCHAR2(16) 
POS_NO         NOT NULL NUMBER(2) 
*/

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

DESC REPORT_APPLY;
/*
이름            널?       유형           
------------- -------- ------------ 
REP_APPLY_NO  NOT NULL VARCHAR2(16) 
APPLY_NO      NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
CREATED_DATE           DATE         
REP_REASON_NO NOT NULL NUMBER(2) 
*/

DESC REP_APPLY_RESULT;
/*
이름              널?       유형           
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
이름           널?       유형           
------------ -------- ------------ 
DEL_APPLY_NO NOT NULL VARCHAR2(16) 
APPLY_NO     NOT NULL VARCHAR2(16) 
DEL_DATE              DATE 
*/

DESC NOTE;
/*
이름        널?       유형             
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
이름            널?       유형           
------------- -------- ------------ 
REP_NOTE_NO   NOT NULL VARCHAR2(16) 
NOTE_NO       NOT NULL VARCHAR2(16) 
PIN_NO        NOT NULL VARCHAR2(16) 
REP_REASON_NO NOT NULL NUMBER(2)    
CREATED_DATE           DATE
*/

DESC REP_NOTE_RESULT;
/*
이름             널?       유형           
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
이름          널?       유형           
----------- -------- ------------ 
DEL_NOTE_NO NOT NULL VARCHAR2(16) 
NOTE_NO     NOT NULL VARCHAR2(16) 
DEL_DATE             DATE 
*/

DESC FINAL;
/*
이름            널?       유형           
------------- -------- ------------ 
FINAL_NO      NOT NULL VARCHAR2(16) 
FIRST_CK_NO   NOT NULL VARCHAR2(16) 
FINAL_CK_DATE          DATE   
*/

DESC FIRST_CK;
/*
이름          널?       유형           
----------- -------- ------------ 
FIRST_CK_NO NOT NULL VARCHAR2(16) 
APPLY_NO    NOT NULL VARCHAR2(16) 
PASS_DATE            DATE 
*/

DESC PROJECT;
/*
이름         널?       유형           
---------- -------- ------------ 
PRJ_NO     NOT NULL VARCHAR2(16) 
RECRUIT_NO NOT NULL VARCHAR2(16) 
PRJ_DATE            DATE
*/

DESC REPORT_PRJ;
/*
이름            널?       유형           
------------- -------- ------------ 
REP_PRJ_NO    NOT NULL VARCHAR2(16) 
PRJ_NO        NOT NULL VARCHAR2(16) 
FINAL_NO      NOT NULL VARCHAR2(16) 
REP_REASON_NO NOT NULL NUMBER(2)    
CREATED_DATE           DATE         
*/

DESC REP_PRJ_REASON;
/*
이름            널?       유형           
------------- -------- ------------ 
REP_REASON_NO NOT NULL NUMBER(2)    
REP_REASON    NOT NULL VARCHAR2(50)
*/

DESC PRJ_PRESULT;
/*
이름            널?       유형           
------------- -------- ------------ 
PRESULT_NO    NOT NULL VARCHAR2(16) 
REP_PRJ_NO    NOT NULL VARCHAR2(16) 
REP_RESULT_NO NOT NULL NUMBER(2)    
CREATED_DATE           DATE         
PIN_NO        NOT NULL VARCHAR2(16) 
*/

DESC DEL_REP_PRJ;
/*
이름         널?       유형           
---------- -------- ------------ 
DEL_PRJ_NO NOT NULL VARCHAR2(16) 
PRESULT_NO NOT NULL VARCHAR2(16)
*/

DESC WORKSPACE;
/*
이름           널?       유형             
------------ -------- -------------- 
WORKSPACE_NO NOT NULL VARCHAR2(16)   
FINAL_NO     NOT NULL VARCHAR2(16)   
TITLE        NOT NULL VARCHAR2(100)  
CONTENT      NOT NULL VARCHAR2(2000) 
CREATED_DATE          DATE
*/

DESC WORKSPACE_COMM;
/*
이름                널?       유형            
----------------- -------- ------------- 
WORKSPACE_COMM_NO NOT NULL NUMBER(10)    
WORKSPACE_NO      NOT NULL VARCHAR2(16)  
FINAL_NO          NOT NULL VARCHAR2(16)  
CONTENT           NOT NULL VARCHAR2(400) 
CREATED_DATE               DATE
*/

DESC SPACE_NOTICE;
/*
이름              널?       유형             
--------------- -------- -------------- 
SPACE_NOTICE_NO NOT NULL VARCHAR2(16)   
PRJ_NO          NOT NULL VARCHAR2(16)   
TITLE           NOT NULL VARCHAR2(100)  
CONTENT         NOT NULL VARCHAR2(1000) 
CREATED_DATE             DATE
*/

DESC MEETING;
/*
이름           널?       유형             
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
이름           널?       유형            
------------ -------- ------------- 
FEED_NO      NOT NULL NUMBER(10)    
FINAL_NO     NOT NULL VARCHAR2(16)  
CONTENT      NOT NULL VARCHAR2(100) 
CREATED_DATE          DATE 
*/

DESC PROJECT_STOP;
/*
이름             널?       유형           
-------------- -------- ------------ 
PRJ_STOP_NO    NOT NULL VARCHAR2(16) 
PRJ_NO         NOT NULL VARCHAR2(16) 
STOP_DATE               DATE         
STOP_REASON_NO NOT NULL NUMBER(1) 
*/

DESC MEMBER_OUT;
/*
이름            널?       유형           
------------- -------- ------------ 
MEM_OUT_NO    NOT NULL VARCHAR2(16) 
FINAL_NO      NOT NULL VARCHAR2(16) 
OUT_REASON_NO NOT NULL NUMBER(1)    
OUT_DATE               DATE 
*/

DESC PROJECT_RATE;
/*
이름           널?       유형           
------------ -------- ------------ 
DONE_RATE_NO NOT NULL VARCHAR2(20) 
GIVER        NOT NULL VARCHAR2(16) 
RECEIVER     NOT NULL VARCHAR2(16) 
RATE_NO      NOT NULL NUMBER(1)    
RATE_DATE             DATE  
*/

DESC PROJECT_STOP_RATE;
/*
이름           널?       유형           
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
이름             널?       유형           
-------------- -------- ------------ 
STOP_REASON_NO NOT NULL NUMBER(1)    
REASON         NOT NULL VARCHAR2(50)
*/

DESC MEM_OUT_RATE;
/*
이름          널?       유형           
----------- -------- ------------ 
OUT_RATE_NO NOT NULL VARCHAR2(18) 
MEM_OUT_NO  NOT NULL VARCHAR2(16) 
GIVER       NOT NULL VARCHAR2(16) 
RATE_NO     NOT NULL NUMBER(1)    
RATE_DATE            DATE
*/

DESC MEM_OUT_REASON;
/*
이름            널?       유형           
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