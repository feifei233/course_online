<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!doctype html>
<html><!-- InstanceBegin template="/Templates/dwt.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Java语言基础在线学习平台</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/course.css"/>
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery-1.8.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/tab.css" media="screen">
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery.tabs.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/mine.js"></script>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->

</head>

<body>

<div class="head" id="fixed">
	<div class="nav">
    	<span class="navimg"><a href="${pageContext.request.contextPath }/enewmoc4/index.jsp"><img border="0" src="${pageContext.request.contextPath }/enewmoc4/images/logo.png"></a></span>
        <ul class="nag">
        	<li><a href="${pageContext.request.contextPath }/lessonAction_frontlist.action" class="link1">课程</a></li>
            <li><a href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp" class="link1">资讯</a></li>
            <li><a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" class="link1">讲师</a></li>
            <li><a href="${pageContext.request.contextPath }/enewmoc4/exam_index.jsp" class="link1" target="_blank">题库</a></li>
        </ul>
        <span class="massage">
            <!--<span class="select">
        	<a href="#" class="sort">课程</a>
        	<input type="text" value="关键字"/>
            <a href="#" class="sellink"></a>
            <span class="sortext">
            	<p>课程</p>
                <p>题库</p>
                <p>讲师</p>
            </span>
        </span>--> 
        	<!--未登录-->
        	<span class="exambtn_lore">
                 <a class="tkbtn tklog" href="${pageContext.request.contextPath }/enewmoc4/login.jsp">登录</a>
                 <a class="tkbtn tkreg" href="${pageContext.request.contextPath }/enewmoc4/register.jsp">注册</a>
            </span>
            <!--登录后-->
            <!--<div class="logined">
                <a href="mycourse.html"  onMouseOver="logmine()" style="width:70px" class="link2 he ico" target="_blank">sherley</a>
                <span id="lne" style="display:none" onMouseOut="logclose()" onMouseOver="logmine()">
                    <span style="background:#fff;">
                        <a href="mycourse.html" style="width:70px; display:block;" class="link2 he ico" target="_blank">sherley</a>
                    </span>
                    <div class="clearh"></div>
                    <ul class="logmine" >
                        <li><a class="link1" href="#">我的课程</a></li>
                        <li><a class="link1" href="#">我的题库</a></li>
                        <li><a class="link1" href="#">我的问答</a></li>
                        <li><a class="link1" href="#">退出</a></li>
                    </ul>
                </span>
            </div>-->
            
        </span>
    </div>
</div>
<!-- InstanceBeginEditable name="EditRegion1" -->
<div class="coursecont" style="background: none repeat scroll 0 0 #fff;border-radius: 3px;box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);" >
    <h3 class="righttit" style="padding-left:50px;">优秀讲师</h3>
	<div class="coursepic tecti">
		<div class="teaimg">
		<a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/teacher.jpg" width="150"></a>
		</div>
		<div class="teachtext">
			<h3><a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" target="_blank" class="teatt">马嫱</a>&nbsp;&nbsp;<strong>会计基础、会计电算化讲师</strong></h3>
			<h4>个人简介</h4>
			<p>资深财会考试与实务操作讲师；拥有五年财税实务及实操经验。 曾在大型连锁超市担任总会计三年，集团公司两年的会计工作经历。</p>
			<h4>授课风格</h4>
			<p>马老师讲授的课程紧扣大纲，重点突出；举例风趣幽默，讲解通俗易懂;传授的学习方法简洁有效；同时，注意与学员进行各种交流，及时解答学员疑惑，反馈学员建议，深受好评。</p>
		</div>
		<div class="clearh"></div>
	</div>
	<div class="coursepic tecti">
		<div class="teaimg">
		<a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/teacher.jpg" width="150"></a>
		</div>
		<div class="teachtext">
			<h3><a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" target="_blank" class="teatt">马嫱</a>&nbsp;&nbsp;<strong>会计基础、会计电算化讲师</strong></h3>
			<h4>个人简介</h4>
			<p>资深财会考试与实务操作讲师；拥有五年财税实务及实操经验。 曾在大型连锁超市担任总会计三年，集团公司两年的会计工作经历。</p>
			<h4>授课风格</h4>
			<p>马老师讲授的课程紧扣大纲，重点突出；举例风趣幽默，讲解通俗易懂;传授的学习方法简洁有效；同时，注意与学员进行各种交流，及时解答学员疑惑，反馈学员建议，深受好评。</p>
		</div>
		<div class="clearh"></div>
	</div>
	<div class="coursepic tecti">
		<div class="teaimg">
		<a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/teacher.jpg" width="150"></a>
		</div>
		<div class="teachtext">
			<h3><a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" target="_blank" class="teatt">马嫱</a>&nbsp;&nbsp;<strong>会计基础、会计电算化讲师</strong></h3>
			<h4>个人简介</h4>
			<p>资深财会考试与实务操作讲师；拥有五年财税实务及实操经验。 曾在大型连锁超市担任总会计三年，集团公司两年的会计工作经历。</p>
			<h4>授课风格</h4>
			<p>马老师讲授的课程紧扣大纲，重点突出；举例风趣幽默，讲解通俗易懂;传授的学习方法简洁有效；同时，注意与学员进行各种交流，及时解答学员疑惑，反馈学员建议，深受好评。</p>
		</div>
		<div class="clearh"></div>
	</div>
</div>
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
