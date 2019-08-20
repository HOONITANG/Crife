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
<title>리워드 입력 화면</title>
<style>
	.option_js.showing {
	    visibility: visible;
	    display: block;
	}
	.option_js {
	    visibility: hidden;
	    display: none;
	}
	#option_input{
	    min-height: 60px;
	}
</style>
</head>
<body>
	 <form id="form-main" role="form">
     	<div id="form-block">
       		<div id="form-group">
		    <p>리워드 #1?</p>
		    <p>금액 <input type="text" name="reward_price"></p>
		    <p>정렬 순서 <input type="text"></p>
		    <p>리워드 명 <input type="text" name="reward_title"></p>
		    <p>상세설명 <input type="text" name="reward_detail"></p>
		    <p>옵션 조건</p>
		        <div>
		            <label>
		                <input type="radio" name="option" value="0">
		                <span>옵션입력이 필요없는 리워드입니다.</span>
		            </label>
		        </div>
		        <div>
		            <label>
		                <input type="radio" name="option" value="1"/>
		                <span>직접 입력 옵션이 필요한 리워드입니다. (각인, 메시지 등)</span>
		                <div class="option_js">
		                    <p id="optionDetail-hint" class="input-hint">
		                        <samp>
		                  		          예시: 한글 10자, 영문 15자 이내 각인 메시지를 입력하세요. 
		                  		          각인 메시지를 입력하세요.
		                        </samp>
		                    </p>
		                    <input type="text" name="option_detail">
		                </div>
		            </label>
		        </div>
		        <div>
		            <label>
		                <input type="radio" name="option" value="2">
		                <span> 선택 옵션이 필요한 리워드입니다. (사이즈, 색상 등) </span>
		                <div class="option_js">
		                    <p id="optionDetail-hint" class="input-hint">
		                        	옵션 값을 입력하세요. 옵션 값은 엔터로 구분됩니다.
		                        <samp>
		                        	예시: 블랙, 230mm 화이트, 240mm
		                        </samp>
		                    </p>
		                    <textarea name="option_detail" id="option_input" style="width: 447px; padding: 10px 0px 0px 10px; font-size: 14px; overflow-y: hidden; resize: none;" maxlength="1500" title="옵션조건"></textarea>
		                    <p>미리보기
		                        <select name="option_view" id="option_view_js">
		                            <option value="">옵션선택</option>
		                        </select>
		                    </p>
		                </div>
		            </label>
		        </div>
		        <p>배송료 <input type="number" name="delivery_fee">원</p>
		        <p>제한수량</p>
		            <span> 리워드를 <input type="number" name="reward_sell_count">개로 제한합니다.</span>
		        <p>
		            <span>발송시작일</span>
		            <input type="text" name="shipment_start">
		        </p>
		        </div>
	        </div>
	        <input type="button" class="btn ins-btn" value="저장하기" />
        </form>
        <a class="btn btn-primary add-more-btn">새 리워드 만들기</a>
        <script>
            const SHOWING_ON = "showing";
            $(document).on("change", 'input[type="radio"]', function(e) {
                e.preventDefault();
                $('input[type="radio"]').each(function() {
                    if($(this).is(":checked")) {
                        optionShow($(this).parent().children('.option_js'));
                        console.log("check");
                    }
                    else {
                        optionHidden($(this).parent().children('.option_js'));
                        console.log("uncheck");
                    }
                });    
            });
             // 체크박스 유무 확인 후 클래스 추가, 제거	      
            function optionShow(chose) {
                chose.addClass(SHOWING_ON);
            }
            function optionHidden(chose) {
                chose.removeClass(SHOWING_ON);    
            }
            $("textarea#option_input").on('keydown keyup', function () {
                $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
            });
            $("textarea#option_input").on('change keyup', function () {	
                var newOptions = {
                    '' : '옵션선택'
                }
                var selectedOption = '';
                var select = $('#option_view_js');
                var optionItem = $(this).val().split("\n");
                for (var count = 0; count < optionItem.length; count++) {
                    newOptions[count] = optionItem[count];
                    //newOptions 객체에 값이 제대로 들어갔는지 확인
                    //console.log(newOptions);
                }
                // 옵션 값을 textarea에 입력 후 지우면 0번째count에 ''가 남는 경우가 생겨서 처리함
                if (!newOptions['0']){
                    delete(newOptions['0']);
                } 
                if(select.prop) {
                    var options = select.prop('options');
                }
                else {
                    var options = select.attr('options');
                }           
                $('option', select).remove();
                $.each(newOptions, function(val, text) {
                    options[options.length] = new Option(text, val);
                });
                select.val(selectedOption);
            });
            // 새리워드 추가하기 jQuery
            $('.add-more-btn').click(function(e) {
            	e.preventDefault();
            	var clone = $('#form-block').clone('#form-group');
            	console.log(clone);
            	$('#form-main').append(clone);
            });
            // Ajax 데이터 저장처리
            jQuery.fn.serializeObject = function() {
            	var obj = null;
            	try {
					// 함수를 호출했을때 넣어줌. 
            		if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            			var arr = this.serializeArray();
            			if(arr) { obj = {};
            			jQuery.each(arr, function() {
            				obj[this.name] = this.value; });
            			}
            		}
            	} catch(e) {
            		alert(e.message);
            	} finally {}
            	return obj;
            }
            function to_ajax() {
            	const serializedValues2 = $('form[role="form"]').serializeObject();
            	console.log(JSON.stringify(serializedValues2));

        		//'${path}/reward/rewardInput'
            	$.ajax({
            		type : 'POST',
            		url : "reward/rewardInput" ,
            		data : JSON.stringify(serializedValues2),
            		dataType : 'json',
            		contentType: "application/json; charset=utf-8;",
            		error: function(){
                        alert("안되무");
                    },
            		success : function(json) {
            			alert('hello');
            			console.log(json);
            		}
            	});
            }
            $('.ins-btn').click(function(e) {
            	to_ajax();
            });
        </script>
</body>

</html>