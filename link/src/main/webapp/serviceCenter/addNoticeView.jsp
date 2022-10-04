<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<title>�������� ���</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="../javascript/calendar.js"></script>

	
	<script type="text/javascript">
	
	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	function fncAddNotice(){

		var title = $("input[name='noticeTitle']").val();
		var content = $("input[name='noticeContent']").val();
		var regDate = $("input[name='noticeRegDate']").val();
		var image = $("input[name='noticeImage']").val();		
		
		if(title == null || title.length < 1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
			}
		if(content == null || content.length < 1){
			alert("������ �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
			}	
		
	
		
		$($("form")[0]).attr("method", "POST").attr("action", "/serviceCenter/getNotice").submit();
	} //funtion AddNotice ��
	

	$(function(){
				
		$("button:contains('���')").bind("click", function(){
			
			fncAddNotice();
		});

		$("button:contains('�ڷ�')").bind("click", function(){
			
			history.go(-1);
		})
		
		$("img[src='../images/ct_icon_date.gif']").bind("click", function(){
			
			var manuDate = $("input[name='manuDate']");
			/* alert("1"); */
			
			show_calendar('manuDate', manuDate.val());
			
		});
		
	});
	
	</script>

</head>

<body>


	<!-- form Start /////////////////////////////////////-->
	<div class="container">
		<div></div>
		<div class="page-header text-center">�� �� �� �� �� �Ϥ�</div>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="noticeTitle" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="noticeTitle" name="noticeTitle">
		       <span id="helpBlock" class="help-block">
		      	
		      </span>
		    </div>
		    
		  </div>

		  <div class="form-group">
		    <label for="noticeContent" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="noticeContent" name="noticeContent" >
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="noticeImage" class="col-sm-offset-1 col-sm-3 control-label">÷�� ����</label>
		    <div class="col-sm-4">
		      <input multiple="multiple" type="file" name="noticeImage" class="ct_input_g" 
							style="width: 200px; height: 19px" maxLength="13"/>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" >���</button>
			  <button type="button" class="btn btn-primary" >�ڷ�</button>
		    </div>
		  </div>
		</form>
		
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>