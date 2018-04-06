<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>学生信息管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style/css/bootstrap.css" />
	<style type="text/css">
		.left {height: 100%;background: rgb(247,247,247);}
		div.sdmenu{ font-size:12px;background:#ccc;color:#fff;}
		div.sdmenu div{overflow:hidden; margin-top:-1px;}
		div.sdmenu div.collapsed {height: 30px;}
		div.sdmenu div span{display:block;height:30px;line-height:30px;overflow:hidden; cursor:pointer;background: url(${pageContext.request.contextPath}/css/style/images/syscenter/left2.png); font-size:12px; color:#38A3D5; text-indent:30px; font-weight:bold;font-family:"microsoft yahei";}
		div.sdmenu div.collapsed span{background:#ccc;background: url(${pageContext.request.contextPath}/css/style/images/syscenter/left.png);font-family:"microsoft yahei"; font-size:12px; color:#333; text-indent:30px; font-weight:bold;}
		div.sdmenu div{background:#fff url(${pageContext.request.contextPath}/css/style/images/syscenter/left_bg.png) repeat-y right;}
		div.sdmenu div a{display:block;color:#066; background:url(${pageContext.request.contextPath}/css/style/images/syscenter/171.png) no-repeat 30px 4px; text-indent:50px; padding:2px 0;}
		div.sdmenu div a.current{ background:#38A3D5 url(${pageContext.request.contextPath}/css/style/images/syscenter/171.png) no-repeat 27px 4px; border-left:3px solid #F65241; color:#fff;}
		div.sdmenu div a:hover{background-color:#e2e2e2;color:#f00;text-decoration: underline;}
		div.sdmenu div a.current:hover{background:#38A3D5 url(${pageContext.request.contextPath}/css/style/images/syscenter/171.png) no-repeat 27px 4px; border-left:3px solid #F65241; color:#fff;}
		#loginInfo {width: 100%;height: 100px;background: rgb(247,247,247);}
		.infoDiv {float: left;}
		#userImg {padding: 24px 0 0 5px;}
		#userInfo {margin: 10px 0 0 5px;width: 155px;overflow: hidden;}
		.infoDiv2 {width: 155px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}
		.infoDiv3 {width: 155px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}
		.info {color: rgb(221,85,68);}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/style/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/style/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/css/style/js/sdmenu.js"></script>
</head>
<body>
	<div class="left">
		<div id="loginInfo">
			<div class="infoDiv" id="userImg">
				<img alt="用户默认头像" src="${pageContext.request.contextPath}/css/style/images/admin_male_48.png">
			</div>
			<div class="infoDiv" id="userInfo">
				<div class="infoDiv2" style="margin-top: 20px;">用户名：<font class="info">${loginUser.username }</font></div>
				<div class="infoDiv2" style="margin-top: 2px;">角色：<font class="info">
					<c:if test="${role == '1' }">学生</c:if>
					<c:if test="${role == '2' }">教师</c:if>
					<c:if test="${role == '3' }">辅导员</c:if>
				</font></div>
			</div>
		</div>
		<c:if test="${role == '1'}">
			<div id="my_menu" class="sdmenu">
				<div>
					<span>个人资料</span>
					<a href="${pageContext.request.contextPath}/selfInfo" target="contentFrame">修改个人信息</a>
				</div>
				<div class="collapsed">
					<span>课程管理</span>
					<a href="${pageContext.request.contextPath}/lesson/stu/own" target="contentFrame">我的成绩</a>
					<a href="${pageContext.request.contextPath}/lesson/stu/list" target="contentFrame">所有课程</a>
				</div>
				<div class="collapsed">
					<span>请假申请</span>
					<a href="${pageContext.request.contextPath}/leave/stu/list" target="contentFrame">查看记录</a>
					<a href="${pageContext.request.contextPath}/leave/stu/add" target="contentFrame">新增请假</a>
				</div>
				<div class="collapsed">
					<span>查看通知</span>
					<a href="${pageContext.request.contextPath}/notice/stu/list" target="contentFrame">通知列表</a>
				</div>
			</div>
		</c:if>
		<c:if test="${role == '2'}">
			<div id="my_menu" class="sdmenu">
				<div>
					<span>个人资料</span>
					<a href="${pageContext.request.contextPath}/selfInfo" target="contentFrame">修改个人信息</a>
				</div>
				<div class="collapsed">
					<span>课程管理</span>
					<a href="${pageContext.request.contextPath}/lesson/teacher/list" target="contentFrame">课程列表</a>
					<a href="${pageContext.request.contextPath}/lesson/add" target="contentFrame">添加课程</a>
				</div>
			</div>
		</c:if>
		<c:if test="${role == '3'}">
			<div id="my_menu" class="sdmenu">
				<div>
					<span>个人资料</span>
					<a href="${pageContext.request.contextPath}/selfInfo" target="contentFrame">修改个人信息</a>
				</div>
				<div class="collapsed">
					<span>通知管理</span>
					<a href="${pageContext.request.contextPath}/notice/list" target="contentFrame">通知列表</a>
					<a href="${pageContext.request.contextPath}/notice/add" target="contentFrame">新增通知</a>
				</div>
				<div class="collapsed">
					<span>请假管理</span>
					<a href="${pageContext.request.contextPath}/leave/teacher/list" target="contentFrame">请假列表</a>
				</div>
			</div>
		</c:if>
	</div>
	
	<script type="text/javascript">
		var myMenu;
		window.onload = function() {
			myMenu = new SDMenu("my_menu");
			myMenu.init();
		};
	</script>
</body>
</html>

