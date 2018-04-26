<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
	<style type="text/css">
		body {background-color: #fff;font-size: 16px;margin: 0;padding: 0;}
		#vLocation {height: 20px;padding: 1% 15px;list-style: none;background-color: #f1f1f1;font-size: 13px;}
		#searchDiv {width: 100%;height: 40px;display: inline-block;float: right;position: relative;padding-top: 15px;font-size: 12px;}
		#search {font-size: 18px;font-family: 楷体;color: RGB(221,85,68);display: inline-block;margin-left: 20px;}
		#searchForm {display: inline-block;position: absolute;top: 10px;}
		#searchPng {float: right;margin-top:-8px;}
		#searchPng:HOVER {cursor: pointer;}
		.t {width: 98%;text-align: center;}
		#title {font-size: 15px;margin-left: 1%;margin-top: 5px;border-bottom: 1px solid #999;color: #999;font-family: 楷体;}
		#title tr {height: 30px;font-weight: bold;}
		#content {margin-left: 1%;}
		#content tr td {display: inline-block;height: 25px;padding-top: 13px;font-size: 13px;border-bottom: 1px solid #ddd;
						white-space: nowrap;text-overflow: ellipsis;overflow: hidden;}
		.reviseColor {background-color: rgb(218,255,218);color: rgb(0,136,204);}
		#paging {font-family: verdana,arial,sans-serif;font-size: 13px;color: #666;width: 96%;padding-top: 15px;padding-left: 10px;}
		#paging td {text-align: right;}
		#paging td a {text-decoration: underline;color: #00f;}
		#paging td a:HOVER {color: #f00;}
		.number {color: #00f;}
		a {text-decoration: none;color: rgb(27,49,66);}
		a:HOVER {text-decoration: none;color: red;}
		textarea {overflow:hidden}
	</style>
  </head>
  <body>
    <div id="mainContent">
		<div id="vLocation">
			当前位置：课程管理 / <a href="javascript:void(0)" style="color: #0088cc;">课程列表</a>
		</div>
		
		<table id="title" class="t" cellpadding="0" cellspacing="0">
			<tr>
				<td width="10%">序号</td>
				<td width="20%">课程名称</td>
				<td width="10%">学时</td>
				<td width="15%">教室</td>
				<td width="15%">时间</td>
				<td width="30%">操作</td>
			</tr>
		</table>
		
		<table id="content" class="t" cellpadding="0" cellspacing="0">
				<c:if test="${list.size() == 0 }">
					<tr><td style="color: red;font-weight: bold;width: 100%;">未查询到课程信息</td></tr>
				</c:if>
				<c:if test="${list.size() > 0 }">
					<c:forEach items="${list }" var="c" varStatus="st">
						<tr>
							<td width="10%">${st.index + 1 }</td>
							<td width="20%" style="color: #f66;font-weight: bold;">${c.name }</td>
							<td width="10%">${c.xueshi }</td>
							<td width="15%">${c.address }</td>
							<td width="15%">${c.time }</td>
							<td width="30%">
								<a href="${pageContext.request.contextPath}/lesson/chosed?id=${c.id }" title="查看授课学生" style="margin-right: 20px;">
									<img src="/resources/static/images/people.png" width="22px" height="22px" border="0" style="CURSOR: hand;margin-top: -5px;">
								</a>
								<a href="${pageContext.request.contextPath}/lesson/edit?id=${c.id }" title="修改课程信息">
									<img src="images/edit.png" border="0" style="CURSOR: hand;margin-top: -8px;">
								</a>
								<a href="${pageContext.request.contextPath}/lesson/delete?id=${c.id }" title="删除课程信息" style="margin-left: 20px;">
									<img src="images/delete.png" border="0" style="CURSOR: hand;margin-top: -6px;">
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:if>
		</table>
	</div>
  </body>
  
  <script type="text/javascript" src="webjars/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="css/style/js/function.js"></script>
  <script type="text/javascript" src="css/style/js/jquery.blockUI.js"></script>
  <script type="text/javascript">
  
  	$(function(){
		altRows("content");
		reviseTdColor();
	});
	
  	function altRows(id){
		if(document.getElementsByTagName){
			var table = document.getElementById(id);  
			var rows = table.getElementsByTagName("tr");
			for(var i = 0; i < rows.length; i++){          
				if(i % 2 == 0){
					rows[i].className = "evenrowcolor";
				} else {
					rows[i].className = "oddrowcolor";
				}      
			}
		}
	}
	
	function reviseTdColor() {
		$("#content tbody tr").mouseover(function() {
			$(this).addClass("reviseColor");
		});
		$("#content tbody tr").mouseout(function() {
			$(this).removeClass("reviseColor");
		});
	}
	
  </script>
</html>
