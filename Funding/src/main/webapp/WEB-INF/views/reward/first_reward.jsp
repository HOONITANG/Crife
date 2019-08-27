<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<!--jquery3.3.1 script 추가  -->
<%@ include file="/WEB-INF/views/include/script.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!--체크 박스 클릭 시 적용 css -->
<link rel="stylesheet" href="${path}/resources/reward/firstReward.css">

<!--font awesome-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- bootstrap 적용 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<style>
	.bd-placeholder-img {
	    font-size: 1.125rem;
	    text-anchor: middle;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	}
	
	@media (min-width: 768px) {
	    .bd-placeholder-img-lg {
	        font-size: 3.5rem;
	    }
	}
</style>

<title>리워드 step10 화면입니다.</title>

</head>
<body>
<div class="container">
	<div class="py-5 text-center">
	    <h2>주문페이지 입니다.</h2>
	    <p class="lead">자바스크립트를 통해 체크 박스를 통해 선택한 리워드의 수량 입력창을 추가하고 남은 갯수을 넘기거나, 500개 이상, 1개미만 유효성 처리를 하였습니다. 
	    다음 페이지를 클릭 했을 시 선택한 리워드들을 합산한 금액, 수량, 상품번호를 값을 전달하기위해 자바스크립트를 사용하여 form태그에 추가하였습니다.</p>
    </div>
	
	<form role="form" id="send_to_reward20" method="post"
		action="${path}/reward/step20/${pro_id}">
		<div class="row">	
			<div class="col-sm-10 order-md-1 mb-3" style="margin: 0 auto;">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">리워드 선택</span>
				</h4>	
				<ul class="list-group mb-3 reward_list " id="reward_list">
					<c:forEach items="${rewards}" var="reward" varStatus="status">
						<!-- 값은 안넘기지만 유효성 검사나 현재페이지에 보여지기 위해 생성한 input type들 입니다.  -->			
						<input type="hidden" id="reward_sell_count${reward.reward_id}" value="${reward.reward_sell_count}">
						<input type="hidden" id="reward_price${reward.reward_id}" value="${reward.reward_price}">							
						<input type="hidden" id="reward_remain_count${reward.reward_id}" value="${reward.reward_sell_count - reward.order_qty}">							
						<input type="hidden" name="list[${status.index}].reward_title" value="${reward.reward_title}">
						<li class="list-group-item d-flex justify-content-between lh-condensed">
	                        <div>
	                            <h6 class="my-0">${reward.reward_title}</h6>
	                            <small class="text-muted">${reward.reward_description}</small>
		                        <p class="text-muted">남은 수량: ${reward.reward_sell_count - reward.order_qty} </p>
		                       	<div class="list_wrap row">
		                       		<div class="col-lg-5 mb-3">
			                        <span class="text-muted"><fmt:formatNumber pattern="###,###,###" value="${reward.reward_price}" />원</span>
				                    <span><input type="checkbox" name="check_box" id="check_box${reward.reward_id}"
											value="${reward.reward_id}" class="check_box_js"
											data-toggle="checkbox" >
									</span>
									</div>
									<div class="col-lg-5 mb-3">
									<span class="number" id="number${reward.reward_id}">
										<i class="fa fa-minus-square decreaseQuantity"  aria-hidden="true"></i>
										<input type="text" name="before_qty" id="qty${reward.reward_id}" class="before_qty text-center" value="0">
										<i class="fa fa-plus-square increaseQuantity" aria-hidden="true"></i>						
									</span>
									</div>
								</div>
							</div>
	                   	</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!--row-->	
		<div class="row ">
			<div class="col-sm-10 order-md-1 mb-3" style="margin: 0 auto;">
				<hr class="mb-4">
	               <h4 class="mb-3">Payment</h4>
	               <div class="mb-3">
	                <span class="text-muted">후원금 </span>
	                <input type="text" class="form-control col-md-5" id="addDonationTmp" value=0  name="sub_money" maxlength="8">
	               </div>
	               <input type="hidden" id="addDonation" name="addDonation" value="0">				
				<hr class="mb-4">
	               <div class="custom-control custom-checkbox">
	                   <input type="checkbox" class="custom-control-input" id="dontShowNameYn" name="dontShowNameYn" value="N">
	                   <label class="custom-control-label" for="dontShowNameYn">이름비공개</label>
	               </div>
	               <div class="custom-control custom-checkbox">
	                   <input type="checkbox" class="custom-control-input" id="dontShowAmountYn" name="dontShowAmountYn" value="N">
	                   <label class="custom-control-label" for="dontShowAmountYn">펀딩금액 비공개</label>
	               </div>
	               <hr class="mb-4">
				<div>
	                <span>Total</span>
	                <strong id="sumTotalNum"> 0</strong>
	               </div>
				<button type="button" id="nextButton" class="btn btn-primary btn-lg btn-block">다음단계로</button>
			</div>
		</div>
		<!-- row  -->
	</form>		
</div>
<!--container  -->
<script>
$(function() {
    const SHOWING_ON = "showing";
    var firstform = $("form[role='form']");
    $(document).on("click", "#nextButton", function(e) {
    	if(vaildCheck()) {
    		rewardNextStep();
            firstform.submit();
    	}
    	else {
    		return;
    	}
    });
 
   	// 페이지 로딩 시 남은 수량에 따라 체크 버튼 비활성화 = 마감표시
    $('.check_box_js').each(function(idx) {
    	var rewardId = $(this).val();
    	var limitCnt = $("#reward_sell_count" + rewardId).val() * 1;
        var remainCnt = $("#reward_remain_count" + rewardId).val() * 1;

        if(remainCnt != 0) { 
        	$(this).attr("disabled", false);  
    	} else {
    	    $(this).attr("disabled", true); 
    	    $(this).parent().append('<span>마감되었습니다.</span>');
    	}
    }); 

    // 뒤로가기 시 체크버튼, 수량 값, 금액 초기화
    $(window).on("pageshow", function(event) {
    	if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
    		//뒤로가기시 페이지 새로고침인데 너무 느리다.
    		//document.location.reload();	
            // 체크박스 해제, 각 리워드별 수량 초기화
            $('.check_box_js').each(function(idx) { 
            	var rewardId = $(this).val();
            	$(this).attr("checked", false);
            	$("#qty" + rewardId).val(0);
            });
            // 후원금 0원으로 초기화
            $('#addDonation').val(0);
            // 총 금액 계산 0으로 초기화
            calculateTotal();
        }
    });

    // 체크박스 유무 확인 후 클래스 추가, 제거	      
    function qtyShow(chose) {
        chose.addClass(SHOWING_ON);
    }

    function qtyHidden(chose) {
        chose.removeClass(SHOWING_ON);
    }

    // 총 금액 계산 함수
    function calculateTotal() {
        selectSumTotal = 0;
        fundingPrice = 0;
        $('.check_box_js').each(function(i) {
            var rewardId = $(this).val();
            // rewardId 값 모두 출력
            // console.log(rewardId);

            var amount = calculateReward(rewardId);
            fundingPrice = fundingPrice + amount;
            //console.log(fundingPrice); 각 현재 리워드별 금액
        });
        var addDonation = $('#addDonation').val();
        if (addDonation == '') {
            addDonation = 0 * 1;
        }
        selectSumTotal = fundingPrice + addDonation * 1;
        $('#sumTotalNum').html(selectSumTotal.format() + '원');
    }

    function calculateReward(rewardId) {
        var calQty = $('#qty' + rewardId).val();
        if (addDonation == '') {
        	calQty = 0 * 1;
        }
        var calPrice = $('#reward_price' + rewardId).val();
        return calQty * calPrice;
    }

    // check 박스 체크 이벤트 처리
    $(document).on("change", ".check_box_js", function(e) {
        e.preventDefault();
        $('.check_box_js').each(function(idx) { 
        	var rewardId = $(this).val();
        	var qty = $('#number'+rewardId);
        	console.log(qty);
        	if ($(this).is(":checked")) {
                qtyShow(qty);
                qty.children(".before_qty").val(1);
            } else {
                qty.children(".before_qty").val(0);
                qtyHidden(qty);
            }
        });    
        calculateTotal();
    });

 	// 수량 감소 증가 
    // 수량 감소 이벤트
    $(document).on("click", ".decreaseQuantity", function(e) {
        e.preventDefault();

        var btn = $(e.target.parentNode); // 바로 위 부모 객체를 찾아감 (number)
        var rewardId = $(e.target.parentNode).children('.before_qty').prop("id").replace("qty", ""); // rewardId 찾음
        var stat = btn.children('.before_qty').val();
        var num = parseInt(stat, 10);
        num--;

        if (num <= 0) {
            alert('더이상 수량을 줄일수 없습니다.');
            num = 1;
        }
        btn.children('.before_qty').val(num);
        countValidation(rewardId, num);
        calculateTotal();
        $(e.target.parentNode).parent().children('.option')[0].remove();

    });

    // 수량 증가 이벤트
    $(document).on("click", ".increaseQuantity", function(e) {
        e.preventDefault();
        var btn = $(e.target.parentNode); // 부모 객체인 number을 찾아 감
        var rewardId = $(e.target.parentNode).children('.before_qty').prop("id").replace("qty", ""); // 체크박스의 id값을 가지고옴.
        var stat = btn.children('.before_qty').val(); //input 태그의 값을 가져옴
        var num = parseInt(stat, 10); // 10진수로 가져온 값을 int형으로 변환함
        num++;

        if (num > 500) {
            alert('더이상 수량을 늘릴수 없습니다.');
            num = 500;
        }
        btn.children('.before_qty').val(num);
        countValidation(rewardId, num);
        calculateTotal();
        $(e.target.parentNode).parent().append(
        		`<div class='option'>
        		<select name="rewardOptions" id="memo" onchange="optionChanged(this)">
                <option value="블랙">화이트</option>
                <option value="화이트">블랙</option>
                <option value="블루">블루</option>
                <option value="레드">레드</option>
          	 	</select>
          	 	</div>`);
    });

    //공개여부 
    //이름
    $('#dontShowNameYn').change(function() {
        if ($(this).is(':checked')) {
            $(this).val('Y');
        } else {
            $(this).val('N');
        }
    });
    //펀딩금액
    $('#dontShowAmountYn').change(function() {
        if ($(this).is(':checked')) {
            var a = $(this).val('Y');

        } else {
            var b = $(this).val('N');

        }
    });
    // 수량 유효성 검증
    // e.target 안해도 this로 하면 이렇게 쉬웠구나.
    $(document).on("focusout", ".before_qty", function(e) {
        e.preventDefault();
        var before_qty = $(this).val() * 1;
        var rewardId = $(this).prop("id").replace("qty", "");
        countValidation(rewardId, before_qty);
        calculateTotal();
    });
    // 후원금 추가 총 금액 계산
    $('#addDonationTmp').focus(function() {
        if ($("#addDonation").val() == 0) {
            $(this).val("");
        } else {
            $(this).val($("#addDonation").val().format());
        }
    });
    $('#addDonationTmp').keyup(function() {
        setAddDonationField($(this));
    });
    $('#addDonationTmp').blur(function() {
        setAddDonationField($(this));
    });

    function setAddDonationField(obj) {
        var addDonationTmp = (obj.val() == '') ? 0 : obj.val().replace(/[^0-9]/g,'') * 1;
        $('#addDonation').val(addDonationTmp);
        $('#addDonationTmp').val(addDonationTmp.format());

        calculateTotal();
    }

    // 수량체크시 중복되는 유효성검사
    function countValidation(rewardId, before_qty) {
        /* console.log(rewardId) */
        // qty : 리워드별 주문자가 선택한 수량
        // remain_cnt : 서버에서 전달된 리워드 별 남은수량
        var limitCnt = $("#reward_sell_count" + rewardId).val() * 1;
        var remainCnt = ($("#reward_remain_count" + rewardId).val() * 1);
        var qty = $("#qty" + rewardId)
        /* 
        console.log("limitCnt" + limitCnt);
        console.log("remainCnt" + remainCnt); 
        */
        if (before_qty < 1) {
            alert('1개 이하로 수량을 선택할 수 없습니다.');
            qty.val(1);
            return;
        }
        if (limitCnt === 0 && before_qty > 500) {
            alert('500개 이상 수량을 선택 할 수 없습니다.');
            qty.val(500);
            return
        }
        if (remainCnt < before_qty) {
            alert('잔여 수량보다 많을 수 없습니다');
            qty.val(remainCnt);
            return
        }
    }

    /*숫자 타입에서 쓸 수 있도록 format() 함수 추가*/
    Number.prototype.format = function() {
        if (this == 0) return 0;
        var reg = /(^[+-]?\d+)(\d{3})/;
        var n = (this + '');
        while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
        return n;
    };

    /* 문자열 타입에서 쓸 수 있도록 format() 함수 추가*/
    String.prototype.format = function() {
        var num = parseFloat(this);
        if (isNaN(num)) return "0";
        return num.format();
    };

    /*다음 단계로 */
    function rewardNextStep() {
        $('.check_box_js').each(function(idx) {
            if ($(this).is(":checked")) {
                var rewardId = $(this).val();
                var qty = $('#qty' + rewardId).val();
                var reward_price = $('#reward_price' + rewardId).val();
                //리워드 별 금액
                var sumAmount = parseInt(reward_price) * parseInt(qty);
                
                // qty : 리워드별 주문자가 선택한 수량
                // remain_cnt : 서버에서 전달된 리워드 별 남은수량
                $('[role="form"]').append('<input type="hidden" name="list[' + idx + '].reward_id" value="' + rewardId + '" />');
                $('[role="form"]').append('<input type="hidden" name="list[' + idx + '].qty" value="' + qty + '" />');
                $('[role="form"]').append('<input type="hidden" name="list[' + idx + '].sumAmount" value="' + sumAmount + '" />');
            };
        });
    }
    /*버튼 클릭 시 체크 유무 확인 */
    function vaildCheck() {
    	var check_count=0;
    	$('.check_box_js').each(function(idx) {
    		if ($(this).is(":checked")) {
    			check_count++;
    		}
    	});
    	if (check_count<=0) {
    		alert('최소 하나의 리워드를 체크하여야합니다.');
    		return false;
    	}
    	return true;
    }
});
</script>

</body>


</html>