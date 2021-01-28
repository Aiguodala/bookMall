<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会员注册页面</title>
	<%@ include file="/pages/common/head.jsp"%>
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
</style>
</head>
<body>
		<div id="header">

				<span class="wel_word"></span>
			<div>
				<span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临书城</span>
				<a href="index.jsp">返回</a>
			</div>
			<%--<%@include file="/pages/common/menu.jsp"%>--%>
		</div>
		
		<div id="main">
		${requestScope.user}
			<h1>注册成功! <a href="index.jsp">转到主页</a></h1>
	
		</div>
		
		<%@ include file="/pages/common/footer.jsp"%>
</body>
</html>