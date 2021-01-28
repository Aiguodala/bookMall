<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册页面</title>
		<%@ include file="/pages/common/head.jsp"%>
		<script type="text/javascript">
			$(function () {
				$("#code_img").click(function () {
					this.src = "${basePath}kaptcha.jpg?d="+new Date();
				})
				
				
				var flag = true;

				$("#username").blur(function () {
					$("span.errorMsg").text("");
					// 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
					var usernameText = $("#username").val();
					var usernamePatt = /^\w{5,12}$/;
					if (!usernamePatt.test(usernameText)) {
						$("span.errorMsg").text("用户名不合法！");
						flag=false;
					}else flag=true;
				})

				$("#password").blur(function () {
					$("span.errorMsg").text("");
					var passwordText = $("#password").val();
					// 创建正则表达式对象
					var passwordPatt = /^\w{5,12}$/;
					// 使用test方法验证
					if (!passwordPatt.test(passwordText)) {
						// 提示用户结果
						$("span.errorMsg").text("密码不合法！");
						flag=false;
					}else flag=true;
				})
				$("#repwd").blur(function () {
					$("span.errorMsg").text("");
					// 验证确认密码：和密码相同
					var passwordText = $("#password").val();
					//1 获取确认密码内容
					var repwdText = $("#repwd").val();
					//2 和密码相比较
					if (repwdText != passwordText) {
						$("span.errorMsg").text("确认密码和密码不一致！");
						flag=false;
					}else flag=true;
				})
				$("#email").blur(function () {
					$("span.errorMsg").text("");
					// 邮箱验证：xxxxx@xxx.com
					//1 获取邮箱里的内容
					var emailText = $("#email").val();
					var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
					if (!emailPatt.test(emailText)) {
						$("span.errorMsg").text("邮箱格式不合法！");
						flag=false;
					}else flag=true;
				})

				$("#sub_btn").click(function () {
					if (flag== false) return false;

					var codeText = $("#code").val();
					codeText = $.trim(codeText);

					if (codeText == null || codeText == "") {
						//4 提示用户
						$("span.errorMsg").text("验证码不能为空！");

						return false;
					}
					})

			})
		</script>
	<style type="text/css">
		.login_form{
			height:420px;
			margin-top: 25px;
		}


	</style>
	</head>
	<body>
		<div id="login_header">
		</div>

			<div class="login_banner">

				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>

				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册用户</h1>
								<span class="errorMsg">
									<%=request.getAttribute("msg") == null?"":request.getAttribute("msg")%>
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名"
										   autocomplete="off" tabindex="1" name="username" id="username"
									value="<%=request.getAttribute("username") == null?"":request.getAttribute("username")%>"/><br>
									<span style="font-size: x-small;color: darkgrey;margin-left: 85px;">用户名由5~12位字母或者数字组成</span>
									<br />

									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码"
										   autocomplete="off" tabindex="1" name="password" id="password" />
									<span style="font-size: x-small;color: darkgrey;margin-left: 85px;">密码输入5~12位字母或者数字</span>
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码"
										   autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>电子邮件：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址"
										   autocomplete="off" tabindex="1" name="email" id="email"
									value="<%=request.getAttribute("email") == null?"":request.getAttribute("email")%>"/>
									<br />
									<br />
									<label>验证码：&nbsp;&nbsp;&nbsp;</label>
									<input class="itxt" type="text" name="code" style="width: 120px;" id="code"/>
									<img id="code_img" alt="" src="kaptcha.jpg" style="float: right; margin-right: 40px;width: 100px;height: 40px">
									<br />
									<br />
									<input type="submit" value="注册" id="sub_btn" />
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		<%@ include file="/pages/common/footer.jsp"%>
		</div>
	</body>
</html>