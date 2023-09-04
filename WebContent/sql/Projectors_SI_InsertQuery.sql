-- ※ 관리자 관련 INSERT 구문

-- 회원 식별번호 생성
-- ⓞ
INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES(UP||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);

-- 관리자 시퀀스 생성
CREATE SEQUENCE ADMINNOSEQ
NOCACHE;

-- 관리자 INSERT 구문 ⓞ 번 실행 후에 번호 INSERT 구문 실행하기
-- ①
INSERT INTO ADMIN(ADMIN_NO, ADMIN_ID, ADMIN_PW, REG_DATE, PIN_NO) 
VALUES (AD||TO_CHAR(ADMINNOSEQ.NEXTVAL), 'admin001@gmail.com'
, CRYPTPACK.ENCRYPT('admin001','java002$'), SYSDATE, '생성한 핀넘버 넣기');

--②
INSERT INTO ADMIN(ADMIN_NO, ADMIN_ID, ADMIN_PW, REG_DATE, PIN_NO) 
VALUES (AD||TO_CHAR(ADMINNOSEQ.NEXTVAL), 'admin002@gmail.com'
, CRYPTPACK.ENCRYPT('admin002','java002$'), SYSDATE, '생성한 핀넘버 넣기');


SELECT *
FROM POSITION;

-- ※ 회원 관련 INSERT 구문

-- 회원 INSERT 구문 ⓞ 번 실행 후에 번호 INSERT 구문 실행하기
-- ①
-- 유저 정보
INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKAME, PHOTOURL)
VALUES (US||TO_CHAR(USERNOSEQ.NEXTVAL), '핀넘버들어갈자리' , 'hwangi@gmail.com', 'java002$', '환기', 'images/defaulfPhoto.jpg ');
-- 프로필
INSERT INTO PROFILE(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PF||TO_CHAR(PROFILESEQ.NEXTVAL), '핀넘버들어갈자리', 2, 901, SYSDATE);
-- 유저 사용언어 + 환경
INSERT INTO USER_TOOL(UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES (UT||TO_CHAR(UTOOLNOSEQ.NEXTVAL), '프로필넘버들어갈자리', 1);
INSERT INTO USER_TOOL(UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES (UT||TO_CHAR(UTOOLNOSEQ.NEXTVAL), '프로필넘버들어갈자리', 11);
INSERT INTO USER_TOOL(UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES (UT||TO_CHAR(UTOOLNOSEQ.NEXTVAL), '프로필넘버들어갈자리', 21);
-- 모집공고 작성
INSERT INTO RECRUIT(RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES (RC||TO_CHAR(RECRUITNOSEQ.NEXTVAL), '핀넘버들어갈자리', 0, '라흐헤스트 모집공고', '저희 라흐헤스트는 이런저런거 하려고 생각하고 있습니다'
, SYSDATE, TO_DATE('2023-08-25'), TO_DATE('2023-12-25'));
-- 모집공고에 대한 포지션 작성
INSERT INTO RECRUIT_POS(RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (RP||TO_CHAR(RECRUITPOSNOSEQ.NEXTVAL), '모집공고들어갈자리', 1);
INSERT INTO RECRUIT_POS(RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (RP||TO_CHAR(RECRUITPOSNOSEQ.NEXTVAL), '모집공고들어갈자리', 1);
INSERT INTO RECRUIT_POS(RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (RP||TO_CHAR(RECRUITPOSNOSEQ.NEXTVAL), '모집공고들어갈자리', 2);
-- 모집공고에 대한 기술 작성
--???? 빠져있네
-- 팀장은 자연스럽게 지원한 상태 됨
INSERT INTO APPLY(APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE)
VALUES(AP||TO_CHAR(APPLYNOSEQ.NEXTVAL), '모집자모집포지션넘버들어갈자리', '모집자회원식별번호들어갈자리', '팀장', SYSDATE, SYSDATE+1);
-- 스무스하게 1차합류까지 자동으로 수락된 상황
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES (FS||TO_CHAR(FIRSTCHECKNOSEQ.NEXTVAL), '모집자의지원번호', SYSDATE+1);

--------------------------------------------------------------------------------

-- 공고 신고데이터 INSERT
SELECT *
FROM RECRUIT;
--==>> 
/*
RC1	UP1	    1	반려동물 집사를 위한 커뮤니티	반려동물 집사들이 서로 정보를 공유하고 소통할 수 있는 커뮤니티를 기획하고 있습니다..
RC2	UP2	    0	프로젝트 기획부터 함께하실 분들을 구합니다.	프로젝트 경험이 없거나 적은 분들도 괜찮습니다. 저 포함 총 3명으로..
RC3	UP6	    1	주차 시스템 프로젝트	주차 시스템 프로젝트에 관련된 내용
RC4	UP7	    1	메신저 시스템 프로젝트	메신저 시스템 프로젝트에 관련된 내용
RC5	UP11	    0	치킨 맛집 어플리케이션	치킨맛집 어플리케이션 프로젝트를 같이 하실 팀원들을 모집합니다.
RC6	UP12	    1	영화 좌석 예매 웹 사이트	영화관 좌석을 예매하는 시스템을 같이 만들어 보실 팀원들을 모집합니다.
RC8	UP20	    1	애매한 제목의 공고	애매한 내용의 공고
RC9	UP15	    0	자전거 동호회 어플리케이션 프로젝트	자전거 동호회 회원들이 산 고도에 대한 정보를 주고받고 날씨 정보 및 실시간 산 정보를 공유할 수 있는 어플리케이션을 제작하고자 합니다. 성실하고 시간적 여유가 많으신 분이시면 좋겠습니다. 많은 지원 부탁드립니다.
RC7	UP18	    1	불량한 제목의 공고	불량한 내용의 공고
*/

SELECT *
FROM REP_RECRUIT;
--==>> 
/*
REP_RECRUIT_NO   RECRUIT_NO       PIN_NO           CREATED_DA REP_REASON_NO
---------------- ---------------- ---------------- ---------- -------------
REPR2            RC8              UP5              2023-08-07             1
REPR1            RC7              UP18             2023-08-07             1
*/

INSERT INTO REP_RECRUIT(REP_RECRUIT_NO,RECRUIT_NO,PIN_NO,REP_REASON_NO)
VALUES('RERP'||REPRECNOSEQ.NEXTVAL, 'RC5', 'UP18', 3);
--==>> 1 행 이(가) 삽입되었습니다.














