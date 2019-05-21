<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知管理</title>
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
		$('#addNoticeWindow').window("open");
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
						var id = rows[i].noticeId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "noticeAction_deleteBatch.action?ids="+ids;
				}
			});
		}
	}
	
	function doExport(){
		//发送请求，请求Action，进行文件下载
		window.location.href = "noticeAction_exportXls.action";
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
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'nid',
		title : '公告编号',
		width : 100,
		align : 'center'
	}, {
		field : 'ncontent',
		title : '公告内容',
		width : 140,
		align : 'center'
	}, {
		field : 'ntime',
		title : '发布时间',
		width : 100,
		align : 'center'
	}, {
		field : 'ncid',
		title : '属于课程',
		width : 120,
		align : 'center',
		formatter : function(data,row,index){ 
			if(row.teacher){
				 return row.cname; 
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
			url : "noticeAction_pageQuery.action",
			idField : 'nid',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改区域窗口
		$('#addNoticeWindow').window({
	        title: '添加公告',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		// 添加修改教师窗口
		$('#editNoticeWindow').window({
	        title: '修改公告',
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
	        title: '查询课程',
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
		$("#editNoticeWindow").window("open");
		//使用form表单对象的load方法回显数据
		$("#editNoticeWindow").form("load",rowData);
	}
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="区域添加修改" id="addNoticeWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addNoticeForm"  action="noticeAction_add.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">公告信息</td>
					</tr>
					<input type="hidden" name="nid" class="easyui-validatebox"/>
					<tr>
						<td>公告内容</td>
						<td><textarea name="ncontent" class="easyui-validatebox" required="true"  style=" border:solid 3px #E2E2E2;line-height:16px; padding:5px;height:80px"></textarea></td>
					</tr>
					<tr>
						<td>公告发布时间</td>
						<td><input type="text" name="ntime" class="easyui-datetimebox" required="true"/></td>
					</tr>
					<tr>
						<td>属于课程</td>
						<td><input class="easyui-combobox" style="width:100px" name="ncid"  
    							data-options="valueField:'cid',textField:'cname',
    							url:'lessonAction_listajax.action',panelHeight: 'auto',editable:false" /></td>
					</tr>
		
					</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#save").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#addNoticeForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#addNoticeForm").submit();
										}
									});
									});
	</script>
	
	
	
	<div class="easyui-window" title="区域添加修改" id="editNoticeWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="editInfo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="editNoticeForm"  action="noticeAction_editInfo.action" method="post">
				<table class="table-edit" width="80%" align="center">
										<tr class="title">
						<td colspan="2">公告信息</td>
					</tr>
					<input type="hidden" name="nid" class="easyui-validatebox"/>
					<tr>
						<td>公告内容</td>
						<td><textarea name="ncontent" class="easyui-validatebox" required="true"  style=" border:solid 3px #E2E2E2;line-height:16px; padding:5px;height:80px"></textarea></td>
					</tr>
					<tr>
						<td>公告发布时间</td>
						<td><input type="text" name="ntime" class="easyui-datetimebox" required="true"/></td>
					</tr>
					<tr>
						<td>属于课程</td>
						<td><input class="easyui-combobox" style="width:100px" name="ncid"  
    							data-options="valueField:'cid',textField:'cname',
    							url:'lessonAction_listajax.action',panelHeight: 'auto',editable:false" /></td>
					</tr>
					</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#editInfo").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#editNoticeForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#editNoticeForm").submit();
										}
									});
									});
	</script>
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
						<td><input type="text" name="NoticeId"/></td>
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