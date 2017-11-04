<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<h2>查看用户</h2>

<table>
	<tr>
		<td>编号</td>
		<td>姓名</td>
		<td>生日</td>
		<td>存款</td>
		<td>操作</td>
	</tr>
	<c:forEach items="${list }" var="u">
		<tr>
			<td>${u.id }</td>
			<td>${u.name}</td>
			<td><fmt:formatDate value="${u.birthday}"/></td>
			<td>${u.money}</td>
			<td>
				<a href="/ssm/user/delete.do?id=${u.id }">删除</a>
				|
				<a href="/ssm/user/findOne.do?id=${u.id }">修改</a>
			</td>
		</tr>
	</c:forEach>
</table>