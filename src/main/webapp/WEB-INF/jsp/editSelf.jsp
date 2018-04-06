<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
  <head>
    <title>个人信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style/css/bootstrap.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/style/js/jquery-1.9.0.min.js"></script>
	<style type="text/css">
		body {background-color: #f5f5f5;font-size: 16px;}
		#vLocation {height: 20px;padding: 10px 15px;list-style: none;background-color: #f1f1f1;font-size: 13px;}
		#infoDiv {width: 100%;}
		#infoTable {width: 40%;margin: 20px 0 0 25%;font-size: 16px;}
		.leftTD {width: 130px;height: 40px;text-align: right;font-family: 微软雅黑,宋体, 'Arial Narrow', HELVETICA;}
		.rightTD {height: 40px;padding-left: 20px;text-align: left;/* font-family: 微软雅黑,宋体, 'Arial Narrow', HELVETICA;font-weight: bold; */color: #08c;}
		.rightTD input {height: 25px;}
		#subBtn {display: inline-block;width: 80px;margin-left: 30px;}
		h4 {margin: 20px 15px;color: #777;}
		textarea {overflow:hidden}
	</style>
  </head>
  <body>
	<div id="vLocation">
		当前位置&nbsp;：个人资料&nbsp;&nbsp;<span class="divider">/</span>&nbsp;&nbsp;<a href="javascript:void(0)">修改个人信息</a>
	</div>
	<div id="infoDiv">
		<form id="saveForm" action="${pageContext.request.contextPath}/update" method="post">
			<input type="hidden" name="id" value="${loginUser.id }"/>
			<c:if test="${role != '1' }"><input type="hidden" name="role" value="${loginUser.role }"/></c:if>
			<table id="infoTable">
				<tr>
					<td class="leftTD" style="color: #f66;font-weight: bold;">${msg }</td>
					<td class="rightTD"></td>
				</tr
				<tr>
					<td class="leftTD">学号</td>
					<td class="rightTD"><input type="text" id="username" name="username" value="${loginUser.username }" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="leftTD">密码</td>
					<td class="rightTD"><input type="password" id="password" name="password" value="${loginUser.password }"/></td>
				</tr>
				<tr>
					<td class="leftTD">确认密码</td>
					<td class="rightTD"><input type="password" id="cfmPwd" name="" value="${loginUser.password }"/></td>
				</tr>
				<tr>
					<td class="leftTD">姓名</td>
					<td class="rightTD"><input type="text" id="truename" name="truename" value="${loginUser.truename }"/></td>
				</tr>
				<c:if test="${role == '1' }">
					<tr>
						<td class="leftTD">性别</td>
						<td class="rightTD">
							<select name="sex" style="width: 150px;height: 24px;">
								<c:if test="${loginUser.sex == '男' }">
									<option value="男" selected=selected>男</option>
									<option value="女">女</option>
								</c:if>
								<c:if test="${loginUser.sex == '女' }">
									<option value="男">男</option>
									<option value="女" selected=selected>女</option>
								</c:if>
							</select>
						</td>
					</tr>
				</c:if>
				<tr>
					<td class="leftTD">手机</td>
					<td class="rightTD"><input type="text" id="phone" name="phone" value="${loginUser.phone }"/></td>
				</tr>
				<tr>
					<td class="leftTD">邮箱</td>
					<td class="rightTD"><input type="text" id="email" name="email" value="${loginUser.email }"/></td>
				</tr>
				<tr>
					<td class="leftTD"></td>
					<td class="rightTD"><button id="subBtn">提交</button></td>
				</tr>
			</table>
		</form>
	</div>
  </body>
  <script type="text/javascript">
  	$(function(){
  		$("#subBtn").click(function() {
			var password = $("#password").val();
			var cfmPwd = $("#cfmPwd").val();
			var truename = $("#truename").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			if (password!='' && cfmPwd!='' && truename!='' && phone!='' && email!='') {
				if (password != cfmPwd) {
					alert("请确定两次填写的密码相同");
					return false;
				} else {
					$("#saveForm").submit();
				}
			} else {
				alert("请将信息填写完整");
				return false;
			}
		});
  	});
  </script>
</html>
