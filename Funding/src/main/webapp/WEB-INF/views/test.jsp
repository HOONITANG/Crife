<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<style>


</style>
</head>
<body>
<div id="section">
	<h2 class="heading">리워드</h2>
    <div>
    	<center><h1><u class="thick template-button">리워드 생성하기</u></h1></center>
    </div>
	<c:forEach items="${rewards}" var="reward">
 	<div class="form-block-check">
 		<input type="hidden" id="input_key" value="${reward.reward_id}">
		<div class="form-group-reward">
			<div class="grid"> <!--Start Grid-->
				<button type='button' class="delBtn pull-right"> 제거하기 </button>
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">리워드 명</p>
						<input type="text" name="reward_title${reward.reward_id}" class="input_js" value="${reward.reward_title}">
					</div>
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">금액</p>
						<input type="text" name="reward_price${reward.reward_id}" class="input_js" value="${reward.reward_price}">
					</div>
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
            	<p class="info-text">리워드 상세내역</p>
            	<br>
	            <div class="controls">
	            	<textarea name="reward_description${reward.reward_id}" class="input_js floatLabel">${reward.reward_description}</textarea>
	            </div>
            </div> <!--End Grid-->
            <div class="grid"> <!--Start Grid-->
				<div class="controls">
					<p class="info-text">옵션 조건</p>
					<input type="radio" name="op_val${reward.reward_id}" class="radio_ck" value="0">
					<span> 옵션입력이 필요없는 리워드입니다. </span>
					<br>
					<input type="radio" name="op_val${reward.reward_id}" class="radio_ck" value="1">
			        <span> 선택 옵션이 필요한 리워드입니다. (사이즈, 색상 등) </span>
			        <input type="button" class="option_add_btn btn pull-right" value="추가하기" />
			        <c:forEach items="${options}" var="option">
			        	<c:if test="${option.reward_id eq reward.reward_id}">
		                <div class="option_add mb-3">
		                	<div class="option_wrap">
		                		<p class="info-text">옵션 명</p>
		                		<input type="text" name="op_name${reward.reward_id}" class="input_js op_js" value="${option.op_name}"> 
		                		<p class="info-text">옵션 제한 수량</p>
		                		<input type="text" name="op_limit_qty${reward.reward_id}" class="input_js op_js"  value="${option.op_limit_qty}">
		                		<input type="button" class="option_del_btn btn pull-right" value="제거하기" />
		                	</div>	
		                </div>    
		                </c:if>
			        </c:forEach>
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">배송료 (단위: 원)</p>
						<input type="text" name="delivery_fee${reward.reward_id}" class="input_js" value="${reward.delivery_fee}">
					</div>
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">제한수량</p>
						<input type="number" name="reward_sell_count${reward.reward_id}" class="input_js" value="${reward.reward_sell_count}">
					</div>
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">발송시작일</p>
						<input type="text" name="shipment_start${reward.reward_id}" class="input_js reward_date" value="${reward.shipment_start}">
              			<input type="hidden" name="pro_id" class="input_js" value="${detail.pro_id}">
					</div>
				</div>
			</div> <!--End Grid-->
		</div> 
		<!-- form-group-reward -->
 	</div>
 	<!-- form-block-check -->
 	</c:forEach>
 	<form id="form-main" role="form">
  	</form>
 	<template>
 	<div class="form-block-pass">
		<input type="hidden" id="input_key" value="">
    	<div class="form-group-reward">
    		<div class="grid"> <!--Start Grid-->
				<button type='button' class="delBtn pull-right"> 제거하기 </button>
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">리워드 명</p>
						<input type="text" name="reward_title" class="input_js">
					</div>
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">금액</p>
						<input type="text" name="reward_price" class="input_js">
					</div>
				</div>
			</div> <!--End Grid-->
	        <div class="grid"> <!--Start Grid-->
            	<p class="info-text">리워드 상세내역</p>
            	<br>
	            <div class="controls">
	            	<textarea name="reward_description" class="input_js"></textarea>
	            </div>
            </div> <!--End Grid-->    
			<div class="grid"> <!--Start Grid-->
				<div class="controls">
					<p class="info-text">옵션 조건</p>
					<input type="radio" name="op_val" class="radio_ck" value="0">
					<span> 옵션입력이 필요없는 리워드입니다. </span>
					<br>
					<input type="radio" name="op_val" class="radio_ck" value="1">
			        <span> 선택 옵션이 필요한 리워드입니다. (사이즈, 색상 등) </span>
			        <input type="button" class="option_add_btn btn pull-right" value="추가하기" />
	                <div class="option_add mb-3">
	                	<div class="option_wrap">
	                		<p class="info-text">옵션 명</p>
	                		<input type="text" name="op_name" class="input_js op_js"> 
	                		<p class="info-text">옵션 제한 수량</p>
	                		<input type="text" name="op_limit_qty" class="input_js op_js">
	                		<input type="button" class="option_del_btn btn pull-right" value="제거하기" />
	                	</div>	
	                </div>    
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">배송료 (단위: 원)</p>
						<input type="text" name="delivery_fee" class="input_js">
					</div>
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">제한수량</p>
						<input type="number" name="reward_sell_count" class="input_js">
					</div>
				</div>
			</div> <!--End Grid-->
			<div class="grid"> <!--Start Grid-->
				<div class="col-1-3">
					<div class="controls">
						<p class="info-text">발송시작일</p>
						<input type="text" name="shipment_start" class="input_js reward_date" value="${reward.shipment_start}">
              			<input type="hidden" name="pro_id" class="input_js">
					</div>
				</div>
			</div> <!--End Grid-->
		</div> 
		<!-- form-group-reward -->
 	</div>
 	<!-- form-block-pass -->
 	</template>
 	<input type="button" class="btn ins-btn col-1-4" value="저장하기" />
</div> 

</body>
</html>