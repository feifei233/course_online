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
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery-1.8.0.min.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/mine.js"></script>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->

</head>

<body>

<div class="head" id="fixed">
	<div class="nav">
    	<span class="navimg"><a href="index.html"><img border="0" src="images/logo.png"></a></span>
       <span class="navimg"><a href="${pageContext.request.contextPath }/enewmoc4/index.jsp"><img border="0" src="${pageContext.request.contextPath }/enewmoc4/images/logo.png"></a></span>
        <ul class="nag">
        	<li><a href="${pageContext.request.contextPath }/lessonAction_frontlist.action" class="link1">课程</a></li>
            <li><a href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp" class="link1">资讯</a></li>
            <!-- <li><a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" class="link1">讲师</a></li> -->
            <li><a href="http://localhost:8090/SSH2/" class="link1" target="_blank">题库</a></li>
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
<div class="coursecont">
<div class="coursepic">
	<h3 class="righttit">全部资讯</h3>
    <div class="clearh"></div>
    <span class="bread nob">
        <a class="fombtn cur" href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp">全部资讯</a>
        <a class="fombtn" href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp">热门资讯</a>
        <a class="fombtn" href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp">考试指导</a>
        <a class="fombtn" href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp">精彩活动</a>
    </span>
    
</div>
<div class="clearh"></div>
<div class="coursetext">
	<div class="articlelist">
    	<h3><a class="artlink" href="${pageContext.request.contextPath }/enewmoc4/article.jsp">2018年第一季度广西省计算机等级考试日程安排<</a></h3>
        <p>2018年第一季度广西省计算机等级考试日程安排...</p>
        <p class="artilabel">
        <span class="ask_label">热门资讯</span>
        <b class="labtime">2018-03-02</b>
        </p>
        <div class="clearh"></div>
    </div>
    <div class="articlelist">
    	<h3><a class="artlink" href="${pageContext.request.contextPath }/enewmoc4/article.jsp">2018年第一季度广西省计算机等级考试日程安排<</a></h3>
        <p>2018年第一季度广西省计算机等级考试日程安排...</p>
        <p class="artilabel">
        <span class="ask_label">热门资讯</span>
        <b class="labtime">2018-03-02</b>
        </p>
        <div class="clearh"></div>
    </div>
    <div class="articlelist">
    	<h3><a class="artlink" href="${pageContext.request.contextPath }/enewmoc4/article.jsp">2018年第一季度广西省计算机等级考试日程安排<</a></h3>
        <p>2018年第一季度广西省计算机等级考试日程安排...</p>
        <p class="artilabel">
        <span class="ask_label">热门资讯</span>
        <b class="labtime">2018-03-02</b>
        </p>
        <div class="clearh"></div>
    </div>
    <div class="articlelist">
    	<h3><a class="artlink" href="${pageContext.request.contextPath }/enewmoc4/article.jsp">2018年第一季度广西省计算机等级考试日程安排<</a></h3>
        <p>2018年第一季度广西省计算机等级考试日程安排...</p>
        <p class="artilabel">
        <span class="ask_label">热门资讯</span>
        <b class="labtime">2018-03-02</b>
        </p>
        <div class="clearh"></div>
    </div>
    
    
	<div class="clearh" style="height:20px;"></div>
	<span class="pagejump">
    	<p class="userpager-list">
       	   <a href="#" class="page-number">首页</a>
           <a href="#" class="page-number">上一页</a>
           <a href="#" class="page-number">1</a>
           <a href="#" class="page-number pageractive">2</a>
           <a href="#" class="page-number">3</a>
            <a href="#" class="page-number">...</a>
            <a href="#" class="page-number">10</a>
           <a href="#" class="page-number">下一页</a>
           <a href="#" class="page-number">末页</a>
        </p>
    </span>
    <div class="clearh" style="height:10px;"></div>
</div>

<div class="courightext">
<div class="ctext">
    <div class="cr1">
    <h3 class="righttit">热门资讯</h3>
    <div class="gonggao">
	<ul class="hotask">
        	<li><a class="ask_link" href="#"><strong>●</strong>最全 最新 办公软件下载</a></li>
            <li><a class="ask_link" href="#"><strong>●</strong>最全 最新 办公软件下载</a></li>
            <li><a class="ask_link" href="#"><strong>●</strong>最全 最新 办公软件下载</a></li>
            <li><a class="ask_link" href="#"><strong>●</strong>最全 最新 办公软件下载</a></li>
            <li><a class="ask_link" href="#"><strong>●</strong>最全 最新 办公软件下载</a></li>
            <li><a class="ask_link" href="#"><strong>●</strong>最全 最新 办公软件下载</a></li>
        </ul>
    </div>
    </div>
</div>
<!--  
<div class="ctext">
    <div class="cr1">
    <h3 class="righttit">推荐课程</h3>
    <div class="teacher">
    <div class="teapic">
        <a href="#"  target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/c1.jpg" height="60" title="财经法规与财经职业道德"></a>
        <h3 class="courh3"><a href="#" class="ask_link" target="_blank">财经法规与财经职业道德</a></h3>
    </div>
    <div class="clearh"></div>
    <div class="teapic">
        <a href="#"  target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/c2.jpg" height="60" title="财经法规与财经职业道德"></a>
        <h3 class="courh3"><a href="#" class="ask_link" target="_blank">财经法规与财经职业道德</a></h3>
    </div>
    <div class="clearh"></div>
    <div class="teapic">
        <a href="#"  target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/c3.jpg" height="60" title="财经法规与财经职业道德"></a>
        <h3 class="courh3"><a href="#" class="ask_link" target="_blank">财经法规与财经职业道德</a></h3>
    </div>
    <div class="clearh"></div>
    </div>
    </div>
</div>
 
</div>
-->  


<div class="clearh"></div>
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
