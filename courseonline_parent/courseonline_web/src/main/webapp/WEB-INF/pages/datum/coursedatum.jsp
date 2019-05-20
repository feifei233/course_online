<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教程资源管理</title>
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
		$('#addCourseWindow').window("open");
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
						var id = rows[i].courseId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "courseAction_deleteBatch.action?ids="+ids;
				}
			});
		}
	}
	
	function doExport(){
		//发送请求，请求Action，进行文件下载
		window.location.href = "courseAction_exportXls.action";
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
		field : 'courseId',
		title : '教程编号',
		width : 100,
		align : 'center'
	}, {
		field : 'courseJj',
		title : '教程简介',
		width : 100,
		align : 'center'
	}, {
		field : 'courseName',
		title : '教程名称',
		width : 100,
		align : 'center'
	}, {
		field : 'courseType',
		title : '教程类型',
		width : 120,
		align : 'center'
	}, {
		field : 'courseFbtq',
		title : '发布日期',
		width : 120,
		align : 'center'
	}, {
		field : 'courseClicksum',
		title : '点击次数',
		width : 120,
		align : 'center'
	} , {
		field : 'courseOpen',
		title : '是否公开',
		width : 200,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "公开"
			}else{
				return "不公开";
			}
		}
	}, {
		field : 'teachername',
		title : '发布人',
		width : 120,
		align : 'center',
		formatter : function(data,row,index){ 
			if(row.teacher){
				 return row.teacher.teachername; 
			}
			else{
				return data;
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
			url : "courseAction_pageQuery.action",
			idField : 'courseId',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		
		
		// 添加、修改区域窗口
		$('#addCourseWindow').window({
	        title: '添加学生',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		// 添加修改教师窗口
		$('#editCourseWindow').window({
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
	        title: '查询资料',
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
		$("#editCourseWindow").window("open");
		//使用form表单对象的load方法回显数据
		$("#editCourseWindow").form("load",rowData);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="教程信息添加" id="addCourseWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="import" icon="icon-redo" href="#" class="easyui-linkbutton" plain="true" >上传</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addCourseForm"  action="courseAction_upload.action" method="post" enctype="multipart/form-data">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">教程信息</td>
					</tr>
					<tr>
						<td>教程编号</td>
						<td><input type="text" name="courseId" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>教程名称</td>
						<td><input type="text" name="courseName" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>教程简介</td>
						<td><input type="text" name="courseJj" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>教程类型</td>
						<td><input type="text" name="courseType" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>发布日期</td>
						<td><input type="text" name="courseFbrq" id="time" class="easyui-datebox" required="true"/></td>
					</tr>
				
					<input type="hidden" name="courseClicksum" class="easyui-validatebox"/>
					
					<tr>
						<td>是否公开</td>
						<td>
						<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#import").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#addCourseForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#addCourseForm").submit();
										}
									});
																
									});
								
								
							</script>
							<select class="easyui-combobox" name="courseOpen" data-options="panelHeight: 'auto',editable:false" style="width:100px">  
							    <option value="0">公开</option>  
							    <option value="1">不公开</option>  
							</select> 
						</td>
					</tr>
					<tr>
						<td>发布人</td>
						<td><input class="easyui-combobox" style="width:100px" name="teacher.teacherId"  
    							data-options="valueField:'teacherId',textField:'teachername',
    							url:'teacherAction_listajax.action',panelHeight: 'auto',editable:false" />
    
    					</td>
					</tr>
					<tr>
						<td>选择文件</td>
						<td><input type="file" name="file" class="easyui-validatebox" required="true"/></td>
					</tr>
					</table>
			</form>
		</div>
		
		
		
	</div>
	
	
	
	
	<div class="easyui-window" title="区域添加修改" id="editCourseWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="editInfo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="editCourseForm"  action="courseAction_editInfo.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">学生信息</td>
					</tr>
					<input type="hidden" name="courseId" class="easyui-validatebox"/>
					
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
										var v = $("#editCourseForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#editCourseForm").submit();
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
						<td><input type="text" name="courseId"/></td>
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