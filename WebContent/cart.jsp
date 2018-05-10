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
			min-width : 2750px;  
        	margin : 0 auto;
      	}
		.jbTitle {
			text-align: center;
		}
		
		.jbMenu {
			text-align: center;
			background-color: yellow;
			padding: 10px 0px;
			width: 100%;
		}
		.jbFixed {
        	position: fixed;
        	top: 0px;
      	}

           li{
                        list-style: none;
                        padding: 5px 10px;
                        text-align: left;
                        float: left;
                        width: 300px;
                        text-align: center;
                        border: 1px solid black; 

                    }
                    a{
                        text-decoration: none;
                    }

                    table {
                            width: 50%;
                            border-top: 1px solid #444444;
                            border-collapse: collapse;
                          }
                    th{
                        border-bottom: 1px solid #444444;
                        padding: 10px;
                      }
                    td{
                        padding: 10px;
                         border-bottom: 1px solid #444444;
                        border-right:  1px solid #444444;
                    }
                    .ta{
                        border-left: 1px solid #444444;
                    }
                    .tds{
                        border-right: 1px solid #ffffff;
                        border-left: 1px solid #444444;
                    }
                    .tda{
                        border-bottom: 1px solid #ffffff;
                        border-right:  1px solid #ffffff;
                    }
                    .tdb{
                        border-right:  1px solid #ffffff;
                    }
                    .tdz{
                        border-bottom: 1px solid #ffffff;
                    }
      
	</style>
	<body>
        <ul class="menu">
            <li>
                <a  href="4.jsp">주문내역</a>
            </li>
            <li>
                <a href="5.jsp">장바구니</a>
            </li>
            <li>
                <a href="6.jsp">작성한후기</a>
            </li>
            <li>
                <a href="7.jsp">개인정보수정</a>
            </li>
        </ul>
        <br><br><br>
        <table>
          <tr>
                <td colspan="2" class="ta">
                    <input type="checkbox">상품정보  
                </td>
                <td>상품금액</td>
                <td>배송비</td>
          </tr>
          <tr>
                <td class="ta"><input type="checkbox" value=""><img src="#"></td>
                <td>안심</td>
                <td>10,000원</td>
                <td>2,500원</td>
          </tr>
          <tr>
                <td class="ta"><input type="checkbox" value=""><img src="#"></td>
                <td>삼겹살</td>
                <td>10,000원</td>
              <td>2,500원</td>
          </tr>
          <tr>
                <td rowspan="2" class="tds">총 주문금액</td>
                <td class="tda"></td>
                <td class="tda">총 상품금액</td>
                <td class="tdz">25,000원</td>
          </tr>
          <tr>
                <td class="tdb"></td>
                <td class="tdb">배송비</td>
                <td>5,000원</td>
          </tr>
          <tr>
                <td colspan="2" class="tds"></td>
                <td class="tds">총 주문금액</td>
                <td>30,000원</td>
          </tr>
        </table>
        <button id="continue">쇼핑 계속하기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="buy">구매하기</button>
	</body>
	<script>
		$("#continue").click(function(){
   	 		location.href="cate1.jsp"; 
    	});
		
		$("#buy").click(function(){
   	 		location.href="buy.jsp"; 
    	});
	</script>
</html>