<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息设置</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.ocupload-1.1.2.js"></script>
<script type="text/javascript">
	function doAdd(){
		$('#addStudentWindow').window("open");
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doDelete(){
		//获取数据表格中所有选中的行，返回数组对象
		var rows = $('#grid').datagrid('getSelections');
		if(rows.length == 0){
			//没有选中记录，弹出提示
			$.messager.alert("提示信息","请选择需要删除的学生！","warning");
		}else{
			$.messager.confirm("删除确认","你确定要删除选中的学生吗？",function(r){
				if(r){
					
					var array = new Array();
					//确定,发送请求
					for(var i=0;i<rows.length;i++){
						//var teacher = rows[i];//json对象
						var id = rows[i].studentId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "studentAction_deleteBatch.action?ids="+ids;
				}
			});
		}
	}
	
	function doExport(){
		//发送请求，请求Action，进行文件下载
		window.location.href = "studentAction_exportXls.action";
		//$.post("subareaAction_exportXls.action");
	}
	
	//工具栏
	var toolbar = [{
		id : 'button-search',	
		text : '查询',
		iconCls : 'icon-search',
		handler : doSearch
	}, {
		id : 'button-add',
		text : '增加',
		iconCls : 'icon-add',
		handler : doAdd
	}, {
		id : 'button-delete',
		text : '删除',
		iconCls : 'icon-cancel',
		handler : doDelete
	}, {
		id : 'button-import',
		text : '导入',
		iconCls : 'icon-redo'
	},{
		id : 'button-export',
		text : '导出',
		iconCls : 'icon-undo',
		handler : doExport
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'studentId',
		title : '学生学号',
		width : 100,
		align : 'center'
	}, {
		field : 'name',
		title : '学生姓名',
		width : 100,
		align : 'center'
	}, {
		field : 'sex',
		title : '性别',
		width : 100,
		align : 'center'
	}, {
		field : 'password',
		title : '登录密码',
		width : 120,
		align : 'center'
	}, {
		field : 'profession',
		title : '专业',
		width : 120,
		align : 'center'
	}, {
		field : 'birthday',
		title : '出生日期',
		width : 120,
		align : 'center'
	} , {
		field : 'address',
		title : '家庭地址',
		width : 200,
		align : 'center'
	}, {
		field : 'tel',
		title : '联系方式',
		width : 120,
		align : 'center'
	}, {
		field : 'email',
		title : '邮箱地址',
		width : 120,
		align : 'center'
	}, {
		field : 'teachername',
		title : '授课教师',
		width : 120,
		align : 'center',
		formatter : function(data,row,index){ 
			if(row.teacher){
				 return row.teacher.teachername; 
			}
			else{
				return null;
			}
		}
	}] ];
	
	$(function(){
		// 先将body隐藏，再显示，不会出现页面刷新效果
		$("body").css({visibility:"visible"});
		
		// 收派标准数据表格
		$('#grid').datagrid( {
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			rownumbers : true,
			striped : true,
			pageList: [15,30,50,100],
			pagination : true,
			toolbar : toolbar,
			url : "studentAction_pageQuery.action",
			idField : 'studentId',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		//页面加载完成后，调用OCUpload插件的方法
		$("#button-import").upload({
			action:'studentAction_importXls.action',
			name:'studentFile'
		});
		
		// 添加、修改区域窗口
		$('#addStudentWindow').window({
	        title: '添加学生',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		// 添加修改教师窗口
		$('#editStudentWindow').window({
	        title: '修改学生',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		
		//定义一个工具方法，用于将指定的form表单中所有的输入项转为json数据{key:value,key:value}
		$.fn.serializeJson=function(){  
            var serializeObj={};  
            var array=this.serializeArray();
            $(array).each(function(){  
                if(serializeObj[this.name]){  
                    if($.isArray(serializeObj[this.name])){  
                        serializeObj[this.name].push(this.value);  
                    }else{  
                        serializeObj[this.name]=[serializeObj[this.name],this.value];  
                    }  
                }else{  
                    serializeObj[this.name]=this.value;   
                }  
            });  
            return serializeObj;  
        }; 
     
		$('#searchWindow').window({
	        title: '查询学生',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		$("#btn").click(function(){
			//将指定的form表单中所有的输入项转为json数据{key:value,key:value}
			var p = $("#searchForm").serializeJson();
			console.info(p);
			//调用数据表格的load方法，重新发送一次ajax请求，并且提交参数
			$("#grid").datagrid("load",p);
			//关闭查询窗口
			$("#searchWindow").window("close");
		});
	});

	function doDblClickRow(rowIndex, rowData){
		$("#editStudentWindow").window("open");
		//使用form表单对象的load方法回显数据
		$("#editStudentWindow").form("load",rowData);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="区域添加修改" id="addStudentWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addStudentForm"  action="studentAction_add.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">学生信息</td>
					</tr>
					<tr>
						<td>学生学号</td>
						<td><input type="text" name="studentId" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>学生姓名</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>性别</td>
						<td><input type="text" name="sex" class="easyui-validatebox" required="true"/></td>
					</tr>
					<input type="hidden" name="password" class="easyui-validatebox"/>
					<tr>
						<td>专业</td>
						<td><input type="text" name="profession" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>出生日期</td>
						<td><input type="text" name="birthday" id="time" class="easyui-datebox" required="true"/></td>
					</tr>
					<tr>
						<td>家庭地址</td>
						<td><input type="text" name="address" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>联系方式</td>
						<td>
						<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#save").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#addStudentForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#addStudentForm").submit();
										}
									});
									
									var reg = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$/;
									//扩展手机号校验规则
									$.extend($.fn.validatebox.defaults.rules, { 
										telephone: { 
											validator: function(value,param){ 
											return reg.test(value);
										}, 
											message: '手机号输入有误！' 
										}
										}); 
									
									var emailreg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
									$.extend($.fn.validatebox.defaults.rules, { 
										email: { 
											validator: function(value,param){ 
											return reg.test(value);
										}, 
											message: '邮箱格式有误！' 
										}
										});
									
									});
								
								
							</script>
						<input type="text" name="tel" data-options="validType:'telephone'"   class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>邮箱地址</td>
						<td><input type="text" name="email" class="easyui-validatebox" required="true"/></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	
	
	
	
	<div class="easyui-window" title="区域添加修改" id="editStudentWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="editInfo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="editStudentForm"  action="studentAction_editInfo.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">学生信息</td>
					</tr>
					<input type="hidden" name="studentId" class="easyui-validatebox"/>
					
					<tr>
						<td>学生姓名</td>
						<td><input type="text" name="name" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>性别</td>
						<td><input type="text" name="sex" class="easyui-validatebox" required="true"/></td>
					</tr>
					<input type="hidden" name="password" class="easyui-validatebox"/>
					<tr>
						<td>专业</td>
						<td><input type="text" name="profession" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>出生日期</td>
						<td><input type="text" name="birthday" id="time" class="easyui-datebox" required="true"/></td>
					</tr>
					<tr>
						<td>家庭地址</td>
						<td><input type="text" name="address" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>联系方式</td>
						<td>
						<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#editInfo").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#editStudentForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#editStudentForm").submit();
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
									
									var emailreg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
									$.extend($.fn.validatebox.defaults.rules, { 
										email: { 
											validator: function(value,param){ 
											return reg.test(value);
										}, 
											message: '邮箱格式有误！' 
										}
										});
									
									});
								$('#time').datebox({   
								    editable:false  
								});
								
							</script>
						<input type="text" name="tel" data-options="validType:'telephone'"   class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>邮箱地址</td>
						<td><input type="text" name="email" class="easyui-validatebox" required="true"/></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	
	<!-- 查询学生 -->
	<div class="easyui-window" title="查询学生窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">查询条件</td>
					</tr>
					<tr>
						<td>学号</td>
						<td><input type="text" name="studentId"/></td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input type="text" name="name"/></td>
					</tr>
					<tr>
						<td>专业</td>
						<td><input type="text" name="profession"/></td>
					</tr>
					<tr>
						<td>授课教师</td>
						<td><input type="text" name="teacher.name"/></td>
					</tr>
					<tr>
						<td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> </td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
</body>
</html>