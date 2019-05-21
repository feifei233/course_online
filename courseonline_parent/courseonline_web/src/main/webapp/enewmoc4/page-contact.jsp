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
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/tab.css" media="screen">
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery-1.8.0.min.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery.tabs.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/mine.js"></script>
<script>
$(function(){
	/*左侧栏*/
    var w = $(window).width();
    var lw = (w - 1100) / 2 - 10;
    $(".courseleft").css({
        "position": "fixed",
        "top": "80px",
        "left": lw + 10
    });
});

</script>
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
    <div class="courseleft">
    <ul class="courseul pageul">
        <li style="border-radius:3px 3px 0 0"><a href="#">关于我们<b></b></a></li>
        <li class="curr"><a href="#" >联系我们<b></b></a></li>
        <li><a href="#" >帮助中心<b></b></a></li>
        <li><a href="#" >意见反馈<b></b></a></li>
        <li style="border-radius:0 0 3px 3px "><a href="#" >加入我们<b></b></a></li>
    </ul>
    </div>
    <div class="courseright pageright" style="min-height:500px;">
    	<h3 class="mem-h3">联系我们</h3>
        <div class="clearh"></div>
   	  	<div class="pagetext">
	    	<span class="pagemap">
            	<img src="${pageContext.request.contextPath }/enewmoc4/images/map.jpg" width="400"> 
            </span>
            <span class="contact">
            	<p><strong>咨询热线</strong>：400-803-5080</p>
                <p><strong>客服QQ</strong>：2977138424</p>
                <p><strong>公司地址</strong>：山西省太原市高新开发区体育路南内环街口数码港A座4层</p>
            </span>
        </div>
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
