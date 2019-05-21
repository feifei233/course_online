<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!doctype html>
<html><!-- InstanceBegin template="/Templates/dwt.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Java语言基础在线学习平台</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/article.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/course.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/tab.css" media="screen">
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery-1.8.0.min.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery.tabs.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/mine.js"></script>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<script type="text/javascript">
function changePage(pageNum){
	$("#currentPageInput").val(pageNum);
	$("#pageForm").submit();
};

function changePagesize(pageSize){
	$("#pageSizeInput").val(pageSize);
	$("#pageForm").submit();
};
</script>
</head>

<body>

<div class="head" id="fixed">
	<div class="nav">
    	<span class="navimg"><a href="${pageContext.request.contextPath }/enewmoc4/index.jsp"><img border="0" src="${pageContext.request.contextPath }/enewmoc4/images/logo.png"></a></span>
        <ul class="nag">
        	<li><a href="${pageContext.request.contextPath }/lessonAction_frontlist.action" class="link1">课程</a></li>
            <!--<li><a href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp" class="link1">资讯</a></li>
             <li><a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" class="link1">讲师</a></li> -->
            <li><a href="http://localhost:8090/SSH2/" class="link1" target="_blank">题库</a></li>
        </ul>
        <!--未登录-->
        	<s:if test="#session.studentInfo==null">
        	<span class="exambtn_lore">
                 <a class="tkbtn tklog" href="${pageContext.request.contextPath }/enewmoc4/login.jsp">登录</a>
                 <a class="tkbtn tkreg" href="${pageContext.request.contextPath }/enewmoc4/register.jsp">注册</a>
            </span>
            </s:if>
            <s:else>
            <div class="logined">
                <a href="mycourse.html"  onMouseOver="logmine()" style="width:70px" class="link2 he ico" target="_blank"><s:property value="#session.studentInfo.name"/></a>
                <span id="lne" style="display:none" onMouseOut="logclose()" onMouseOver="logmine()">
                    <span style="background:#fff;">
                        <a href="#" style="width:70px; display:block;" class="link2 he ico" target="_blank"><s:property value="#session.studentInfo.name"/></a>
                    </span>
                    <div class="clearh"></div>
                    <ul class="logmine" >
                        <li><a class="link1" href="${pageContext.request.contextPath }/lessonAction_fronthome?studentId=<s:property value="#session.studentInfo.studentId"/>">个人中心</a></li>
                        <li><a class="link1" href="${pageContext.request.contextPath }/enewmoc4/studentinfo.jsp">我的信息</a></li>
                        <li><a class="link1" href="${pageContext.request.contextPath }/loginAction_logout">退出</a></li>
                    </ul>
                </span>
            </div>
            </s:else>
    </div>
</div>

<form id="pageForm" name="pageForm" action="${pageContext.request.contextPath}/lessonAction_frontlist" method="post">
			<!-- 隐藏域.当前页码 -->
			<input type="hidden" name="currentPage" id="currentPageInput" value="<s:property value="#pageBean.currentPage" />" />
			<!-- 隐藏域.每页显示条数 -->
			<input type="hidden" name="pageSize" id="pageSizeInput"       value="<s:property value="#pageBean.pageSize" />" />	
</form>

<!-- InstanceBeginEditable name="EditRegion1" -->
<div class="coursecont">
    <div class="courseleft">
	<span class="select">     	
      <input type="text" value="请输入关键字" class="pingjia_con"/>
      <a href="#" class="sellink"></a>        
    </span>
    <ul class="courseul">
    <li class="curr" style="border-radius:3px 3px 0 0;background:#fb5e55;"><h3 style="color:#fff;"><a href="${pageContext.request.contextPath }/lessonAction_frontlist.action" class="whitea">全部课程</a></h3>
    <li>
    <h4>JAVA</h4>
        <ul class="sortul">
         
       		 <li><a href="${pageContext.request.contextPath }/lessonAction_frontlist.action?ctype=java基础课程">java基础课程</a></li>
       		 <li><a href="${pageContext.request.contextPath }/lessonAction_frontlist.action?ctype=java进阶课程" >java进阶课程</a></li>
       		 <li><a href="${pageContext.request.contextPath }/lessonAction_frontlist.action?ctype=java高级课程" >java高级课程</a></li>
 
        </ul>
    <div class="clearh"></div>
    </li>
    </ul>
    <div style="height:20px;border-radius:0 0 5px 5px; background:#fff;box-shadow:0 2px 4px rgba(0, 0, 0, 0.1)"></div>
    </div>
    <div class="courseright">
        <div class="clearh"></div>
      <ul class="courseulr">
      
      
      <s:iterator value="#pageBean.list" var="lesson">
        <li>
        	<div class="courselist">
            <a href="${pageContext.request.contextPath }/lessonAction_frontlist1.action?cid=<s:property value="#lesson.cid"/>" target="_blank"><img style="border-radius:3px 3px 0 0;" width="240" src="${pageContext.request.contextPath }/uploadimage/<s:property value='#lesson.imagename'/>" title="<s:property value="#lesson.cname"/>"></a>
            <p class="courTit"><a href="${pageContext.request.contextPath }/lessonAction_frontlist1.action?cid=<s:property value="#lesson.cid"/>" target="_blank"><s:property value="#lesson.cname"/></a></p>
            <div class="gray">
            <span><s:property value="#lesson.ctime"/>课时</span>
            <span class="sp1"><s:property value="#lesson.count"/>人学习</span>
            <div style="clear:both"></div>
            </div>
            </div>
            
       </li>
	</s:iterator>

		</div>
    </div>
    <div class="clearh"></div>

        <span class="pagejump">
		<p class="userpager-list" >
		共[<b><s:property value="#pageBean.totalCount"/></b>]条记录,
			   共[<b><s:property value="#pageBean.totalPage"/></b>]页&nbsp;&nbsp;
			   每页显示
			<select name="pageSize" onchange="changePagesize($('#pageSizeselect option:selected').val())" id="pageSizeselect">
				<option value="15" <s:property value="#pageBean.pageSize==15?'selected':''" />>15</option>
				<option value="30" <s:property value="#pageBean.pageSize==30?'selected':''" />>30</option>
				<option value="100" <s:property value="#pageBean.pageSize==100?'selected':''" />>100</option>
			</select>条
			<a href="javascript:void(0);" class="page-number">首页</a>
		    <a href="javascript:void(0);" onclick="changePage(<s:property value='#pageBean.currentPage-1'/>)" class="page-number">上一页</a>
			<a href="javascript:void(0);" class="page-number pageractive"><s:property value="#pageBean.currentPage"/></a>
			<a href="javascript:void(0);" onclick="changePage(<s:property value='#pageBean.currentPage+1'/>)" class="page-number">下一页</a>
			<a href="javascript:void(0);" class="page-number">末页</a>
		</p>
		</span>s
	<div class="clearh" style="height:10px;"></div>
<!-- InstanceEndEditable -->


<div class="clearh"></div>
<div class="foot">
<div class="fcontainer">
      <div class="fwxwb"> 
	       	              
      </div>
      <div class="fmenu">
	     <p><a href="#">关于我们</a> | <a href="#">联系我们</a>  | <a href="#">加入我们</a></p>
      </div>
      <div class="copyright">      
        <div><a href="/"></a>所有&nbsp;</div>
      </div>
    </div>
</div>
</div>

<!--右侧浮动-->
<div class="rmbar">
	<span class="barico qq" style="position:relative">
	<div  class="showqq">
	   <p>QQ:1254071858<br></p>
	</div>
	</span>
	<span class="barico em" style="position:relative">
	  <img src="" width="75" class="showem">
	</span>
	<span class="barico wb" style="position:relative">
	  <img src="" width="75" class="showwb">
	</span>	
	<span class="barico top" id="top">置顶</span>	
</div>
</body>

<!-- InstanceEnd --></html>
