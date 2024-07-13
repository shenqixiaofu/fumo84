<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUMO登陆界面</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style>
	html, body, div.box {
		height: 100%;
		background-color: gray;
	}
	
	div.ibox {
		background-color: white;
		height: 60%;
		width: 50%;
		border-radius: 25px;
	}
	
	div.container {
		width: 100%;
	}
	
	div.text {
		text-align: center;
		font-size: 20px;
		
	}
	
	.button {
		text-align: center;
	}
</style>
</head>
<body>
	<div class="box d-flex justify-content-center align-items-center">
		<div class="ibox d-flex justify-content-center align-items-center">
			<form action="loginservlet" method="post">
				<div class="text">
					管理员登陆
				</div>
				<br>
				<div>
					${errerMsg }
				</div>
				<br>
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">用户名</label> <input
						type="text" class="form-control" name="username">
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">密码</label> <input
						type="password" class="form-control" id="exampleInputPassword1"
						name="password">
				</div>
				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input" id="exampleCheck1">
					<label class="form-check-label" for="exampleCheck1">同意协议</label>
				</div>
				<div class="button">
					<button type="submit" class="btn btn-primary" disabled
						style="float: left;">登录</button>
					<a class="btn btn-primary"
					href="adduser.jsp"
					role="button" target="_self">注册</a>
					<button type="reset" class="btn btn-primary" style="float: right;">重置</button>
				</div>
			</form>
		</div>
	</div>
	<script>
		document.getElementById("exampleCheck1").onclick = function() {
			if (this.checked)
				document.getElementsByTagName("button")[0].disabled = false;
			else
				document.getElementsByTagName("button")[0].disabled = true;
		}
	</script>
</body>
</html>