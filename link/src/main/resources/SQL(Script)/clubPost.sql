
// null값일 때  ${IMAGE:VARCHAR2} 붙이자
addClubPost()
INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_UPDATE_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, REPORT_CONDITION,
DELETE_CONDITION, IMAGE1, IMAGE2, IMAGE3, IMAGE4, IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10)
VALUES (seq_club_post_no.NEXTVAL, 7, 'user02', 'clubposttitle1',
null, null, null, null, sysdate, null, 0, 0, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null)



//모임원 전체에게 알림
addPush()
INSERT INTO REPORT_PUSH (NO, TITLE, CONTENT, REPORT_SOURCE, CLUB_POST_NO, USER_ID1, USER_ID2, REPORT_REGDATE, 
TYPE) VALUES (seq_REPORT_PUSH_NO.NEXTVAL, 'title', 'content', '1', seq_club_post_no.CURRVAL,
'user02', 'user03', sysdate, '2')



getClubPost() - 모임게시물 상세보기 가져오기
SELECT CLUB_POST_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, CLUB_POST_VIDEO3,
CLUB_POST_REG_DATE, CLUB_POST_UPDATE_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, REPORT_CONDITION, DELETE_CONDITION,
IMAGE1, IMAGE2, IMAGE3, IMAGE4, IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10 FROM CLUB_POST
WHERE REPORT_CONDITION = 0 AND DELETE_CONDITION = 0 AND CLUB_POST_NO = 20



getClubPost() - getClubPostCommentList - 모임게시물 댓글리스트 가져오기
SELECT CLUB_POST_COMMENT_NO, CLUB_POST_NO, USER_ID, COMMENT_CONTENT, COMMENT_REG_DATE, COMMENT_UPDATE_DATE, COMMENT_LIKE_COUNT,
COMMENT_COUNT, REPORT_CONDITION, DELETE_CONDITION, PARENT, DEPTH, SEQUENCE
FROM CLUB_POST_COMMENT
WHERE CLUB_POST_NO = 20
ORDER BY COMMENT_REG_DATE ASC



getClubPostRecommentList - 모임게시물 대댓글리스트 가져오기
SELECT CLUB_POST_COMMENT_NO, CLUB_POST_NO, USER_ID, COMMENT_CONTENT, COMMENT_REG_DATE, COMMENT_UPDATE_DATE, COMMENT_LIKE_COUNT,
COMMENT_COUNT, REPORT_CONDITION, DELETE_CONDITION, PARENT, DEPTH, SEQUENCE
FROM CLUB_POST_COMMENT
WHERE PARENT = 4
ORDER BY COMMENT_REG_DATE ASC



SELF OUTER JOIN()
SELECT *
FROM CLUB_POST_COMMENT C1 LEFT OUTER JOIN CLUB_POST_COMMENT C2
ON C1.CLUB_POST_COMMENT_NO = C2.PARENT
WHERE C1.CLUB_POST_NO = 20
ORDER BY C1.COMMENT_REG_DATE ASC, C2.SEQUENCE ASC;
GROUP BY C1.CLUB_POST








getClubPostList() - 가장 최근 가입한 모임게시물 리스트
SELECT CLUB_NO, CLUB_POST_NO, IMAGE1, CLUB_POST_TITLE, USER_ID, CLUB_POST_HEART_COUNT
FROM CLUB_POST
WHERE CLUB_NO = ( SELECT V2.CLUB_NO
					FROM ( SELECT ROWNUM, V1.*
							FROM ( SELECT *
									FROM CLUB_USER
									WHERE USER_ID = 'user03' AND JOIN_REG_DATE IS NOT NULL
									ORDER BY JOIN_REG_DATE DESC ) V1
							WHERE ROWNUM = 1
						 ) V2
				 ) AND REPORT_CONDITION = '0' AND DELETE_CONDITION = '0'
ORDER BY CLUB_POST_REG_DATE DESC



getClubPostList() - 특정 모임의 최신순
SELECT CLUB_NO, CLUB_POST_NO, IMAGE1, CLUB_POST_TITLE, USER_ID, CLUB_POST_HEART_COUNT
FROM CLUB_POST
WHERE CLUB_NO = 10 AND REPORT_CONDITION = '0' AND DELETE_CONDITION = '0'
ORDER BY CLUB_POST_REG_DATE DESC 



getClubPostList() - 특정 모임의 오래된순
SELECT CLUB_NO, CLUB_POST_NO, IMAGE1, CLUB_POST_TITLE, USER_ID, CLUB_POST_HEART_COUNT
FROM CLUB_POST
WHERE CLUB_NO = 10 AND REPORT_CONDITION = '0' AND DELETE_CONDITION = '0'
ORDER BY CLUB_POST_REG_DATE ASC



getClubPostList() - 특정 모임의 좋아요 많은순
SELECT CLUB_NO, CLUB_POST_NO, IMAGE1, CLUB_POST_TITLE, USER_ID, CLUB_POST_HEART_COUNT
FROM CLUB_POST
WHERE CLUB_NO = 10 AND REPORT_CONDITION = '0' AND DELETE_CONDITION = '0'
ORDER BY CLUB_POST_HEART_COUNT DESC, CLUB_POST_REG_DATE DESC 



getClubPostList() - 특정 모임의 내가 작성한 게시물
SELECT CLUB_POST_NO, IMAGE1, CLUB_POST_TITLE, USER_ID, CLUB_POST_HEART_COUNT
FROM CLUB_POST
WHERE CLUB_NO = 10 AND USER_ID = 'user02' AND REPORT_CONDITION = '0' AND DELETE_CONDITION = '0'
ORDER BY CLUB_POST_REG_DATE DESC 






getClubPostListMyHome()
SELECT CLUB_POST_NO, IMAGE1, CLUB_POST_TITLE, USER_ID, CLUB_POST_LIKE_COUNT
FROM CLUB_POST
WHERE USER_ID = 'user02' AND REPORT_CONDITION = '0' AND DELETE_CONDITION = '0'
ORDER BY CLUB_POST_REG_DATE DESC


getClubPostListMyHomeCount()
SELECT COUNT(*) FROM CLUB_POST WHERE USER_ID = 'user02' AND REPORT_CONDITION = '0' AND DELETE_CONDITION = '0'









// null값일 때  ${IMAGE:VARCHAR2} 붙이자
updateClubPost() - 모임게시물 수정할 떄
UPDATE CLUB_POST SET CLUB_POST_TITLE = 'updateTitle', CLUB_POST_CONTENT = 'updateContent', CLUB_POST_VIDEO1 = '1', CLUB_POST_VIDEO2 = '2',
CLUB_POST_VIDEO3 = '3', IMAGE1 = '1', IMAGE2 = '2', IMAGE3 = '3', IMAGE4 = '4', IMAGE5 = '5', IMAGE6 = '6', IMAGE7 = '7', IMAGE8 = '8',
IMAGE9 = '9', IMAGE10 = '10'
WHERE CLUB_POST_NO = 20



deleteClubPost()
UPDATE CLUB_POST SET DELETE_CONDITION = '1' WHERE CLUB_POST_NO = 20



updateClubPostLike()
UPDATE CLUB_POST SET CLUB_POST_LIKE_COUNT = CLUB_POST_LIKE_COUNT + 1 WHERE CLUB_POST_NO = 20



INSERT INTO HEART (HEART_NO, USER_ID, SOURCE, SOURCE_NO)
VALUES( seq_heart_no.NEXTVAL, 'user03', '2', 20)











///////////////////////////////////////////////////////////////////////////////////// 모임게시물 댓글 /////////////////////////////////////////////////////////////////////////////////////



club_post_comment_no가 없다면 즉, 모임게시물의 댓글이라면? parent 0, depth 0, sequence는 parent의 번호가 같은것 중 sequence의 값이 가장 큰 것 +1
addClubPostComment()
INSERT INTO CLUB_POST_COMMENT (CLUB_POST_COMMENT_NO, CLUB_POST_NO, USER_ID, COMMENT_CONTENT, COMMENT_REG_DATE, COMMENT_UPDATE_DATE,
COMMENT_LIKE_COUNT, REPORT_CONDITION, DELETE_CONDITION, PARENT, DEPTH, SEQUENCE, COMMENT_COUNT)
VALUES (seq_club_post_comment_no.NEXTVAL,
10,
'user02',
'댓글내용이다',
sysdate, null, 0, '0', '0', 4, 1, 0, 0)



// 작성자에게 알림
addPush()
INSERT INTO REPORT_PUSH (NO, TITLE, CONTENT, REPORT_SOURCE, CLUB_POST_COMMENT_NO, USER_ID1, USER_ID2, REPORT_REGDATE, TYPE)
VALUES (seq_club_post_comment_no, 'titleComment', 'contentComment', '2', seq_club_post_no.currval, 'user03', 'user02')



getCurrval()
SELECT ROWNUM, seq_club_post_comment_no.currval FROM CLUB_POST_COMMENT WHERE ROWNUM = 1



getClubPostCommentNo()
SELECT V1.CLUB_POST_COMMENT_NO FROM ( SELECT * FROM CLUB_POST_COMMENT ORDER BY COMMENT_REG_DATE DESC ) V1
WHERE ROWNUM = 1



getClubPostComment()
SELECT * FROM CLUB_POST_COMMENT WHERE CLUB_POST_COMMENT_NO = 9;



updateClubPostComment()
UPDATE CLUB_POST_COMMENT SET COMMENT_CONTENT = '댓글내용99' WHERE CLUB_POST_COMMENT_NO = 9



updateClubPostCommentLike()
UPDATE CLUB_POST_COMMENT SET COMMENT_LIKE_COUNT = COMMENT_LIKE_COUNT + 1 WHERE CLUB_POST_COMMENT_NO = 1



deleteClubPostComment()
UPDATE CLUB_POST_COMMENT SET DELETE_CONDITION = '1' WHERE CLUB_POST_COMMENT_NO = 1












///////////////////////////////////////////////////////////////////////////////////// 모임공지사항 /////////////////////////////////////////////////////////////////////////////////////



가장 최근 가입한 모임번호
SELECT V1.CLUB_NO
FROM 
( SELECT *
FROM CLUB
WHERE USER_ID = 'user01'
ORDER BY CLUB_REG_DATE DESC )V1
WHERE ROWNUM = 1



getClubNoticeList() - 가장 최근 가입한 모임의 리스트
SELECT V2.*
FROM ( SELECT *
		FROM NOTICE
		WHERE CLUB_NO = ( SELECT V1.CLUB_NO
							FROM ( SELECT *
									FROM CLUB
									WHERE USER_ID = 'user01'
									ORDER BY CLUB_REG_DATE DESC
								  )V1
							WHERE ROWNUM = 1
						 )
		ORDER BY NOTICE_REGDATE ASC
	 ) V2
WHERE ROWNUM BETWEEN 1 AND 10



getClubNoticeList() - 특정 모임의 리스트
SELECT V2.*
FROM ( SELECT *
		FROM NOTICE
		WHERE CLUB_NO = 2
		ORDER BY NOTICE_REGDATE ASC
	 ) V2
WHERE ROWNUM BETWEEN 1 AND 10



SELECT V3.*
FROM ( SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) AS R, V2.*
		FROM ( SELECT *
				FROM NOTICE
				WHERE CLUB_NO = 2
				ORDER BY NOTICE_REGDATE DESC
			 ) V2
	) V3
WHERE R BETWEEN 21 AND 30


















addClubNotice()
INSERT INTO NOTICE( NOTICE_NO, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_IMAGE1, NOTICE_IMAGE2, NOTICE_REGDATE, NOTICE_COUNT, CLUB_NO, USER_ID)
VALUES ( seq_notice_no.nextval, 'clubTitle', 'clubContent', null, null, SYSDATE, 0, 2, 'user03' )



getClubNoticetNo()
SELECT V1.NOTICE_NO
FROM ( SELECT *
		FROM NOTICE
		WHERE CLUB_NO = 2
		ORDER BY NOTICE_REGDATE DESC ) V1
WHERE ROWNUM = 1



updateClubNotice()
UPDATE NOTICE SET NOTICE_TITLE = '1', NOTICE_CONTENT = '2' WHERE NOTICE_NO = 6



deleteClubNotice()
DELETE FROM NOTICE WHERE NOTICE_NO = 6



getClubNotice()
SELECT * FROM NOTICE WHERE NOTICE_NO = 6



getClubNoticeList()
SELECT *
FROM NOTICE
WHERE CLUB_NO = 2
ORDER BY NOTICE_REGDATE DESC








///////////////////////////////////////////////////////////////////////////////////// 결제 /////////////////////////////////////////////////////////////////////////////////////



addPay()
INSERT INTO PAY (PAY_NO, USER_ID, CLUB_NO, PAY_PRODUCT, PAY_OPTION, TOTAL_PRICE, PAY_REG_DATE, UPDATE_CLUB_COUNT, UPDATE_CLUB_MEMBER_COUNT, MERCHANT_UID)
VALUES (seq_pay_no.NEXTVAL, 'user03', 2, '1', '0', 10000, SYSDATE, 0, 20, '111')



updateClubMember() - 모임원 최대 수 증가
UPDATE CLUB SET CLUB_MAX_MEMBER = CLUB_MAX_MEMBER + 10 WHERE CLUB_NO = 2



updateClub() - 모임 최대 수 증가
UPDATE USERS SET JOIN_CLUB_LIMIT = JOIN_CLUB_LIMIT + 2 WHERE USER_ID = 'user03'







INSERT INTO REPORT_PUSH (NO, CONTENT, USER_ID2, REPORT_REGDATE, TYPE) VALUES (seq_REPORT_PUSH_NO.NEXTVAL, 'OOO님이 회원님의 게시물에 댓글을 남겼습니다', 'user02', sysdate, 2)
INSERT INTO REPORT_PUSH  ( NO, TITLE, CONTENT, REPORT_SOURCE, CLUB_POST_NO, CLUB_POST_COMMENT_NO, FEED_NO, FEED_COMMENT_NO,  USER_ID1,  USER_ID2, REPORT_REGDATE, REPORT_IMAGE1, REPORT_IMAGE2, TYPE, REPORT_REASON, REPORT_CONDITION)   VALUES (seq_report_push_no.nextval,     ?,     ?,     ?,     ?,     ?,     ?,     ?,      ?,     ?,     SYSDATE,     ?,     ?,      ?,     ?,        ? )


		SELECT
			club_user_no ,
			user_id ,
			club_no ,
			application_reg_date ,
			join_reg_date ,
			logout_date ,
			member_role ,
			approval_condition ,
			join_greeting 
		FROM club_user
		WHERE club_no = '1'

