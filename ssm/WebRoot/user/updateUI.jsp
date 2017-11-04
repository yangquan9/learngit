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
				$.extend($.fn.validatebox.defaults.rules,{
					cellphone:{
						validator:function(value,param){
							var re=/^1[358]\d{9}$/;
							return re.test(value);
						}
					},
					name:{
						validator:function(value,param){
							var re=/^[\u4e00-\u9fa5]{2,4}$/;
							return re.test(value);
						}
					},
					birthday:{
						validator:function(value,param){
							var valueDate=new Date(value);
							return valueDate<new Date();
						}
					}
				});
				$("input[name=cellphone]").validatebox({
					validType:'cellphone',
					invalidMessage:'请填写正确的手机号格式'
				});
				$("input[name=name]").validatebox({
					validType:'name',
					invalidMessage:'姓名必须是2到4列中文啊'
				});
				$("input[name=birthday]").validatebox({
					validType:'birthday',
					invalidMessage:'生日不能是今天以后'
				});
				$("input[name=email]").validatebox({
					validType:'email',
					invalidMessage:'非法邮箱'
				});
			});
		</script>
		<h2>修改用户</h2>
		<form action="/ssm/user/update.do" method="post">
			编号：<input name="id" value="${user.id }" readonly="readonly"/><br/>
			姓名：<input type="text" name="name" value="${user.name }"/>${nameError }<br/>
			<fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd" var="bb" scope="page"/>
			生日：<input type="date" name="birthday" value="${bb}"/>${birthdayError }<br/>
			存款：<input type="text" name="money" value="${user.money }"/>${moneyError }<br/>
			<button type="submit">提交</button>
		</form>
	</body>
</html>