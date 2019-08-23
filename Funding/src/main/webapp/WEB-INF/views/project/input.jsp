<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>크라우디 : 내 프로젝트 수정</title>
<%@ include file="../include/header.jsp"%>
<!-- 탭 관련 css,js -->
<script src="${path}/resources/js/tabcontent.js" type="text/javascript"></script>
<link href="${path}/resources/css/tabcontent.css" rel="stylesheet"type="text/css" />

<!-- parsley 유효성 검사 js.css -->
<script src="${path}/resources/js/parsley.min.js"></script>
<script src="${path}/resources/js/ko.js"></script>
<link href="${path}/resources/css/parsley.css" rel="stylesheet"type="text/css" />

<!-- 달력관련 css-->
<link rel="stylesheet" href="${path}/resources/pickadate/lib/themes/default.css">
<link rel="stylesheet" href="${path}/resources/pickadate/lib/themes/default.date.css">
<!-- 달력관련 js-->
<script src="${path}/resources/pickadate/lib/picker.js"></script>
<script src="${path}/resources/pickadate/lib/picker.date.js"></script>
<script src="${path}/resources/pickadate/lib/legacy.js"></script>
<script type="text/javascript">
	var pk = jQuery.noConflict();
</script>

<!-- summernote관련 css/js -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- summernote관련 css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<!--리워드 삽입 css  -->
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

<body style="font-family: 'Nanum Gothic', sans-serif;">
<%@ include file="../include/navbar.jsp"%>
	<!-- 승인요청 버튼 폼 -->
	<form id="ok" name="ok" action="${path}/project/request" method="post">
		<input type="hidden" name="pro_id" value="${detail.pro_id}">
		<div class="ok">
			<button id="btn_ok" type="button" class="btn btn-outline-primary">승인요청</button>
		</div>
	</form>

	<div style="width: 800px; height:800px; margin: 0 auto; padding: 120px 0 40px; font-family: 'Nanum Gothic', sans-serif;">
		<ul class="tabs" data-persist="true">
			<li><a href="#view1">기본정보</a></li>
			<li><a href="#view2">리워드</a></li>
			<li><a href="#view3">스토리</a></li>
			<li><a href="#view4">메이커</a></li>
		</ul>
		<div class="tabcontents">
			<div id="view1">
				<p><form name="input_form" enctype="multipart/form-data" method="post" class="input_form"
					action="${path}/project/save1" data-parsley-validate>
					<table>
								<tr>
									<td style="font-weight:bold;">카테고리</td>
								</tr>
								<tr>
									<td>오픈 후, 노출될 카테고리를 선택해 주세요.</td>
								</tr>
								<tr>
									<td><select id="pro_category" name="pro_category">
											<option value=""
										<c:out value="${detail.pro_category == null ? 'selected' : ''}"/>>프로젝트카테고리</option>
											<option value="1"
										<c:out value="${detail.pro_category eq '1' ? 'selected' : ''}"/>>테크·가전</option>
											<option value="2"
										<c:out value="${detail.pro_category eq '2' ? 'selected' : ''}"/>>패션·잡화</option>
											<option value="3"
										<c:out value="${detail.pro_category eq '3' ? 'selected' : ''}"/>>뷰티</option>
											<option value="4"
										<c:out value="${detail.pro_category eq '4' ? 'selected' : ''}"/>>푸드</option>
											<option value="5"
										<c:out value="${detail.pro_category eq '5' ? 'selected' : ''}"/>>홈리빙</option>
											<option value="6"
										<c:out value="${detail.pro_category eq '6' ? 'selected' : ''}"/>>디자인소품</option>
											<option value="7"
										<c:out value="${detail.pro_category eq '7' ? 'selected' : ''}"/>>여행·레저</option>
											<option value="8"
										<c:out value="${detail.pro_category eq '8' ? 'selected' : ''}"/>>스포츠·모빌리티</option>
											<option value="9"
										<c:out value="${detail.pro_category eq '9' ? 'selected' : ''}"/>>반려동물</option>
											<option value="10"
										<c:out value="${detail.pro_category eq '10' ? 'selected' : ''}"/>>모임</option>
											<option value="11"
										<c:out value="${detail.pro_category eq '11' ? 'selected' : ''}"/>>공연·컬쳐</option>
											<option value="12"
										<c:out value="${detail.pro_category eq '12' ? 'selected' : ''}"/>>소셜·캠페인</option>
											<option value="13"
										<c:out value="${detail.pro_category eq '13' ? 'selected' : ''}"/>>교육·키즈</option>
											<option value="14"
										<c:out value="${detail.pro_category eq '14' ? 'selected' : ''}"/>>게임·취미</option>
											<option value="15"
										<c:out value="${detail.pro_category eq '15' ? 'selected' : ''}"/>>출판</option>
											<option value="16"
										<c:out value="${detail.pro_category eq '16' ? 'selected' : ''}"/>>기부·후원</option>
									</select></td>
								</tr>
								<tr>
									<td>프로젝트 제목</td>
								</tr>
								<tr>
									<td>프로젝트의 핵심 내용을 담을 수 있고 간결한 제목을 정해주세요.</td>
								</tr>
								<tr>
									<td><input type="text" id="pro_name" name="pro_name" value="${detail.pro_name}"></td>
								</tr>
								<tr>
									<td>프로젝트 키워드</td>
								</tr>
								<tr>
									<td>제목 외에도 키워드 검색 시 검색 결과에 프로젝트가 나타납니다.</td>
								</tr>
								<tr>
									<td>#<input type="text" name="pro_keyword1"id="pro_keyword1" value="${detail.pro_keyword1}"
											data-parsley-length="[0, 5]">&nbsp;
										#<input type="text" name="pro_keyword2" id="pro_keyword2"value="${detail.pro_keyword2}"
											data-parsley-length="[0, 5]">&nbsp;
										#<input type="text" name="pro_keyword3" id="pro_keyword3"value="${detail.pro_keyword3}"
											data-parsley-length="[0, 5]">></td>
								</tr>
								<tr>
									<td>목표금액</td>
								</tr>
								<tr>
									<td>목표 금액을 적어주세요.</td>
								</tr>
								<tr>
									<td><input type="text" name="pro_price" id="pro_price" value="${detail.pro_price}"
									data-parsley-type="digits" data-parsley-trigger="change"></td>
								</tr>
								<tr>
									<td>프로젝트 진행기간</td>
								</tr>
								<tr>
									<td>프로젝트 진행기간을 정해주세요.</td>
								</tr>
								<tr>
									<td><input type="text" name="pro_start" id="pro_start"
								class="datepicker" value="${detail.pro_start}"> ~ <input
								type="text" name="pro_end" id="pro_end" class="datepicker"
								value="${detail.pro_end}"></td>
								</tr>
								<tr>
									<td>프로젝트 대표 이미지</td>
								</tr>
								<tr>
									<td>프로젝트를 한 눈에 나타낼 수 있는 이미지를 등록해주세요.</td>
								</tr>
								<tr>
									<td>현재 파일 : ${detail.pro_imageURL}&nbsp;
									<img src="${path}/resources/images/${detail.pro_imageURL}" width="100" height="100"><br>
									<input type="file"name="file1" id="file1" size="50"
									data-parsley-max-file-size="3072"></td>
								</tr>
								<tr>
									<td><input type="hidden" name="pro_id"
								value="${detail.pro_id}"></td>
								</tr>
								<tr>
									<td><input type="button" value="저장하기" id='save1'></td>
								</tr>
							</table>
						</form></p>
			</div>
			<!--리워드 시작  -->
			<div id="view2">
				<div id="section">
			        <h1>리워드</h1>
			        <div>
			            <input type="button" class="template-button" value="리워드 생성하기">
			        </div>
			
			    <form id="form-main" role="form">
			    </form>
			    <template>
			        <div class="form-block">
			            <div class="form-group-reward">
			                <p class="rnumber">리워드 #</p>
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
			                    <input type="text" name="shipment_start" class="input_js reward_date">
			                    <input type="hidden" name="pro_id" class="input_js" value="${detail.pro_id}">
			                </p>
			            </div>
			        </div>        
			    </template>
			    
			    <input type="button" class="btn ins-btn" value="저장하기" />
			    </div>
			</div>
			<div id="view3">
				<p><form id="story_form" name="story_form" method="post"
					action="${path}/project/save3" data-parsley-validate>
							소개 영상<br>
							유튜브 동영상 주소를 적어주세요<br>
							동영상을 등록하지 않으면 메인사진이 올라갑니다<br>
							<input type="text" name="pro_video" value="${detail.pro_video}" size="50"><br>
							<br>스토리<br>
							<textarea rows="10" cols="30" id="summernote" name="pro_content" style="width:766px; height:500px;">
							${detail.pro_content}</textarea>
							<br>
							간단설명<br>
							프로젝트에 대한 간단한 설명을 해주세요.(최소 20글자, 최대 100글자)<br>
							<textarea id="pro_summary" name="pro_summary" style="width:735px; height:200px;"
							data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100"
							>${detail.pro_summary}</textarea>
							<input type="hidden" name="pro_id" value="${detail.pro_id}">
							<input type="button" value="저장하기" id='save3'>
						</form>
				</p>
			</div>
			<div id="view4">
				<p><form id="maker_form" action="${path}/maker/save4"
							method="post" enctype="multipart/form-data" >

							<table class="table_view">
								<tr>
									<th scope="row">메이커 이름</th>
									<td><input name="maker_name" id="maker_name" type="text"
										value="${maker_detail.maker_name}"></td>
								</tr>
								<tr>
									<th scope="row">메이커 전화번호</th>
									<td><input name="maker_phone" id="maker_phone" type="text"
										value="${maker_detail.maker_phone}"></td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td>나중에 추가</td>
								</tr>
								<tr>
									<th scope="row">메이커 소개</th>
									<td><input name="maker_intro" id="maker_intro" type="text"
										value="${maker_detail.maker_intro}"></td>
								</tr>
								<tr>
									<th scope="row">메이커 이미지</th>
									<td>현재 파일 : ${maker_detail.maker_photo} &nbsp;<input type="file" name="file3" id="file3" size="50">
										<input type="hidden" name="mem_idx" value="${login.mem_idx}">
										<input type="hidden" name="maker_idx" value="${maker_detail.maker_idx}">
										<input type="hidden" name="pro_id" value="${detail.pro_id}"></td>
								</tr>
								<tr>
									<th colspan="2"><button id="save4">저장하기</button></th>
								</tr>
							</table>
						</form></P>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	pk('.datepicker').pickadate({
		format : 'yyyy-mm-dd',
		formatSubmit : 'yyyy-mm-dd'
	});
	
	$(document).on("click", '.reward_date', function(e) {
		pk('.reward_date').pickadate({
			format : 'yyyy-mm-dd',
			formatSubmit : 'yyyy-mm-dd'
		});
	})

	$(document).ready(function() {
		$('#summernote').summernote({
			height: 400
		});
	});
</script>
<script>
	$(document).ready(function() {
		//프로젝트등록 유효성검사
		$("#save1").click(function() {
			document.input_form.submit();
			alert("저장되었습니다");
		});
		
		$("#save3").click(function() {
			document.story_form.submit();
			alert("저장되었습니다");
		});
		
		$('#save4').click(function() {
			document.maker_form.submit();
			alert("저장되었습니다");
		});
		
		$("#btn_ok").click(function() {
			alert("승인요청이 되었습니다. 2주 안에 처리됩니다");
			document.getElementById('ok').submit();
		});
	});
</script>
<script type="text/javascript">
	window.Parsley.addValidator('maxFileSize', {
		  validateString: function(_value, maxSize, parsleyInstance) {
		    if (!window.FormData) {
		      alert('You are making all developpers in the world cringe. Upgrade your browser!');
		      return true;
		    }
		    var files = parsleyInstance.$element[0].files;
		    return files.length != 1  || files[0].size <= maxSize * 1024;
		  },
		  requirementType: 'integer',
		  messages: {
		    ko: '%s kb(3Mb) 이하 파일만 입력가능합니다'
		  }
	});
</script>
<!--리워드 삽입 스크립트  -->
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
      	//const serializedValues2 = $('form[role="form"]').serializeJSON();
      	//const serializedValues2 = $('form[role="form"]').serialize();
      	// Json 값 삽입
      	 const serializedValues2 = createInputJson();
      	console.log(JSON.stringify(serializedValues2));

  		//'${path}/reward/rewardInput'
      	$.ajax({
      		type : 'POST',
      		url : "${path}/project/rewardInput",
      		data : JSON.stringify(serializedValues2),
      		//data: serializedValues2,
      		dataType : 'json',
      		contentType: "application/json; charset=utf-8;",
      		error: function(){
                  alert("안되무");
              },
      		success : function(json) {
      			alert('hello');
      		}
      	});
      }
      $('.ins-btn').click(function(e) {
      	e.preventDefault();
      	to_ajax();
      });

      /*리워드 생성  */
      
      var section = document.querySelector("#section");
	  var templateButton = section.querySelector(".template-button");
	  var formMain = document.querySelector("#form-main");
      
      $(".template-button").on('click', function () {
      	let template = section.querySelector("template");
        //importNode -> cloneNode와 비슷한 역할 
        let cloneNode = document.importNode(template.content, true);
        formMain.appendChild(cloneNode);  
        $(".rnumber").each(function(idx) {
        	$(this).value = "리워드 #"+idx;
        });
    
      });
      /*저장하기 클릭시 Ajax로 보내는 Json 데이터 생성  */
      function createInputJson() {
      	 var totalList = new Object();
		 var testArray = new Array();
		 var lastIndex = 0;
		    $('.form-group-reward').each(function(idx) { 
		 	var fileData = new Array();
		 	fileData = $(this).find('.input_js');
		 	var data = new Object() ;
		    console.log(idx);
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
</html>
