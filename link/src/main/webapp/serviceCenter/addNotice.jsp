<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>

	<title>공지사항 확인</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		$("td.ct_btn01:contains('확인')").bind("click", function(){
			self.location = "/serviceCenter/getNoticeList";
		});
		
		$("td.ct_btn01:contains('추가등록')").bind("click", function(){
			self.location = "../serviceCenter/addNoticeView.jsp";
		})
		
		$("td.ct_btn01:contains('수정')").bind("click", function(){
			self.location = "../serviceCenter/updateNoticeView.jsp";
		})
		
		$("td.ct_btn01:contains('삭제')").bind("click", function(){
		self.location = "../serviceCenter/deleteNotice";
		})
	});
	
	</script>
	
</head>

<body bgcolor="#ffffff" text="#000000">
	
	<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="15" height="37">
				<img src="/images/ct_ttl_img01.gif" 	width="15" height="37"/>
			</td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">공지사항 확인</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
			</td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				제목 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">${notice.noticeTitle}</td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>
	
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">
				내용 <img  src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${notice.noticeContent}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	
		<tr>
			<td width="104" class="ct_write">
				등록 일자<img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>${notice.noticeRegDate}
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${notice.noticeRegDate}</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
	<%-- 	<c:set var="text" value="${fn:split(notice.noticeImage, '*')}" ></c:set> --%>

		<tr>
			<td width="104" class="ct_write">상품이미지</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<!-- 테이블 시작 -->
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="26">
							<c:forEach var="i" items="${text}">
						
								<img src="/images/uploadFiles/${i}" width="100" height="100" align="absmiddle"/>
							
							</c:forEach>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td width="53%"></td>
			<td align="right">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>					
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
							확인
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
						
						<td width="30"></td>
						
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
							
							추가등록
							
						</td>
						
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
		
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>
