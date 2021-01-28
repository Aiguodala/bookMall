<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>书城首页</title>
	<%@ include file="/pages/common/head.jsp"%>
<script type="text/javascript">
	$(function () {


		$("#loginOut").click(function () {
			return confirm("你确定要注销登录吗？")
		})

		$("button.addToCart").click(function () {

			var bookId = $(this).attr("bookId");

			$.getJSON("${pageContext.request.contextPath}/cartServlet","action=ajaxAddItem&id="+bookId,function (data) {
				$("#cartTotalCount").text(data.totalCount);
				$("#cartLastName").text("您刚刚将《"+data.lastName+"》加入到了购物车中");

			})
		})
	})
</script>

</head>
<body>

<div style="background-color: silver;margin: 0;line-height: 30px;text-align: right;padding-right: 150px;">

	<c:if test="${empty sessionScope.user}">
		<a href="pages/user/login.jsp" style="text-decoration: none">登录</a> |
		<a href="pages/user/regist.jsp" style="text-decoration: none">注册</a>
	</c:if>
	<c:if test="${not empty sessionScope.user}">
		<span>用户:<span class="um_span">${sessionScope.user.username}</span></span>&nbsp;&nbsp;&nbsp;
		<a href="orderServlet?action=myOrders"style="text-decoration: none">我的订单</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="loginOut" href="userServlet?action=loginOut" style="text-decoration: none">注销登录</a>

	</c:if>

	<a href="pages/cart/cart.jsp" style="padding-left: 30px;text-decoration: none">购物车(<span id="cartTotalCount">${sessionScope.cart.totalCount == null?0:sessionScope.cart.totalCount}</span>)</a>
	<a href="pages/manager/manager.jsp" style="padding-left: 20px;text-decoration: none">后台管理</a>
</div>
	<div id="header">
			
			<span class="wel_word" style="color: forestgreen">网上书城</span>
		<span  style="margin: 0 auto;font-size: x-large">
			<form action="client/bookServlet" method="get">
			<input type="hidden" name="action" value="pageByName">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索：<input id="bookName" type="text" name="bookName" value="${param.bookName}" placeholder="请输入搜索内容" style="width: 400px;border-color: forestgreen;border-bottom-width: 1px;height: 30px;margin-top: 30px;">
			<input id="seacheForBook" type="submit" value="查询" style="background-color: forestgreen;width: 80px;height: 35px;color: white"/>
		</form>
		</span>


	</div>
	<div id="main">
		<div id="book">
			<div class="book_cond">

			</div>
			<div style="text-align: center">
				<%--<c:if test="${empty sessionScope.cart.items}">
					<div>
						<span style="color: forestgreen">当前购物车为空</span>
					</div>
				</c:if>--%>
				<%--<c:if test="${not empty sessionScope.cart.items}">--%>
					<%--<span>您的购物车中有${sessionScope.cart.totalCount}件商品</span>--%>
					<div>
						<span id="cartLastName" style="color: red">&nbsp;</span>
					</div>
				<%--</c:if>--%>

			</div>
			<c:forEach items="${requestScope.page.items}" var="book">
				<div class="b_list">
					<div class="img_div">
						<img class="book_img" alt="" src="${book.imgPath}" />
					</div>
					<div class="book_info">
						<div class="book_name">
							<span class="sp1">书名:</span>
							<span class="sp2">${book.name}</span>
						</div>
						<div class="book_author">
							<span class="sp1">作者:</span>
							<span class="sp2">${book.author}</span>
						</div>
						<div class="book_price">
							<span class="sp1">价格:</span>
							<span class="sp2">￥${book.price}</span>
						</div>
						<div class="book_sales">
							<span class="sp1">销量:</span>
							<span class="sp2">${book.sales}</span>
						</div>
						<div class="book_amount">
							<span class="sp1">库存:</span>
							<span class="sp2">${book.stock}</span>
						</div>
						<div class="book_add">
							<button bookId="${book.id}" class="addToCart">加入购物车</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<%@include file="/pages/common/page_nav.jsp"%>
	
	</div>

	<%@ include file="/pages/common/footer.jsp"%>
</body>
</html>