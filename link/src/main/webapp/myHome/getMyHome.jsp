<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>

<head>

<title>噺据舛左繕噺</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) 硲什闘 紫遂 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript">
		
		//==> 蓄亜吉採歳 : "呪舛" "溌昔"  Event 尻衣 貢 坦軒
$(function() {
	//==> DOM Object GET 3亜走 号狛 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
 	$("#sgr:contains('覗稽琶')").on("click" , function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "/myHome/getProfile?userId=${user.userId}"
	}); 
	$("#gg:contains('穣汽戚闘')").on("click" , function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "/myHome/updateProfile?userId=${user.userId}"
	});
	$("#ff:contains('独稽酔軒什闘')").on("click" , function() {
		//$(self.location).attr("href","/user/logout");
		self.location = "/myHome/getFollowList?userId=${user.userId}"
	}); 
	

 });
 $(function(){


     $(".pp").on("click" , function() {
   
           var userId = $(".pp").html();
           console.log(userId);
           alert("持失");
           // 戚惟照吉陥澗暗走?しししし
           $(document).ready(function(){
        		$.ajax({
        			type: 'GET',   //get号縦生稽 誤獣
        			url : '/myHomeRest/json/addFollow/'+userId,  //戚疑拝 jsp 督析 爽社
        			dataType:'json',   //庚切莫縦生稽 閤奄
        			success: function(data){   //汽戚斗 爽壱閤奄 失因梅聖 井酔 叔楳拝 衣引
        	            //function(data)研 床惟 鞠檎 穿含閤精 汽戚斗亜 data照拭 眼焼辞 級嬢神惟 吉陥. 
        				alert(data);   
        			},
        			error:function(data){   //汽戚斗 爽壱閤奄亜 叔鳶梅聖 井酔 叔楳拝 衣引
        				alert('叔鳶');
        			}
        		})
        	});
              
     });
 });			
 $(function(){


     $(".pp").on("click" , function() {
   
           var userId = $(".pp").html();
           console.log(userId);
           alert("持失");
           // 戚惟照吉陥澗暗走?しししし
           $(document).ready(function(){
        		$.ajax({
        			type: 'GET',   //get号縦生稽 誤獣
        			url : '/myHomeRest/json/addFollow/'+userId,  //戚疑拝 jsp 督析 爽社
        			dataType:'json',   //庚切莫縦生稽 閤奄
        			success: function(data){   //汽戚斗 爽壱閤奄 失因梅聖 井酔 叔楳拝 衣引
        	            //function(data)研 床惟 鞠檎 穿含閤精 汽戚斗亜 data照拭 眼焼辞 級嬢神惟 吉陥. 
        				alert(data);   
        			},
        			error:function(data){   //汽戚斗 爽壱閤奄亜 叔鳶梅聖 井酔 叔楳拝 衣引
        				alert('叔鳶');
        			}
        		})
        	});
              
     });
 });			
 
</script>
<style>
.calendar {
	margin: 0 auto;
	width: 1000px;
	display: flex;
	justify-content: center;
}
</style>

<style>
.image {
	margin: 0 auto;
	width: 400px;
	text-align: center;
}

.to {
	margin: 0;
	width: 350px;
	text-align: left;
}

.usertext {
	margin-right: 10px;
	padding: 10px;
	margin-left: -100px;
}

.calendertext {
	padding: 10px;
}
</style>



</head>

<body bgcolor="#ffffff" text="#000000">


<div class="calendar">

		<div class="usertext">
			<table width="300px" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 13px;" class="to">
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
                    
					<td width="104" class="ct_write">焼戚巨</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105" class="pp">${user.userId}</td>  
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>

				<tr>
					<td width="104" class="ct_write">戚硯</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${user.nickName}</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">爽社</td>
					<td bgcolor="D6D6D6" width="1"></td>

				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">戚五析</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							
							
								
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>

				<tr>
					<td width="104" class="ct_write">亜脊析切</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td height="26">${club.clubTitle}</td>
					<td height="26">${user.nickName}</td>
					<td height="26">${user.phoneNo}</td>
					<td height="26">${club.clubDetail}</td>
					<td height="26">${club.clubArea}</td>
					<td height="26">${club.clubArea}</td> 
					<td>${feedList}</td>
					<td>${clubList}</td>

				</tr>
				<tr>
					<td width="104" class="ct_write">切奄社鯵</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<li><a href="#" id="ss">独稽酔</a></li>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td width="104" class="ct_write">切奄社鯵</td>
					<td bgcolor="D6D6D6" width="1"></td>

					<td width="53%"></td>
					<td align="right">
						<table border="0" cellspacing="0" cellpadding="0">

							<li><a href="#" id="sgr">覗稽琶</a></li>
							<li><a href="#" id="gg">穣汽戚闘</a></li>
							<li><a href="#" id="ff">独稽酔軒什闘</a></li>
							<li><a href="#" id="zz">独独軒什闘</a></li>
<a href="/myHome/getMyHome?userId=user11" id="zz">政煽11</a></li>
							<tr>
           
								<!--	jQuery Event 坦軒稽 痕井
					
						<a href="javascript:history.go(-1);">溌昔</a>
						
					-->
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="calendertext">
			<jsp:include page="/myHome/calendar.jsp" />
		</div>
		<div>
			<td width="104" class="ct_write">切奄社鯵</td>
			<td bgcolor="D6D6D6" width="1"></td>

		</div>

		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-6 text-center"></div>
			
<p id="demo"></p><br>
<button type="button" class="abc" value="${user.userId}">適遣</button>
<!-- json 災君辞 p殿益拭 隔奄 -->
<script type="text/javascript">
$(document).ready(function() {
	$("button").click(function() {
		var userId = $(".abc").val();
		console.log($(".abc").val());
		alert("持失");
		$.ajax({
			url : "/myHomeRest/json/getFollowList", // 嬢巨稽 哀暗艦? // 哀 凶 汽戚斗
			type : "POST", // 展脊精 校 承暗艦?
			datatype : "json",
			 data		:  JSON.stringify({userId}),
			contentType : "application/json",
			success : function(data) { // 穐陥紳 陥製 衣引葵
				alert('seccuss');	// 蟹神檎 督析聖 達紹陥澗 依
			//	alert(data);  // [object Object],[object Object],[object Object]
				
			// 汽戚斗研 溌昔馬壱 粛聖 凶.
			//	let str = JSON.stringify(data); // <> parse()
			//	alert(str); 
           console.log(data.list[0].receiveId.nickName);
				$.each(data.list, function(index, item) { // 汽戚斗 =item
					$("#demo").append(index + " "); // index亜 魁劾凶猿走 
					$("#demo").append(item.receiveId.userId + " ");
					$("#demo").append(item.receiveId.nickName + " ");
					$("#demo").append(item.receiveId.name + " ");
					$("#demo").append(item.receiveId.profileImage + "<br>");
					console.log(item.receiveId);
				});
			},
			error : function() {
				alert('error');			
			}
			
		});
		
		
	});
	
	
});


$(function(){
	$("#demo").on("click", function(){
		
		self.location ="/myHome/getMyHome?userId=" + $(this).text().trim();
	});
});


</script>		
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
</body>

</html>