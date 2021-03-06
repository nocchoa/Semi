<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원가입 - 개인</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        
        <style>
            table, td, th{
   		        font-weight: 600;
            	border: 1px solid black;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            	border:none;
            }   
            
            .userJoin hr{
            	border:none;
            	width:1000px;
            	border:1px solid limegreen;
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
            }
            
           	.userJoin h5{
           		position:absolute;
           		left:78%;
           	}
            
            .userJoinTitle{
            	margin : 60px 0px 55px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            .userJoinTable{
            	position:absolute;
            	left: 20%;
				margin:  0 0 120px 0;
            }
            
            .userJoin select{
            	font-weight: 600;
            	border-style : solid;
            	height : 41px;
            	width: 130px;
            }
            
            .inp{
            	height: 41px;
            }
            
            #overlay, #path{
            	font-weight: 600;
            	border-style : solid;
            	height : 41px;
            	width: 130px;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
            }
            
            #join{
            	position:absolute;
            	left:86%;
            	height : 42px;
            	width: 130px;
            	font-weight: 800;
            	border-style : solid;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
            }
            
             .exit{
            	position:absolute;
            	left:1%;
            	height : 30px;
            	width: 130px;
            	font-weight: 800;
            	font-size:14;
            	text-align:center;
        		padding: 10px 0 0 0;
            	border:2.5px solid limegreen;
            	background-color : white;
            	color: limegreen;
            	cursor: pointer;
            }
            
        </style>
    </head>
    <body>
    	<jsp:include page="navi.jsp"></jsp:include>
    	<!-- 바디 전체를 감사는 userJoin  클래스 -->
    <div class = userJoin>
    	<div class = userJoinTitle>
    		<br/><br/>
    		<h1>회원 가입 (개인)</h1>
    	</div> <br/>
    	<h5>* 필수입력사항</h5><br/>
    		<table class=userJoinTable>
    			<br/>
    			<tr>
    				<td colspan="3">
    				<hr/>
    				</td>
    			</tr>
    			<tr>
    				<td>아이디 *</td>
    				<td>
    				<input class="inp" type="text" name="userId" placeholder="아이디"/>
    				<input type="button" id="overlay" value="아이디 중복 체크"/>
    				</td>
    			</tr>
    			<tr>
    				<td>비밀번호 *</td>
    				<td><input class="inp" type="password" name="userPw" placeholder="비밀번호"/></td>
    			</tr>
    			<tr>
    				<td>비밀번호 확인 *</td>
    				<td><input class="inp" type="password" name="userPwCk" placeholder="비밀번호 확인"/></td>
    			</tr>
    			<tr>
    				<td>이름 *</td>
    				<td><input class="inp" type="text" name="userName" placeholder="이름"/></td>
    			</tr>
    			<tr>
    				<td>주소 *</td>
    				<td>
    				<input class=inp type="text" name="addr1" id="sample4_postcode" placeholder="우편번호" style="margin:4 0 4 0"/> 
           			<input type="button" id="path" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <br>
           			<input class=inp type="text" name="addr2" id="sample4_roadAddress" placeholder="도로명주소" style="margin:4 0 4 0"/> 
            		<input class=inp type="text" name="addr3" id="sample4_jibunAddress" placeholder="지번주소" style="margin:4 0 4 0"/> 
            		<span id="guide" style="color: #999"></span>
    				</td>
    			</tr>
    			<tr>
    				<td>이메일 *</td>
    				<td>
    				<input class= inp type="text" name="email" placeholder="이메일" style="margin:0 5 0 0"/>@
    				<input class= inp type="text" id="emailView" name="emailView" disabled="true" style="width:150" placeholder="이메일 선택" />
    				<select id="email" >
    					<option value="0">이메일 선택</option>
    					<option value="1">직접 입력</option>
    					<option>naver.com</option>
    					<option>daum.net</option>
    					<option>hanmail.net</option>
    					<option>gmail.com</option>
    					<option>nate.com</option>
    				</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<td>휴대폰 *</td>
    				<td><input class="inp" type="text" name="phone" placeholder="휴대전화 번호"/></td>
    			</tr>
    			
    			<tr>
    				<td colspan="3">
    				<hr/>
    				</td>
    			</tr>
    			
    			<tr>
    				<td colspan="3">
    				<button class=button id="join">회원가입</button>
    				<a class=exit onclick=" location.href = 'userLogin.jsp' ">나가기</a>
    				</td>
    			</tr>
    		</table>
    	<br/>
    	<br/>
    	<br/>
    </div>
    </body>
    <script>
    
    var overChk = false;
    
    // json 등록
	var obj = {};//초기화   
    obj.type = "post";
    obj.dataType = "json";
    obj.error = function(e) {
       console.log(e)
    }; 
	
    //전달 받은 오브젝트로 ajax 통신 실행
    function ajaxCall(obj) {
       $.ajax(obj);
    }
    
    // 아이디 중복체크 기능
    $("#overlay").click(function() {
        obj.url = "./overlay";
        obj.data = {
           user_Id : $("input[name='userId']").val()
        };
        obj.success = function(d) {
           console.log(d.overlay);
           if (d.overlay) {
              alert("사용중인 아이디 입니다.");
              $("input[name='userId']").val("");
           } else {
              alert("사용 가능한 아이디 입니다.");
              $("input[name='userId']").css("color", "green");
              overChk = true;
           }
        };
        console.log(obj);
        ajaxCall(obj);
     });
    
 // 주소 찾기 기능
    function sample4_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                     extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== '' && data.apartment === 'Y') {
                     extraRoadAddr += (extraRoadAddr !== '' ? ', '
                           + data.buildingName : data.buildingName);
                  }
                  // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraRoadAddr !== '') {
                     extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }
                  // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                  if (fullRoadAddr !== '') {
                     fullRoadAddr += extraRoadAddr;
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                  document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                  // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                  if (data.autoRoadAddress) {
                     //예상되는 도로명 주소에 조합형 주소를 추가한다.
                     var expRoadAddr = data.autoRoadAddress
                           + extraRoadAddr;
                     document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                           + expRoadAddr + ')';

                  } else if (data.autoJibunAddress) {
                     var expJibunAddr = data.autoJibunAddress;
                     document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                           + expJibunAddr + ')';

                  } else {
                     document.getElementById('guide').innerHTML = '';
                  }
               }
            }).open();
   }
    
    // 이메일 입력창 관리 기능
    $("#email").change(function() {
       $("#email option:selected").each(function() {
          if ($(this).val() == '1') { //직접입력일 경우
             $("#emailView").val(''); //값 초기화
             $("#emailView").attr("disabled", false); //활성화 
          } else { //직접입력이 아닐경우 
             $("#emailView").val($(this).text()); //선택값 입력
             $("#emailView").attr("disabled", true); //비활성화
          }
       });
    }); 
		 
    // 회원가입 절차 확인
    $("#join").click(
            function() {
               if (!overChk) {
                  alert("아이디 중복 체크를 실행 해 주세요!"); // 아이디 중복체크 여부 확인
                  $("input[name='userId']").focus();//포커스 이동
               } else {
                  if ($("input[name='userPw']").val() == "") {//비밀번호 입력 확인
                     alert("비밀 번호를 확인 해 주세요!");
                     $("input[name='userPw']").focus();//포커스 이동
                  } else if ($("input[name='userPwCk']").val() == "") {//비밀번호 재입력 확인
                     alert("비밀번호확인을  확인 해 주세요!");
                     $("input[name='userPwCk']").focus();//포커스 이동
                  } else if ($("input[name='userPw']").val() != $(
                        "input[name='userPwCk']").val()) { //비밀번호 일치 확인
                     alert("비밀번호가 일치하지 않습니다.");
                     $("input[name='userPwCk']").focus();//포커스 이동
                  } else if ($("input[name='userName']").val() == "") { //이름 입력 확인
                     alert("이름을 확인 해 주세요!");
                     $("input[name='userName']").focus();//포커스 이동
                  } else if ($("input[name='addr1']").val() == ""
                        || $("input[name='addr2']").val() == ""
                        || $("input[name='addr3']").val() == "") { //주소 입력 확인
                     alert("주소를 확인 해 주세요!");
                     $("input[name='addr1']").focus();//포커스 이동
                  } else if ($("input[name='email']").val() == "") { //이메일 입력 확인
                     alert("이메일을 확인 해 주세요!");
                     $("input[name='email']").focus();//포커스 이동
                  } else if ($("input[name='phone']").val() == "") { // 핸드폰 번호 입력 확인
                     alert("핸드폰 번호를 확인 해 주세요!");
                     $("input[name='phone']").focus();//포커스 이동
                  } else {
                     console.log("서버 전송");
                     obj.url = "./join";
                     obj.data.user_Id = $("input[name='userId']").val();
                     obj.data.user_Pw = $("input[name='userPw']").val();
                     obj.data.user_Name = $("input[name='userName']").val();
                     obj.data.email = $("input[name='email']").val()+"@"+$("input[name=emailView]").val();
                     obj.data.addr1 = $("input[name='addr1']").val();
                     obj.data.addr2 = $("input[name='addr2']").val();
                     obj.data.addr3 = $("input[name='addr3']").val();
                     obj.data.phone = $("input[name='phone']").val();
					
                     obj.success = function(data) {
                        if (data.success == 1) {
                           alert("회원 가입이 정상 처리 되었습니다.");
                           location.href = "index.jsp";
                        } else {
                           alert("회원 가입에 실패 했습니다.");
                        }
                     }
                     console.log(obj);
                     ajaxCall(obj);
                  }
               }
            });
    
    </script>
</html>