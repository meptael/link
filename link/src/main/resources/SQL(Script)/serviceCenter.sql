

// INSERT NOTICE    =  =  = addNotice()

	INSERT INTO NOTICE( NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_IMAGE1, NOTICE_IMAGE2, NOTICE_REGDATE, NOTICE_COUNT, CLUB_NO, USER_ID)
	VALUES (seq_notice_notice_no.nextval, '공지사항ss', '내용ss', 'abc.jpg', 'cdf.jpg' , SYSDATE, '1' , null, 'admin1');


// DELETE NOTICE  = = = deleteNotice()

	DELETE 
	FROM NOTICE
	WHERE NOTICE_NO = '3';

// SELECT NOTICE =   =  =  getNotice()

	SELECT NOTICE_NO , NOTICE_TITLE , NOTICE_CONTENT , NOTICE_IMAGE1 , NOTICE_IMAGE2, NOTICE_REGDATE, NOTICE_COUNT, CLUB_NO, USER_ID
	FROM NOTICE 
	WHERE NOTICE_NO = '3';


// UPDATE NOTICE = = = updateNotice()

	UPDATE NOTICE
	SET NOTICE_TITLE = '실험',
		NOTICE_CONTENT = '입니다',
		NOTICE_REGDATE = SYSDATE,
		NOTICE_IMAGE1 = 'ABC.JPG',
		NOTICE_IMAGE2 = 'DFE.JPG'
	WHERE NOTICE_NO = '3';


//===============================================================여기까지 노티스	
//===============================================================밑부턴 Q&A

// INSERT QANDA = = = addQandA()

	INSERT INTO QANDA ( QANDA_NO, QANDA_TITLE, QANDA_CONTENT, QANDA_REGDATE, QANDA_IMAGE1,
						QANDA_IMAGE2, ANSWER_CONDITION, QANDA_OPEN_CONDITION, QANDA_COUNT, USER_ID)
	VALUES (SEQ_QANDA_NO.NEXTVAL, '실험', '실험입니다', SYSDATE, 'ABC.JPG', 'JPS.JPG', '0', '0','0','admin1' );

// DELETE QANDA = = = deleteQandA()

	DELETE
	FROM QANDA
	WEHRE QANDA_NO ='3';

// SELECT QANDA = = = getQandA()

	SELECT QANDA_NO, QANDA_TITLE, QANDA_CONTENT, QANDA_REGDATE, QANDA_IMAGE1,
		   QANDA_IMAGE2, ANSWER_CONTENT, ANSWER_REGDATE, ANSWER_CONDITION, QANDA_OPEN_CONDITION, QANDA_COUNT, USER_ID
	FROM QANDA
	WHERE QANDA_NO = '3';

// UPDATE QANDA = = = updateQandA()

	UPDATE QANDA
	SET QANDA_TITLE = '실험',
		QANDA_CONTENT = '입니다',
		QANDA_REGDATE = SYSDATE,
		QANDA_IMAGE1 = 'ABC.JPG',
		QANDA_IMAGE2 = 'JPS.JPG',
	WHERE QANDA_NO = '3';

	
// ANSWER QANDA = = = updateQandA()    관리자 대답. updateQandA에서 아이디(세션)으로 나눌예정


	UPDATE QANDA
	SET	ANSWER_CONTENT = '대답',
	 	ANSWER_REGDATE = SYSDATE,
	 	ANSWER_CONDITION '1'
	 WHERE QANDA_NO = '3';
		


































//==========================================실험

DROP SEQUENCE seq_notice_notice_no;

CREATE SEQUENCE seq_notice_notice_no   INCREMENT BY 1 START WITH 1;


select * from notice;

delete from notice where notice_no = '6';



//==================여기까지가 Notice ====//

DROP SEQUENCE seq_qanda_qanda_no;
DROP SEQUENCE seq_qanda_no;

CREATE SEQUENCE SEQ_QANDA_NO					INCREMENT BY 1 START WITH 1;
 

select * from qanda;


//=================여기까지가 QandA

select * from users;

select * from report_push;
desc report_push;

select * from club_post;

DROP TABLE report_push;
================

CREATE TABLE REPORT_PUSH (
	NO				NUMBER(20)				NOT NULL,
	TITLE				VARCHAR2(200)				,
	CONTENT				VARCHAR2(2000)				NOT NULL,
	REPORT_SOURCE 			CHAR(3)					,
	CLUB_POST_NO			NUMBER(20)					NULL	REFERENCES club_post(club_post_no),
	CLUB_POST_COMMENT_NO		NUMBER(20)					NULL	REFERENCES club_post_comment(club_post_comment_no),
	CHAT_NO				NUMBER(20)				NULL		REFERENCES chat(chat_no),
	FEED_NO				NUMBER(20)					NULL	REFERENCES feed(feed_no),
	FEED_COMMENT_NO			NUMBER(20)				NULL		REFERENCES feed_comment(feed_comment_no),
	LIVE_NO				NUMBER(20)					NULL	REFERENCES live(live_no),
	USER_ID1				VARCHAR2(20)						REFERENCES users(user_id),
	USER_ID2				VARCHAR2(20)				NOT NULL	REFERENCES users(user_id),
	REPORT_REGDATE			DATE					NOT NULL,
	REPORT_IMAGE1			VARCHAR2(100),
	REPORT_IMAGE2			VARCHAR2(100),
	TYPE				CHAR(3)					NOT NULL,
	REPORT_REASON			CHAR(3)					,
	REPORT_CONDITION		CHAR(3)			DEFAULT '1'	,
	REPORT_DUPLICATION		CHAR(3)			,
	PRIMARY KEY(NO)
);

//addReport() 
INSERT INTO report_push
( no, title, content, report_source, club_post_no, club_post_comment_no, feed_no, feed_comment_no, live_no, user_id1,
 user_id2, report_regdate, report_image1, report_image2, type, report_reason, report_condition)
VALUES (seq_report_push_no.nextval, '신고', '신고합니다' , NULL , NULL , NULL , NULL , NULL , NULL, 'admin1' , 'user01' , SYSDATE, NULL , NULL ,
  '1' , '1' , '0'); 



 SELECT * FROM REPORT_PUSH;
 
 
 INSERT INTO REPORT_PUSH
	( NO, TITLE, CONTENT, REPORT_SOURCE, CLUB_POST_NO, CLUB_POST_COMMENT_NO, FEED_NO, FEED_COMMENT_NO,  USER_ID1,
	USER_ID2, REPORT_REGDATE, REPORT_IMAGE1, REPORT_IMAGE2, TYPE, REPORT_REASON, REPORT_CONDITION)

	VALUES (seq_report_push_no.nextval,
			 #{title},
			 #{content},
			 null,
			 #{clubPostComment.clubPostCommentNo},
			 #{feed.feedNo},
			 #{feedComment.feedCommentNo}, 
			 #{user1.userId},
			 #{user2.userId},
			 SYSDATE,
			 #{reportImage1},
			 #{reportImage2}, 
			 #{type},
			 #{reportReason},
		     #{reportCondition} )
 
 
 //updateReport()
 
 SELECT * FROM USERS where user_id='user02';
 
 SELECT * FROM REPORT_PUSH WHERE no='37';

SELECT u.report_count, u.penalty_type, r.report_reason, u.user_id
FROM USERS u, report_push r
WHERE u.user_id=r.user_id2 AND r.user_id2='user02';



SELECT REPORT_COUNT, penalty_type, stop_start_date, stop_end_date
FROM USERS
WHERE user_id='user02';
	
	
UPDATE USERS
SET
REPORT_COUNT = '0',
PENALTY_TYPE = '0',
STOP_START_DATE = NULL,
STOP_END_DATE = NULL
WHERE USER_ID = 'user02';



 SELECT to_number(1) + to_number(1)
 FROM users; 
 
 
SELECT r.*
FROM REPORT_PUSH R;

SELECT R.*
FROM CLUB_POST R
WHERE club_post_no='45';

DELETE report_push
WHERE no='45';



UPDATE REPORT_PUSH
SET CLUB_POST_NO = '30'
WHERE No='45';

SELECT *
FROM REPORT_PUSH
WHERE USER_ID1='admin1' AND USER_ID2='user01' AND REPORT_REGDATE < TO_CHAR(REPORT_REGDATE+7,'YYYYMMDD');

SELECT R.*   FROM REPORT_PUSH R      WHERE R.USER_ID1 = 'admin1' AND R.USER_ID2 = 'user01'   AND TO_CHAR(R.REPORT_REGDATE, 'YYYYMMDD') < TO_CHAR(R.REPORT_REGDATE+3, 'YYYYMMDD')