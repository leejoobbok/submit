SELECT USER
FROM DUAL;
--==>> PROJECTORS

-- �����շ���ȣ ���Ŀ��� ��������� ��
-- [37] SPACE_NOTICE (�� �����Խ���)
-- �����Խ��ǹ�ȣ, ������Ʈ��ȣ, ����, ����, �ۼ���
-- PRJ_NO (FK,NN)
-- CREATED_DATE (NN) DEFAULT SYSDATE
CREATE TABLE SPACE_NOTICE
( SPACE_NOTICE_NO
, PRJ_NO
, TITLE             �����շ���ȣ
, CONTENT           VARCHAR2(��)
, CREATED_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT SPACE_NOTICE_NO_PK PRIMARY KEY(SPACE_NOTICE_NO)
);

-- �����շ���ȣ ���Ŀ��� ��������� ��
-- [38] WORKSPACE (�۾�����)
-- �۾�������ȣ, �����շ���ȣ, ����, ����, �ۼ���
-- FINAL_NO(FK,NN)
-- CREATED_DATE (NN) DEFAULT SYSDATE
CREATE TABLE WORKSPACE
( WORKSPACE_NO
, FINAL_NO
, TITLE             VARCHAR2(��)
, CONTENT           VARCHAR2(��)
, CREATED_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT WORKSPACE_NO_PK PRIMARY KEY(WORKSPACE_NO)
);

-- �����շ���ȣ, �۾����� ���� ���� ��������� ��
-- [39] WORKSPACE_COMM (�۾����� ���)
-- �۾�������۹�ȣ, �۾�������ȣ, �����շ���ȣ, ����, �ۼ���
-- WORKSPACE_NO (FK, NN)
-- FINAL_NO (FK, NN)
-- CREATED_DATE (NN) DEFAULT SYSDATE
CREATE TABLE WORKSPACE_COMM
( WORKSPACE_COMM_NO
, WORKSPACE_NO
, FINAL_NO
, CONTENT           VARCHAR2(��)
, CREATED_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT WORKSPACE_COMM_NO_PK PRIMARY KEY(WORKSPACE_COMM_NO)
);

-- �����շ����̺� ���Ŀ��� ��������� ��
-- [40] MEETING (ȸ�Ƿ�)
-- ȸ�Ƿ� ��ȣ, �����շ���ȣ, ����, ����, ÷�����ϰ��, �Խ����ۼ���, ȸ������
-- FINAL_NO (FK,NN)
-- FILE..????
-- CREATED_DATE (NN)    DEFAULT SYSDATE
-- MEETING_DATE (NN)    DEFAULT SYSDATE ��
CREATE TABLE MEETING
( MEETING_NO
, FINAL_NO
, TITLE             VARCHAR2(��)
, CONTENT           VARCHAR2(��)
, FILE
, CREATED_DATE      DATE    DEFAULT SYSDATE
, MEETING_DATE      DATE
, CONSTRAINT MEETING_NO_PK PRIMARY KEY(MEETING_NO)
);

-- �����շ����̺� ���Ŀ��� �����ϸ� ��
-- [41] FEED (�㺭��)
-- �ǵ��ȣ, �����շ���ȣ, ����, �ۼ���
-- FINAL_NO (FK,NN)
-- CREATED_DATE     DEFAULT SYSDATE
CREATE TABLE FEED
( FEED_NO
, FINAL_NO
, CONTENT           VARCHAR2(��)
, CREATED_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT FEED_NO_PK PRIMARY KEY(FEED_NO)
);


-- �� ���̺���� ���� �������� ��������� ��

-- [42] PROJECT_RATE (������Ʈ �Ϸ���)
-- ������Ʈ �Ϸ��򰡹�ȣ, ����, ������, �򰡼�������ȣ, ����
-- ����, ������ (FINAL_NO) (FK, NN)
-- RATE_NO (FK, NN)
-- RATE_DATE    DEFAULT SYSDATE
CREATE TABLE PROJECT_RATE
( DONE_RATE_NO
, GIVER
, RECEIVER
, RATE_NO
, RATE_DATE         DATE    DEFAULT SYSDATE
, CONSTRAINT PROJECT_RATE_PK PRIMARY KEY(PROJECT_RATE)
);


-- [43] PROJECT_STOP_RATE ������Ʈ �ߴ���
-- ������Ʈ �ߴ��򰡹�ȣ, ������Ʈ �ߴܹ�ȣ, ����, ������, �򰡼�������ȣ, ����
-- ����, ������ (FINAL_NO) (FK, NN)
-- PRJ_STOP_NO (FK, NN)
-- RATE_NO (FK, NN)
-- RATE_DATE    DEFAULT SYSDATE
CREATE TABLE PROJECT_STOP_RATE
( STOP_RATE_NO
, PRJ_STOP_NO
, RECEIVER
, GIVER
, RATE_NO
, RATE_DATE     DATE    DEFAULT SYSDATE
, CONSTRAINT STOP_RATE_NO_PK PRIMARY KEY(STOP_RATE_NO)
);


-- [44] MEM_OUT_RATE ������Ż��
-- ������Ż �򰡹�ȣ, ������Ʈ ��Ż��ȣ, ����, �򰡼�������ȣ, ����
-- MEM_OUT_NO (FK,NN)
-- GIVER (FK, NN)  (FINAL_NO)
-- RATE_DATE    DEFAULT SYSDATE
CREATE TABLE MEM_OUT_RATE
( OUT_RATE_NO
, MEM_OUT_NO
, GIVER
, RATE_NO
, RATE_DATE     DATE    DEFAULT SYSDATE
, CONSTRAINT OUT_RATE_NO_PK PRIMARY KEY(OUT_RATE_NO)
);


-- �򰡵� ���� ���� �����������
-- [45] RATE_SELECT �� ������
-- �򰡼�������ȣ, �򰡳���
CREATE TABLE RATE_SELECT
( RATE_NO
, CONTENT       VARCHAR2(��)
, CONSTRAINT RATE_NO_PK PRIMARY KEY(RATE_NO)
);


-- �ĺ���ȣ �ڿ��� ��������� ��
-- [46] NOTE ����
-- ������ȣ, �������, �������, ������¥, ������¥, ����, ����, �������������, �޴»��������
-- �������, ������� (FK, NN) (PIN_NO)
-- ������¥ DEFAULT SYSDATE
CREATE TABLE NOTE
( NOTE_NO
, SENDER
, READER
, SEND_DATE     DATE    DEFAULT SYSDATE
, READ_DATE     DATE
, TITLE         VARCHAR2(��)
, CONTENT       VARCHAR2(��)
, SEND_DEL      DATE
, READ_DEL      DATE
, CONSTRAINT NOTE_NO_PK PRIMARY KEY(NOTE_NO)
);


-- ������Ʈ ������ ���� ����������ϴ� ���̺�
-- [47] DO_TYPE ��鿩��
-- �����Ĺ�ȣ, �����ĸ�
-- DO_TYPE_NAME (NN)
CREATE TABLE DO_TYPE
( DO_TYPE_NO
, DO_TYPE_NAME  VARCHAR2(��)     NOT NULL
, CONSTRAINT DO_TYPE_NO_PK PRIMARY KEY(DO_TYPE_NO)
);


-- ������, ������ȣ �ڿ� ����������ϴ� ���̺�
-- [48] REPORT_APPLY ������ �Ű�
-- ������ �Ű��ȣ, ����������������ȣ, ȸ���ĺ���ȣ, �ۼ���, ������ȣ
-- APPLY_NO (FK, NN)
-- PIN_NO (FK, NN)
-- CREATED_DATE     DEFAULT SYSDATE
-- REP_REASON_NO    (FK,NN)
CREATE TABLE REPORT_APPLY
( REP_APPLY_NO
, APPLY_NO
, PIN_NO
, CREATED_DATE      DATE    DEFAULT SYSDATE
, REP_REASON_NO
, CONSTRAINT REP_APPLY_NO_PK PRIMARY KEY(REP_APPLY_NO)
);

-- ������ �Ű�, ó����� ���� ����������ϴ� ���̺�
-- [49] APPLY_PRESULT ������ �Ű�ó�� (�Խù�)
-- ������ �Ű�ó����ȣ, ������ �Ű��ȣ, ó����� ��ȣ
-- REP_APPLY_NO (FK, NN)
-- REP_RESULT_NO (FK, NN)
CREATE TABLE APPLY_PRESULT
( PRESULT_NO
, REP_APPLY_NO
, REP_RESULT_NO
, CONSTRAINT PRESULT_NO_PK PRIMARY KEY(PRESULT_NO)
);


-- ����, ����Ⱓ, ������ �Ű�ó�� ����
-- [50] APPLY_URESULT ������ �Ű�ó�� (����)
-- ������ �ǽŰ���ó����ȣ, ������ �Ű�ó����ȣ, �����ȣ , ����Ⱓ��ȣ, ��������
-- PRESULT_NO (FK, NN)
-- REGU_NO (FK, NN)
-- REGU_PERIOD_NO (FK, NN)
-- REGU_DATE        DEFAULT SYSDATE
CREATE TABLE APPLT_URESULT
( URESULT_NO
, PRESULT_NO
, REGU_NO
, REGU_PERIOD_NO
, REGU_DATE         DATE    DEFAULT SYSDATE
, CONSTRAINT URESULT_NO_PK PRIMARY KEY(URESULT_NO)
);


-- ������, ������, �����Ű�ó�� ����
-- [51] DEP_REP_APPLY ������ ����
-- ������ ������ȣ, ������ �Ű�ó����ȣ, �����ڹ�ȣ, ������
-- PRESULT_NO (FK, NN)
-- ADMIN_NO (FK, NN)
-- DEL_DATE     DEFAULT SYSDATE
CREATE TABLE DEL_REP_APPLY
( DEL_APPY_NO
, PRESULT_NO
, ADMIN_NO
, DEL_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT ADEL_APPY_NO_PK PRIMARY KEY(DEL_APPY_NO)
);

-- ������ ����
-- [52] DEL_APPLY ���� ��Ȱ��ȭ ������
-- APPLY_NO (FK, NN)
-- DEL_DATE     DEFAULT SYSDATE
CREATE TABLE DEL_APPLY
( DEL_APPLY_NO
, APPLY_NO
, DEL_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT DEL_APPLY_NO_PK PRIMARY KEY(DEL_APPLY_NO)
);


-- ȸ���ĺ���ȣ, ����, ������ȣ ����
-- [53] REP_RECRUIT ��������Ű�
-- ����Ű��ȣ, �����ȣ, ȸ���ĺ���ȣ, �ۼ���, ������ȣ
-- RECRUIT_NO   (FK, NN)
-- PIN_NO (FK, NN)
-- CREATED_DATE     DEFAULT SYSDATE
-- REP_REASON_NO    (FK, NN)
CREATE TABLE REP_RECRUIT
( REP_RECRUIT_NO
, RECRUIT_NO
, PIN_NO
, CREATED_DATE
, REP_REASON_NO
, CONSTRAINT REP_RECRUIT_NO_PK PRIMARY KEY(REP_RECRUIT_NO)
);


-- ����Ű�, ó�������ȣ ����
-- [54] RECRUIT_PRESULT  ����Ű�ó��(�Խù�)
-- ����Ű�ó����ȣ, ����Ű��ȣ, ó�������ȣ
-- REP_RECRUIT_NO (FK, NN)
-- REP_RESULT_NO (FK, NN)
CREATE TABLE RECRUIT_PRESULT
( PRESULT_NO
, REP_RECRUIT_NO
, REP_RESULT_NO
, CONSTRAINT RECRUIT_PRESULT_NO_PK PRIMARY KEY(PRESULT_NO)
);

-- ����, ����Ⱓ, ����Ű�ó�� ����
-- [55] RECRUIT_URESULT ����Ű�ó��(�ǽŰ���)
-- �����ǽŰ���ó����ȣ, ����Ű�ó����ȣ, ���系���ȣ, ����Ⱓ��ȣ, ������
-- PRESULT_NO (FK, NN)
-- REGU_NO (FK, NN)
-- REGU_PERIOD_NO (FK, NN)
-- REDU_DATE        DEDAULT SYSDATE
CREATE TABLE RECRUIT_URESULT
( URESULT_NO
, PRESULT_NO
, REGU_NO
, REGU_PERIOD_NO
, REGU_DATE         DATE    DEFAULT SYSDATE
, CONSTRAINT RECRUIT_URESULT_NO_PK PRIMARY KEY(URESULT_NO)
);


-- ������, ����, ����Ű�ó�� ����
-- [56] DEL_REP_RECRUIT ����� ����
-- ����� ������ȣ, ����Ű�ó����ȣ, �����ڹ�ȣ, ������
-- PRESULT_NO (FK,NN)
-- ADMIN_NO (FK, NN)
-- DEL_DATE     DEFAULT SYSDATE
CREATE TABLE DEL_REP_RECRUIT
( DEL_RECRUIT_NO
, PRESULT_NO
, ADMIN_NO
, DEL_DATE          DATE    DEFAULT SYSDATE
, CONSTRAINT ADEL_RECRUIT_NO_PK PRIMARY KEY(DEL_RECRUIT_NO)
);


-- ���� ����
-- [57] DEL_RECRUIT ������Ȱ��ȭ����
-- �����Ȱ��ȭ��ȣ, �����ȣ, ������
-- RECRUIT_NO   (FK, NN)
-- DEL_DATE     DEFAULT SYSDATE
CREATE TABLE DEL_RECRUIT
( DEL_RECRUIT_NO
, RECRUIT_NO
, DEL_DATE          DATE    DEFAULT SYSDATE
, CONSTRAINT DEL_RECRUIT_NO_PK PRIMARY KEY(DEL_RECRUIT_NO)
);


-- ȸ���ĺ���ȣ, ����, ������ȣ ����
-- [58] REPORT_NOTE �����Ű�
-- �����Ű��ȣ, ������ȣ, ȸ���ĺ���ȣ, ������ȣ, �ۼ���
-- NOTE_NO  (FK, NN)
-- PIN_NO (FK, NN)
-- CREATED_DATE         DEFAULT SYSDATE
-- REP_REASON_NO    (FK, NN)
CREATE TABLE REPORT_NOTE
( REP_NOTE_NO
, NOTE_NO
, PIN_NO
, REP_REASON_NO
, CREATED_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT REP_NOTE_NO_PK PRIMARY KEY(REP_NOTE_NO)
);


-- �����Ű�, ó����� ����
-- [59] NOTE_PRESULT �����Ű�ó��(�Խù�)
-- �����Ű�ó����ȣ, �����Ű��ȣ, ó�������ȣ
-- REP_NOTE_NO (FK, NN)
-- REP_RESULT_NO (FK, NN)
CREATE TABLE NOTE_PRESULT
( PRESULT_NO
, REP_NOTE_NO
, REP_RESULT_NO
, CONSTRAINT NOTE_PRESULT_NO_PK PRIMARY KEY(PRESULT_NO)
);


-- ����, �����Ⱓ, �����Ű�ó�� ����
-- [60] NOTE_URESULT �����Ű�ó��(�ǽŰ���)
-- �����ǽŰ���ó����ȣ, ���� �Ű�ó����ȣ, ���系���ȣ, ����Ⱓ��ȣ, ������
-- PRESULT_NO   (FK, NN)
-- REGU_NO  (FK, NN)
-- RENU_PERIOD_NO (FK, NN)
-- REGU_DATE        DEFAULT SYSDATE
CREATE TABLE NOTE_URESULT
( URESULT_NO
, PRESULT_NO
, REGU_NO
, REGU_PERIOD_NO
, REGU_DATE         DATE    DEFAULT SYSDATE
, CONSTRAINT NOTE_URESULT_NO_PK PRIMARY KEY(URESULT_NO)
);


-- ������, ����, �����Ű�ó������
-- [61] DEL_REP_NOTE ��������
-- ����������ȣ, �����Ű�ó����ȣ, �����ڹ�ȣ, ������
-- PRESULT_NO (FK, NN)
-- ADMIN_NO (FK,NN)
-- DEL_DATE     DEFAULT SYSDATE
CREATE TABLE DEL_REP_NOTE
( DEL_NOTE_NO
, PRESULT_NO
, ADMIN_NO
, DEL_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT ADEL_NOTE_NO_PK PRIMARY KEY(DEL_NOTE_NO)
);


-- ���� ����
-- [62] DEL_NOTE ������Ȱ��ȭ����
-- ������Ȱ��ȭ��ȣ, ������ȣ, ������
-- NOTE_NO (FK, NN)
-- DEL_DATE     DEFAULT SYSDATE
CREATE TABLE DEL_NOTE
( DEL_NOTE_NO
, NOTE_NO
, DEL_DATE      DATE    DEFAULT SYSDATE
, CONSTRAINT DEL_NOTE_NO_PK PRIMARY KEY(DEL_NOTE_NO)
);


-- �����շ���ȣ, ������Ʈ ����
-- [63] REPORT_PRJ ������Ʈ �Ű�
-- ������Ʈ�Ű��ȣ, ������Ʈ��ȣ, �����շ���ȣ, ������Ʈ �Ű������ȣ, �ۼ���
-- PRJ_NO (FK, NN)
-- FINAL_NO (FK, NN)
-- REP_REASON_NO (FK, NN)
-- CREATED_DATE     DEFAULT SYSDATE
CREATE TABLE REPORT_PRJ
( REP_PRJ_NO
, PRJ_NO
, FINAL_NO
, REP_REASON_NO
, CREATED_DATE
, CONSTRAINT REP_PRJ_NO_PK PRIMARY KEY(REP_PRJ_NO)
);


-- ������, ó�����, ������Ʈ �Ű� ����
-- [64] PRJ_PRESULT ������Ʈ �Ű�ó��
-- ������Ʈ �Ű�ó����ȣ, ������Ʈ �Ű�������ȣ, ó�������ȣ, �����ڹ�ȣ, ó���Ͻ�
-- REP_PRJ_NO (FK, NN)
-- REP_RESULT_NO (FK, NN)
-- ADMIN_NO (FK, NN)
-- DATE     DEFAULT SYSDATE
CREATE TABLE PRJ_RESULT
( PRESULT_NO
, REP_PRJ_NO
, REP_RESULT_NO
, ADMIN_NO
, DATE          DATE    DEFAULT SYSDATE
, CONSTRAINT PRJ_PRESULT_NO_PK PRIMARY KEY(PRESULT_NO)
);


-- ������Ʈ�Ű�ó�� ����
-- [65] DEL_REP_PRJ ������ ������Ʈ
-- ������ ������Ʈ��ȣ, ������Ʈ �Ű�ó����ȣ 
-- PRESULT_NO (FK, NN)
CREATE TABLE DEL_REP_PRJ
( DEL_PRJ_NO
, PRESULT_NO
, CONSTRAINT ADEL_PRJ_NO_PK PRIMARY KEY(DEL_PRJ_NO)
);

-- ������Ʈ �Ű� ������ ������ ���� �������
-- [66] REP_PRJ_RREASON ������Ʈ �Ű����
-- ������Ʈ�Ű������Ȳ, ������Ʈ �Ű��������
-- REP_REASON (NN)
CREATE TABLE REP_PRJ_REASON
( REP_REASON_NO
, REP_REASON        NOT NULL
, CONSTRAINT REP_REASON_NO_PK PRIMARY KEY(REP_REASON_NO)
);









