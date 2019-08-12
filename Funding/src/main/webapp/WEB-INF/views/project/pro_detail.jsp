<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
<%@ include file="../include/navbar.jsp"%>
<%@ include file="project_navbar.jsp"%>

<h2>${dto.pro_name}</h2>


<form role="form" id="send_pro_id" method="get"
		action="${path}/reward/step10/${dto.pro_id}">
	
</form>
<button type="button" id="fbtn">펀딩하기</button>
</body>
	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);
			$("#fbtn").on("click", function() {
				if(!("${login.mem_idx}")) alert("로그인해주세요");
				else formObj.submit();
			});
		});
	</script>
</html>