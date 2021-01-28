<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
	<%@ include file="/pages/common/head.jsp"%>

<script type="text/javascript">
		$(function () {
			$("#sendOrder_btn").click(function () {
				var orderId = $(this).attr("orderId");

				location.href = "${pageContext.request.contextPath}/orderServlet?action=sendOrder&orderId="+orderId;


				/*$.getJSON("http://localhost:8080/bookMall/orderServlet","action=sendOrder&orderId="+orderId,function (data) {
					$("#tdText").text("已发货，等待签收");
				})*/
			})
		})
	</script>
</head>
<body>
	
	<div id="header">

			<span class="wel_word">订单管理系统</span>
		<%@ include file="/pages/common/manager.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>日期</td>
				<td>金额</td>
				<td>详情</td>
				<td>发货</td>
				
			</tr>



			<c:if test="${not empty sessionScope.orders}">

				<c:forEach items="${sessionScope.orders}" var="order">

					<tr>
						<td>${order.createTime}</td>
						<td>${order.price}</td>
						<td><a href="orderServlet?action=orderDetil&orderId=${order.orderId}">查看详情</a></td>

						<%--<a href="orderServlet?action=sendOrder&orderId=${order.orderId}">点击发货</a>--%>
						<td id="tdText">
							<c:if test="${order.status == 1}">已发货<br>
								等待签收</c:if>

							<c:if test="${order.status == 0}"><button orderId="${order.orderId}" id="sendOrder_btn">点击发货</button></c:if>

							<c:if test="${order.status == 2}">已签收</c:if>
						</td>
					</tr>

				</c:forEach>

			</c:if>

		</table>
	</div>

	<%@ include file="/pages/common/footer.jsp"%>
</body>
</html>