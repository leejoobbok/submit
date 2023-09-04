SELECT USER FROM DUAL;
--==>PROJECTORS
--------------------------------------------------------------------------------
--▣ 2023.08.03.오후 8:55 아현 : 테이블 인서트 구문 작성 


DESC RATE_SELECT;
--==>>
/*
이름      널?       유형           
------- -------- ------------ 
RATE_NO NOT NULL NUMBER(1)    
CONTENT NOT NULL VARCHAR2(30) 
*/

--○ 평가 선택지 테이블 데이터 입력 ( RATE_SELECT )
INSERT INTO RATE_SELECT VALUES(1,'열심히 참여함');
INSERT INTO RATE_SELECT VALUES(2,'협업능력이 뛰어남');
INSERT INTO RATE_SELECT VALUES(3,'업무 능력이 뛰어남');
INSERT INTO RATE_SELECT VALUES(4,'참여율이 저조함');
INSERT INTO RATE_SELECT VALUES(5,'협업능력이 부족함');
INSERT INTO RATE_SELECT VALUES(6,'업무 능력이 부족함');

--(실제 수행 없이 작성만 하고 준복이한테 전송 완료) 
--------------------------------------------------------------------------------

--▣ 2023.08.04.오후 2:48 아현
-- : 메인 공지 게시판, 메인공지글 작성 페이지 관련 쿼리문 작성

--○ 관리자 공지 게시판 테이블 확인 
DESC ADMIN_NOTICE; 
--==>>
/*
이름              널?       유형             
--------------- -------- -------------- 
ADMIN_NOTICE_NO NOT NULL VARCHAR2(8)    
TITLE           NOT NULL VARCHAR2(100)  
CONTENT         NOT NULL VARCHAR2(1000) 
PIN_NO          NOT NULL VARCHAR2(16)  
*/
--------------------------------------------------------------------------------
--● 공지글 목록 조회 쿼리문 준비 (MainNoticeLists.jsp)
--( 글번호, 제목) + (작성자, 작성일..도 있음 좋겠지만 일단은 빼고 썼습니다) 
SELECT ADMIN_NOTICE_NO, TITLE 
FROM ADMIN_NOTICE;

--------------------------------------------------------------------------------
--◈ 관리자 공지 등록 관련 쿼리문 준비 (MainNoticeInsert.jsp)

--●1) 시퀀스 생성 (글 번호 앞에 붙일 문자열은 아직 미정) 
CREATE SEQUENCE ADMIN_NOTICE_NO_SEQ
NOCACHE;

--●2)인서트 수행 ( 글번호, 제목, 내용, 핀번호) // 문자열 결합
INSERT INTO ADMIN_NOTICE(ADMIN_NOTICE_NO,TITLE,CONTENT,PIN_NO)
VALUES('AAA'||TO_CHAR(ADMIN_NOTICE_SEQ.NEXTVAL),'안녕하세요 프로젝터스입니다','안녕하세요! 사이트가 정식 오픈했습니다!','ABCD1234');

--------------------------------------------------------------------------------

--▣ 2023.08.06.오후 2:00 아현
-- 데이터 인서트 쿼리문 작성

-- : 회원 5명(프로필까지), 모집공고 2개(1모집중|1모집완료)
--  지원서 5개 (공고1의 모집자 지원서 1개, 공고 2의 모집자 지원서 1개 
--               + 지원자 3개(2개는: 모집 완료된 공고2 // 1개는 모집 중인 공고 1)) 
-- 프로젝트 1개(3인 프로젝트) 

-- 유저 핀번호 생성
INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES(UP||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);

-- 유저 번호 시퀀스 생성
CREATE SEQUENCE USERNOSEQ
NOCACHE;



--● 회원 테이블(USERS) 인서트 (유저번호, 유저핀번호, 아이디, 비번, 닉네임, 프사) 
INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --유저번호
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- 유저 핀번호
, 'doolahyeon@gmail.com'                     -- 아이디(이메일)
, CRYPTPACK.ENCRYPT('user0001','user0001')    -- 비밀번호(암호화)
, '두라현'                                  -- 닉네임
, 'images/defaultPhoto.jpg');                -- 프로필사진 url

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --유저번호
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- 유저 핀번호
, 'sedahyeon@gmail.com'                     -- 아이디(이메일)
, CRYPTPACK.ENCRYPT('user0002','user0002')    -- 비밀번호(암호화)
, '세다현'                                  -- 닉네임
, 'images/defaultPhoto.jpg');                -- 프로필사진 url

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --유저번호
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- 유저 핀번호
, 'nedahyeon@gmail.com'                     -- 아이디(이메일)
, CRYPTPACK.ENCRYPT('user0003','user0003')    -- 비밀번호(암호화)
, '네다현'                                  -- 닉네임
, 'images/defaultPhoto.jpg');                -- 프로필사진 url


INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --유저번호
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- 유저 핀번호
, 'ohahyeon@gmail.com'                     -- 아이디(이메일)
, CRYPTPACK.ENCRYPT('user0004','user0004')    -- 비밀번호(암호화)
, '오아현'                                  -- 닉네임
, 'images/defaultPhoto.jpg');                -- 프로필사진 url

INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKNAME, PHOTOURL)
VALUES(US||TO_CHAR(USERNOSEQ.NEXTVAL)        --유저번호
,(SELECT MAX(PIN_NO) FROM USER_PIN)          -- 유저 핀번호
, 'ugahyeon@gmail.com'                     -- 아이디(이메일)
, CRYPTPACK.ENCRYPT('user0005','user0005')    -- 비밀번호(암호화)
, '유가현'                                  -- 닉네임
, 'images/defaultPhoto.jpg');                -- 프로필사진 url

--------------------------------------------------------------------------------
--● 프로필 인서트문

-- 프로필 번호 생성에 쓸 시퀀스 생성
CREATE SEQUENCE PROFILESEQ
NOCACHE;

-- 프로필(PROFILE) 인서트 (프로필번호, 유저핀번호, 포지션번호,세부지역번호,등록일)
INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 1                                                     
, 991               -- 서울전체  
, SYSDATE);

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 2                                                       
, 1                 -- 경기도 고양시
, SYSDATE);

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 2                                                       
, 28                 -- 강원도 강릉시
, SYSDATE);

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 2                                                       
, 35                 -- 경상남도 거제시
, SYSDATE);

INSERT INTO PROFILE
(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PROFILESEQ.NEXTVAL
,(SELECT PIN_NO FROM USERS)
, 2                                                       
, 45                 -- 경상북도 구미시
, SYSDATE);
--------------------------------------------------------------------------------
--공고 번호 시퀀스
CREATE SEQUENCE RECRUITSEQ
NOCACHE;

--● 모집공고 인서트문
--(공고번호, 모집자의 핀번호, 진행방식번호, 제목, 내용, 등록일, 프로젝트 시작일, 프로젝트 종료일)

--● 1) 공고 1 ( 모집중) 8/6 공고 등록 , 19일 마감일 
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END) 
VALUES('RC'||TO_CHAR(RECRUITSEQ.NEXTVAL)
        ,'모집자의 핀넘버'
        , 1                                         
        , '반려동물 집사를 위한 커뮤니티'               
        , '반려동물 집사들이 서로 정보를 공유하고 소통할 수 있는 커뮤니티를 기획하고 있습니다..' 
        , SYSDATE                                    
        , TO_DATE('2023-08-25', 'YYYY-MM-DD')
        , TO_DATE('2023-10-25', 'YYYY-MM-DD'));

--● 2) 공고 2 ( 모집완료) 7/23 공고 등록 , 8/5일 모집 마감, 6일 합류체크 모두 완료 
INSERT INTO RECRUIT (RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END) 
VALUES('RC'||TO_CHAR(RECRUITSEQ.NEXTVAL)
        ,'모집자의 핀넘버'
        , 0                                         
        , '프로젝트 기획부터 함께하실 분들을 구합니다.'               
        , '프로젝트 경험이 없거나 적은 분들도 괜찮습니다. 저 포함 총 3명으로..' 
        , SYSDATE                                    
        , TO_DATE('2023-08-10', 'YYYY-MM-DD')
        , TO_DATE('2023-10-10', 'YYYY-MM-DD'));


--------------------------------------------------------------------------------
--● 지원서 1 (공고1(모집중) 의 모집자 지원서(자동처리))
-- (지원 번호, 공고에서 모집중인 포지션번호, 지원자의 핀번호, 내용, 지원일, 처리일시(수락/거절) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0001' -- 예시 (공고에서 모집중인 포지션 번호)(사용자가 선택한 값)
        , '지원자의핀번호' -- 지원자 핀 번호(=모집자)
        ,'없음' -- 내용
        , TO_DATE('2023-08-06', 'YYYY-MM-DD')     -- 지원일 (공고 등록일시와 같음) 원래는 SYSDATE로 
        , TO_DATE('2023-08-06', 'YYYY-MM-DD'));     -- 처리일 (공고 등록일시와 같음) 원래는 SYSDATE로 

--● 지원서 2 (공고1(모집중) 의 지원자의 지원서
-- (지원 번호, 공고에서 모집중인 포지션번호, 지원자의 핀번호, 내용, 지원일, 처리일시(수락/거절) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0002' -- 예시 (공고에서 모집중인 포지션 번호)(사용자가 선택한 값)
        , '지원자의핀번호' -- 지원자 핀 번호
        ,'안녕하세요. 강아지 두 마리를 키우고 있는 집사입니다! 반려인으로서 주제에 관심이..' -- 내용
        , TO_DATE('2023-08-06', 'YYYY-MM-DD')     -- 지원일 (공고 등록일시와 같음) 원래는 SYSDATE로 
        , TO_DATE('2023-08-06', 'YYYY-MM-DD'));     -- 처리일 (공고 등록일시와 같음) 원래는 SYSDATE로 

--● 지원서 3 (공고2(모집 완료) 의 모집자 지원서(자동처리)
-- (지원 번호, 공고에서 모집중인 포지션번호, 지원자의 핀번호, 내용, 지원일, 처리일시(수락/거절) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0003' -- 예시 (공고에서 모집중인 포지션 번호)(사용자가 선택한 값)
        , '지원자의핀번호' -- (= 모집자 핀번호)
        ,'없음' -- 내용
        , TO_DATE('2023-07-23', 'YYYY-MM-DD')     -- 지원일 (공고 등록일시와 같음) 원래는 SYSDATE로 
        , TO_DATE('2023-07-23', 'YYYY-MM-DD'));    -- 처리일 (공고 등록일시와 같음) 원래는 SYSDATE로 


--● 지원서 4 (공고2(모집 완료) 의 모집자1 지원서(합격, 합류 완료)
-- (지원 번호, 공고에서 모집중인 포지션번호, 지원자의 핀번호, 내용, 지원일, 처리일시(수락/거절) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0004' -- 예시 (공고에서 모집중인 포지션 번호)(사용자가 선택한 값)
        , '지원자의핀번호' -- (= 모집자 핀번호)
        ,'프로젝트 경험은 없지만 프론트엔드에 관심이 많아 이론적인 부분은 전반적으로 숙지하고 있습니다. 또한 클론 코딩으로..' -- 내용
        , TO_DATE('2023-07-24', 'YYYY-MM-DD')     -- 지원일  원래는 SYSDATE로 
        , TO_DATE('2023-07-24', 'YYYY-MM-DD'));    -- 처리일 원래는 SYSDATE로 


--● 지원서 5 (공고2(모집 완료) 의 모집자2 지원서(합격, 합류 완료)
-- (지원 번호, 공고에서 모집중인 포지션번호, 지원자의 핀번호, 내용, 지원일, 처리일시(수락/거절) 

INSERT INTO APPLY (APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE) 
VALUES('AP'||TO_CHAR(APPLYSEQ.NEXTVAL)
        , 'RP0005' -- 예시 (공고에서 모집중인 포지션 번호)(사용자가 선택한 값)
        , '지원자의핀번호' -- (= 모집자 핀번호)
        ,'프로젝트 경험이 1회 있고 기본적인 기능 위주로 구성된 게시판이었습니다. 능숙하지는 않지만..' -- 내용
        , TO_DATE('2023-07-25', 'YYYY-MM-DD')     -- 지원일  원래는 SYSDATE로 
        , TO_DATE('2023-07-25', 'YYYY-MM-DD'));    -- 처리일 원래는 SYSDATE로 

--------------------------------------------------------------------------------

--● 프로젝트 (공고 2를 통해 생성, 인원 3명 )
--(프로젝트 번호, 공고번호, 프로젝트 생성일)

INSERT INTO PROJECT (PRJ_NO, RECRUIT_NO, PRJ_DATE)
VALUES('PJ'||TO_CHAR(PROJECTSEQ.NEXTVAL)
    , '공고2의 공고번호'
    , TO_DATE('2023-08-06', 'YYYY-MM-DD')); -- 합류 체크 완료일 (원래는 SYSDATE)
    
--------------------------------------------------------------------------------
--==>> 여기까지 수정 및 반영 완료 
--------------------------------------------------------------------------------

--▣ 08.07 월_오후 9시 ~ 12시 
-- faq, qna 관련 dto, Idao, dao.xml, controller 구성 후 테스트

--// 테이블 데이터 확인 
SELECT * FROM FAQ;
--==>>1	FAQ 예시1	예시 1에 관련된 내용 //- 테스트용 데이터 1개 있음.

-- FAQ 목록 조회 쿼리문 
SELECT FAQ_NO, TITLE FROM FAQ
;
--------------------------------------------------------------------------------
--==>> FAQ 목록 action 파일로 출력 확인완료 (dto ~ controller) 0808 오전 8시 55분
-- faq 목록 보기 : faq-list.action
-- 특정 글 보기 :  faq-article.action
--------------------------------------------------------------------------------

--▣ 08.08 화 (QnA 관련 데이터 연결 확인) 
-- 내 질문 목록 리스트 (QnALists.jsp)  --==>>  question-list.action (연결 완료)
-- 내 특정 질문 아티클 페이지(답변포함)(QnAArticle.jsp)  --==>> question-article.action  (연결 완료) 
-- 질문하기 작성 페이지  --==>> 인서트 수행까지 완료 --==>> question-insert-form.action

--------------------------------------------------------------------------------
--// 테이블 데이터 확인 
SELECT * FROM QUESTION; 
--  질문번호  유저핀번호 제목        내용                  질문 날짜
/*
QN1	UP1	등업 질문	            등업은 어떻게 하나요?	2023-08-07
QN6	UP2	탈퇴 어떻게해요?	        전 여길 탈출할거에요	    2023-08-08
QN7	UP2	문의좀하겟소	        사실뻥이요       	    2023-08-08
QN8	UP2	드디어 연결됐다	        에휴	                2023-08-08
*/

--● 내 질문 리스트 조회 쿼리문  ( 번호, 제목, 작성일, 상태(없으면 답변대기상태 )    
SELECT Q.QUESTION_NO AS QUESTIONNO, Q.TITLE AS QUESTIONTITLE
, Q.CREATED_DATE AS QCREATEDDATE
, NVL2(A.CREATED_DATE,'답변완료','답변대기중') AS ISREPLY
FROM QUESTION Q FULL OUTER JOIN ANSWER A 
ON Q.QUESTION_NO = A.QUESTION_NO
WHERE Q.PIN_NO = 'UP2';

--● 특정 질문글 상세 아티클 (질문만)
SELECT QUESTION_NO AS QUESTIONNO, TITLE AS QUESTIONTITLE, 
CONTENT AS QUESTIONCONTENT, CREATED_DATE AS QCREATEDDATE
FROM QUESTION
WHERE QUESTION_NO='QN13';	


--● 문의글 작성 인서트 
INSERT INTO QUESTION VALUES('QN'||TO_CHAR(QUESTIONNOSEQ.NEXTVAL)
, 'UP2'
,'탈퇴 어떻게해요?' 
,'전 여길 탈출할거에요'
, SYSDATE)
;
--==>> 인서트 완료 

--------------------------------------------------------------------------------

--// 관리자 계정 확인 
SELECT * FROM ADMIN;
/*
AD1	admin001@gmail.com	admin001	2023-08-06	UP16
AD2	admin002@gmail.com	admin002	2023-08-06	UP17
*/
DESC ANSWER;


--------------------------------------------------------------------------------
--● 특정 질문에 대한 답변 등록(인서트) - 정적 구성  
INSERT INTO ANSWER (ANSWER_NO, CONTENT, QUESTION_NO, CREATED_DATE, PIN_NO) 
VALUES ('AN'||TO_CHAR(ANSWERNOSEQ.NEXTVAL)
        , '가지마세요..'
        , 'QN6'
        , SYSDATE
        , 'UP16'); -- 답변번호, 문의번호, 관리자 번호
--==>> 1 행 이(가) 삽입되었습니다.

SELECT * FROM ANSWER;
--==>> AN1	그런거 없습니다	QN1	2023-08-08	UP16

COMMIT; -- 커밋 완료.
--------------------------------------------------------------------------------    
--○ 특정 질문글 상세 아티클 (질문 - 답변 통합) 
/*
SELECT Q.QUESTION_NO, Q.TITLE, Q.CONTENT, Q.CREATED_DATE
    , A.ANSWER_NO, A.CONTENT,A.CREATED_DATE
FROM QUESTION Q FULL JOIN ANSWER A 
ON Q.QUESTION_NO = 'QN1';
*/

--● 특정 질문글에 대한 답변 출력 쿼리문
SELECT CONTENT AS ANSWERCONTENT,CREATED_DATE AS ANSWERCREATEDDATE
FROM ANSWER
WHERE QUESTION_NO='QN7';
--==>>가지마세요..	2023-08-09     -- QN6
--==>>그런거 없습니다	2023-08-08 -- QN1

--●[관리자용] 유저 전체 질문 리스트 조회 쿼리문  
--( 번호, 작성자 닉네임, 제목, 작성일, 상태(없으면 답변대기상태 )    
SELECT Q.QUESTION_NO AS QUESTIONNO
        , U.NICKNAME AS NICKNAME
        , Q.TITLE AS QUESTIONTITLE
        , Q.CREATED_DATE AS QCREATEDDATE
        , NVL2(A.CREATED_DATE,'답변완료','답변대기중') AS ISREPLY
FROM (QUESTION Q FULL OUTER JOIN ANSWER A 
ON Q.QUESTION_NO = A.QUESTION_NO) LEFT JOIN USERS U
ON Q.PIN_NO= U.PIN_NO
ORDER BY Q.CREATED_DATE DESC;

/*
SELECT NICKNAME FROM QUESTION Q LEFT JOIN USERS U
ON Q.PIN_NO= U.PIN_NO;
-- 문의글 작성자 닉네임만 출력 */



--● 관리자용 아티클 조회 (유저를 닉네임으로 출력)=> 닉네임만 안가져와짐. 
-- 어차피 관리자 페이지라 핀넘버가 더 나은 것 같아서 바꾸기로. 
SELECT Q.QUESTION_NO AS QUESTIONNO      --문의번호
      ,Q.PIN_NO AS PINNO                -- 유저 핀번호
      ,U.NICKNAME AS NICKNAME           -- 유저 닉네임
      ,Q.TITLE AS QUESTIONTITLE         -- 문의 제목
      ,Q.CONTENT AS QUESTIONCONTENT     -- 문의 내용
      , Q.CREATED_DATE AS QCREATEDDATE  -- 작성일시
FROM QUESTION Q LEFT JOIN USERS U 
ON Q.PIN_NO= U.PIN_NO
WHERE QUESTION_NO = 'QN13';

--답변 번호 시퀀스 생성
CREATE SEQUENCE ANSWERNOSEQ 
NOCACHE;
--==>> Sequence ANSWERNOSEQ이(가) 생성되었습니다.

--● 특정 질문글에 등록한 답변 수정 
UPDATE ANSWER 
SET CONTENT = '가지마세요..' 
WHERE QUESTION_NO='QN7';
--==>> 1 행 이(가) 업데이트되었습니다.


--● 특정 질문글에 등록한 답변 삭제  
DELETE FROM ANSWER 
WHERE QUESTION_NO = 'QN7';
--==>>1 행 이(가) 삭제되었습니다.

SELECT * FROM FAQ;
SELECT * FROM ANSWER;

--------------------------------------------------------------------------------
--==>> 08.10 목 완료.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--▣ 08.10 목 (오후 3시 ~)// 지원서 관련 

-- 지원서 폼     -> 인서트 수행 (모집자는 자동 처리) 
-- 지원서 아티클 -> 등록된 지원서를 모집자  / 지원자 입장에서 확인하는 페이지
--               -> 모집자: 수락/거절 선택 

-->> 지원서에 입력해야하는 데이터는 상세내용뿐! 나머지는 프로필 IMPORT 

--  필요한 데이터 체크 
SELECT * FROM USERS;     --(회원번호, 핀번호, 아이디, 닉네임, 프사URL) 
SELECT * FROM PROFILE;   -- (포지션, 세부지역, 가입일)
SELECT * FROM USER_TOOL; -- (유저 사용 도구)

SELECT * FROM APPLY;     -- 지원서 테이블 
--( 공고번호,지원 포지션 번호, 회원핀번호, 상세내용) 

--------------------------------------------------------------------------------

--[그냥 써봄] 모집자가 보는 지원서 아티클 (존재하는 지원서 내용 조회)
-- 프로필 + 상세내용 + 지원서 테이블에 저장된 정보

-- 유저 기능이라서 구분 문자 뺌 
SELECT SUBSTR(A.APPLY_NO, 3) AS applyNo               -- 지원 번호
     , SUBSTR(A.RECRUIT_POS_NO,3) AS recruitPosNo      -- 공고 번호
     , U.ID AS ID                                     -- 유저 아이디 
     , U.NICKNAME AS nickName                          -- 유저 닉네임  
     , U.PHOTOURL AS photoUrl                         -- 프로필사진 url
     , P.SUB_REGION_NO AS subRegionNo                   -- 세부 지역
FROM (APPLY A FULL OUTER JOIN USERS U 
      ON A.PIN_NO = U.PIN_NO) RIGHT OUTER JOIN PROFILE P 
      ON U.PIN_NO = P.PIN_NO
;
--==>> 앞에서 데이터 연결 먼저 해야할 것 같아서 보류.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--▣ 08.11 금 (오전 9시 ~)// 팀 스페이스 > 공지 게시판 작업

--==>> 테이블 데이터들 확인.. 
SELECT * FROM RECRUIT;  -- 모집공고
SELECT * FROM PROJECT; --(플젝번호, 공고번호, 프로젝트 생성일) 
SELECT * FROM USER_PIN; -- 회원 식별번호
SELECT * FROM NOTE;     -- 쪽지
SELECT * FROM FEED;     -- 담벼락
SELECT * FROM SPACE_NOTICE;  -- 스페이스 공지 
--------------------------------------------------------------------------------

-- 스페이스 공지 번호 시퀀스 생성
CREATE SEQUENCE SPACENOTICENOSEQ
NOCACHE;
--==>> Sequence SPACENOTICENOSEQ이(가) 생성되었습니다.
--DROP SEQUENCE SPACENOTICENOSEQ;

--------------------------------------------------------------------------------
--○ 스페이스 공지글 샘플 데이터 입력 (20개)
--(스페이스 공지번호, 플젝번호, 공지글제목, 내용, 작성일)

INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL)
,'PJ1'
, '그라운드 룰 공지 및 첫 회의'
, '안녕하세요. 첫 공지입니다. 제가 미리 정한 룰은 회의를 통해 변경할 수 있으니 의견이 있으시면..'
, SYSDATE);

INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 2회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 3회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 4회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 5회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 6회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 7회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 8회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 9회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 10회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 11회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 12회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 13회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 14회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 15회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 16회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 17회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 18회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 19회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);
INSERT INTO SPACE_NOTICE 
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL),'PJ1', '정기 회의 20회차 안내'
, '안녕하세요. 벌써 새로운 한 주가 시작되었네요! 지난 회의때 미결된 안은 XXX..이며..', SYSDATE);

--==>> 1 행 이(가) 삽입되었습니다. * 20  --커밋 완료 

COMMIT;

---------------------------[스페이스 공지 관련 기능]---------------------------
--● 공지글 등록 (팀장)
INSERT INTO SPACE_NOTICE
VALUES('SN'||TO_CHAR(SPACENOTICENOSEQ.NEXTVAL)
,'PJ1'
,'공지인척 하는 글'
,'우히히'
,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

--● 공지글 본문 수정 (팀장)
UPDATE SPACE_NOTICE
SET CONTENT='프로젝트 종료가 코앞이네요. 지난 n개월 동안 고생 많으셨습니다'
WHERE SPACE_NOTICE_NO = 'SN44';
--==>> 1 행 이(가) 업데이트되었습니다.

--● 공지글 삭제  (팀장)
DELETE FROM SPACE_NOTICE
WHERE SPACE_NOTICE_NO = 'SN11'
;
--==>> 1 행 이(가) 삭제되었습니다.

--● 공지글 리스트로 불러오기 (모든 팀원)
--(공지번호, 제목 , 작성일)  
SELECT SUBSTR(SPACE_NOTICE_NO,3) AS spaceNoticeNo
, TITLE AS title
, CREATED_DATE AS createdDate
FROM  SPACE_NOTICE
WHERE PRJ_NO ='PJ1'
ORDER BY spaceNoticeNo DESC
;

--● 공지글 아티클 읽기 (모든 팀원)
--(공지번호, 제목, 내용, 작성일) 
SELECT SUBSTR(SPACE_NOTICE_NO,3) AS spaceNoticeNo
, TITLE AS title
, CONTENT AS content
, CREATED_DATE AS createdDate
FROM  SPACE_NOTICE
WHERE SPACE_NOTICE_NO ='SN44'
;

SELECT * FROM SPACE_NOTICE;
--DELETE FROM SPACE_NOTICE;

--==>> 공지 게시판 기능 끝
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--▣ 2023.08.12 토 

--------------------------------[ 담벼락 기능 ]---------------------------------
-- 테이블 데이터확인
SELECT * FROM FEED;  

-- 현재 계정의 모든 시퀀스 조회 
SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences;

-- 담벼락 시퀀스 생성
CREATE SEQUENCE FEEDNOSEQ
NOCACHE;
--==>> Sequence FEEDNOSEQ이(가) 생성되었습니다. 

--DROP SEQUENCE FEEDNOSEQ;

-- 샘플 데이터 입력 ( PJ1 의 팀스페이스 팀원들이 1번씩 작성) 
INSERT INTO FEED(FEED_NO, FINAL_NO, CONTENT, CREATED_DATE) 
VALUES(FEEDNOSEQ.NEXTVAL        
        , 'FN1'
        , '우와 안녕하세요'
        , SYSDATE);
INSERT INTO FEED(FEED_NO, FINAL_NO, CONTENT, CREATED_DATE) 
VALUES(FEEDNOSEQ.NEXTVAL                        
        , 'FN2'
        , '네 안녕하세요'
        , SYSDATE);
INSERT INTO FEED(FEED_NO, FINAL_NO, CONTENT, CREATED_DATE) 
VALUES(FEEDNOSEQ.NEXTVAL 
        , 'FN3'
        , '반갑습니다'
        , SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다. *3 

-- 샘플 데이터 입력2 ( PJ2 의 팀스페이스 팀원 8명 중 2명이 1번씩 작성) 
INSERT INTO FEED(FEED_NO, FINAL_NO, CONTENT, CREATED_DATE) 
VALUES(FEEDNOSEQ.NEXTVAL        
        , 'FN5'
        , '하이하이'
        , SYSDATE);
INSERT INTO FEED(FEED_NO, FINAL_NO, CONTENT, CREATED_DATE) 
VALUES(FEEDNOSEQ.NEXTVAL                        
        , 'FN6'
        , '바이바이요'
        , SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다. *2

SELECT * FROM FEED;
SELECT * FROM FINAL;
SELECT * FROM PROJECT;

--DELETE FROM FEED;
--------------------------------------------------------------------------------
--● 담벼락 입력(등록) 쿼리문 (피드 글번호, 최종합류번호, 내용, 등록일) 
INSERT INTO FEED(FEED_NO, FINAL_NO, CONTENT, CREATED_DATE) 
VALUES(FEEDNOSEQ.NEXTVAL
        , 'FN1'                         --  이후 동적 구성해야되는 최종합류번호 
        , '우와 안녕하세요'
        , SYSDATE);

--● 팀 스페이스별 담벼락 내용 불러오기 (무한 스크롤)
SELECT U.NICKNAME nickName, F.CONTENT content, F.CREATED_DATE createdDate
FROM FEED F JOIN FINAL FN 
ON F.FINAL_NO = FN.FINAL_NO -- 최종 합류번호로 조인
    JOIN FIRST_CK FC 
    ON FN.FIRST_CK_NO = FC.FIRST_CK_NO -- 1차 합격 번호로 조인
        JOIN APPLY A 
        ON FC.APPLY_NO = A.APPLY_NO -- 포지션 지원번호로 조인
            JOIN USERS U 
            ON A.PIN_NO = U.PIN_NO  -- PIN 번호로 조인 
WHERE F.FINAL_NO IN ('FN1', 'FN2', 'FN3') -- 같은 팀스페이스 사람들 조건
ORDER BY F.CREATED_DATE DESC;  -- 최신순 정렬 

------------------------------[ 회의록 게시판 ]---------------------------------

-- 회의록 게시판 
-- 현재 계정의 모든 시퀀스 조회 
SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences;

-- 회의록 번호 시퀀스 생성
CREATE SEQUENCE MEETINGNOSEQ
NOCACHE;
--==>> Sequence MEETINGNOSEQ이(가) 생성되었습니다.

-- 샘플 데이터 인서트
--(회의록 번호, 최종합류번호, 제목, 내용, 첨부파일URL, 작성일, 회의날짜 )
--(히스토리에는 회의 날짜 기준으로 기록됨)

INSERT INTO MEETING (MEETING_NO, FINAL_NO, TITLE, CONTENT, FILEURL, CREATED_DATE, MEETING_DATE)
VALUES('MT'||TO_CHAR(MEETINGNOSEQ.NEXTVAL)
        , 'FN1'
        , '1차: 기획 회의'
        , '담당자: 팀원1 .. 장소 어쩌구.. 내용 어쩌구..'
        , NULL
        , SYSDATE
        , '2023-08-01');
INSERT INTO MEETING (MEETING_NO, FINAL_NO, TITLE, CONTENT, FILEURL, CREATED_DATE, MEETING_DATE)
VALUES('MT'||TO_CHAR(MEETINGNOSEQ.NEXTVAL)
        , 'FN2'
        , '2차: 기획 회의'
        , '담당자: 팀원2 .. 장소 어쩌구.. 내용 어쩌구..'
        , NULL
        , SYSDATE
        , '2023-08-02');

--==>> 1 행 이(가) 삽입되었습니다. *2
--COMMIT;

-- 테이블, 데이터 체크
SELECT * FROM MEETING;
--==>>
/*
--(회의록번호, 최종합류번호(작성자), 제목, 내용, 첨부파일URL, 작성일, 회의날짜 )
MT1	FN1	1차: 기획 회의	담당자: 팀원1 .. 장소 어쩌구.. 내용 어쩌구..	2023-08-13	2023-08-01
MT2	FN2	2차: 기획 회의	담당자: 팀원2 .. 장소 어쩌구.. 내용 어쩌구..		2023-08-13	2023-08-02
*/



--------------------------------------------------------------------------------
--● 회의록 등록 쿼리문
INSERT INTO MEETING (MEETING_NO, FINAL_NO, TITLE, CONTENT, FILEURL, CREATED_DATE, MEETING_DATE)
VALUES('MT'||TO_CHAR(MEETINGNOSEQ.NEXTVAL)
        , 'FN2'
        , '5차: 스토리보드'
        , '담당자: 팀원3 .. 장소 어쩌구.. 내용 어쩌구..'
        , NULL
        , SYSDATE
        , '2023-08-07')
;

--------------------------------------------------------------------------------
--● 회의록 수정 쿼리문
UPDATE MEETING 
SET TITLE = '3차: 스토리보드'
    ,CONTENT = '담당자: 팀원3.. 이번 주부터 진행할 스토리보드..'
    ,FILEURL = '/images/exit.png'
    ,MEETING_DATE = '2023-08-04'
WHERE MEETING_NO = 'MT3'
;
--==>>1 행 이(가) 업데이트되었습니다.
--------------------------------------------------------------------------------
--● 회의록 삭제 쿼리문
DELETE FROM MEETING
WHERE MEETING_NO = 'MT2'
;
--==>> 1 행 이(가) 삭제되었습니다.
--------------------------------------------------------------------------------
--● 회의록 목록(게시판) 조회 (5개 속성)
--(글 번호, 제목, 작성자, 회의날짜, 작성일) 
SELECT SUBSTR(M.MEETING_NO,3) meetingNo
      , U.NICKNAME nickName
      , M.TITLE title
      , M.CREATED_DATE createdDate
      , M.MEETING_DATE meetingDate
FROM MEETING M JOIN FINAL F
ON M.FINAL_NO = F.FINAL_NO              -- 최종 합류 번호로 조인 
    JOIN FIRST_CK FC 
    ON F.FIRST_CK_NO = FC.FIRST_CK_NO -- 1차 합격 번호로 조인
        JOIN APPLY A 
        ON FC.APPLY_NO = A.APPLY_NO -- 포지션 지원번호로 조인
            JOIN USERS U 
            ON A.PIN_NO = U.PIN_NO  -- 핀 번호로 조인 
WHERE M.FINAL_NO IN('FN1','FN2','FN3')
;

--------------------------------------------------------------------------------
--● 회의록 아티클 조회 (7개 속성)
--(글 번호, 제목, 내용, 첨부파일, 작성자, 회의날짜, 작성일)
SELECT SUBSTR(M.MEETING_NO,3) meetingNo
      , M.TITLE title
      , M.CONTENT content
      , NVL(M.FILEURL,'첨부파일없음') fileUrl
      , U.NICKNAME nickName
      , M.CREATED_DATE createdDate
      , M.MEETING_DATE meetingDate
FROM MEETING M JOIN FINAL F
ON M.FINAL_NO = F.FINAL_NO              -- 최종 합류 번호로 조인 
    JOIN FIRST_CK FC 
    ON F.FIRST_CK_NO = FC.FIRST_CK_NO -- 1차 합격 번호로 조인
        JOIN APPLY A 
        ON FC.APPLY_NO = A.APPLY_NO -- 포지션 지원번호로 조인
            JOIN USERS U 
            ON A.PIN_NO = U.PIN_NO  -- 핀 번호로 조인 
WHERE M.MEETING_NO ='MT1'
;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--▣ 2023.08.14 월 // 유저의 신고 접수 기능(인서트) (공고,쪽지,댓글,지원서)

-- 데이터 확인 

SELECT * FROM REP_RECRUIT; -- 모집 공고 신고 
SELECT * FROM REPORT_REASON; -- 신고 사유 
SELECT * FROM PROJECT;   
SELECT * FROM REPORT_APPLY;
SELECT * FROM APPLY;
SELECT * FROM COMMENTS;
/*
1	부적절한 언어 사용
2	저작권 침해
3	도배 및 광고
4	개인정보 침해
5	허위사실유포
*/
CREATE SEQUENCE REPAPPLYNOSEQ
NOCACHE;
--==>> Sequence REPAPPLYNOSEQ이(가) 생성되었습니다

--------------------------------------------------------------------------------
--● 공고 신고 인서트 (공고신고번호, 공고번호, 신고자핀번호, 신고일, 신고사유) 
INSERT INTO REP_RECRUIT(REP_RECRUIT_NO, RECRUIT_NO, PIN_NO, CREATED_DATE, REP_REASON_NO)
VALUES('REPR'|| TO_CHAR(REPRECNOSEQ.NEXTVAL)
       ,'RC8','UP1',SYSDATE, 5)
;
--==>> 1 행 이(가) 삽입되었습니다.
--------------------------------------------------------------------------------
--● 지원서 신고 인서트 (지원서신고번호, 지원서번호, 신고자핀번호, 신고일, 신고사유) 
INSERT INTO REPORT_APPLY(REP_APPLY_NO, APPLY_NO, PIN_NO, CREATED_DATE, REP_REASON_NO)
VALUES('REPA'|| TO_CHAR(REPAPPLYNOSEQ.NEXTVAL)
       ,'AP14','UP2',SYSDATE, 1)
;
--==>>1 행 이(가) 삽입되었습니다.
--------------------------------------------------------------------------------
--● 댓글 신고 인서트 (댓글신고번호, 댓글번호, 신고자핀번호, 신고일, 신고사유) 
INSERT INTO REPORT_COMM(REP_COMM_NO, COMM_NO, PIN_NO, REP_DATE, REP_REASON_NO)
VALUES(REPCOMMNOSEQ.NEXTVAL,1,'UP3',SYSDATE, 1)
;
--==>> 1 행 이(가) 삽입되었습니다.
--------------------------------------------------------------------------------
--● 쪽지 신고 인서트 (쪽지신고번호, 쪽지번호, 신고자핀번호, 신고사유, 신고일) 
INSERT INTO REPORT_NOTE(REP_NOTE_NO, NOTE_NO, PIN_NO, REP_REASON_NO, CREATED_DATE)
VALUES('REPN'|| TO_CHAR(REPNOTENOSEQ.NEXTVAL)
    ,'NN1', 'UP15', 1, SYSDATE )
;
--==>> 1 행 이(가) 삽입되었습니다.
SELECT * FROM REPORT_NOTE;
--==>> REPN1	NN1	UP15	1	2023-08-14

--------------------------------------------------------------------------------
--==>> 신고 접수(인서트) 기능은 DTO ~ 컨트롤러까지 구성 완료.
--==>> 공고 신고는 연결까지 끝. 지원서는 아직 모집자 입장에서 지원서 확인하는거 
-- 안 만들어져서 댓글이랑 쪽지 먼저 하겠음 ( 오후 12시 36분) 
--------------------------------------------------------------------------------
---------------[로그인 한 유저가 본인 쪽지만 볼 수 있게 구성하기]---------------


--데이터 확인
SELECT * FROM NOTE;
--==>> 신고용 쪽지만 몇 개 있음.

-- 샘플 데이터 입력
DELETE FROM NOTE;

--● 쪽지 전송하기 (인서트)
--(쪽지번호, 보낸사람핀번호, 받는사람핀번호, 보낸날짜, 읽은날짜,


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--▣ 2023.08.16 수
--==>> 쪽지 기능 중단하고 팀스페이스기능 이어서


SELECT * FROM PROJECT
WHERE RECRUIT_NO ='RC2'; -- PJ1  프로젝트의 공고번호는 RC2고 팀장은 UP2 
SELECT * FROM RECRUIT
WHERE RECRUIT_NO ='RC2';

---------------------------------[ 작업실 ]-------------------------------------

-- 현재 계정의 모든 시퀀스 조회 
SELECT sequence_name, min_value, max_value, increment_by, last_number
FROM user_sequences;

-- 작업 게시글 번호 시퀀스 생성 
CREATE SEQUENCE WORKSPACENOSEQ
NOCACHE;
--==>> Sequence WORKSPACENOSEQ이(가) 생성되었습니다.


-- 작업실 글, 댓글 데이터 확인, 샘플데이터 입력
SELECT * FROM workspace;--(작업글번호, 최종합류번호, 제목, 내용, 작성일) 
SELECT * FROM workspace_comm;

--------------------------------------------------------------------------------
--● 작업 게시글 등록 쿼리문
INSERT INTO WORKSPACE(WORKSPACE_NO, FINAL_NO, TITLE, CONTENT, CREATED_DATE)
VALUES ('WS'||TO_CHAR(WORKSPACENOSEQ.nextval)
        ,'FN1'
        ,'작업 10일차!'
        ,'요구분석서와 스토리보드가 끝났습니다!'
        ,SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다. *10 
--------------------------------------------------------------------------------
--● 작업글 수정 쿼리문 
UPDATE WORKSPACE
SET TITLE = '작업 10일차 (수정)'
    ,CONTENT = '끝난 줄 알았지만..아직 할 게 남았네요'
WHERE WORKSPACE_NO = 'WS20';
--==>> 1 행 이(가) 업데이트되었습니다.

--------------------------------------------------------------------------------    
--● 작업글 삭제 쿼리문
DELETE
FROM WORKSPACE
WHERE WORKSPACE_NO = 'WS21';
--==>> 1 행 이(가) 삭제되었습니다.

--------------------------------------------------------------------------------
--● 특정 유저의 작업글 목록 조회 쿼리문
SELECT W.WORKSPACE_NO workspaceNo
     , U.NICKNAME nickname
     , W.TITLE title
     , W.CREATED_DATE createdDate
FROM WORKSPACE W JOIN FINAL F
ON W.FINAL_NO = F.FINAL_NO              -- 최종 합류 번호로 조인 
    JOIN FIRST_CK FC 
    ON F.FIRST_CK_NO = FC.FIRST_CK_NO -- 1차 합격 번호로 조인
        JOIN APPLY A 
        ON FC.APPLY_NO = A.APPLY_NO -- 포지션 지원번호로 조인
            JOIN USERS U 
            ON A.PIN_NO = U.PIN_NO  -- 핀 번호로 조인 
WHERE FINAL_NO = 'FN1';
--------------------------------------------------------------------------------
--● 작업글 아티클 상세 조회 쿼리문
SELECT WORKSPACE_NO workspace, FINAL_NO finalNo, TITLE title
      , CONTENT content, CREATED_DATE createdDate
FROM WORKSPACE
WHERE WORKSPACE_NO = 'WS15'; 
--------------------------------------------------------------------------------


