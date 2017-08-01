<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'hello.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<table border="0" width="900px">
		<tr>
			<td align="center" style="font-size:24px; color:#666">人员管理</td>
		</tr>
		<tr>
			<td align="right"><a
				href="${pageContext.request.contextPath}/person/addperson">添加</a></td>
		</tr>
	</table>
	<br />
	<table cellspacing="0" border="1" class="table1">
		<thead>
			<tr>
				<th width="300">姓名</th>
				<th width="300">身份证号</th>
				<th width="300">电话</th>
				<th width="300">地址</th>
				<th width="300">编辑</th>
				<th width="300">删除</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="p" items="${requestScope.personlist }">
				<tr>
					<td align="center">${p.name }</td>
					<td align="center">${p.idCard }</td>
					<td align="center">${p.phone }</td>
					<td align="center">${p.address }</td>
					<td align="center"><a
						href="${pageContext.request.contextPath}/person/doupdate?id=${p.id}"><img
							src="<%=basePath%>images/编辑.png"></a></td>
					<td align="center"><a
						href="${pageContext.request.contextPath}/person/deletePersonById?id=${p.id}"
						onclick='return confirm("确认要删除吗?")'><img
							src="<%=basePath%>images/trash.gif"></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br />
</body>
</html>
