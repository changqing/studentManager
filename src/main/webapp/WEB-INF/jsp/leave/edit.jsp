<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
  <head>
    <title>添加请假信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.css" />
	<script type="text/javascript" src="webjars/jquery/1.9.1/jquery.min.js"></script>
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
		当前位置&nbsp;：请假申请&nbsp;&nbsp;<span class="divider">/</span>&nbsp;&nbsp;<a href="javascript:void(0)">新增请假申请</a>
	</div>
	<div id="infoDiv">
		<form id="saveForm" action="${pageContext.request.contextPath}/leave/update" method="post">
			<input type="hidden" name="id" value="${l.id }"/>
			<input type="hidden" name="sid" value="${l.sid }"/>
			<input type="hidden" name="sname" value="${l.sname }"/>
			<input type="hidden" name="status" value="${l.status }"/>
			<table id="infoTable">
				<tr>
					<td class="leftTD">标题</td>
					<td class="rightTD"><input type="text" id="title" name="title" value="${l.title }"/></td>
				</tr>
				<tr>
					<td class="leftTD">原因</td>
					<td class="rightTD">
						<textarea rows="6" cols="10" name="content">${l.content }</textarea>
					</td>
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
			var title = $("#title").val().trim();
			var content = $("#content").val();
			if (truename!='' && age!='') {
				$("#saveForm").submit();
			} else {
				alert("请将信息填写完整");
				return false;
			}
			
		});
  	});
  </script>
</html>
