<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="/resources/javascript/plugins.js"></script>
<script src="/resources/javascript/beetle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
.row {
	margin-left : 0px !important;
	    display: inherit;
}
body {
	padding-top: 50px;
	background-color: #EBEDF0 !important;
    margin-top: -54px !important;
}

.head {
	background-color: #5F0080;
     background-image: linear-gradient(315deg, #5F0080  30%, #BD76FF 74%);
	border: 1px solid #bcbcbc;
	align = center;
}


.content {

	width: 500px;
}

.btn-13 {
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background-color: white;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  border: solid 2px;
  box-shadow:none !important;
  outline: none;
  box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
  border-radius: 10px;
  padding: 10px;
  color: #5F0080 !important;
  font-size: 16px !important;
  text-align: center;
}

.btn-13:hover { 
   background-color: #5F0080;
   box-shadow: rgba(102, 051, 102, 0.3) 0px 19px 38px, rgba(95, 0, 128, 0.22) 0px 15px 12px;
   border-radius: 10px;
   color: white !important;
   font-size: 16px !important;
   text-align: center;
   border: solid 2px;
}

.waviy {
  position: relative;
}
.waviy span {
  position: relative;
  display: inline-block;
  font-size: 5px;
  color: #5F0080;
  text-transform: uppercase;
  animation: flip 1s infinite;
  animation-delay: calc(.2s * var(--i))
}
@keyframes flip {
  0%,80% {
    transform: rotateY(360deg) 
  }
}
.darkover {
    	position: sticky !important;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    width:1800px;
 	   background: rgba(0,0,0,0.35);
 	   }


}

</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">

function fncGetList(currentPage) {
	
	if(${user.role=='1'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "GET").attr("action", "/serviceCenter/getReportList")   //전체보기
				.submit();
		
	}else if (${user.role=='0'}){
		$("#currentPage").val(currentPage)
		$("form").attr("method","post").attr("action","/serviceCenter/getReportList/${sessionScope.user.userId}").submit();   //나만보기
				
    }
}
	$(function() {
		$("td:nth-child(3)").on(
				"click",
				function() {
					self.location = "/serviceCenter/getReport?no="+ $(this).parent().find("td:eq(0)").text()
							});

		$("button:contains('뒤로')").bind("click", function() {
			self.location = "/serviceCenter/serviceCenterHome.jsp";
		})

	});
</script>

</head>
	<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="/toolbar.jsp" />

	<!-- ToolBar End /////////////////////////////////////-->
<body>  
<div class="page-header" align="center" style="transform: translate(-395px, 149px);">
  <h1 >신고 리스트</h1>
</div>
	<div class="container">

		<div class="row1">

		<div class=" text-left">
				<div class="col-md-3 col-sm-3 col-xs-6"> 
									</div>
				<p class="text" style="text-align-last:end; transform: translate(-44px, 22px);">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>
			</div>


			<!-- table 위쪽 검색 Start /////////////////////////////////////-->

			<div class="col-md-6 text-right" style= "transform: translate(600px, 0px);">
					<form class="form-inline" name="detailForm">
						
						<div class="form-group">
							<select class="form-control" name="searchCondition" style="vertical-align: top;">
								<option value="0"
									${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>번호</option>
								<option value="1"
									${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>제목</option>
							</select>

							<label class="sr-only" for="searchKeyword" style="color:#BD76FF;">검색어</label> <input
								type="text" class="form-control" id="searchKeyword" width="200px"
								name="searchKeyword" placeholder="검색어" style="transform: translate(10px, 8px); width:300px; "
								value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>

							<button type="button" class="custom-btn btn-13" style="transform: translate(20px, 0px); width: 70px; height :26px;">검색</button>

						<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
						<input type="hidden" id="currentPage" name="currentPage" value="1" />
					</form>
				</div>


		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
			<table   style="text-align-last: center; background-color:white;">
				<div class="row2">
			  <thead class="bg-primary text-white">
					<tr class = "head" id ="head" >
						<th align="center">No</th>
						<td />
						<th align="center" class="content">제목</th>
						<td />
						<th align="center">진행상황</th>
						<td />
						<th align="center">신고받는 ID</th>
						<td />
						<th align="center" width="140">작성 날짜</th>
					</tr>
				</thead>
				
				
				<tbody>
			
					<c:set var="i" value="0" />
					<c:forEach var="getReportList" items="${getReportList}">
						<c:set var="i" value="${i + 1}" />
						<tr class="ct_list_pop">
							<td align="center" id="bb">${getReportList.no}</td>
							<td></td>
							<td align="center" class="content">${getReportList.title}	
							<c:if test="${getReportList.reportImage1 !=null || getReportList.reportImage2 != null}">
							<img src="/resources/image/uploadFiles/파일.png" style="width:15px; height:15px; display: inline;">
							</c:if>	
							</td>
							<td></td>
							<c:if test="${getReportList.reportCondition=='1'}">
								<td align="center" >처리완료</td>
							</c:if>
							<c:if test="${getReportList.reportCondition=='0'}">
								<td align="center" >대기중</td>
							</c:if>
							<td></td>
							<td align="center">${getReportList.user2.userId}</td>
							<td>
							<input type="hidden" name="order" id="order" value="${search.order}">
							</td>
							<td align="left">${getReportList.regDate}</td>
							

							
					</c:forEach>
				</tbody>
		</table>
		<!--  table End /////////////////////////////////////-->
		<!-- PageNavigation Start... -->

		<jsp:include page="../common/pageNavigator_n.jsp" />

		<!-- PageNavigation End... -->

		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">

					<table border="0" cellspacing="0" cellpadding="0">
						<tr>


							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="ct_write01"><input type="hidden" id="Quantity"
										name="Quantity" value="1" /></td>
								</tr>
							</table>
							<td width="30"></td>


							<div class="col-md-3 col-sm-3 col-xs-6">

								<button class="custom-btn btn-13" style= "transform: translate(957px, -90px); margin-left::20px; ">
									뒤로</button>
							</div>


						</tr>
					</table>

				</td>
			</tr>
		</table>
	</div>
	</div>
	</div>
	<!--  화면구성 div End /////////////////////////////////////-->



</body>

</html>