<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/include/head.jsp" %>

<script>
	$(function(){
		$("input[name=birthday]").datepick({dateFormat:"yy-mm-dd"});
		$("form").validate(
			{
				rules:{
					name:{
						required:true,
						minlength:2,
						maxlength:4
					},
					birthday:{
						required:true
					},
					money:{
						required:true,
						minvalue:0
					}
				},
				messages:{
					name:{
						required:"姓名必填",
						minlength:"最少2个字",
						maxlength:"最多4个字"
					},
					birthday:{
						required:"生日必须填"
					},
					money:{
						required:"存款必须填",
						minvalue:"存款不能小于0"
					}
				}
			}
		)
	})
</script>

<center>
<h2>修改用户</h2>
<br/>
<br/>
<form action="/test/user.do?method=update" method="post">
	编号：<input name="id" value="${user.id }" readonly/><br/>
	姓名：<input name="name" value="${user.name }"/><br/>
	生日：<input name="birthday"/><br/>
	姓名：<input name="money" value="${user.money }"/><br/>
	<button type="submit">提交</button>
</form>

<br/>
<br/>