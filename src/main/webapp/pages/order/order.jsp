<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
	<%@ include file="/pages/common/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>

<script type="text/javascript">
	$(function () {
		$("#receive_btn").click(function () {
			var orderId = $(this).attr("orderId");

			location.href = "${pageContext.request.contextPath}/orderServlet?action=receiveOrder&orderId="+orderId;

			})
	})
</script>
</head>
<body>
	
	<div id="header">

			<span class="wel_word">我的订单</span>
		<%--<%@include file="/pages/common/menu.jsp"%>--%>
		<div>
			<span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临书城</span>
			<a href="pages/cart/cart.jsp" style="padding-left: 30px;text-decoration: none">购物车(${sessionScope.cart.totalCount == null?0:sessionScope.cart.totalCount})</a>
			<a href="index.jsp">返回</a>
		</div>
	</div>
	
	<div id="main">

		<table>
			<tr>
				<td>日期</td>
				<td>金额</td>
				<td>状态</td>
				<td>详情</td>
			</tr>

			<c:if test="${not empty sessionScope.orders}">

				<c:forEach items="${sessionScope.orders}" var="order">

					<tr>
						<td>${order.createTime}</td>
						<td>${order.price}</td>
						<td>
							<c:if test="${order.status==0}">未发货</c:if>
							<c:if test="${order.status==1}">已发货<br>
								<button orderId="${order.orderId}" id="receive_btn">确认收货</button></c:if>
							<c:if test="${order.status==2}">已签收</c:if>
						</td>
						<td><a href="orderServlet?action=orderDetil&orderId=${order.orderId}">查看详情</a></td>
					</tr>

				</c:forEach>

			</c:if>

		</table>
		
	
	</div>

	<%@ include file="/pages/common/footer.jsp"%>
</body>
</html>