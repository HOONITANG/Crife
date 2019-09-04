<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/script.jsp"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Myorder 결제내역 보기</title>
<style>
.glyphicon-lg
{
    font-size:4em
}
.info-block
{
    border-right:5px solid #E6E6E6;margin-bottom:25px
}
.info-block .square-box
{
    width:100px;min-height:110px;margin-right:22px;text-align:center!important;background-color:#676767;padding:20px 0
}
.info-block.block-info
{
    border-color:#20819e
}
.info-block.block-info .square-box
{
    background-color:#20819e;color:#FFF
}    
</style>
</head>
<body>
<div class="container">
	<h2>리워드 목록</h2>
	<br>
	<c:forEach items="${rewardList}" var="rewardlist">
    <div class="row">
        <div class="col-md-6">
            <div class="card mb-3">
                <img src="../images/ryan.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title"><a href="${path}/mypage/myorder/orderdetail/${rewardlist.order_id}">${rewardlist.pro_name}</a></h5>
                    <p class="card-text">${rewardlist.mem_name}</p>
                    ${rewardlist.pro_category}->카테고리 필터링           
                    <p class="card-text">
                    <small class="text-muted">${rewardlist.order_date}</small></p>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
</div>  
<div class="container">
	<div class="row">
		<h2>리워드 목록</h2>
		<br>
        <div class="searchable-container">
        	<c:forEach items="${rewardList}" var="rewardlist">
            <div class="items col-xs-12 col-sm-6 col-md-6 col-lg-6 clearfix">
               <div class="info-block block-info clearfix">
                    <div class="square-box pull-left">
                        <span class="glyphicon glyphicon-user glyphicon-lg"></span>
                    </div>
                    <!-- <h5>Company Name</h5> -->
                    <h4>프로젝트 이름: <a href="${path}/mypage/myorder/orderdetail/${rewardlist.order_id}">${rewardlist.pro_name}</a></h4>
                    <p>${rewardlist.pro_category}->카테고리 필터링</p>
                    <span>메이커이름: ${rewardlist.mem_name}</span>
                </div>
            </div>
            </c:forEach>
        </div>
	</div>
</div>

<%-- <form >
<input type="button" value="나의 리워드">
<table>
<tr>
<td> 프로젝트 이름  </td>
<td> 카테고리 </td>
<td> 메이커 이름  </td>
<td> 주문번호 </td>
</tr>
<c:forEach items="${rewardList}" var="rewardlist">
<tr>
	<td><a href="${path}/mypage/myorder/orderdetail/${rewardlist.order_id}">${rewardlist.pro_name}</a></td>
	<td>${rewardlist.pro_category }</td>
	<td>${rewardlist.mem_name}</td>
	<td>${rewardlist.order_id}</td>
</tr>
</c:forEach>
</table>
</form> --%>

</body>
</html>