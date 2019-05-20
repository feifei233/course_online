<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<!-- 导入easyui类库 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">	
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function doAdd(){
		$('#addTeacherWindow').window("open");
	}
	
	function doView(){
		alert("查看...");
	}
	
	function doDelete(){
		//获取数据表格中所有选中的行，返回数组对象
		var rows = $('#grid').datagrid('getSelections');
		if(rows.length == 0){
			//没有选中记录，弹出提示
			$.messager.alert("提示信息","请选择需要删除的教师！","warning");
		}else{
			$.messager.confirm("删除确认","你确定要删除选中的教师吗？",function(r){
				if(r){
					
					var array = new Array();
					//确定,发送请求
					for(var i=0;i<rows.length;i++){
						//var teacher = rows[i];//json对象
						var id = rows[i].teacherId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "teacherAction_deleteBatch.action?ids="+ids;
				}
			});
		}
	}
	
	function doRestore(){
		//获取数据表格中所有选中的行，返回数组对象
		var rows = $('#grid').datagrid('getSelections');
		if(rows.length == 0){
			//没有选中记录，弹出提示
			$.messager.alert("提示信息","请选择需要还原的教师！","warning");
		}else{
			$.messager.confirm("删除确认","你确定要还原选中的教师吗？",function(r){
				if(r){
					
					var array = new Array();
					//确定,发送请求
					for(var i=0;i<rows.length;i++){
						//var teacher = rows[i];//json对象
						var id = rows[i].teacherId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "teacherAction_restoreBatch.action?ids="+ids;
				}
			});
		}
	}
	
	function doEdit(){
		//获取数据表格中所有选中的行，返回数组对象
		var rows = $('#grid').datagrid('getSelections');
		if(rows.length == 0){
			//没有选中记录，弹出提示
			$.messager.alert("提示信息","请选择需要修改密码的教师！","warning");
		}else{
			$.messager.confirm("密码修改","你确定要修改密码吗？",function(r){
				if(r){
					
					var array = new Array();
					//确定,发送请求
					for(var i=0;i<rows.length;i++){
						//var teacher = rows[i];//json对象
						var id = rows[i].teacherId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "teacherAction_initPassword.action?ids="+ids;
				}
			});
		}
	}
	
	//工具栏
	var toolbar = [ {
		id : 'button-view',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doView
	},{
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	},{
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	},{
		id : 'button-save',
		text : '还原',
		iconCls : 'icon-save',
		handler : doRestore
	},{
		id : 'button-edit',
		text : '初始化密码',
		iconCls : 'icon-edit',
		handler : doEdit
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'teacherId',
		title : '教师工号',
		width : 120,
		align : 'center'
		
	},{
		field : 'teachername',
		title : '教师姓名',
		width : 120,
		align : 'center'
		
	}, {
		field : 'tel',
		title : '联系方式',
		width : 120,
		align : 'center'
		
	}, {
		field : 'password',
		title : '登录密码',
		width : 210,
		align : 'center'
		}
	, {
		field : 'deltag',
		title : '是否删除',
		width : 120,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "正常使用"
			}else if(data=="1"){
				return "已删除";
			}else{
				return "正在编辑";
			}
			
		}
	}] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 取派员信息表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [15,30,50,100],
			pagination : true,
			toolbar : toolbar,
			url : "teacherAction_pageQuery.action",
			idField : 'teacherId',
			columns : columns,
			onDblClickRow : doDblClickRow
		});

	// 添加、修改区域窗口
	$('#addTeacherWindow').window({
        title: '添加教师',
        width: 400,
        modal: true,
        shadow: true,
        closed: true,
        height: 400,
        resizable:false
    });
	// 添加修改教师窗口
	$('#editTeacherWindow').window({
        title: '修改教师',
        width: 400,
        modal: true,
        shadow: true,
        closed: true,
        height: 400,
        resizable:false
    });
	});
	
	function doDblClickRow(rowIndex, rowData){
		$("#editTeacherWindow").window("open");
		//使用form表单对象的load方法回显数据
		$("#editTeacherWindow").form("load",rowData);
	}
	
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
		<div class="easyui-window" title="" id="addTeacherWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addTeacherForm"  action="teacherAction_add.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">教师信息</td>
					</tr>
					<tr>
						<td>教师工号</td>
						<td><input type="text" name="teacherId" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>教师姓名</td>
						<td><input type="text" name="teachername" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>联系方式</td>
						<td>
						<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#save").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#addSTeacherForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#addTeacherForm").submit();
										}
									});
									
									var reg = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/;
									//扩展手机号校验规则
									$.extend($.fn.validatebox.defaults.rules, { 
										telephone: { 
											validator: function(value,param){ 
											return reg.test(value);
										}, 
											message: '手机号输入有误！' 
										}
										}); 
									
									});
								
							</script>
						<input type="text" name="tel" data-options="validType:'telephone'"   class="easyui-validatebox" required="true"/></td>
					</tr>
					<input type="hidden" name="password" class="easyui-validatebox"/>
					</table>
			</form>
		</div>
	</div>
	
	
		</div>
		<div class="easyui-window" title="" id="editTeacherWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="edit" icon="icon-edit" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="editTeacherForm"  action="teacherAction_edit.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">教师信息</td>
					</tr>
					
						<input type="hidden" name="teacherId" class="easyui-validatebox"/>
					
					<tr>
						<td>教师姓名</td>
						<td><input type="text" name="teachername" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>联系方式</td>
						<td>
						<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#edit").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#editSTeacherForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#editTeacherForm").submit();
										}
									});						
									});
								
							</script>
						<input type="text" name="tel" data-options="validType:'telephone'"   class="easyui-validatebox" required="true"/></td>
					</tr>
					<input type="hidden" name="password" class="easyui-validatebox"/>
					</table>
			</form>
		</div>
	</div>
	
</body>
</html>	