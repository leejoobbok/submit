SELECT USER
FROM DUAL;
--==>> PROJECTORS

-- �� ���� REGION ���̺� ���� INSERT
INSERT INTO REGION VALUES (1,'����Ư����');
INSERT INTO REGION VALUES (2,'��⵵');
INSERT INTO REGION VALUES (3,'��õ������');
INSERT INTO REGION VALUES (4,'�λ걤����');
INSERT INTO REGION VALUES (5,'�뱸������');
INSERT INTO REGION VALUES (6,'���ֱ�����');
INSERT INTO REGION VALUES (7,'����������');
INSERT INTO REGION VALUES (8,'��걤����');
INSERT INTO REGION VALUES (9,'����Ư����');
INSERT INTO REGION VALUES (10,'������');
INSERT INTO REGION VALUES (11,'��󳲵�');
INSERT INTO REGION VALUES (12,'���ϵ�');
INSERT INTO REGION VALUES (13,'���󳲵�');
INSERT INTO REGION VALUES (14,'����ϵ�');
INSERT INTO REGION VALUES (15,'��û����');
INSERT INTO REGION VALUES (16,'��û�ϵ�');
INSERT INTO REGION VALUES (17,'����Ư����ġ��');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 17 


SELECT *
FROM REGION;
--==>> 
/*
1	����Ư����
2	��⵵
3	��õ������
4	�λ걤����
5	�뱸������
6	���ֱ�����
7	����������
8	��걤����
9	����Ư����
10	������
11	��󳲵�
12	���ϵ�
13	���󳲵�
14	����ϵ�
15	��û����
16	��û�ϵ�
17	����Ư����ġ��
*/

--�� �������� SUB_REGION ���̺� ���� INSERT
-- ��⵵ 2��
  INSERT INTO SUB_REGION VALUES( 1 , 2,'����'  );
  INSERT INTO SUB_REGION VALUES( 2 , 2,'��õ��'  );
  INSERT INTO SUB_REGION VALUES( 3 , 2,'�����'  );
  INSERT INTO SUB_REGION VALUES( 4 , 2,'���ֽ�'  );
  INSERT INTO SUB_REGION VALUES( 5 , 2,'������'  );
  INSERT INTO SUB_REGION VALUES( 6 , 2,'������'  );
  INSERT INTO SUB_REGION VALUES( 7 , 2,'������'  );
  INSERT INTO SUB_REGION VALUES( 8 , 2,'����õ'  );
  INSERT INTO SUB_REGION VALUES( 9 , 2,'��õ��'  );
  INSERT INTO SUB_REGION VALUES( 10, 2,'������'  );
  INSERT INTO SUB_REGION VALUES( 11, 2,'������'  );
  INSERT INTO SUB_REGION VALUES( 12, 2,'�����'  );
  INSERT INTO SUB_REGION VALUES( 13, 2,'�Ȼ��'  );
  INSERT INTO SUB_REGION VALUES( 14, 2,'�ȼ���'  );
  INSERT INTO SUB_REGION VALUES( 15, 2,'�Ⱦ��'  );
  INSERT INTO SUB_REGION VALUES( 16, 2,'���ֽ�'  );
  INSERT INTO SUB_REGION VALUES( 17, 2,'���ֽ�'  );
  INSERT INTO SUB_REGION VALUES( 18, 2,'�����'  );
  INSERT INTO SUB_REGION VALUES( 19, 2,'���ν�'  );
  INSERT INTO SUB_REGION VALUES( 20, 2,'�ǿս�'  );
  INSERT INTO SUB_REGION VALUES( 21, 2,'�����ν�');
  INSERT INTO SUB_REGION VALUES( 22, 2,'��õ��'  );
  INSERT INTO SUB_REGION VALUES( 23, 2,'���ֽ�'  );
  INSERT INTO SUB_REGION VALUES( 24, 2,'���ý�'  );
  INSERT INTO SUB_REGION VALUES( 25, 2,'��õ��'  );
  INSERT INTO SUB_REGION VALUES( 26, 2,'�ϳ���'  );
  INSERT INTO SUB_REGION VALUES( 27, 2,'ȭ����'  );

-- ���� 10��
  INSERT INTO SUB_REGION VALUES (28,10,'������');
  INSERT INTO SUB_REGION VALUES (29,10,'���ؽ�');
  INSERT INTO SUB_REGION VALUES (30,10,'��ô��');
  INSERT INTO SUB_REGION VALUES (31,10,'���ʽ�');
  INSERT INTO SUB_REGION VALUES (32,10,'���ֽ�');
  INSERT INTO SUB_REGION VALUES (33,10,'��õ��');
  INSERT INTO SUB_REGION VALUES (34,10,'�¹��');

-- �泲 11��
 INSERT INTO SUB_REGION VALUES(35,11,'������');
 INSERT INTO SUB_REGION VALUES(36,11,'���ؽ�');
 INSERT INTO SUB_REGION VALUES(37,11,'�о��');
 INSERT INTO SUB_REGION VALUES(38,11,'��õ��');
 INSERT INTO SUB_REGION VALUES(39,11,'����');
 INSERT INTO SUB_REGION VALUES(40,11,'���ֽ�');
 INSERT INTO SUB_REGION VALUES(41,11,'â����');
 INSERT INTO SUB_REGION VALUES(42,11,'�뿵��');

-- 12���
 INSERT INTO SUB_REGION VALUES(43,12,'����');
 INSERT INTO SUB_REGION VALUES(44,12,'���ֽ�');
 INSERT INTO SUB_REGION VALUES(45,12,'���̽�');
 INSERT INTO SUB_REGION VALUES(46,12,'��õ��');
 INSERT INTO SUB_REGION VALUES(47,12,'�����');
 INSERT INTO SUB_REGION VALUES(48,12,'���ֽ�');
 INSERT INTO SUB_REGION VALUES(49,12,'�ȵ���');
 INSERT INTO SUB_REGION VALUES(50,12,'���ֽ�');
 INSERT INTO SUB_REGION VALUES(51,12,'��õ��');
 INSERT INTO SUB_REGION VALUES(52,12,'���׽�');
-- 13����
 INSERT INTO SUB_REGION VALUES(53,13,'�����');
 INSERT INTO SUB_REGION VALUES(54,13,'���ֽ�');
 INSERT INTO SUB_REGION VALUES(55,13,'������');
 INSERT INTO SUB_REGION VALUES(56,13,'��õ��');
 INSERT INTO SUB_REGION VALUES(57,13,'������');
-- 14����
 INSERT INTO SUB_REGION VALUES(58,14,'�����');
 INSERT INTO SUB_REGION VALUES(59,14,'������');
 INSERT INTO SUB_REGION VALUES(60,14,'������');
 INSERT INTO SUB_REGION VALUES(61,14,'�ͻ��');
 INSERT INTO SUB_REGION VALUES(62,14,'���ֽ�');
 INSERT INTO SUB_REGION VALUES(63,14,'������');
-- 15�泲
 INSERT INTO SUB_REGION VALUES(64,15,'�����');
 INSERT INTO SUB_REGION VALUES(65,15,'���ֽ�');
 INSERT INTO SUB_REGION VALUES(66,15,'����');
 INSERT INTO SUB_REGION VALUES(67,15,'������');
 INSERT INTO SUB_REGION VALUES(68,15,'���ɽ�');
 INSERT INTO SUB_REGION VALUES(69,15,'�����');
 INSERT INTO SUB_REGION VALUES(70,15,'�ƻ��');
 INSERT INTO SUB_REGION VALUES(71,15,'õ�Ƚ�');
-- 16���
 INSERT INTO SUB_REGION VALUES(72,16,'��õ��');
 INSERT INTO SUB_REGION VALUES(73,16,'û�ֽ�');
 INSERT INTO SUB_REGION VALUES(74,16,'���ֽ�');
-- 17����
 INSERT INTO SUB_REGION VALUES(75,17,'���ֽ�');
 INSERT INTO SUB_REGION VALUES(76,17,'��������');
 
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 76


--�� ���� ������ ���� �����鿡 ���� ��ü��� �������� ���� SUB_REGION
INSERT INTO SUB_REGION VALUES( 991 , 1,'��ü');
INSERT INTO SUB_REGION VALUES( 993 , 3,'��ü');
INSERT INTO SUB_REGION VALUES( 994 , 4,'��ü');
INSERT INTO SUB_REGION VALUES( 995 , 5,'��ü');
INSERT INTO SUB_REGION VALUES( 996 , 6,'��ü');
INSERT INTO SUB_REGION VALUES( 997 , 7,'��ü');
INSERT INTO SUB_REGION VALUES( 998 , 8,'��ü');
INSERT INTO SUB_REGION VALUES( 999 , 9,'��ü');
-- 1 �� ��(��) ���ԵǾ����ϴ�. * 8

SELECT *
FROM SUB_REGION;
/*
991	1	��ü
993	3	��ü
994	4	��ü
995	5	��ü
996	6	��ü
997	7	��ü
998	8	��ü
999	9	��ü
1	2	����
2	2	��õ��
3	2	�����
4	2	���ֽ�
5	2	������
6	2	������
7	2	������
8	2	����õ
9	2	��õ��
10	2	������
11	2	������
12	2	�����
13	2	�Ȼ��
14	2	�ȼ���
15	2	�Ⱦ��
16	2	���ֽ�
17	2	���ֽ�
18	2	�����
19	2	���ν�
20	2	�ǿս�
21	2	�����ν�
22	2	��õ��
23	2	���ֽ�
24	2	���ý�
25	2	��õ��
26	2	�ϳ���
27	2	ȭ����
28	10	������
29	10	���ؽ�
30	10	��ô��
31	10	���ʽ�
32	10	���ֽ�
33	10	��õ��
34	10	�¹��
35	11	������
36	11	���ؽ�
37	11	�о��
38	11	��õ��
39	11	����
40	11	���ֽ�
41	11	â����
42	11	�뿵��
43	12	����
44	12	���ֽ�
45	12	���̽�
46	12	��õ��
47	12	�����
48	12	���ֽ�
49	12	�ȵ���
50	12	���ֽ�
51	12	��õ��
52	12	���׽�
53	13	�����
54	13	���ֽ�
55	13	������
56	13	��õ��
57	13	������
58	14	�����
59	14	������
60	14	������
61	14	�ͻ��
62	14	���ֽ�
63	14	������
64	15	�����
65	15	���ֽ�
66	15	����
67	15	������
68	15	���ɽ�
69	15	�����
70	15	�ƻ��
71	15	õ�Ƚ�
72	16	��õ��
73	16	û�ֽ�
74	16	���ֽ�
75	17	���ֽ�
76	17	��������
*/


-- �� ������Ż���� ����
INSERT INTO MEM_OUT_REASON VALUES(1, '�ٸ� ������Ʈ ����');
INSERT INTO MEM_OUT_REASON VALUES(2, '���');
INSERT INTO MEM_OUT_REASON VALUES(3, '���� ��ȭ');      
INSERT INTO MEM_OUT_REASON VALUES(4, '��������' );     
INSERT INTO MEM_OUT_REASON VALUES(5, '���λ���' );    
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

SELECT *
FROM MEM_OUT_REASON;
--==>>
/*
1	�ٸ� ������Ʈ ����
2	���
3	���� ��ȭ
4	��������
5	���λ���
*/

-- �� �� �ߴܻ��� ����
INSERT INTO PRJ_STOP_REASON VALUES(1,'��ǥ ������');
INSERT INTO PRJ_STOP_REASON VALUES(2,'���� ��ȭ');
INSERT INTO PRJ_STOP_REASON VALUES(3,'���� ���� ����');
INSERT INTO PRJ_STOP_REASON VALUES(4,'�� �������� ��Ż');
INSERT INTO PRJ_STOP_REASON VALUES(5,'��������');
INSERT INTO PRJ_STOP_REASON VALUES(6,'���� ����');
INSERT INTO PRJ_STOP_REASON VALUES(7,'���� ���λ���');
--==>> 

SELECT *
FROM PRJ_STOP_REASON;
--==>>
/*
1	��ǥ ������
2	���� ��ȭ
3	���� ���� ����
4	�� �������� ��Ż
5	��������
6	���� ����
7	���� ���λ���
*/


-- �� �� �����̽� �Ű� ���� ����
INSERT INTO REP_PRJ_REASON VALUES(1,'�������� ������');
INSERT INTO REP_PRJ_REASON VALUES(2,'���� �� ����');
INSERT INTO REP_PRJ_REASON VALUES(3,'�δ��� ����');
INSERT INTO REP_PRJ_REASON VALUES(4,'��������');
INSERT INTO REP_PRJ_REASON VALUES(5,'��� �� ���Ѽ�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

SELECT *
FROM REP_PRJ_REASON;
--==>>
/*
2	���� �� ����
3	�δ��� ����
4	��������
5	��� �� ���Ѽ�
1	�������� ������
*/


-- �� ȸ��Ż�� ���� ����
INSERT INTO WITHDRAW_TYPE VALUES(1,'��� �� ����');
INSERT INTO WITHDRAW_TYPE VALUES(2,'���� �̿� ����');
INSERT INTO WITHDRAW_TYPE VALUES(3,'�����޼�');
INSERT INTO WITHDRAW_TYPE VALUES(4,'�ٸ� ���� �̿�');
INSERT INTO WITHDRAW_TYPE VALUES(5,'������ ����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

SELECT *
FROM WITHDRAW_TYPE;
--==>>
/*
1	��� �� ����
2	���� �̿� ����
3	�����޼�
4	�ٸ� ���� �̿�
5	������ ����
*/

-- �� �Ű���� ����
INSERT INTO REPORT_REASON VALUES(1,'�������� ��� ���');
INSERT INTO REPORT_REASON VALUES(2,'���۱� ħ��');
INSERT INTO REPORT_REASON VALUES(3,'���� �� ����');
INSERT INTO REPORT_REASON VALUES(4,'�������� ħ��');
INSERT INTO REPORT_REASON VALUES(5,'�����������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 5

SELECT *
FROM REPORT_REASON;
--==>>
/*
1	�������� ��� ���
2	���۱� ħ��
3	���� �� ����
4	�������� ħ��
5	�����������
*/



-- �� �Ű�ó����� ����
INSERT INTO REPORT_RESULT VALUES(0,'�ݷ�');
INSERT INTO REPORT_RESULT VALUES(1,'ó��');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM REPORT_RESULT;
--==>>
/*
1	ó��
0	�ݷ�
*/

-- �� ���� �׸� ����
INSERT INTO REGULATION VALUES(1,'�����');
INSERT INTO REGULATION VALUES(2,'������');
INSERT INTO REGULATION VALUES(3,'�弳');
INSERT INTO REGULATION VALUES(4,'����');
INSERT INTO REGULATION VALUES(5,'����');
INSERT INTO REGULATION VALUES(6,'������ ����(���� �� �ڻ� ��)');
INSERT INTO REGULATION VALUES(7,'��⼺ ����');
INSERT INTO REGULATION VALUES(8,'�������� ������');
INSERT INTO REGULATION VALUES(9,'��Ÿ');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 9

SELECT *
FROM REGULATION;
--==>>
/*
1	�����
2	������
3	�弳
4	����
5	����
6	������ ����(���� �� �ڻ� ��)
7	��⼺ ����
8	�������� ������
9	��Ÿ
*/


-- �� ���� �Ⱓ ����
INSERT INTO REGULATION_PERIOD VALUES(1,7);
INSERT INTO REGULATION_PERIOD VALUES(2,14);
INSERT INTO REGULATION_PERIOD VALUES(3,73000);  -- 200 ��
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM REGULATION_PERIOD;
--==>>
/*
1	7
2	14
3	73000
*/

-- �� ��� ���� ����
INSERT INTO DO_TYPE VALUES(0,'����');
INSERT INTO DO_TYPE VALUES(1,'���');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 2

SELECT *
FROM DO_TYPE;
--==>>
/*
1	���
0	����
*/


-- �� �����(����) ����
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
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 30

SELECT *
FROM TOOL;
--==>> 
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

-- �� �򰡻��� ����
INSERT INTO RATE_SELECT VALUES(1,'������ ������');
INSERT INTO RATE_SELECT VALUES(2,'�����ɷ��� �پ');
INSERT INTO RATE_SELECT VALUES(3,'���� �ɷ��� �پ');
INSERT INTO RATE_SELECT VALUES(4,'�������� ������');
INSERT INTO RATE_SELECT VALUES(5,'�����ɷ��� ������');
INSERT INTO RATE_SELECT VALUES(6,'���� ���� �ɷ��� ����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 6

SELECT *
FROM RATE_SELECT;
--==>>
/*
1	������ ������
2	�����ɷ��� �پ
3	���� �ɷ��� �پ
4	�������� ������
5	�����ɷ��� ������
6	���� ���� �ɷ��� ����
*/

COMMIT;



INSERT INTO POSITION VALUES (1, 'FRONTEND');
INSERT INTO POSITION VALUES (2, 'BACKEND');
INSERT INTO POSITION VALUES (3, 'FULLSTACK');
INSERT INTO POSITION VALUES (4, 'PUBLISHING');
INSERT INTO POSITION VALUES (5, 'DESIGN');
INSERT INTO POSITION VALUES (6, 'PLANNING');

COMMIT;
--==>> Ŀ�� �Ϸ�

