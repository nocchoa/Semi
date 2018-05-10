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
    	 a:visited{
      		color:black;
      		text-decoration : none;
      	}
   		li:hover{
        	background-color: gray;
   		}
   		li.on{
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
    	#mem_del{
			float : right;
			margin-right: 100px;
		}
    	table{
    		width : 90%;
    		align: center;
    		border-top : 1px solid black;
    		border-collapse: collapse;
    		text-align: center;
    		margin: auto;	
    	}
    	td,th{
			padding : 10px;
			border-bottom : 1px solid black;
    	}
    	th{
    		background-color: #bbdefb;
  		}
		td{
			background-color: #e3f2fd;
		}
		#sell{
			background-color: gray;
		}
		h2{
			margin-left : 15px;
		}
		h4{
			margin-left : 22px;
		}

	

	
	</style>
	<body>
		<div class="title">
			<h1><a href="2-1.jsp"><img src="아이콘.gif"/>Mar-KH-et</a></h1>		
			<ul class ="menu">
				<li id="mem"><a href="2-1.jsp">회원관리</a></li>
				<li id="sell"><a href="2-2.jsp">판매자관리</a></li>
				<li><a href="2-3.jsp">후기 관리</a></li>
				<li><a href="2-4.jsp">공지사항</a></li>
				<li><a href="2-5.jsp">판매자 등록</a></li>
			</ul>
		</div>
		
		<br/><br/><br/><br/><br/><br/>
		<hr/>
		<br/><br/>
		
		<h2>판매자 관리</h2>
		<h4>승인이 완료된 판매자들을 확인 할 수 있습니다. </h4>
		
		<div class ="member">
			<table>
				<tr>
					<th>체크</th>
					<th>번호</th>
					<th>판매자아이디</th>
					<th>판매자주소</th>
					<th>핸드폰 번호</th>
					<th>가입일</th>
				</tr>
				<tr>
					<td class="che">
						<input type="checkbox"/>
					</td>
					<td class="idx"></td>
					<td class="user_Id"></td>
					<td class="user_Addr"></td>
					<td class="user_Phone"></td>
					<td class="reg_Date"></td>
				</tr>
			</table>
			<br/>
			<input id="mem_del" type="button" value="삭제" onclick="selldel()"/>
		</div>
	</body>
	<script>
	
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	});
	
	function selldel(){
        var con = confirm("정말로 삭제 하시겠습니까?");
        //"확인" 버튼을 눌렀을 경우
        if(con ==true){
            //삭제 처리(요청)
            alert("삭제가 완료 되었습니다.");
        }
	}
	
	</script>
</html>