-- �� ������ ���� INSERT ����

-- ȸ�� �ĺ���ȣ ����
-- ��
INSERT INTO USER_PIN(PIN_NO, JOIN_DATE) VALUES(UP||TO_CHAR(USERPINSEQ.NEXTVAL),SYSDATE);

-- ������ ������ ����
CREATE SEQUENCE ADMINNOSEQ
NOCACHE;

-- ������ INSERT ���� �� �� ���� �Ŀ� ��ȣ INSERT ���� �����ϱ�
-- ��
INSERT INTO ADMIN(ADMIN_NO, ADMIN_ID, ADMIN_PW, REG_DATE, PIN_NO) 
VALUES (AD||TO_CHAR(ADMINNOSEQ.NEXTVAL), 'admin001@gmail.com'
, CRYPTPACK.ENCRYPT('admin001','java002$'), SYSDATE, '������ �ɳѹ� �ֱ�');

--��
INSERT INTO ADMIN(ADMIN_NO, ADMIN_ID, ADMIN_PW, REG_DATE, PIN_NO) 
VALUES (AD||TO_CHAR(ADMINNOSEQ.NEXTVAL), 'admin002@gmail.com'
, CRYPTPACK.ENCRYPT('admin002','java002$'), SYSDATE, '������ �ɳѹ� �ֱ�');


SELECT *
FROM POSITION;

-- �� ȸ�� ���� INSERT ����

-- ȸ�� INSERT ���� �� �� ���� �Ŀ� ��ȣ INSERT ���� �����ϱ�
-- ��
-- ���� ����
INSERT INTO USERS(USER_NO, PIN_NO, ID, PW, NICKAME, PHOTOURL)
VALUES (US||TO_CHAR(USERNOSEQ.NEXTVAL), '�ɳѹ����ڸ�' , 'hwangi@gmail.com', 'java002$', 'ȯ��', 'images/defaulfPhoto.jpg ');
-- ������
INSERT INTO PROFILE(PROFILE_NO, PIN_NO, POS_NO, SUB_REGION_NO, PROFILE_DATE)
VALUES (PF||TO_CHAR(PROFILESEQ.NEXTVAL), '�ɳѹ����ڸ�', 2, 901, SYSDATE);
-- ���� ����� + ȯ��
INSERT INTO USER_TOOL(UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES (UT||TO_CHAR(UTOOLNOSEQ.NEXTVAL), '�����ʳѹ����ڸ�', 1);
INSERT INTO USER_TOOL(UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES (UT||TO_CHAR(UTOOLNOSEQ.NEXTVAL), '�����ʳѹ����ڸ�', 11);
INSERT INTO USER_TOOL(UTOOL_NO, PROFILE_NO, TOOL_NO)
VALUES (UT||TO_CHAR(UTOOLNOSEQ.NEXTVAL), '�����ʳѹ����ڸ�', 21);
-- �������� �ۼ�
INSERT INTO RECRUIT(RECRUIT_NO, PIN_NO, DO_TYPE_NO, TITLE, CONTENT, CREATED_DATE, PRJ_START, PRJ_END)
VALUES (RC||TO_CHAR(RECRUITNOSEQ.NEXTVAL), '�ɳѹ����ڸ�', 0, '�����콺Ʈ ��������', '���� �����콺Ʈ�� �̷������� �Ϸ��� �����ϰ� �ֽ��ϴ�'
, SYSDATE, TO_DATE('2023-08-25'), TO_DATE('2023-12-25'));
-- �������� ���� ������ �ۼ�
INSERT INTO RECRUIT_POS(RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (RP||TO_CHAR(RECRUITPOSNOSEQ.NEXTVAL), '����������ڸ�', 1);
INSERT INTO RECRUIT_POS(RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (RP||TO_CHAR(RECRUITPOSNOSEQ.NEXTVAL), '����������ڸ�', 1);
INSERT INTO RECRUIT_POS(RECRUIT_POS_NO, RECRUIT_NO, POS_NO)
VALUES (RP||TO_CHAR(RECRUITPOSNOSEQ.NEXTVAL), '����������ڸ�', 2);
-- �������� ���� ��� �ۼ�
--???? �����ֳ�
-- ������ �ڿ������� ������ ���� ��
INSERT INTO APPLY(APPLY_NO, RECRUIT_POS_NO, PIN_NO, CONTENT, APPLY_DATE, CK_DATE)
VALUES(AP||TO_CHAR(APPLYNOSEQ.NEXTVAL), '�����ڸ��������ǳѹ����ڸ�', '������ȸ���ĺ���ȣ���ڸ�', '����', SYSDATE, SYSDATE+1);
-- �������ϰ� 1���շ����� �ڵ����� ������ ��Ȳ
INSERT INTO FIRST_CK (FIRST_CK_NO, APPLY_NO, PASS_DATE)
VALUES (FS||TO_CHAR(FIRSTCHECKNOSEQ.NEXTVAL), '��������������ȣ', SYSDATE+1);

--------------------------------------------------------------------------------

-- ���� �Ű����� INSERT
SELECT *
FROM RECRUIT;
--==>> 
/*
RC1	UP1	    1	�ݷ����� ���縦 ���� Ŀ�´�Ƽ	�ݷ����� ������� ���� ������ �����ϰ� ������ �� �ִ� Ŀ�´�Ƽ�� ��ȹ�ϰ� �ֽ��ϴ�..
RC2	UP2	    0	������Ʈ ��ȹ���� �Բ��Ͻ� �е��� ���մϴ�.	������Ʈ ������ ���ų� ���� �е鵵 �������ϴ�. �� ���� �� 3������..
RC3	UP6	    1	���� �ý��� ������Ʈ	���� �ý��� ������Ʈ�� ���õ� ����
RC4	UP7	    1	�޽��� �ý��� ������Ʈ	�޽��� �ý��� ������Ʈ�� ���õ� ����
RC5	UP11	    0	ġŲ ���� ���ø����̼�	ġŲ���� ���ø����̼� ������Ʈ�� ���� �Ͻ� �������� �����մϴ�.
RC6	UP12	    1	��ȭ �¼� ���� �� ����Ʈ	��ȭ�� �¼��� �����ϴ� �ý����� ���� ����� ���� �������� �����մϴ�.
RC8	UP20	    1	�ָ��� ������ ����	�ָ��� ������ ����
RC9	UP15	    0	������ ��ȣȸ ���ø����̼� ������Ʈ	������ ��ȣȸ ȸ������ �� ���� ���� ������ �ְ�ް� ���� ���� �� �ǽð� �� ������ ������ �� �ִ� ���ø����̼��� �����ϰ��� �մϴ�. �����ϰ� �ð��� ������ ������ ���̽ø� ���ڽ��ϴ�. ���� ���� ��Ź�帳�ϴ�.
RC7	UP18	    1	�ҷ��� ������ ����	�ҷ��� ������ ����
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
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.














