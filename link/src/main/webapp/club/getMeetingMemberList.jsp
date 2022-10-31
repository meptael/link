<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>모임일정 참여자 리스트</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <!-- jQuery UI toolTip 사용 JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	 
 	 <style>
 	 
	.club-wrap {
			width : 100%;
			margin: 10px auto;
			position: relative;
	}
	
	.club-wrap img {
			width: 100%;
			vertical-align: middle;
			filter: brightness(1.1);
	}
	
	.club-text {
			
			position: absolute;
			top: 50%;
			left: 50%;
			width: 100%;
			transform: translate(-50%, -50%);
			font-size: 20px;
			text-align: center;
			
	}
	
	.plain.button.red.cancel{
	   background-color: white;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: #5F0080 !important;
	   font-size: 16px !important;
	   text-align: center;
	   border: solid 2px;
	}
	
	.plain.button.red.cancel:hover{
	   background-color: #5F0080;
	   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
	   border-radius: 10px;
	   margin: 1rem;
	   padding: 0px;
	   width: 65px !important;
	   color: white !important;
	   font-size: 16px !important;
	}
	
	main {
		background-color: #f0f2f5 !important;
	}
	
	#main {
		background-color: #f0f2f5 !important;
	}
	
	.h2-color {
		color: yellow;
	}
	
	.p-color {
		color: yellow;
	}
	
	</style>

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
	

	$(function() {
		
		$("#deleteParticipant").on("click", function() {
			alert("모임일정 참가를 취소합니다.");
			$("form").attr("method", "POST").attr("action", "/club/deleteMeetingMember").submit();
		});
		
	/* 	$(document).on("click", "#deleteParticipant", function() {
			
			var meetingNo = $(this).val();
			var userId = $(this).attr("userId");
			
			$.ajax("/clubRest/json/deleteMeetingMember" ,
					{
						method : "POST" ,
						data : JSON.stringify({
							meetingNo : meetingNo ,
							userId : userId
						}) ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"							
						},
						dataType : "json",
						success : function(JSONData, status){
							alert(status);
						} // end of success
				
					}); // end of ajax		
				}); // end of 신청취소
			
		}); */
	
	
		});
	
	
	$(function() {

		$("#cancel").bind("click", function() {
			history.go(-1);
		});
	});
	
	
	
	
	</script>	
	
</head>

<body class="blog masonry-style">
		
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->

		<!-- <main role="main">
			<div id="intro-wrap" data-height="17.35">상단 검은색 공통 영역
				<div id="intro" class="preload darken">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
					<div class="intro-item">
					
						<div class="club-wrap">
						
							
							<div class="club-text">
							<h2 class="h2-color">Meeting Member List</h2>
							<p class="p-color">Make good memories with the members...</p>
							</div>							
						</div>
					</div>								
				</div>intro
			</div>intro-wrap -->
			
		
			<div id="main" class="row"><!-- 중간 개별영역 -->
			
				<div class="row-content buffer-left buffer-right buffer-bottom">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px; margin-left: 200px;">
						<li data-group="advertising">
							<a href="/club/getClub?clubNo=${clubNo}" style="color: #BD76FF;">모임</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList" style="color: #BD76FF;">모임 게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList" style="color: #BD76FF;">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="/clubPost/chatRoomList" style="color: #BD76FF;">모임 채팅</a>
						</li>
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">결제</a>
						</li> --%>
					</ul>
	
	
	
	
			    
			  <form class="form-horizontal">  
		      <!--  table Start /////////////////////////////////////-->
		      <table class="table table-hover table-striped" >
		      
		        <thead>
		          <tr>
		          	<th align="left">회원 프로필사진</th>
		            <th align="left" >회원 아이디</th>
		            <th align="left">회원 닉네임</th>
		          </tr>
		        </thead>
		       
		<tbody>
		<tr>
		  <c:forEach var="i" items="${meetingMemberList}">
		  <input type="hidden" name="participantNo" value="${i.participantNo}">
			<tr>
			<td align="left">
			<a href="/myHome/getYourHome?userId=${i.user.userId}"><img src="/resources/image/uploadFiles/${i.user.profileImage}" width="100" height="100"></a>
			</td>
			  <td align="left">${i.user.userId}</td>
			  <td align="left">${i.user.nickName}</td>
			  
			  
			</tr>
          </c:forEach>
        </tr>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
		<div class="form-group">
				<div class="col-sm-offset-6  col-sm-6 text-center" style="margin-left: 30%;">
					<button type="button" class="plain button red cancel" id="deleteParticipant">신청취소</button>
					<button type="button" class="plain button red cancel" id="cancel">닫&nbsp;기</button>					
		    </div>
			</div>		
	  
	  </form>
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
	</div>
	<!-- </main> -->
</body>

</html>