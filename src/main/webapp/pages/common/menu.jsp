<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/12/30
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        $("#loginOut").click(function () {
            return confirm("你确定要注销登录吗？")
        })
    })
</script>
<div>
    <span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临书城</span>
    <a href="orderServlet?action=myOrders">我的订单</a>
    <a id="loginOut" href="userServlet?action=loginOut">注销登录</a>&nbsp;&nbsp;
    <a href="index.jsp">返回</a>
</div>