<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
		//获取数据表格中所有选中的行，返回数组对象
		var rows = $('#grid').datagrid('getSelections');
		if(rows.length == 0){
			//没有选中记录，弹出提示
			$.messager.alert("提示信息","请选择需要下载的文件！","warning");
		}else if(rows.length==1){
			$.messager.confirm("下载确认","你确定要下载选中的文件吗？",function(r){
				if(r){
					
					var array = new Array();
					//确定,发送请求
					for(var i=0;i<rows.length;i++){
						//var teacher = rows[i];//json对象
						var id = rows[i].courseId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "courseAction_downloadFile.action?ids="+ids;
				}
			});
		}
		else{
			$.messager.alert("提示信息","每次只能选择一个文件下载！","error");
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
	},{
		id : 'button-export',
		text : '下载',
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
		field : 'courseFbrq',
		title : '发布日期',
		width : 120,
		align : 'center'
	}, {
		field : 'url',
		title : '文件位置',
		width : 120,
		align : 'center'
	},{
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
			if(data=="1"){
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
	        title: '添加教程',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: false,
	        height: 300,
	        resizable:false
	    });
		// 添加修改教师窗口
		$('#editCourseWindow').window({
	        title: '修改教程',
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
			<!--   <div class="datagrid-toolbar">
				<a id="uploadfile" icon="icon-redo" href="#" class="easyui-linkbutton" plain="true" >上传</a>
			</div>-->
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addCourseForm"  action="courseAction_add.action" method="post" enctype="multipart/form-data">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">教程信息</td>
					</tr>
					<tr>
						<td>选择文件：<input type="file" id="upload" name="upload" class="easyui-filebox" onchange="filefujianChange(this);" required="true"/>
						</td>		
					</tr>
					<tr>
						<td>选择图片：<input type="file" id="imagefile" name="upload" class="easyui-filebox" onchange="imageChange(this);"/>
						</td>		
					</tr>
					<tr>
						<td>
							<script type="text/javascript">
									
								function filefujianChange(target) {
									//检测上传文件的类型 
									var imgName = $("#upload").val();
				   
									  
								        var fileName = imgName.substring(imgName.lastIndexOf(".")+1).toLowerCase();
								        if(fileName !="jpg" && fileName !="jpeg" && fileName !="png" && fileName !="doc" && fileName !="gif"
								        	&& fileName !="docx"&& fileName !="xls" && fileName !="ppt"&& fileName !="pptx" && fileName !="mp4" && fileName !="avi"){
								        	$.messager.alert("提示信息","请选择正确的格式文件","error");
								            target.value="";
								            return;
								        }
								      
								}
								function iamgeChange(target) {
									//检测上传文件的类型 
									var imgName = $("#imagefile").val();
				   
									  
								        var fileName = imgName.substring(imgName.lastIndexOf(".")+1).toLowerCase();
								        if(fileName !="jpg" && fileName !="jpeg"  && fileName !="png"){
								        	$.messager.alert("提示信息","请选择正确的格式图片（jpg，jpeg,png）","error");
								            target.value="";
								            return;
								        }
								      
								}
								
								</script> 
						
							<input type="submit" id="uploadfile" value="上传" class="easyui-linkbutton" style="width:200px;align:center"/>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red"><s:actionerror/></font>
						</td>
					</tr>
					</table>
			</form>
		</div>
		
		
		
	</div>
	
	
	
	
	<div class="easyui-window" title="教程添加修改" id="editCourseWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="editInfo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="editCourseForm"  action="courseAction_editInfo.action" method="post">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">教程信息</td>
					</tr>

					<input type="hidden" name="courseId"/>
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
						<td><input type="text" name="courseFbrq" id="time" class="easyui-datetimebox" required="true"/></td>
					</tr>
				
					<input type="hidden" name="courseClicksum" class="easyui-validatebox"/>
					<input type="hidden" name="url" class="easyui-validatebox"/>
					<tr>
						<td>是否公开</td>
						<td>
								<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#editInfo").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#editCourseForm").form("validate");
										if(v){
											$("#editCourseForm").submit();
										}
									});
																
									});
								
								
							</script> 
							<select class="easyui-combobox" name="courseOpen" data-options="panelHeight: 'auto',editable:false" style="width:100px">  
							    <option value="1">公开</option>  
							    <option value="0">不公开</option>  
							</select> 
						</td>
					</tr>
					<!--  <tr>
						<td>发布人</td>
						<td><input class="easyui-combobox" style="width:100px" name="teacher.teacherId"  
    							data-options="valueField:'teacherId',textField:'teachername',
    							url:'teacherAction_listajax.action',panelHeight: 'auto',editable:false" />
    
    					</td>
					</tr>-->
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