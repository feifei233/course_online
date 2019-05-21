<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程管理</title>
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
<script src="${pageContext.request.contextPath }/js/highcharts/highcharts.js"></script>
<script src="${pageContext.request.contextPath }/js/highcharts/modules/exporting.js"></script>
<script type="text/javascript">
	function doAdd(){
		$('#addLessonWindow').window("open");
	}
	
	function doSearch(){
		$('#searchWindow').window("open");
	}
	
	function doDelete(){
		//获取数据表格中所有选中的行，返回数组对象
		var rows = $('#grid').datagrid('getSelections');
		if(rows.length == 0){
			//没有选中记录，弹出提示
			$.messager.alert("提示信息","请选择需要删除的课程！","warning");
		}else{
			$.messager.confirm("删除确认","你确定要删除选中的课程吗？",function(r){
				if(r){
					
					var array = new Array();
					//确定,发送请求
					for(var i=0;i<rows.length;i++){
						//var teacher = rows[i];//json对象
						var id = rows[i].lessonId;
						array.push(id);
					}
					var ids = array.join(",");//1,2,3,4,5
					location.href = "lessonAction_deleteBatch.action?ids="+ids;
				}
			});
		}
	}
	
	function doExport(){
		//发送请求，请求Action，进行文件下载
		window.location.href = "lessonAction_exportXls.action";
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
	},
	{
		id : 'button-showPie',
		text : '饼状图',
		iconCls : 'icon-search',
		handler : doShowpie
	},
	{
		id : 'button-showConlumn',
		text : '柱状图',
		iconCls : 'icon-search',
		handler : doShowConlumn
	}];
	// 定义列
	var columns = [ [ {
		field : 'id',
		checkbox : true,
	},{
		field : 'cid',
		title : '课程编号',
		width : 100,
		align : 'center'
	}, {
		field : 'cname',
		title : '课程名',
		width : 100,
		align : 'center'
	}, {
		field : 'cjj',
		title : '课程简介',
		width : 100,
		align : 'center'
	}, {
		field : 'ctype',
		title : '课程类别',
		width : 120,
		align : 'center'
	}, {
		field : 'count',
		title : '学习人数',
		width : 120,
		align : 'center'
	}, {
		field : 'ctime',
		title : '课时',
		width : 120,
		align : 'center'
	} ,{
		field : 'cstate',
		title : '开设状态',
		width : 100,
		align : 'center',
		formatter : function(data,row, index){
			if(data=="0"){
				return "开设中"
			}else{
				return "未开设";
			}
			
		} 
	} ] ];
	
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
			url : "lessonAction_pageQuery.action",
			idField : 'cid',
			columns : columns,
			onDblClickRow : doDblClickRow
		});
		
		// 添加、修改区域窗口
		$('#addLessonWindow').window({
	        title: '添加客课程',
	        width: 400,
	        modal: true,
	        shadow: true,
	        closed: true,
	        height: 400,
	        resizable:false
	    });
		// 添加修改教师窗口
		$('#editLessonWindow').window({
	        title: '修改课程',
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
     
        $('#showWindow').window({
            title: '课程类别人数分布',
            width: 450,
            modal: true,
            shadow: true,
            closed: true,
            height: 450,
            resizable:false
        });
        
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
		$("#editLessonWindow").window("open");
		//使用form表单对象的load方法回显数据
		$("#editLessonWindow").form("load",rowData);
	}
	
	
	
	function doShowpie(){
		$("#showWindow").window("open");
		
		//页面加载完成后，动态创建图表
		$.post("lessonAction_findPieByType.action",function(data){
			$("#test").highcharts({
				chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false,
		            type: 'pie'
		        },
				
				title: {
		            text: '课程类别人数分布图'
		        },
		        tooltip: {
		            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		        },
		        plotOptions: {
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                    style: {
		                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                    }
		                }
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: '课程类别人数分布图',
		            data: data
		        }]
			});
		});
	}
	
	function doShowConlumn(){
		$("#showWindow").window("open");
		
		$.post("lessonAction_findConlumnByType.action",function(data){
			
			$("#test").highcharts({
			
				title: {
		            text: '课程类型人数分布'
		        },
		        subtitle:{text:'-----------选课人数分布统计'},
		        xAxis: {
		            categories: ['java基础', ' java进阶', 'java高级']
		        },
		        series: [{
		            type: 'column',
		            name: 'Jane',
		            data: data
		        }]
		    });
				
				
				
			});
			
	}
	
</script>	
</head>
<body class="easyui-layout" style="visibility:hidden;">
	<div region="center" border="false">
    	<table id="grid"></table>
	</div>
	<div class="easyui-window" title="区域添加修改" id="addLessonWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="save" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="addLessonForm"  action="lessonAction_add.action" method="post" enctype="multipart/form-data">
				<table class="table-edit" width="80%" align="center">
					<tr class="title">
						<td colspan="2">课程信息</td>
					</tr>
					<input type="hidden" name="cid" class="easyui-validatebox"/>
					<tr>
						<td>课程名</td>
						<td><input type="text" name="cname" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>课程简介</td>
						<td><textarea name="cjj" class="easyui-validatebox" required="true"  style=" border:solid 3px #E2E2E2;line-height:16px; padding:5px;height:80px"></textarea></td>
					</tr>
					<tr>
						<td>课程类别</td>
						<td><input type="text" name="ctype" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>开设状态</td>
						<td><select class="easyui-combobox" name="cstate" data-options="panelHeight: 'auto',editable:false" style="width:100px">  
							    <option value="0">开设</option>  
							    <option value="1">不开设</option>  
							</select> 
						</td>
					</tr>
					<input type="hidden" name="count" class="easyui-validatebox"/>	
					<input type="hidden" name="ctime" class="easyui-validatebox"/>
					 <tr>
						<td>选择图片</td>
						<td><input type="file" id="imagefile"  name="upload" class="easyui-filebox" style="width:200px"" onchange="imageChange(this);"/>
						<script type="text/javascript">
						function iamgeChange(target) {
							//检测上传文件的类型 
							var imgName = $("#imagefile").val();
		   
							  
						        var fileName = imgName.substring(imgName.lastIndexOf(".")+1).toLowerCase();
						        if(fileName !="jpg" && fileName !="jpeg"  && fileName !="png"){
						        	$.messager.alert("提示信息","请选择正确的格式图片（jpg，jpeg,png）","error");
						            target.value="";
						            return;
						        }
						
						</script>
						
						</td>
						
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
										var v = $("#addLessonForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#addLessonForm").submit();
										}
									});
									});
	</script>
	
	
	
	<div class="easyui-window" title="修改" id="editLessonWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div region="north" style="height:31px;overflow:hidden;" split="false" border="false" >
			<div class="datagrid-toolbar">
				<a id="editInfo" icon="icon-save" href="#" class="easyui-linkbutton" plain="true" >保存</a>
			</div>
		</div>
		
		<div region="center" style="overflow:auto;padding:5px;" border="false">
			<form id="editLessonForm"  action="lessonAction_editInfo.action" method="post">
				<table class="table-edit" width="80%" align="center">
						<tr class="title">
						<td colspan="2">课程信息</td>
					</tr>
					<input type="hidden" name="cid" class="easyui-validatebox"/>
					<tr>
						<td>课程名</td>
						<td><input type="text" name="cname" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>课程简介</td>
						<td><textarea name="cjj" class="easyui-validatebox" required="true"  style=" border:solid 3px #E2E2E2;line-height:16px; padding:5px;height:80px"></textarea></td>
					</tr>
					<tr>
						<td>课程类别</td>
						<td><input type="text" name="ctype" class="easyui-validatebox" required="true"/></td>
					</tr>
					<tr>
						<td>开设状态</td>
						<td><select class="easyui-combobox" name="cstate" data-options="panelHeight: 'auto',editable:false" style="width:100px">  
							    <option value="0">开设</option>  
							    <option value="1">不开设</option>  
							</select> 
						</td>
					</tr>
					<input type="hidden" name="count" class="easyui-validatebox"/>	
					<input type="hidden" name="ctime" class="easyui-validatebox"/>
					
					</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
								$(function(){
									//为保存按钮绑定事件
									$("#editInfo").click(function(){
										//表单校验，如果通过，提交表单
										var v = $("#editLessonForm").form("validate");
										if(v){
											//$("#addStaffForm").form("submit");
											$("#editLessonForm").submit();
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
						<td><input type="text" name="lessonId"/></td>
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
	
	
	
	<div class="easyui-window" title="课程类别人数分布" id="showWindow" collapsible="false" minimizable="false" maximizable="false" style="top:20px;left:200px">
		<div id="test"  split="false" border="false" >
		</div>
	</div>
	
	
</body>
</html>