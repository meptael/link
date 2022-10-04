<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[value='���ӰԽù����']").bind("click", function(){
		location.href = "/clubPost/addClubPostView?clubNo=10";
	});
});
</script>
</head>
<body>
���ӰԽù� ����Ʈ ���� : ${ map.clubPostListCount }</br>
<c:if test="${ map.clubPostListCount > 0 }">
<c:forEach var="i" begin="0" end="${ map.clubPostListCount - 1 }" step="1">
${ map.clubPostList[i].clubPostNo } - 
${ map.clubPostList[i].clubPostTitle } - 
${ map.clubPostList[i].clubPostContent } - 
${ map.clubPostList[i].user.nickName } - 
${ map.clubPostList[i].user.userId }</br>
</c:forEach>
</c:if>
<input type="button" value="���ӰԽù����">
<%-- <a href="/clubPostRest/getClubPostListRecent/${ clubNo }">�ֽż�</a> --%>
<a href="/clubPostRest/getClubPostList?clubNo=2">�ֽż�</a>
<a href="/clubPostRest/getClubPostListMySelf?clubNo=10">���� �ۼ��� �Խù�</a>
<a href="/clubPostRest/getClubPostListLike?clubNo=10">���ƿ� ������</a>
<a href="/clubPostRest/getClubPostListMyHome">����Ȩ��</a>
</body>
</html>