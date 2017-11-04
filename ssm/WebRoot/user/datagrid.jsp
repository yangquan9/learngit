<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp" %>

<script>
	$(function(){
		$("#dg").datagrid({
			url:"/ssm/user2/findPage.do",
			fitColumns:true,
			pagination:true,
			columns:[[    
				        {field:'id',title:'编号',width:100},    
				        {field:'name',title:'姓名',width:100},   
				        {
				        	field:'birthday',
				        	title:'生日',
				        	width:100,
				        	formatter:function(value){
				        		var date = new Date(value.time); 
								var mon = date.getMonth() + 1;
								var day = date.getDate();
								var nowDay = date.getFullYear() + "-" + (mon<10?"0"+mon:mon) + "-" +(day<10?"0"+day:day);
								return nowDay;
				        	}
				        },    
				        {field:'money',title:'存款',width:100}
			]],
			toolbar:[
				{
					text:"添加",
					iconCls:'icon-add',
					handler:function(){
						$("#saveUserDiv").window('open');
					}
				},
				{
					text:"删除",
					iconCls:'icon-remove',
					handler:function(){
						var ids=$("#dg").datagrid('getSelections');
						if(ids.length==0){
							$.messager.show({
								title:'提醒',
								content:'最少选择一行'
							});
						}else{
							$.messager.confirm('警告','删除后不可恢复，确定删除吗？',function(r){
								if(r){
									for(var i=0;i<ids.length;i++){
										$.ajax({
											type:'post',
											url:'/ssm/user2/delete.do',
											data:{"id":ids[i].id},
											complete:function(){
												$("#dg").datagrid('reload');
											}
										});
									}
									$.messager.show({
										title:'提醒',
										content:'删除成功'
									});
								}
							});
						}
					}
				},
				{
					text:"修改",
					iconCls:'icon-edit',
					handler:function(){
						var users=$("#dg").datagrid('getSelections');
						if(users.length!=1){
							$.messager.show({
								title:'提醒',
								content:'请选择一行'
							});
						}else{
							$("#updateUserForm").form('load',users[0]);
							$("#updateUserDiv").window('open');
							var date = new Date(users[0].birthday.time); 
							var mon = date.getMonth() + 1;
							var day = date.getDate();
							var nowDay = date.getFullYear() + "-" + (mon<10?"0"+mon:mon) + "-" +(day<10?"0"+day:day);
							$("input[name=birthday]").val(nowDay);
						}
					}
				}
			]
		});
		
		$("#saveUserDiv").window({
			width:300,
			height:200,
			title:'添加用户',
			closed:true,
			modal:true
		});
		$("#btn").click(function(){
			if($("#saveUserForm").form('validate')){
				$("#saveUserForm").form('submit');
			}
		});
		$("#saveUserForm").form({
			success:function(){
				$("#dg").datagrid('reload');
				$("#saveUserDiv").window('close');
				$("#saveUserForm").form('clear');
				$.messager.show({
					title:'提醒',
					content:'添加成功'
				});
			}
		});
		$("#updateUserDiv").window({
			width:300,
			height:200,
			title:'修改用户',
			closed:true,
			modal:true
		});
		$("#btn2").click(function(){
			if($("#updateUserForm").form('validate')){
				$("#updateUserForm").form('submit');
			}
		});
		$("#updateUserForm").form({
			success:function(){
				$("#dg").datagrid('reload');
				$("#updateUserDiv").window('close');
				$.messager.show({
					title:'提醒',
					content:'修改成功'
				});
			}
		});
	});
</script>


<table id="dg"></table>
<div id="saveUserDiv">
	<form action="/ssm/user2/save.do" id="saveUserForm" method="post">
		姓名：<input name="name"/><br/>
		生日：<input class= "easyui-datebox" name="birthday"/><br/>
		存款：<input name="money"/><br/>
		<button id="btn" type="button">提交</button>
	</form>
</div>
<div id="updateUserDiv">
	<form action="/ssm/user2/update.do" id="updateUserForm" method="post">
		编号：<input name="id" readonly="readonly"/><br/>
		姓名：<input name="name"/><br/>
		生日：<input name="birthday"/><br/>
		存款：<input name="money"/><br/>
		<button id="btn2" type="button">提交</button>
	</form>
</div>
