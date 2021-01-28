<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
	<%@ include file="/pages/common/head.jsp"%>
</head>

<body>
	
	<div id="header">

			<span class="wel_word">订单号:<%=request.getParameter("orderId")%></span>

		<%@include file="/pages/common/menu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>商品名称</td>
				<td>数量</td>
				<td>单价</td>
				<td>金额</td>
			</tr>
		<c:if test="${not empty sessionScope.orderItems}">

			<c:forEach items="${sessionScope.orderItems}" var="orderItems">
				<tr>
					<td>${orderItems.name}</td>
					<td>${orderItems.count}</td>
					<td>${orderItems.price}</td>
					<td>${orderItems.totalPrice}</td>
				</tr>

			</c:forEach>

		</c:if>

		</table>

	</div>

	<%@ include file="/pages/common/footer.jsp"%>
</body>
</html>