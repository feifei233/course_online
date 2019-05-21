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
            <li><a href="http://localhost:8090/SSH2/" class="link1" target="_blank">题库</a></li>a></li>
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
        <li class="curr" style="border-radius:3px 3px 0 0"><a href="#">关于我们<b></b></a></li>
        <li><a href="${pageContext.request.contextPath }/enewmoc4/page-contact.jsp" >联系我们<b></b></a></li>
        <li><a href="#" >帮助中心<b></b></a></li>
        <li><a href="#" >意见反馈<b></b></a></li>
        <li style="border-radius:0 0 3px 3px "><a href="#" >加入我们<b></b></a></li>
    </ul>
    </div>
    <div class="courseright pageright" style="min-height:500px;">
    	<h3 class="mem-h3">关于我们</h3>
        <div class="clearh"></div>
        <div class="pagetext">
            <p>谋刻网(www.moc.cc)——山西省首家O2O教育品牌。</p>
            <p>
                谋刻网成立于2014年8月15日，是山西思软科技集团独立运营面向全国的在线教育品牌，致力于为中国大学生，职场白领提供高质量高品质的线上与线下学习课程。课程内容包括大学MOOC（大规模开放式课程），职业技能课程，以及各界名人的经验分享课程。
            </p>
            <p>
                    谋刻网目标用户定位于在校大学生、提升职业技能的城市从业人员和有志于掌握一技之长的进城务工人员，网站通过丰富的在线课程、人性化的网站和不断创新的互动教学模式，为用户提供愉悦便捷的在线学习体验，从而节省学习时间，降低学习成本；更为用户提供了种类丰富和卓越品质的在线技能培训和学习资源，并以扩展的线下服务来保障学习者的学习品质。
            </p>
            <div class="imgdiv">
                <img src="${pageContext.request.contextPath }/enewmoc4/images/tbanner1.jpg" width="740"> 
                <p>图片信息一</p>
            </div>
            <p>
                现代人的生活日益紧凑，繁忙的学习和工作挤占了生活的绝大多数时间，而传统技能类教育培训动辄数月的集中式学习已经越来越无法适应在校大学生、职场新人的学习要求。“谋刻网”则利用强大的互联网及移动互联网平台，充分整合用户的碎片时间，将系统的课程体系切分成众多的单元，用户可以灵活选择学习的时间、地点、课程进度，从而最大化的利用碎片时间，提高学习效率。“谋刻网”也致力于打造强大的教育云平台，整合众多的优秀师资和教学资料，将最好的学习资源传递至每个用户的终端。
            </p>
            <div class="imgdiv">
                <img src="${pageContext.request.contextPath }/enewmoc4/images/tbanner2.jpg" width="740"> 
                <p>图片信息二</p>
            </div>
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
