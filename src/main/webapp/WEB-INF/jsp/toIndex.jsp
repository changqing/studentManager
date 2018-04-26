<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
	<head>
	<title>学生信息管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="css/animate.css">
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<!-- Modernizr JS -->
	<%--<script src="${pageContext.request.contextPath }/js/modernizr-2.6.2.min.js"></script>--%>
	</head>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="menu">
						<li class="active" style="font-size: 20px;color: rgb(44,89,157);">学生信息管理系统</li>
					</ul>
				</div>
			</div>
            <div class="copyrights"></div>
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<!-- Start Sign In Form -->
					<form action="${pageContext.request.contextPath }/login" class="fh5co-form animate-box" data-animate-effect="fadeIn" method="post">
						<h2>登&nbsp;录</h2>
						<div class="form-group">
							<label for="username" class="sr-only">Username</label>
							<input type="text" class="form-control" id="username" name="username" placeholder="Username" maxlength="12" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">Password</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="Password" autocomplete="off">
						</div>
						<div class="form-group">
							角色：
							<input type="radio" name="role" value="1" checked="checked"/>&nbsp;学生&nbsp;&nbsp;
							<input type="radio" name="role" value="2"/>&nbsp;教师&nbsp;&nbsp;
							<input type="radio" name="role" value="3"/>&nbsp;辅导员
						</div>
						<div class="form-group">
							<label for="remember" style="color: red;">${msg }</label>
						</div>
						<div class="form-group">
							<input type="submit" value="登&nbsp;录" class="btn btn-primary">
						</div>
					</form>
					<!-- END Sign In Form -->

				</div>
			</div>
			<div class="row" style="padding-top: 60px; clear: both;">
				<div class="col-md-12 text-center"><p><small>&copy; All Rights Reserved.</small></p></div>
			</div>
		</div>
	

	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Placeholder -->

	</body>
</html>

