<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<%@ include file="/include/head.jsp" %>
	</head>
	<body>
		<script>
			$(function(){
				$("input[name=birthday]").datepick({dateFormat:"yy-mm-dd"});
			});
		</script>
		<h2>添加用户</h2>
		<form action="/ssm/user/save.do" method="post">
			姓名：<input type="text" name="name" value="${user.name }"/>${nameError }<br/>
			<fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd" var="bb" scope="page"/>
			生日：<input type="date" name="birthday" value="${bb}"/>${birthdayError }<br/>
			存款：<input type="text" name="money" value="${user.money }"/>${moneyError }<br/>
			邮箱：<input name="email"/><br/>
			手机：<input name="cellphone"/><br/>
			<button type="submit">提交</button>
		</form>
	</body>
</html>

