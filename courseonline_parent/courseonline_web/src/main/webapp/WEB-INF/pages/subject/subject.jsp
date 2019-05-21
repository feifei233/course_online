<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试题目信息管理</title>
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
		$('#addSubjectWindow').window("open");
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doDelete(){
		//获取数据表格中所有选中的行，返回数组对象
		var rows = $('#grid').datagrid('getSelections');
		if(rows.length == 0){
			//没有选中记录，弹出提示
			$.messager.alert("提示信息","请选择需要删除的题目！","warning");
		}else{
			$.messager.confirm("删除确认","你确定要删除选中的题目吗？",function(r){
				if(r){
					
					var array = new Array();
					//确定,发送请求
					for(var i=0;i<rows.length;i++){
						//var teacher = rows[i];//json对象
						var id = rows[i].subjectId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "subjectAction_deleteBatch.action?ids="+ids;
				}
			});
		}
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
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'subjectId',
		title : '题目编号',
		width : 100,
		align : 'center'
	}, {
		field : 'subjectTitle',
		title : '题目名称',
		width : 100,
		align : 'center'
	}, {
		field : 'subjectOptionA',
		title : 'A选项',
		width : 100,
		align : 'center'
	}, {
		field : 'subjectOptionB',
		title : 'B选项',
		width : 120,
		align : 'center'
	}, {
		field : 'subjectOptionC',
		title : 'C选项',
		width : 120,
		align : 'center'
	}, {
		field : 'subjectOptionD',
		title : 'D选项',
		width : 120,
		align : 'center'
	} , {
		field : 'subjectAnswer',
		title : '题目答案',
		width : 120,
		align : 'center'
	}, {
		field : 'subjectParse',
		title : '题目解析',
		width : 200,
		align : 'center'
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
			url : "subjectAction_pageQuery.action",
			idField : 'subjectId',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改区域窗口
		$('#addSubjectWindow').window({
	        title: '录入题目',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		// 添加修改教师窗口
		$('#editSubjectWindow').window({
	        title: '更新题目',
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
	        title: '查询题目',
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
		$("#editSubjecttWindow").window("open");
		//使用form表单对象的load方法回显数据
		$("#editSubjectWindow").form("load",rowData);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="区域添加修改" id="addSubjectWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addSubjectForm"  action="subjectAction_add.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">题目信息</td>
					</tr>
					<tr>
						<td>题目编号</td>
						<td><input type="text" name="subjectId" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>题目名称</td>
						<td><input type="text" name="subjectTitle" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>A选项</td>
						<td><input type="text" name="subjectOptionA" class="easyui-textbox" required="true"/></td>
					</tr>
					<tr>
						<td>B选项</td>
						<td><input type="text" name="subjectOptionB" class="easyui-textbox" required="true"/></td>
					</tr>
					<tr>
						<td>C选项</td>
						<td><input type="text" name="subjectOptionC" class="easyui-textbox" required="true"/></td>
					</tr>
					<tr>
						<td>D选项</td>
						<td><input type="text" name="subjectOptionD" class="easyui-textbox" required="true"/></td>
					</tr>
					<tr>
						<td>题目答案</td>
						<td>
						<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#save").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#addSubjectForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#addSubjectForm").submit();
										}
									});	
									
								});
							</script>
						<input type="text" name="subjectAnswer" class="easyui-textbox" required="true"/></td>
					</tr>
					<tr>
						<td>题目解析</td>
						<td><input name="subjectParse" class="easyui-textbox" data-options="multiline:true,required:true"/></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	
	
	
	
	<div class="easyui-window" title="区域添加修改" id="editSubjectWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="editInfo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="editSubjectForm"  action="subjectAction_editInfo.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">题目信息</td>
					</tr>
					
					<input type="text" name="hidden" class="easyui-validatebox" required="true"/></td>
					
					<tr>
						<td>题目名称</td>
						<td><input type="text" name="subjectTitle" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>A选项</td>
						<td><input type="text" name="subjectOptionA" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>B选项</td>
						<td><input type="text" name="subjectOptionB" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>C选项</td>
						<td><input type="text" name="subjectOptionC" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>D选项</td>
						<td><input type="text" name="subjectOptionD" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>题目答案</td>
						<td>
						<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#editInfo").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#editSubjectForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#editSubjectForm").submit();
										}
									});	
								});
							</script>
						<input type="text" name="subjectAnswer" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>题目解析</td>
						<td><input type="text" name="subjectParse" class="easyui-validatebox" required="true"/></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	
	<!-- 查询学生 -->
	<div class="easyui-window" title="查询题目窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div style="overflow:auto;padding:5px;" border="false">
			<form id="searchForm">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">查询条件</td>
					</tr>
					<tr>
						<td>题目名称</td>
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