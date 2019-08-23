<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/script.jsp"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Myorder 결제내역 보기</title>
<!--font awesome-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- bootstrap 적용 -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<style>
.invoice-title h2, .invoice-title h3 {
    display: inline-block;
}

.table > tbody > tr > .no-line {
    border-top: none;
}

.table > thead > tr > .no-line {
    border-bottom: none;
}

.table > tbody > tr > .thick-line {
    border-top: 2px solid;
}
</style>    
</head>
<body>
<form>
<div class="container">
    <div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>결제상세내역</h2>
    			<h3 class="pull-right">Order #${orderinfo.order_id}</h3>
    		</div> 
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>프로젝트 정보:</strong><br>
    					${proinfo.pro_name}<br>
    				<strong>프로젝트 종료일:</strong><br>	
    					${proinfo.pro_end}<br>
    				<strong>메이커:</strong>
    					${meminfo.mem_name}<br>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
        			<strong>배송지 To:</strong><br>
    					${shipinfo.order_name}<br>
    					${shipinfo.order_address1}<br>
    					${shipinfo.order_address3}<br>
    					${shipinfo.order_address4}
    				</address>
    			</div>
    		</div>
    		<!-- row -->
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
    				<address>
    					<strong>Order Date:</strong><br>
    					${orderinfo.order_date}<br><br>
    				</address>
    			</div>
    		</div>
    		<!-- row -->
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>주문 정보</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Reward</strong></td>
        							<td class="text-center"><strong>가격</strong></td>
        							<td class="text-center"><strong>수량</strong></td>
        							<td class="text-right"><strong>Totals</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<c:set var="total" value="0" />
    							<c:forEach items="${rewardinfo}" var="rewards">
    							<tr>
    								<td>
    								${rewards.reward_title}<br>
    								<small class="text-muted">${rewards.reward_description}</small>
    								</td>
    								<td class="text-center"><fmt:formatNumber pattern="###,###,###" value= "${rewards.reward_price}"/>원</td>
    								<td class="text-center">${rewards.order_qty}</td>
    								<td class="text-right"><fmt:formatNumber pattern="###,###,###" value= "${rewards.reward_price * rewards.order_qty}"/>원</td>
    							</tr>
    							<c:set var="total" value="${total + (rewards.reward_price * rewards.order_qty)}" />
    							</c:forEach>
    							<tr>
    								<td class="thick-line"></td>
    								<td class="thick-line"></td>
    								<td class="thick-line text-center"><strong>Subtotal</strong></td>
    								<td class="thick-line text-right"><fmt:formatNumber pattern="###,###,###" value= "${total}"/>원</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Shipping</strong></td>
    								<td class="no-line text-right">$15</td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
    								<td class="no-line text-center"><strong>Total</strong></td>
    								<td class="no-line text-right">$685.99</td>
    							</tr>
    						</tbody>
    					</table>
    				</div>
    			</div>
    			<!-- panel body -->
    		</div>
    		<!-- panel panel-default -->
    	</div>
    	<!-- col-md-12 -->
    	<div class="btn-backlist">	
			<a class="btn btn-primary stretched-link" href="${path}/mypage/myorder/orderlist">목록으로 이동하기</a>
		</div>
    </div>
    <!-- row -->   
</div>

<%-- <h2>주문정보</h2>
<p> 주문번호: ${orderinfo.order_id} </p>
<p> 주문날짜: ${orderinfo.order_date} </p>
<h2>프로젝트정보</h2>
<p> 프로젝트 종료일: ${proinfo.pro_end} </p>
<p> 프로젝트 이름:  ${proinfo.pro_name} </p>
<h2>메이커정보</h2>
<p> 메이커 이름: ${meminfo.mem_name } </p>
<h2>배송정보</h2>
<p> 주문자 이름: ${shipinfo.order_name} </p>
<p> 주문자 전화번호: ${shipinfo.order_phone} </p>
<p> 주문자 배송요청: ${shipinfo.order_requests} </p>
<p> 배송상태: ${shipinfo.order_status} </p>
<p> 배송주소1: ${shipinfo.order_address1} </p>
<p> 배송주소2: ${shipinfo.order_address2} </p>
<p> 배송주소3: ${shipinfo.order_address3} </p>
<p> 배송주소4: ${shipinfo.order_address4} </p>
<h2>리워드</h2>
<c:forEach items="${rewardinfo}" var="rewards">
<p> 리워드번호: ${rewards.reward_id}</p>
<p> 리워드제목: ${rewards.reward_title}</p>
<p> 리워드설명: ${rewards.reward_description}</p>
<p> 리워드가격: ${rewards.reward_price}</p>
<p> 리워드옵션: ${rewards.reward_option_detail}</p>
<p> 리워드수량: ${rewards.order_qty}</p>
</c:forEach> --%>
</form>
</body>
</html>