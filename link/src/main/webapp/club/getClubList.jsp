<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>모임리스트</title>
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
		body {
		padding-top : 70px;
		clear: none;
		
		}
		.thumbnail {
			    display: flex;
			    height: 100%;
			    justify-content: flex-start;
		    	align-items: center;
		    	flex-direction: column;
		}
		
		.thumbnail img { 
			min-height:200px; height:150px;
		 }     
		 
		 div {
		 	clear: none;
		 }
	
	</style>
	
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="/resources/javascript/plugins.js"></script>
	<script src="/resources/javascript/beetle.js"></script>
	<script type="text/javascript">
	
	function fncUpdateMemberRole() {
		
		$("form").attr("method", "POST").attr("action", "/club/updateMemberRole")
		alert("모임원 수정 화면")
		.submit();
	}
	
	$(function(){
		$()
		
		
	})
	
	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			self.location="/club/getApprovalConditionList"
			
		});
	});
	
	
	
	</script>	
</head>

<body class="blog masonry-style">

	<jsp:include page="/toolbar.jsp" />

	<main role="main">
		
			<div id="intro-wrap" data-height="27.778">
				<div id="intro" class="preload darken">
					<div class="intro-item"
						style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>CLUB LIST</h2>
							<p>The meeting is waiting for you.. </p>
						</div>
						<!-- caption -->
					</div>
					<!-- intro -->
				</div>
				<!-- intro -->
			</div>
			<!-- intro-wrap -->
			
			
	
		<!--  화면구성 div Start /////////////////////////////////////-->
		<div class="container">
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	  	  <div id="main" class="row">
	    
		    
		    <div class="col-md-6 text-right" style="float: right;">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>모임이름</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>모임카테고리</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <div class="form-group">
				  <button type="button" class="btn btn-default">검색</button>
				  <button type="button" class="btn btn-primary">가입현황리스트</button>
				  <a href="/club/addClubView.jsp">모임등록</a>
				  </div>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


	<div id="main" class="row">
		

		<!-- <div class="row"> -->
		  <c:forEach var="i" items="${clubList}">
		  	<div class="col-xs-4 col-md-4">	
				<div class="thumbnail" style="">
			  			<img src="/resources/image/uploadFiles/${i.clubImage}" class="img-rounded">
			  			<p><strong>모임제목 : ${i.clubTitle}</strong></p>
				  		<p>${i.clubArea}</p>
				  		<p>현재인원 : ${i.currentMember}</p>
				  		<p>최대인원 : ${i.clubMaxMember}</p>
				  		<p><a href="/club/getClub?clubNo=${i.clubNo}" class="btn btn-success" role="button">모임보기</a></p>			  	
				 </div>
				</div>						
	    	 </c:forEach>
		</div>			
      
	</div>
	  
 	
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
	</main>
	
</body>

</html>