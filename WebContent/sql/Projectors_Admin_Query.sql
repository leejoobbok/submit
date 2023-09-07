SELECT USER
FROM DUAL;
--==>> PROJECTORS

SELECT SYSDATE
FROM DUAL;
--==>> 2023-08-07

-- ������ ��ȸ (�α��ν�) ������
-- DELETEDATE �� 0�̸� Ȱ��ȭ ������, 1�̸� ��Ȱ��ȭ ������
SELECT NVL2(TO_CHAR(QA.QUIT_DATE,'YYYY-MM-DD'),0,1) AS DELETEDATE, AD.PIN_NO AS PIN_NO, AD.ADMIN_NO AS ADMIN_NO, COUNT(*) AS COUNT
FROM QUIT_ADMIN QA
RIGHT JOIN ADMIN AD 
ON QA.PIN_NO = AD.PIN_NO
WHERE AD.ADMIN_ID = 'admin001@gmail.com' AND AD.ADMIN_PW = 'admin001'
GROUP BY TO_CHAR(QA.QUIT_DATE,'YYYY-MM-DD'), AD.PIN_NO, AD.ADMIN_NO;

-- ������ �α��� ��� ������
DESC LOGIN_REC;

SELECT *
FROM LOGIN_REC;

INSERT INTO LOGIN_REC(LOGIN_REC,PIN_NO) 
VALUES(LOGINRECSEQ.NEXTVAL, 'UP1' )
;

ROLLBACK;

--------------------------------------------------------------------------------

-- ���� �α��� Ƚ��
SELECT COUNT(*)
FROM LOGIN_REC
WHERE TO_CHAR(LOGIN_DATE, 'YYYY-MM-DD')=TO_CHAR(SYSDATE,'YYYY-MM-DD');

DESC REPORT_COMM;

-- ó���ؾ��� �Ű� �Ǽ�
-- ���
SELECT COUNT(CASE WHEN RCR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
FROM REP_COMM_RESULT RCR
JOIN REPORT_COMM RC
ON RCR.REP_COMM_NO = RC.REP_COMM_NO;
-- ����
SELECT COUNT(CASE WHEN RAR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
FROM REP_APPLY_RESULT RAR
JOIN REPORT_APPLY RA
ON RAR.REP_APPLY_NO = RA.REP_APPLY_NO;
-- ����
SELECT COUNT(CASE WHEN RRR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
FROM REP_RECRUIT_RESULT RRR
JOIN REP_RECRUIT RR
ON RRR.REP_RECRUIT_NO = RR.REP_RECRUIT_NO;
-- ����
SELECT COUNT(CASE WHEN RNR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
FROM REP_NOTE_RESULT RNR
JOIN REPORT_NOTE RN
ON RNR.REP_NOTE_NO = RN.REP_NOTE_NO;

-- ��� + ���� + ���� + ����
SELECT
  (
    SELECT COUNT(CASE WHEN RCR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
    FROM REP_COMM_RESULT RCR
    RIGHT JOIN REPORT_COMM RC
    ON RCR.REP_COMM_NO = RC.REP_COMM_NO
  ) +
  (
    SELECT COUNT(CASE WHEN RAR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
    FROM REP_APPLY_RESULT RAR
    RIGHT JOIN REPORT_APPLY RA
    ON RAR.REP_APPLY_NO = RA.REP_APPLY_NO
  ) +
  (
    SELECT COUNT(CASE WHEN RRR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
    FROM REP_RECRUIT_RESULT RRR
    RIGHT JOIN REP_RECRUIT RR
    ON RRR.REP_RECRUIT_NO = RR.REP_RECRUIT_NO
  ) +
  (
    SELECT COUNT(CASE WHEN RNR.REGU_DATE IS NULL THEN 1 END) AS NULL_COUNT
    FROM REP_NOTE_RESULT RNR
    RIGHT JOIN REPORT_NOTE RN
    ON RNR.REP_NOTE_NO = RN.REP_NOTE_NO
  ) AS TOTAL_REPORT_COUNT
FROM DUAL;

-- ó���ؾ��� ���ǰǼ�
SELECT COUNT(CASE WHEN A.CREATED_DATE IS NULL THEN 1 END)AS NULL_COUNT
FROM QUESTION Q
JOIN ANSWER A
ON Q.QUESTION_NO = A.QUESTION_NO;


-----------------------------------------------------------------------------------
-- ADMIN ���� ���� ������

-- ���� LIST ��ȸ ����

SELECT ADMIN_NOTICE_NO
        , SUBSTR(( SELECT ADMIN_NO
            FROM ADMIN
            WHERE PIN_NO = AN.PIN_NO),3) AS ADMIN_NO
        , TITLE
        , CONTENT
FROM ADMIN_NOTICE AN
;

-- ���� insert����
INSERT INTO ADMIN_NOTICE(ADMIN_NOTICE_NO, PIN_NO, TITLE, CONTENT)
VALUES(AD||ADMINNOSEQ.NEXTVAL, ?, ? , ? )
;

-- ���� DELETE ����
DELETE
FROM ADMIN_NOTICE
WHERE ADMIN_NOTICE = ? ;


-- pin_no �� �����ڹ�ȣ ���ڸ� ���ڸ� ��ȸ
SELECT TO_NUMBER(SUBSTR(ADMIN_NO, 3)) AS adminNo
FROM ADMIN
WHERE PIN_NO = 'UP16';


-- ���� ��ƼŬ Ȯ�� ����
SELECT ADMIN_NOTICE_NO AS adminNoticeNo
        , TITLE
        , CONTENT
FROM ADMIN_NOTICE
WHERE ADMIN_NOTICE_NO = 'AN1'
;

DESC ADMIN_NOTICE;

--TEXTAREA Ȯ�� �� ������ ����

INSERT INTO ADMIN_NOTICE(ADMIN_NOTICE_NO, TITLE, CONTENT, PIN_NO)
VALUES('AN'||ADMINNOTICENOSEQ.NEXTVAL, '�̿��Ģ', '�� ����Ʈ�� �� ���� ������Ʈ�� ���� ����Ʈ��, ���� �� �����ںе��� ���ɰ� ������� ��ǰ� �ֽ��ϴ�. 
�ٸ�, �Ϻ� �ǿ��������� ���к��� �̿����� ����, �� ����Ʈ�� ��Ģ�� ��ȭ�ϰ� �Ǿ����ϴ�.
������ �����鲲 ������ ��ġ�� �����鼭 �ǿ��������� �̿��� �����ϰ��� �Ʒ��� ���� ��Ģ���� �ȳ��帮��, Ȯ�� ��Ź�帳�ϴ�.', 'UP16')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

commit;

-- FAQ  FAQ_NO �޾ƿͼ� ���� ������ ����
UPDATE FAQ
SET TITLE = ? , CONTENT = ?
WHERE FAQ_NO = ?
;

-- FAQ FAQ_NO �޾ƿͼ� ���� �� ����
DELETE
FROM FAQ
WHERE FAQ_NO = ? ;

-- FAQ ���� �ֱٿ� insert �� FAQ_NO �� ã�ƿ��� ���� -- insert �� �ش� ������ ����ֱ� ���ؼ�
SELECT TO_CHAR(MAX(FAQ_NO)) AS faqNo
FROM FAQ
;

-- FAQ Insert
INSERT INTO FAQ(FAQ_NO, TITLE, CONTENT)
VALUES (FAQNOSEQ.NEXTVAL, ?, ? )
;


------------------------------------------------------------------------------------
-- ADMIN �Ű� ������ ������

-- ��� + ������ + �������� + ���� UNION �õ�

SELECT *
FROM REPCOMMNULL
;
SELECT *
FROM REPAPPLYNULL
;
SELECT *
FROM REPRECRUITNULL
; 
SELECT *
FROM REPNOTENULL
;
--==>>
/*
expression must have same datatype as corresponding expression
--==>> COMM �� ��ȣ�� NUMBER �̶� �ȵ�.
--==>> ������ ���� �ؾ���
*/
--==============================================================================

-- �Ű���� ��� ����Ʈ ������ ���� ó�� �ȵ� �� ã��
-- ��� 
    CREATE OR REPLACE VIEW REPCOMMNULL
    AS
    SELECT ( SELECT NICKNAME
            FROM USERS 
            WHERE PIN_NO = C.PIN_NO 
            )AS reportedNickName
        , C.PIN_NO AS reportedUserPinNo
        , NVL('������',( SELECT NICKNAME
            FROM USERS
            WHERE PIN_NO = RC.PIN_NO 
            ))AS reportNickName
        , RC.PIN_NO AS reportUserPinNo
        , RCR.REGU_DATE AS reguDate
        , RC.REP_COMM_NO AS repNo
        , RC.COMM_NO AS postNo
        , RC.REP_DATE AS reportDate
        , (  SELECT REASON
            FROM REPORT_REASON
            WHERE REP_REASON_NO = RC.REP_REASON_NO 
        )   AS repReason
    FROM REP_COMM_RESULT RCR
    RIGHT JOIN REPORT_COMM RC 
    ON RCR.REP_COMM_NO = RC.REP_COMM_NO
    JOIN COMMENTS C
    ON C.COMM_NO = RC.COMM_NO
    WHERE RCR.REGU_DATE IS NULL;
--==>> View REPCOMMNULL��(��) �����Ǿ����ϴ�.

-- ������
    CREATE OR REPLACE VIEW REPAPPLYNULL
    AS
    SELECT ( SELECT NICKNAME
            FROM USERS 
            WHERE PIN_NO = A.PIN_NO 
            )AS reportedNickName 
        , A.PIN_NO AS reportedUserPinNo
        , ( SELECT NICKNAME
            FROM USERS
            WHERE PIN_NO = RA.PIN_NO 
            )AS reportNickName
        , RA.PIN_NO AS reportUserPinNo
        , RAR.REGU_DATE AS reguDate
        , RA.REP_APPLY_NO AS repNo
        , RA.APPLY_NO AS postNo
        , RA.CREATED_DATE AS reportDate
        , (  SELECT REASON
            FROM REPORT_REASON
            WHERE REP_REASON_NO = RA.REP_REASON_NO 
        )   AS repReason
    FROM REP_APPLY_RESULT RAR
    RIGHT JOIN REPORT_APPLY RA 
    ON RAR.REP_APPLY_NO = RA.REP_APPLY_NO
    JOIN APPLY A
    ON A.APPLY_NO = RA.APPLY_NO
    WHERE RAR.REGU_DATE IS NULL;
--==>> View REPAPPLYNULL��(��) �����Ǿ����ϴ�

SELECT *
FROM REPORT_APPLY
;
SELECT *
FROM REP_APPLY_RESULT
;


SELECT REPORTEDUSERPINNO, REPORTUSERPINNO, REGUDATE, REPNO, POSTNO, REPORTDATE, REPREASON
FROM REPAPPLYNULL
;

        
-- ����
    CREATE OR REPLACE VIEW REPRECRUITNULL
    AS
    SELECT ( SELECT NICKNAME
            FROM USERS 
            WHERE PIN_NO = R.PIN_NO 
            )AS reportedNickName 
        , R.PIN_NO AS reportedUserPinNo
        , COALESCE(
            (SELECT NICKNAME
             FROM USERS
             WHERE PIN_NO = RR.PIN_NO )
           ,(SELECT 'Ż��ȸ��'||TO_CHAR(WD_USER_NO)
             FROM WITHDRAW_USER
             WHERE PIN_NO = RR.PIN_NO)
           ,('������'||SUBSTR(( SELECT ADMIN_NO
            FROM ADMIN
            WHERE PIN_NO = RR.PIN_NO 
            ),3))
        ) AS reportNickName
        , RR.PIN_NO AS reportUserPinNo
        , RRR.REGU_DATE AS reguDate
        , RR.REP_RECRUIT_NO AS repNo
        , RR.RECRUIT_NO AS postNo
        , RR.CREATED_DATE AS reportDate
        ,(  SELECT REASON
            FROM REPORT_REASON
            WHERE REP_REASON_NO = RR.REP_REASON_NO 
        )   AS repReason
    FROM REP_RECRUIT_RESULT RRR
    RIGHT JOIN REP_RECRUIT RR
    ON RRR.REP_RECRUIT_NO = RR.REP_RECRUIT_NO
    JOIN RECRUIT R
    ON RR.RECRUIT_NO = R.RECRUIT_NO
    WHERE RRR.REGU_DATE IS NULL;
--==>> View REPRECRUITNULL��(��) �����Ǿ����ϴ�.
DESC REPRECRUITNULL;
--==>> 
/*
REPORTEDUSERPINNO, REPORTUSERPINNO, REGUDATE, REPNO, POSTNO, REPORTDATE, REPREASONNO
*/
SELECT REPORTEDUSERPINNO, REPORTUSERPINNO, REGUDATE, REPNO, POSTNO, REPORTDATE, REPREASON
FROM REPRECRUITNULL
;

select *
from recruit;

-- ����
    CREATE OR REPLACE VIEW REPNOTENULL
    AS
    SELECT (SELECT NICKNAME
            FROM USERS 
            WHERE PIN_NO = N.SENDER
            )AS reportedNickName 
        , N.SENDER AS reportedUserPinNo
        , ( SELECT NICKNAME
            FROM USERS
            WHERE PIN_NO = RN.PIN_NO
          ) AS reportNickName
        , RN.PIN_NO AS reportUserPinNo
        , RNR.REGU_DATE AS reguDate
        , RN.REP_NOTE_NO AS repNo
        , RN.NOTE_NO AS postNo
        , RN.CREATED_DATE AS reportDate
        , (  SELECT REASON
            FROM REPORT_REASON
            WHERE REP_REASON_NO = RN.REP_REASON_NO 
        )   AS repReason
    FROM REP_NOTE_RESULT RNR
    RIGHT JOIN REPORT_NOTE RN 
    ON RNR.REP_NOTE_NO = RN.REP_NOTE_NO
    JOIN NOTE N
    ON N.NOTE_NO = RN.NOTE_NO
    WHERE RNR.REGU_DATE IS NULL;
--==>> View REPNOTENULL��(��) �����Ǿ����ϴ�.
        SELECT REPORTEDUSERPINNO, REPORTEDNICKNAME
            ,REPORTUSERPINNO, REPORTNICKNAME
            ,REGUDATE, REPNO, POSTNO, REPORTDATE,
            REPREASON
		FROM REPNOTENULL
        ;

    select *
    from report_note;
    
CREATE SEQUENCE REPNOTENOSEQ
NOCACHE;
--==>> Sequence REPNOTENOSEQ��(��) �����Ǿ����ϴ�.

SELECT *
FROM NOTE;

		SELECT SUM(COUNTALL) AS COUNTALL
		     , SUM(COUNTPOS) AS COUNTPOS
		     , RECRUITNO
		FROM RECRUITPOSITIONVIEW
		WHERE RECRUITNO LIKE '%' || 'RC1'
		GROUP BY RECRUITNO;

SELECT *
  FROM all_sequences
 WHERE sequence_owner = 'PROJECTORS';
    
-- �Ű�ó�� â���� �ʿ��� ó�� ����, ó���Ⱓ
SELECT REGU_NO AS reguNo
    , CONTENT
FROM REGULATION
;

SELECT REGU_PERIOD_NO AS reguPeriodNo
    , PERIOD
FROM REGULATION_PERIOD
;

SELECT *
FROM REP_RECRUIT_RESULT
;

-- ���� �Ű�ó�� insert
INSERT INTO REP_RECRUIT_RESULT(RECRUIT_RESULT_NO, REP_RECRUIT_NO, REP_RESULT_NO, REGU_NO, REGU_PERIOD_NO, PIN_NO)
VALUES('RESR'||RECRUITRESULTNOSEQ.NEXTVAL, ?, ?, ? , ?, ?)
;

-- ������ �Ű� ó�� insert
		INSERT INTO REP_APPLY_RESULT
		( APPLY_RESULT_NO
		, REP_APPLY_NO
		, REP_RESULT_NO
		, REGU_NO
		, REGU_PERIOD_NO
		, PIN_NO
VALUES( 'REPA'||TO_CHAR(REPAPPLYNOSEQ.NEXTVAL), ?, ?, ? , ?, ?)
;


desc REGULATION_PERIOD;

select *
from regulation_period;

--==============================================================================
    
-- �Ű�ó�� �Ϸ�� ���----------------------------------------------------------
-- ��� 
    CREATE OR REPLACE VIEW REPCOMMCOMPLETE
    AS
    SELECT RCR.COMM_RESULT_NO AS ResultNo
        , RCR.REP_RESULT_NO AS repResultNo
        , RCR.REGU_NO AS reguNo
        , RCR.REGU_PERIOD_NO AS reguPeriod
        , C.PIN_NO AS reportedUserPinNo
        , RC.PIN_NO AS reportUserPinNo
        , RCR.REGU_DATE AS reguDate
        , RC.REP_COMM_NO AS repNo
        , RC.COMM_NO AS postNo
        , RCR.PIN_NO AS adminPinNo
        , RC.REP_DATE AS reportDate
        , RC.REP_REASON_NO AS repReasonNo
    FROM REP_COMM_RESULT RCR
    RIGHT JOIN REPORT_COMM RC 
    ON RCR.REP_COMM_NO = RC.REP_COMM_NO
    JOIN COMMENTS C
    ON C.COMM_NO = RC.COMM_NO
    WHERE RCR.REGU_DATE IS NOT NULL;
--==>> View REPCOMMCOMPLETE��(��) �����Ǿ����ϴ�.

-- ������
    CREATE OR REPLACE VIEW REPAPPLYCOMPLETE
    AS
    SELECT RAR.APPLY_RESULT_NO AS ResultNo
        , RAR.REP_RESULT_NO AS repResultNo
        , RAR.REGU_NO AS reguNo
        , RAR.REGU_PERIOD_NO AS reguPeriod
        , A.PIN_NO AS reportedUserPinNo
        , RA.PIN_NO AS reportUserPinNo
        , RAR.REGU_DATE AS reguDate
        , RA.REP_APPLY_NO AS repNo
        , RA.APPLY_NO AS postNo
        , RAR.PIN_NO AS adminPinNo
        , RA.CREATED_DATE AS reportDate
        , RA.REP_REASON_NO AS repReasonNo
    FROM REP_APPLY_RESULT RAR
    RIGHT JOIN REPORT_APPLY RA 
    ON RAR.REP_APPLY_NO = RA.REP_APPLY_NO
    JOIN APPLY A
    ON A.APPLY_NO = RA.APPLY_NO
    WHERE RAR.REGU_DATE IS NOT NULL;
--==>> View REPAPPLYNULL��(��) �����Ǿ����ϴ�
---------------------------------------------
    SELECT ResultNo, repResultNo
		    ,(SELECT CONTENT
		      FROM REGULATION
		      WHERE RAC.reguNo = REGU_NO
		     ) as content
		    ,(SELECT PERIOD
		      FROM REGULATION_PERIOD
		      WHERE RAC.reguPeriod = REGU_PERIOD_NO
		     ) as period
		    , ( SELECT NICKNAME
		        FROM USERS
		        WHERE PIN_NO = RAC.reportedUserPinNo
		      ) as reportedNickName 
		    , reportUserPinNo
		    , reguDate, repNo, postNo
		    , (SELECT admin_no
		       FROM ADMIN
		       WHERE RAC.adminPinNo = pin_no
		      ) as adminNo
		    , adminPinNo
		    , reportDate, repReasonNo
		FROM REPAPPLYCOMPLETE RAC
		ORDER BY REGUDATE DESC
;

-- ����
    CREATE OR REPLACE VIEW REPRECRUITCOMPLETE
    AS
    SELECT RRR.RECRUIT_RESULT_NO AS ResultNo
        , RRR.REP_RESULT_NO AS repResultNo
        , RRR.REGU_NO AS reguNo
        , RRR.REGU_PERIOD_NO AS reguPeriod
        , R.PIN_NO AS reportedUserPinNo
        , RR.PIN_NO AS reportUserPinNo
        , RRR.REGU_DATE AS reguDate
        , RR.REP_RECRUIT_NO AS repNo
        , RR.RECRUIT_NO AS postNo
        , RRR.PIN_NO AS adminPinNo
        , RR.CREATED_DATE AS reportDate
        , RR.REP_REASON_NO AS repReasonNo
    FROM REP_RECRUIT_RESULT RRR
    RIGHT JOIN REP_RECRUIT RR
    ON RRR.REP_RECRUIT_NO = RR.REP_RECRUIT_NO
    JOIN RECRUIT R
    ON RR.RECRUIT_NO = R.RECRUIT_NO
    WHERE RRR.REGU_DATE IS NOT NULL;
--==>> View REPRECRUITNULL��(��) �����Ǿ����ϴ�.
--------------------------------------------------
    SELECT ResultNo, repResultNo
		    ,(SELECT CONTENT
		      FROM REGULATION
		      WHERE RRC.reguNo = REGU_NO
		     ) as content
		    ,(SELECT PERIOD
		      FROM REGULATION_PERIOD
		      WHERE RRC.reguPeriod = REGU_PERIOD_NO
		     ) as period
		    , ( SELECT NICKNAME
		        FROM USERS
		        WHERE PIN_NO = RRC.reportedUserPinNo
		      ) as reportedNickName 
		    , reportUserPinNo
		    , reguDate, repNo, postNo
		    , (SELECT admin_no
		       FROM ADMIN
		       WHERE RRC.adminPinNo = pin_no
		      ) as adminNo
		    , adminPinNo
		    , reportDate, repReasonNo
    FROM REPRECRUITCOMPLETE RRC
    ORDER BY REGUDATE DESC
    ;

        
        SELECT PIN_NO as adminPinNo
		FROM ADMIN
		WHERE ADMIN_NO = 'AD1'
        ;
        
UPDATE REPRECRUITCOMPLETE
SET ADMINPINNO='UP17'
WHERE POSTNO='RC7'
;
COMMIT;
-- ��������(����O, ������X) �ڱ� ���� �ڱ� �Ű� ó������ �������� ������ ������ update

SELECT *
FROM USERS;
--==>> US16	UP18	spb@naver.com	java002	��������	images/defaulfPhoto.jpg

--------------------------------------------------

-- ����
    CREATE OR REPLACE VIEW REPNOTECOMPLETE
    AS
    SELECT RNR.NOTE_RESULT_NO AS ResultNo
        , RNR.REP_RESULT_NO AS repResultNo
        , RNR.REGU_NO AS reguNo
        , RNR.REGU_PERIOD_NO AS reguPeriod
        , N.SENDER AS reportedUserPinNo
        , RN.PIN_NO AS reportUserPinNo
        , RNR.REGU_DATE AS reguDate
        , RN.REP_NOTE_NO AS repNo
        , RN.NOTE_NO AS postNo
        , RNR.PIN_NO AS adminPinNo
        , RN.CREATED_DATE AS reportDate
        , RN.REP_REASON_NO AS repReasonNo
    FROM REP_NOTE_RESULT RNR
    RIGHT JOIN REPORT_NOTE RN 
    ON RNR.REP_NOTE_NO = RN.REP_NOTE_NO
    JOIN NOTE N
    ON N.NOTE_NO = RN.NOTE_NO
    WHERE RNR.REGU_DATE IS NOT NULL;
--==>> View REPNOTECOMPLETE��(��) �����Ǿ����ϴ�.
---------------------------------------------
    SELECT ResultNo, repResultNo
		    ,(SELECT CONTENT
		      FROM REGULATION
		      WHERE RNC.reguNo = REGU_NO
		     ) as content
		    ,(SELECT PERIOD
		      FROM REGULATION_PERIOD
		      WHERE RNC.reguPeriod = REGU_PERIOD_NO
		     ) as period
		    , ( SELECT NICKNAME
		        FROM USERS
		        WHERE PIN_NO = RNC.reportedUserPinNo
		      ) as reportedNickName 
		    , reportUserPinNo
		    , reguDate, repNo, postNo
		    , (SELECT admin_no
		       FROM ADMIN
		       WHERE RNC.adminPinNo = pin_no
		      ) as adminNo
		    , adminPinNo
		    , reportDate, repReasonNo
    FROM REPNOTECOMPLETE RNC
    ORDER BY REGUDATE DESC
    ;


select *
from users;

--==============================================================================
select *
from REPORT_RESULT
;
select *
from REP_RECRUIT;

update rep_recruit
set pin_no ='UP5'
where RECRUIT_NO='RC8';

commit;
--==============================================================================

-- ȸ�� ���� ��ȸ
SELECT UP.PIN_NO AS pinNo
    , USER_NO AS userNo
    , ID AS userId
    , NICKNAME AS nickName
    , UP.JOIN_DATE AS joinDate
FROM USERS U
RIGHT JOIN USER_PIN UP
ON U.PIN_NO = UP.PIN_NO
;

-- ȸ�� ���� �˻� (���� ���̵�)

SELECT UP.PIN_NO AS pinNo
    , USER_NO AS userNo
    , ID AS userId
    , NICKNAME AS nickName
    , UP.JOIN_DATE AS joinDate
FROM USERS U
RIGHT JOIN USER_PIN UP
ON U.PIN_NO = UP.PIN_NO
WHERE U.ID LIKE 'spb@naver.com' || '%'
;

================================================================================

-- �α��� �α� ����Ʈ
SELECT LOGIN_REC
     , PIN_NO
     , LOGIN_DATE
FROM LOGIN_REC
ORDER BY LOGIN_DATE DESC;

SELECT LOGOUT_REC as logOutRecNo
     , PIN_NO as pinNo
     , TO_CHAR(LOGOUT_DATE, 'YYYY-MM-DD HH24:MI:SS') as logOutDate
FROM LOGOUT_REC
ORDER BY logOutRecNo DESC
;

select *
from logout_rec;

-- �÷� �� ����
ALTER TABLE LOGOUT_REC
RENAME COLUMN LOGIN_DATE TO LOGOUT_DATE;

CREATE SEQUENCE LOGOUTREC;

		SELECT REP_RECRUIT_NO
		FROM REP_RECRUIT
		WHERE RECRUIT_NO = 'RC13';
        
delete
from REPRECRUITCOMPLETE
where repno = 'REPR5'
and resultno != 'RESR37'
;

commit;