<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">  
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <!-- addMeetingCss -->
  <link rel="stylesheet" href="/resources/css/addUser.css">
  
  
  	<!--  	jQuery UI toolTip 사용 JS -->
  <!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->
  
  <script src="http://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <!-- <script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script> -->
		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	
	
	
	<style>
	  body>div.container {
			border: 3px solid #D6CDB7;
			margin-top: 10px;
		}       
        
    </style>
    
<script type="text/javascript">


	function fncAddClub() {

		////////////////////////////////////////////////////
		//document.detailForm.action = '/addProduct.do';
		///////////////////////////////////////////////////

		$("form").submit();
	}


	$(function() {

		$("button.btn.btn-primary").on("click", function() {
			//alert($("td.ct_btn01:contains('등록')").html());
			fncAddClub();
		});
	});

	// 	 function resetData() {
	// 		document.detailForm.reset();
	// 	} 

	$(function() {

		$("a[href='#']").bind("click", function() {
			history.go(-1);
		});
	});

</script>
</head>

<body>
	<form class="form-horizontal" method="post" action="/club/addClub" enctype="multipart/form-data">
		<div class="wrap wd668">
			<div class="container">
				<div class="form_txtInput">
					<h2 class="sub_tit_txt">모 임 등 록</h2>
					<p class="exTxt">새로운 모임을 등록해보세요...</p>
					<div class="join_form">
		
		<!-- <form class="form-horizontal" method="post" action="/club/addClub" enctype="multipart/form-data"> -->
		
			<div class="form-group">
				<label for="clubTitle" class="col-sm-offset-1 col-sm-3 control-label">모 임 제 목</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="clubTitle" name="clubTitle" placeholder="모임제목은 필수입니다" style="width:300px;">
				</div>					
			</div>
			
			
		
			<div class="form-group">
				<label for="clubDetail" class="col-sm-offset-1 col-sm-3 control-label">모 임 설 명</label>
				<div class="col-sm-4">
					<input type="text" height="150px" class="form-control" id="clubDetail" name="clubDetail" placeholder="모임설명은 필수입니다. (최대 500자)" style="width:300px;">
				</div>		
			</div>
			
			<div class="form-group">
				<label for="clubCategory" class="col-sm-offset-1 col-sm-3 control-label" >모임카테고리</label>
				<div class="col-sm-4">
					<!-- <select class="form-control"> -->
					<select class="form-control" id="clubCategory" name="clubCategory" style="width:300px;">
						<option value="운동">운동</option>
  						<option value="봉사활동">봉사활동</option>
  						<option value="음식">음식</option>
						<option value="여행">여행</option>
						<option value="반려동물">반려동물</option>
						<option value="게임">게임</option>
						<option value="음악/댄스">음악/댄스</option>
						<option value="독서">독서</option>
						<option value="기타">기타</option>
					</select>
				</div>			    
			</div>			
			
			<div class="form-group">
				<label for="clubArea" class="col-sm-offset-1 col-sm-3 control-label">활 동 영 역</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="clubArea" name="clubArea" style="width:300px;">
				</div>		
			</div>			
			
			<div class="form-group">
				<label for="clubImage" class="col-sm-offset-1 col-sm-3 control-label">모임이미지</label>
				<div class="col-sm-4">
					<input type="file" name="file" class="file" id="clubImage" multiple="multiple">
				</div>		
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
		      		<button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
					<a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
			</div>
			</div>
		</div>
		</div>
		</div>	
			
		</form>	
		
		
</body>
</html>