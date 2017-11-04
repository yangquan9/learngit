<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
  <head>
    <script src="/ssm/jquery-easyui-1.5.1/jquery.min.js"></script>
	<script src="/ssm/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
	<script src="/ssm/jquery-easyui-1.5.1/locale/easyui-lang-zh_CN.js"></script>
	<link rel="stylesheet" href="/ssm/jquery-easyui-1.5.1/themes/icon.css"></link>
	<link rel="stylesheet" href="/ssm/jquery-easyui-1.5.1/themes/default/easyui.css"></link>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
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
							return re.test(value)&&value!=null;
						}
					},
					birthday:{
						validator:function(value,param){
							var date = $("#input[name=birthday]").val();
							alert(date);
							return date<new Date();
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
  </head>
  <body>
  </body>
</html>
