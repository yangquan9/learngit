<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>用户管理系统</title>
		<script>
			$(function() {
				$(".abc").click(function() {
					var titleText = $(this).html();
					var url = $(this).attr("name");
					if(!$("#tt").tabs('exists',titleText)) {
						$("#tt").tabs('add', {
							title:titleText,
							closable:true,
							content:'<iframe name="mainFormat"+html() src='+url+' width="100%" height="100%" framebordre="0" />'
						});
					} else {
						$("#tt").tabs('select', titleText);
						var tab = $("#tt").tabs('getTab',titleText);
						$("#tt").tabs('update', {
							tab:tab,
							options:{
							}
						});
					}
				});
			});
		</script>
		<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
		<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
		<meta HTTP-EQUIV="expires" CONTENT="0">
	</head>
	<body class="easyui-layout">   
	    <div data-options="region:'north',title:'欢迎光临',split:true" style="height:100px;">
	    	<h1 align="center">信息用户管理系统</h1>
	    </div>   
	    <div data-options="region:'west',title:'菜单',split:true" style="width:250px;">
	    	
	    	<div id="aa" class="easyui-accordion" style="width:100%;height:99%;">   
			    <div title="用户管理" data-options="iconCls:'icon-man',height:'30px'" style="overflow:auto;padding:10px;" height="30px">
			    		<a class="abc" name="/ssm/user/saveUI.do" target="mainFormat添加用户">添加用户</a>  <br />
			    		<a class="abc" name="/ssm/user/findAll.do" target="mainFormat查看用户">查看用户</a>  <br />
			    		<a class="abc" name="/ssm/user/datagrid.jsp" target="mainFormatdatagrid实现">datagrid实现</a>  <br />
			    </div>   
			    <div title="商品管理" data-options="iconCls:'icon-reload'" style="padding:10px;">   
			    </div>   
			    <div title="类型管理" data-options="iconCls:'icon-save'">   
			    </div>   
			</div>  
	    </div>   
	    <div data-options="region:'center',title:'内容'" style="padding:5px;background:#eee;">
	    	<div id="tt" class="easyui-tabs" style="width:100%;height:100%;"></div>  
	    </div>   
	</body> 
</html>
