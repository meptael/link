<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="description" content="The Page Description">
		<style type="text/css">@-ms-viewport{width: device-width;}</style>
		<title>Beetle - Works 4 Columns Alternative</title>
		<link rel="stylesheet" href="css/layers.min.css" media="screen">
		<link rel="stylesheet" href="css/font-awesome.min.css" media="screen"> 
		<link rel="stylesheet" href="style.css" media="screen">
		<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700|Open+Sans:400italic,700italic,400,700' rel='stylesheet' type='text/css'>
		
		<link rel="icon" href="favicon.ico">
		<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png">
		<link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png">
		<link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png">
		
		<!--  ///////////////////////// jQuery CDN////////////////////////// -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		
		<script type="text/javascript">
			$(function() {
				$("a.button.transparent.aqua:contains('등록하기')").bind("click", function() {
					//swal.fire("아이디를 입력하셔야 합니다.");
					//self.location = "/clubPost/addClubPostView?clubNo=2";
					location.href = "/clubPost/addClubPostView?clubNo=2";
				});
				$("b:contains('최신순')").bind("click", function() {
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=0";
				});
				$("b:contains('오래된순')").bind("click", function() {
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=1";
				});
				$("b:contains('좋아요 많은순')").bind("click", function() {
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=2";
				});
				$("b:contains('내가 작성한 게시물')").bind("click", function() {
					location.href = "/clubPost/getClubPostList?clubNo="+${ clubPostList[0].clubNo }+"&order=3";
				});
				$("a:contains('검색')").bind("click", function() {
					$("input[name='currentPage']").val("1");
					$("form").submit();
				});
				
				//무한 페이징
				var currentPage = 1;
				$(window).scroll(function() {
					var maxHeight = $(document).height();
					var currentScroll = Math.ceil($(window).scrollTop() + $(window).height());
					
					if(currentScroll >= maxHeight) {
						
						currentPage++;
						//alert(currentPage);
						$("input[name='currentPage']").val(currentPage);
						
						var clubNo = "2";
						var searchCondition = $("option:selected").val();
						var searchKeyword = $("input[name='searchKeyword']").val();
						var order = $("input[name='order']").val();
						
						//alert(searchCondition);
						//alert(searchKeyword);
						//alert(order);
						
						$.ajax({
							url : "/clubPostRest/json/getClubPostList",
							type : "post",
							dataType : "json",
							data : JSON.stringify({
								pageUnit : clubNo,
								currentPage : currentPage,
								searchCondition : searchCondition,
								searchKeyword : searchKeyword,
								order : order
							}),
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function( JSONData, status ) {
								alert(status);
								
								console.log(JSONData.search);
								console.log(JSONData.clubPostListCount);
								console.log(JSONData.clubPostList);
							}// end of success
						});// end of ajax				
					}// end of if			
				}); // end of scroll
				
				
				
			});// end of function()
			
			//썸네일 클릭시 상세상품조회 페이지 or 상품수정 페이지로 이동
			function getClubPostGo(clubPostNo){
				location.href = "/clubPost/getClubPost?clubPostNo="+clubPostNo;
			}
			
			// 닉네임, 프로필사진 클릭시 해당 유저의 마이홈피로 이동
			function getMyHomeGo(userId){
				location.href = "/myHome/getYourHome?userId="+userId;
			}
		</script>
		
		<style type="text/css">
			.clubPostList-Thumbnail {
				background-color: blue;
			}
			.contains-order {
				font-size: 15px;
			}
		</style>
		
	</head>
<body class="portfolio">

	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script src="js/plugins.js"></script>
	<script src="js/beetle.js"></script>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	

		<main role="main">
			<div id="intro-wrap" class="full-height"><!-- 상단 검은색 공통 영역 -->
				<div id="intro" class="preload darken more-button">					
					<div class="intro-item" style="background-image: url(http://placehold.it/1800x600/ddd/fff&text=Beetle%20image);">
						<div class="caption">
							<h2>Tools</h2>
							<p>For me, the camera is a sketch book, an instrument of intuition and spontaneity.</p>
						</div><!-- caption -->	
						<div class="photocaption">
							<h4>A shot by <a href="http://madebyvadim.com/" target="blank" alt="Vadim Sherbakov">Vadim Sherbakov</a></h4>
						</div><!-- photocaption -->											
					</div>								
				</div><!-- intro -->
			</div><!-- intro-wrap -->

			<div id="main" class="row"><!-- 중간 개별영역 -->
			
				<div class="row-content buffer clear-after" style="padding-right: 0px;">
				
				
				
					<ul class="inline cats filter-options" style="font-size: 40px;">
						<li data-group="advertising">
							<a href="/club/getClubList">모임 일정</a>
						</li>
						<li data-group="fun">
							<a href="/clubPost/getClubPostList">모임 게시물</a>
						</li>
						<li data-group="icons">
							<a href="/club/getClubMemberList">모임원</a>
						</li>
						<li data-group="infographics">
							<a href="#">모임 채팅</a>
						</li>
						<%-- <li data-group="infographics">
							<a href="/clubPost/addPayView?clubNo=${ clubPostList[0].clubNo }">결제</a>
						</li> --%>
					</ul>
					
					
					
					<div class="grid-items preload">
					
					
							<!--  화면구성 div Start /////////////////////////////////////-->
						<div class="column nine">
						
						
							    
							    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
							    <div class="contains-search">
							    
								    <div class="contains-order">
								    	<p class="text-primary" style="width: 87%">
								    		전체  ${ clubPostListCount } 건수, 현재 ${ search.currentPage } 페이지&nbsp;&nbsp;&nbsp;&nbsp;
											<b>최신순</b>&nbsp;/&nbsp;
											<b>오래된순</b>&nbsp;/&nbsp;
											<b>좋아요 많은순</b>&nbsp;/&nbsp;
											<b>내가 작성한 게시물</b>
											<!-- <a href="/clubPost/getClubNoticeList">모임공지사항</a> -->
											<a class="button transparent aqua" style="float: right;">등록하기</a>
								    	</p>
								    </div>
								    
									<div class="contains-search" >
										<form class="form-inline" name="detailForm" action="/clubPost/getClubPostList" method="post">
											
											<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
											<input type="hidden" name="currentPage" value=""/>
											<input type="hidden" name="order" value="${ search.order }">
										  
										</form>
									</div>
							    	
							    </div>
							    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
							    
							    
							    
							    <!-- 썸네일로 list display start -->
								<div class="row">
									<c:set var="i" value="${ clubPostList }"></c:set>
									<c:if test="${ clubPostListCount > 0}">
									<c:forEach var="i" begin="0" end="${ fn:length(clubPostList) - 1 }" step="1">
										<div class="col-md-4">
											<a href="javascript:getClubPostGo('${ clubPostList[i].clubPostNo }')">
												<img src="/resources/image/uploadFiles/${ clubPostList[i].image1 }" height="400" width="700">
												<%-- <c:if test="${ empty clubPostList[i].clubPostVideo1 }">
													<img src="/resources/image/uploadFiles/${ clubPostList[i].image1 }" height="400" width="700">
												</c:if>
												<c:if test="${ ! empty clubPostList[i].clubPostVideo1 }">
													<img src="https://img.youtube.com/vi/${ clubPostList[i].clubPostVideo1 }/mqdefault.jpg" alt="유튜브 동영상 이미지입니다." height="400" width="700">
												</c:if> --%>
											</a>
											
											<div style="display: flex; width: 87%;">
												<div style="flex:1;">
													<a href="javascript:getMyHomeGo('${ clubPostList[i].user.userId }')">
														<img src="/resources/image/uploadFiles/${ clubPostList[i].user.profileImage }" height="100" width="100">
													</a>
												</div>
												<div style="flex:1;">
													<a href="javascript:getMyHomeGo('${ clubPostList[i].user.userId }')">
														<p align="center" style="font-size: 30px; color: red;">${ clubPostList[i].user.nickName }</p>
													</a>
												</div>
												<div style="flex:1;">
													<p align="center" style="font-size: 30px">${ clubPostList[i].clubPostHeartCount }</p>
												</div>
												<div style="flex:1;">
													<!-- 변수 선언 1이면 좋아요한 게시물 0이면 좋아요 안한 게시물 -->
													<c:set var="heart_condition" value="0"/>
													<c:if test="${ fn:length(heartList) > 0}">
														<c:forEach var="k" begin="0" end="${ fn:length(heartList) - 1 }" step="1">
															<c:if test="${ clubPostList[i].clubPostNo == heartList[k].sourceNo }">
																<c:set var="heart_condition" value="1"/>
															</c:if>
														</c:forEach>
													</c:if>
													<img src="/resources/image/uploadFiles/${ heart_condition == 1 ? 'heart.jpg' : 'no_heart.jpg' }" height="50" width="50">
												</div>
												
											</div>
											<div style="width: 87%;">
												<p align="center" style="font-size: 30px">${ clubPostList[i].clubPostTitle }</p>
											</div>
											
											<br><br>
											
										</div>
									</c:forEach>
									
									</c:if>
									<c:if test="${ clubPostListCount == 0}">
										<h4>해당되는 게시물이 없습니다.</h4>
									</c:if>
								</div>
								<!-- 썸네일로 list display end -->
							    
							    
							    
							
						
						</div><!-- grid-items -->
						<!--  화면구성 div End /////////////////////////////////////-->
						
						
						
						
						
						<aside role="complementary" class="sidebar column three last">
							<div class="widget widget_search">
								<form role="search">
									<span class="pre-input"><i class="icon icon-search"></i></span>
									
										<div style="float: left; width: 65%;">
											<input type="text"  name="searchKeyword" placeholder="내용을 입력" class="plain buffer" value="${ ! empty search.searchKeyword ? search.searchKeyword : '' }">
										</div>
									
										<%-- <div class="form-group" style="flex: 1;">
											<select class="form-control" name="searchCondition" >
												<option value="0"  ${ ! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>아이디</option>
												<option value="1"  ${ ! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>내용</option>
											</select>
										</div> --%>
										
										<div style="display: inline-block;">
											<a class="button transparent aqua">검색</a>
										</div>
									
								</form>
							</div>
						</aside>
						
						
						
					</div>
				</div><!-- row-content -->
			</div><!-- row -->
		</main><!-- main -->
		
		
		
		

		<footer role="contentinfo"><!-- 하단 검은색 영역 -->
			<div class="row">
				<div class="row-content buffer clear-after">
					<section id="top-footer">
						<div class="widget column three">
							<h4>Menu</h4>
							<ul class="plain">
								<li><a href="home-01.html">Home</a></li>
								<li><a href="works-3-columns.html">Portfolio</a></li>
								<li><a href="blog-4-columns-masonry.html">Blog</a></li>
								<li><a href="resume.html">Resume</a></li>
								<li><a href="file:///Users/pasqualevitiello/My%20Folder/Job/Envato/PR%20Themeforest/Flattie/Markup/Beetle/contact.html">Contact</a></li>
							</ul>
						</div>
						<div class="widget column three">
							<h4>Archives</h4>
							<ul class="plain">
								<li><a href="#">March 2014</a></li>
								<li><a href="#">April 2014</a></li>
								<li><a href="#">May 2014</a></li>
								<li><a href="#">June 2014</a></li>
								<li><a href="#">July 2014</a></li>
							</ul>
						</div>								
						<div class="widget column three">
							<h4>Widget</h4>
							<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
						</div>				
						<div class="widget meta-social column three">
							<h4>Follow Us</h4>
							<ul class="inline">
								<li><a href="#" class="twitter-share border-box"><i class="fa fa-twitter fa-lg"></i></a></li>
								<li><a href="#" class="facebook-share border-box"><i class="fa fa-facebook fa-lg"></i></a></li>
								<li><a href="#" class="pinterest-share border-box"><i class="fa fa-pinterest fa-lg"></i></a></li>
							</ul>
						</div>														
					</section><!-- top-footer -->
					<section id="bottom-footer">
						<p class="keep-left">&copy; 2014 <a href="http://mokaine.com/" alt="Mokaine Lab">Mokaine</a>. All Rights Reserved.</p>
						<p class="keep-right">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.</p>
					</section><!-- bottom-footer -->			
				</div><!-- row-content -->	
			</div><!-- row -->	
		</footer>

</body>
</html>