<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE>
<html>
  <head>
    <title></title>
	<style type="text/css">
		body {background-color: #fff;font-size: 16px;margin: 0;padding: 0;}
		#vLocation {height: 20px;padding: 1% 15px;list-style: none;background-color: #f1f1f1;font-size: 13px;}
		a {text-decoration: none;color: rgb(27,49,66);}
		a:HOVER {text-decoration: none;color: red;}
		.notice {width: 96%;margin: 5px 0 0 2%;border-bottom: 1px solid #aaa;}
		.title {font-family: 微软雅黑;font-size: 14px;color: #f66;line-height: 20px;}
		.content {font-family: 微软雅黑;font-size: 12px;text-indent: 2em;line-height: 20px;}
		.t {float: right;margin: 0 10px 0 0;font-weight: normal;font-size: 10px;color: #000;}
	</style>
  </head>
  <body>
    <div id="mainContent">
		<div id="vLocation">
			当前位置：查看通知/ <a href="javascript:void(0)" style="color: #0088cc;">通知列表</a>
		</div>
		
		<c:forEach items="${list }" var="n" varStatus="st">
			<div class="notice">
				<h4 class="title">${st.index+1 }、 ${n.title }<span class="t"><fmt:formatDate value="${n.publishtime }" pattern="yyyy-MM-dd HH:mm:ss"/></span></h4>
				<p class="content">${n.content }</p>
			</div>
			
		</c:forEach>
		
	</div>
  </body>
  
</html>
