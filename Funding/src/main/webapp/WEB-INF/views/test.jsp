<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>topnavbar</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
nav.navbar-findcond { background: #fff; border-color: #ccc; box-shadow: 0 0 2px 0 #ccc; }
nav.navbar-findcond a { color: black; }
nav.navbar-findcond ul.navbar-nav a { color: black; border-style: solid; border-width: 0 0 2px 0; border-color: #fff; }
nav.navbar-findcond ul.navbar-nav a:hover,
nav.navbar-findcond ul.navbar-nav a:visited,
nav.navbar-findcond ul.navbar-nav a:focus,
nav.navbar-findcond ul.navbar-nav a:active { background: #fff; }
nav.navbar-findcond ul.navbar-nav a:hover { border-color: black; }
nav.navbar-findcond li.divider { background: #ccc; }
nav.navbar-findcond button.navbar-toggle { background: black; border-radius: 2px; }
nav.navbar-findcond button.navbar-toggle:hover { background: #999; }
nav.navbar-findcond button.navbar-toggle > span.icon-bar { background: #fff; }
nav.navbar-findcond ul.dropdown-menu { border: 0; background: #fff; border-radius: 4px; margin: 4px 0; box-shadow: 0 0 4px 0 #ccc; }
nav.navbar-findcond ul.dropdown-menu > li > a { color: #444; }
nav.navbar-findcond ul.dropdown-menu > li > a:hover { background: black; color: #fff; }
nav.navbar-findcond span.badge { background: black; font-weight: normal; font-size: 11px; margin: 0 4px; }
nav.navbar-findcond span.badge.new { background: rgba(255, 0, 0, 0.8); color: #fff; }

</style>
</head>
<body>
<nav class="navbar navbar-findcond navbar-fixed-top">
    <div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">HOME</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${path}/project/listv">프로젝트 더보기</a></li>
				<li><a href="${path}/community/notice/notice.do">공지사항</a></li>
				<li><a href="${path}/admin/adminhome.do">관리자</a></li>
				<li class="right"><a href="${path}/project/check">펀딩오픈신청</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">로그인 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<c:if test="${sessionScope.login == null}">
							<li class="right"><a href="${path}/user/login">로그인</a></li>
							<li class="right"><a href="${path}/user/join">회원가입</a></li>
						</c:if>
						<c:if test="${sessionScope.login != null}">
							<li class="right"><a href="${path}/user/logout">로그아웃</a></li>
						</c:if>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">내 정보 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">내 프로젝트 목록</a></li>
						<li><a href="#">내 리워드 목록</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
</body>
</html>