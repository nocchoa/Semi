<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#menuCenter {
	width: 1000px;
	margin: 0 auto;
}
#detailTable table,#detailTable tr,#detailTable th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
#pic {
	width: 500px;
	height: 450px;
}

.mainImg {
	background-color: aqua;
	width: 1000px;
	height: 300px;
}
</style>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<div id="menuCenter">
		<div id="detailTable">
			<h2>${info.cateFirst_Id } > ${info.cateSecond_Id }</h2>
			<table>
				<tr>
					<th id="pic" colspan="2" rowspan="7">
						<c:if test="${list.newFileName1 ne null}">
							<img width="500" src="./upload/${list.newFileName1}"/>
						</c:if>
					</th>
					<th colspan="2" style="width: 500px">
						<c:if test="${info.prd_Count eq 0}">
							<h2 style="color:red">[품절]</h2>
						</c:if>
						<h2>${info.prd_Name }</h2>
					</th>
				</tr>
				<tr>
					<th style="width: 100px">판매자</th>
					<th style="width: 400px">${info.sell_Id }</th>
				</tr>
				<tr>
					<th>판매가(100g)</th>
					<th>${info.prd_Price }</th>
				</tr>
				<tr>
					<th>원산지</th>
					<th>${info.prd_From }</th>
				</tr>
				<tr>
					<th>조회수</th>
					<th>${info.prd_bHit }</th>
				</tr>
				<tr>
					<th>구매수량</th>
					<th>
						<button id="dec">-</button> 
							<span id="msg">1</span>
						<button id="inc">+</button>
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<button onclick = "location.href ='prd2_buy?prd_id=${info.prd_Id}&sell_id=${info.sell_Id}'">바로결제</button>
						<button id="cart">장바구니 추가</button>
						<%-- <button onclick = "location.href = 'prd2_cart?prd_id=${info.prd_Id}'">장바구니 추가</button> --%>
						<button id="restock">재입고 알림</button>
					</th>
				</tr>
				<tr>
					<th colspan="4" width="1000px" height="300px">
						<c:if test="${list.newFileName2 ne null}">
							<img width="500" src="./upload/${list.newFileName2}"/>
						</c:if>
						<c:if test="${list.newFileName3 ne null}">
							<img width="500" src="./upload/${list.newFileName3}"/>
						</c:if>
					</th>
				</tr>
				<tr>
					<th width="140px"><h3>글 내용</h3></th>
					<th height="300px" colspan="3">${info.prd_Content }</th>
				</tr>
			</table>
		</div>
		<jsp:include page="reviewList.jsp"></jsp:include>
	</div>
</body>
<script>
	var cnt=1;
	/* var id = "${sessionScope.loginUserId}";
	
	$(document).ready(function() {
		if(id != null) {
			alert("로그인이 필요한 서비스입니다.");
			history.back();
		}	
	}); */
	
	$("#inc").click(function() {
		cnt=cnt+1;
		$("#msg").text(cnt);
	});

	$("#dec").click(function() {
		cnt=cnt-1;
		if(cnt<0){
			alert("수량을 다시 입력해주세요.");
			cnt=0;
		};
		
		$("#msg").text(cnt);
	});

	<%-- function cart() {
		location.href = "prd2_cart?prd_id=${info.prd_Id}&prd_count="+cnt;
		<button onclick = "location.href = 'prd2_cart?prd_id=${info.prd_Id}'">장바구니 추가</button>
	} --%>
	
	///////////////
	/*ProductDTO2 dto2 = dao2.buy(request.getParameter("prd_id"));
	request.setAttribute("info", dto2);
	dto2 = dao2.list(request.getParameter("prd_id"));
	request.setAttribute("list", dto2);
	RequestDispatcher dis = request.getRequestDispatcher("cart.jsp");
	dis.forward(request, response);*/
	
	// 수량 컬럼 추가(필요)
	$("#cart").click(function(){
		$.ajax({
			type : "post",
			url : "./prd2_cart",
			dataType : "json",
			data : {
				prd_id: "${info.prd_Id}",
				user_id: "${sessionScope.loginUserId}",
				prd_count: cnt
			},
			success : function(data) {
				alert(data.msg);
				location.href = "cartDetail?prd_id=${info.prd_Id}&prd_count="+cnt;
			},
			error : function(err) { console.log(err) }
		});
	}); 
	</script>
</html>