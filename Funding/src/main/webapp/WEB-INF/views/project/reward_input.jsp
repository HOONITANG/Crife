<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/script.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
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
	
	 <!-- <form id="form-main" role="form">
     	<div id="form-block">
       		<div id="form-group">
		    <p>리워드 #1?</p>
		    <p>금액 <input type="text" name="list[0][reward_price]"></p>
		    <p>정렬 순서 <input type="text"></p>
		    <p>리워드 명 <input type="text" name="list[0][reward_title]"></p>
		    <p>상세설명 <input type="text" name="list[0][reward_description]"></p>
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
		        <p>배송료 <input type="number" name="list[0][delivery_fee]">원</p>
		        <p>제한수량</p>
		            <span> 리워드를 <input type="number" name="list[0][reward_sell_count]">개로 제한합니다.</span>
		        <p>
		            <span>발송시작일</span>
		            <input type="text" name="list[0][shipment_start]">
		        </p>
		        </div>
	        </div>
	        <input type="button" class="btn ins-btn" value="저장하기" />
        </form> -->
    <!--template추가  -->
    <div id="section7">
        <h1>Ex7 노드복제와 템플릿 태그</h1>
        <div>
            <input type="button" class="clone-button" value="복제하기">
            <input type="button" class="template-button" value="템플릿 복제하기">
        </div>

    <form id="form-main" role="form">
    </form>
    <template>
        <div class="form-block">
            <div class="form-group">
                <p>리워드 #</p>
                <p>금액 <input type="text" name="reward_price" class="input_js"></p>
                <p>정렬 순서 <input type="text"></p>
                <p>리워드 명 <input type="text" name="reward_title" class="input_js"></p>
                <p>상세설명 <input type="text" name="reward_description" class="input_js"></p>
                <p>옵션 조건</p>
                <div>
                   <input type="radio" value="0">
                   <span>옵션입력이 필요없는 리워드입니다.</span>
                </div>
                <div>
                   <input type="radio" value="1" />
                   <span>직접 입력 옵션이 필요한 리워드입니다. (각인, 메시지 등)</span>
                   <div class="option_js">
                       <p id="optionDetail-hint" class="input-hint">
                           <samp>
                               예시: 한글 10자, 영문 15자 이내 각인 메시지를 입력하세요.
                               각인 메시지를 입력하세요.
                           </samp>
                       </p>
                       <input type="text">
                   </div>
                </div>
                <div>
                   <input type="radio" value="2">
                   <span> 선택 옵션이 필요한 리워드입니다. (사이즈, 색상 등) </span>
                   <div class="option_js">
                       <p id="optionDetail-hint" class="input-hint">
                           옵션 값을 입력하세요. 옵션 값은 엔터로 구분됩니다.
                           <samp>
                               예시: 블랙, 230mm 화이트, 240mm
                           </samp>
                       </p>
                       <textarea id="option_input" style="width: 447px; padding: 10px 0px 0px 10px; font-size: 14px; overflow-y: hidden; resize: none;" maxlength="1500" title="옵션조건"></textarea>
                       <p>미리보기
                           <select id="option_view_js">
                               <option value="">옵션선택</option>
                           </select>
                       </p>
                   </div>
                </div>
                <p>배송료 <input type="number" name="delivery_fee" class="input_js">원</p>
                <p>제한수량</p>
                <span> 리워드를 <input type="number" name="reward_sell_count" class="input_js">개로 제한합니다.</span>
                <p>
                    <span>발송시작일</span>
                    <input type="text" name="shipment_start" class="input_js">
                </p>
            </div>
        </div>        
    </template>
    
    <input type="button" class="btn ins-btn" value="저장하기" />
    </div>
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

            // Ajax 데이터 저장처리
		
            function to_ajax() {
            	//const serializedValues2 = $('form[role="form"]').serializeObject();
            	// Json 값 삽입
            	 const serializedValues2 = createInputJson();
            	//const serializedValues2 = $('form[role="form"]').serializeJSON();
            	//const serializedValues2 = $('form[role="form"]').serialize();
            	console.log(JSON.stringify(serializedValues2));

        		//'${path}/reward/rewardInput'
            	$.ajax({
            		type : 'POST',
            		url : "project/rewardInput",
            		data : JSON.stringify(serializedValues2),
            		//data: serializedValues2,
            		dataType : 'json',
            		contentType: "application/json; charset=utf-8;",
            		error: function(){
                        alert("안되무");
                    },
            		success : function(json) {
            			alert('hello');
            			/* var data = data.json;
            			$.each(data, function(idx, val) {
            				console.log(idx + " " + val.reward_price);
            			}); */
            		}
            	});
            }
            $('.ins-btn').click(function(e) {
            	e.preventDefault();
            	to_ajax();
            });
            /*Ajax사용시 이용되는 데이터  */
            /* function listCreate() {
                $('.form-block').each(function(idx) {
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
            } */
            /*리워드 생성  */
            
            var section = document.querySelector("#section7");
		    var templateButton = section.querySelector(".template-button");
		    var formMain = document.querySelector("#form-main");
            $(".template-button").on('click', function () {
            	let template = section.querySelector("template");
		        //importNode -> cloneNode와 비슷한 역할 
		        let cloneNode = document.importNode(template.content, true);
		        formMain.appendChild(cloneNode);  
            });
            /*저장하기 클릭시 Ajax로 보내는 Json 데이터 생성  */
            function createInputJson() {
            	var totalList = new Object();
			    var testArray = new Array();
			    var lastIndex = 0;
            	$('.form-group').each(function(idx) { 
			    	var fileData = new Array();
			    	fileData = $(this).find('.input_js');
			    	var data = new Object() ;
			    	/*find 사용시 바닐라자바스크립트를 사용해야하는구나  */
			        for(var i=0; i< $(this).find('.input_js').length; i++){    
			             // input_js 클래스에 해당하는 name 과 value 값 object생성
			             data[fileData[i].getAttribute('name')] = fileData[i].value;	
			        }
			        testArray = testArray.concat(data);
			    });	
            	totalList.list = testArray;
            	/* var jsonData = JSON.stringify(totalList);
		    	console.log(jsonData); */
		    	return totalList;
            }

        </script>
</body>

</html>