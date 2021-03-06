<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
	<style>
		body {
        	margin: 0px;
        	padding: 0px;
      	}
      	a{
      		text-decoration : none;
      	}
		.title {
			min-width : 1000px;
			margin : 0 auto;
		}
		h1{
			color : black; 
			line-height:70px;
			float : left; 	
		}
		.menu {
			float : right;
		}
		.menu li{
			 float: left;
			 color: black;
		     font-weight: 600;
		     font-size: 120%;
		}
		.menu a{
		    line-height:80px;
    		color : black;
    		padding: 0 15px; 
    		display: block;
		}
    	li{
    	   	list-style-type: none;
    	}
   		a:hover{
        	background-color: gray;
   		}
   		a.on{
   			background-color:gray;
   		}
    	.bar{
	        border: 1px solid white;
	        width: 100%;
	        height: 30px;
	        background-color: white;
    	}
    	.member{
    		min-width : 800px;
    	}
		#notice{
			background-color: gray;
		}

		#write-form td {
		    border: none;
		}
		#write-form textarea {
		    width: 99%;
		}
				h5{
			float : right;
		}
				#notice_form{
			margin:0 auto;
		}
		#write-form td {
		    border: none;
		}
		#write-form textarea {
		    width: 90%;
		}
		table{
    		border-top : 1px solid black;
    		border-collapse: collapse;
    		text-align: center;
			min-width : 700px;
			margin : 0 auto;
            height:300px; 
		}
		h3{
			text-align: center;
		}
		h2{
			margin-left : 15px;
		}
		 a{
      		text-decoration : none;
      	}
	
	</style>
	<body>
		<div class="title">
			<h1><a href="a_main_user.jsp"><img src="아이콘.gif"/>Mar-KH-et</a></h1>		
			<ul class ="menu">		
				<li id="mem"><a href="a_main_user.jsp">회원관리</a></li>
				<li id="sell"><a href="a_seller.jsp">판매자관리</a></li>
				<li id="review"><a href="a_review.jsp">후기 관리</a></li>
				<li id="notice"><a href="a_notice.jsp">공지사항</a></li>
				<li id="regist"><a href="a_seller_re.jsp">판매자 등록</a></li>
			</ul>
		</div>
		<br/><br/><br/><br/><br/><br/>
		<hr/>
		<h5> <%=request.getSession().getAttribute("loginId") %> , 로그인 중 <button onclick="location.href='a_login.jsp'">로그아웃</button></h5>
		<br/><br/>
		<div id="notice_form"><h2>공지사항</h2></div>
		<h3>공지사항 글쓰기 </h3>
		
		
		<table id="write-form" >
			<tr>
				<td>작성자</td>
				<td><input type="text" name="admin_id" id="admin_id" readonly/></td>
			</tr>
			<tr>
			    <td>제목</td>
			    <td><input type="text" name="title" id="title"style="width: 90%;" placeholder="제목을 입력하세요" /></td>
			</tr>
			<tr>
				<td>내용</td>
			    <td>
			        <textarea name="content" id="content" rows="15" cols="120" placeholder="내용을 입력하세요"></textarea>
			    </td>
			</tr>
		</table>
		<div style="text-align: center;padding-bottom: 15px;">
			<br/><br/>
			<a href="./a_notice.jsp">리스트 가기</a>
		    <button id="save">저장</button>
		</div>
		
			</body>
	<script>
	
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	});
	
	
	var obj = {};
	obj.type = "POST";
	obj.dataType ="JSON";
	obj.error = function(e){console.log(e)};
	
	//로그인체크 메서드
	$(document).ready(function(){
		obj.url="./admin_loginCheck";
		obj.success = function(data){
			if(data.login){
				$("#admin_id").val(data.loginId);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href ="a_login.jsp";	
			}
	}
		ajaxCall(obj);
	});
	
	// 글쓴 후 저장 버튼 클릭시 
	$("#save").click(function(){
		console.log($("#admin_id").val());
		obj.url="./notice_write";
		obj.data ={};
		//제목, 내용만 작성 
		obj.data.admin_id = $("#admin_id").val();
		obj.data.title = $("#title").val();
		obj.data.content = $("#content").val();
		obj.success = function(data){
			console.log(data);
			if(data.success>0){
				if((obj.data.title == null)){
						alert("제목이 작성 되지 않았습니다!")
					}
				else if(obj.data.content == null){
						alert("내용이 작성되지 않았습니다.")
					}
				else if(obj.data.title==null && obj.data.content==null){
						alert("제목과 내용이 작성되지 않았습니다.")
				}else{
					alert("글쓰기에 성공 했습니다.");
					//글쓰기 성공시 경로 설정 
					location.href = "a_notice_detail.jsp";
				}

			}else{
				alert("글쓰기에 실패 했습니다.");
			}
		}
		
		ajaxCall(obj);
	})
		function ajaxCall(param){
		$.ajax(param);

	}

	</script>
</html>