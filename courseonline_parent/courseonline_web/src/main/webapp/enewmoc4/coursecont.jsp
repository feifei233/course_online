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
            <!--<li><a href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp" class="link1">资讯</a></li>
             <li><a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" class="link1">讲师</a></li> -->
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
            
        </span>
    </div>
</div>
<!-- InstanceBeginEditable name="EditRegion1" -->
<script type="text/javascript">
	//function toEdit(sid,cid){
		//var cid = document.getElementById("aaa").value;
		//var sid = document.getElementById("ccc").value;
	//	location.href="${pageContext.request.contextPath }/lessonAction_frontlist2.action?sid="+sid+"&cid="+cid;
	//}

</script>
<div class="coursecont">
<div class="coursepic">
<s:iterator value="#pageBean.list" var="lesson">
	<div class="course_img"><img src="${pageContext.request.contextPath }/uploadimage/<s:property value='#lesson.imagename'/>" width="500"></div>
    <div class="coursetitle">
    
   		<a class="state">更新中</a>
    	<h2 class="courseh2"><s:property value="#lesson.cname"/></h2>    
        <br/><br/>
        <p class="courstime">总课时：<span class="course_tt"><s:property value="#lesson.ctime"/>课时</span></p>
       	
        <p class="courstime">学习人数：<span class="course_tt"><s:property value="#lesson.count"/>人</span></p>
		
		<p class="courstime">课程评价：<img width="71" height="14" src="${pageContext.request.contextPath }/enewmoc4/images/evaluate5.png">&nbsp;&nbsp;<span class="hidden-sm hidden-xs">5.0分（10人评价）</span></p>
		<input type="hidden" value="<s:property value="#lesson.cid"/>" id="aaa"/>
		<input type="hidden" value="<s:property value="#lesson.ctype"/>" id="bbb"/>
		<input type="hidden" value="<s:property value="#session.studentInfo.studentId"/>" id="ccc"/>
        <!--<p><a class="state end">完结</a></p>-->
        <s:if test="#session.studentInfo==null"><span class="coursebtn"><a class="btnlink" href="${pageContext.request.contextPath }/enewmoc4/login.jsp" >加入学习</a></s:if>      
        <s:else><span class="coursebtn"><a class="btnlink" href="${pageContext.request.contextPath }/lessonAction_frontlist2.action?studentId=<s:property value="#session.studentInfo.studentId"/>&cid=<s:property value="#lesson.cid"/>"  >加入学习</a></s:else><a class="codol fx" href="javascript:void(0);" onClick="$('#bds').toggle();">分享课程</a><a class="codol sc" href="#">收藏课程</a></span> 
		<div style="clear:both;"></div>
		<div id="bds">
            <div class="bdsharebuttonbox">
				<a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a>
				<a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a>
				<a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a>
				<a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a>
				<a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a>
				<a href="#" class="bds_more" data-cmd="more"></a>
				<a class="bds_count" data-cmd="count"></a>
			</div>
            <script>
			window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"24"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
			</script>
       </div>
      </s:iterator> 
    </div>
    <div class="clearh"></div>
</div>
<script type="text/javascript">
    jQuery(document).ready(function($) {
    })
   
</script>
<div class="clearh"></div>
<div class="coursetext">
	<h3 class="leftit">课程简介</h3>
    <p class="coutex"><s:iterator value="#pageBean.list" var="lesson"><s:property value="#lesson.cjj"/></s:iterator> </p>
	<div class="clearh"></div>
	<h3 class="leftit">课程目录</h3>
    <dl class="mulu">
  		<s:iterator value="#vedio" var="list">
			<dt><a href='${pageContext.request.contextPath }/materiaAction_frontdownloadFile.action?ids=<s:property value="#list.vid"/>' class='graylink'><s:property value="#list.vname"/></a></dt>
		</s:iterator>
    </dl>
</div>

<div class="courightext">
<!--  <div class="ctext">
    <div class="cr1">
    <h3 class="righttit">授课讲师</h3>
    <div class="teacher">
    <div class="teapic ppi">
    <a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/teacher.png" width="80" class="teapicy" title="张民智"></a>
    <h3 class="tname"><a href="teacher.html" class="peptitle" target="_blank">张民智</a><p style="font-size:14px;color:#666">会计讲师</p></h3>
    </div>
    <div class="clearh"></div>
    <p>十年以上Linux从业经验， 培训经验超过八年。在各 个知名培训机构做过金牌 讲师、学科负责人，培训 学员过万人。曾获红帽认 证讲师，微软认证讲师等 资质认证。教学以逻辑性 强、教学细致、知识点准 确著称。</p>
    </div>
    </div>
</div>-->

 <div class="ctext">
    <div class="cr1">
    <h3 class="righttit">课程公告</h3>
    <div class="gonggao">
	<div class="clearh"></div>
    <p class="notice">
    	<s:iterator value="#notice" var="list">
    		<s:property value="#list.ncontent"/><br/><span class="gonggao_time"><s:property value="#list.ntime"/></span>
    	</s:iterator>
	</p>
	<div class="clearh"></div>
    </div>
    </div>
</div>

<div class="ctext">
    <div class="cr1">
    <h3 class="righttit">相关课程</h3>
    <div class="teacher">
    
    <s:iterator value="#listlesson" var="list">
   		<div class="teapic"><a href="${pageContext.request.contextPath }/lessonAction_frontlist1.action?cid=<s:property value="#list.cid"/>"  target="_blank">
   		<img src="${pageContext.request.contextPath }/uploadimage/<s:property value='#list.imagename'/>" height="60" title="<s:property value="#list.cname"/>"></a><h3 class="courh3">
   		<a href="#" class="peptitle" target="_blank"><s:property value="#list.cname"/></a></h3> 
   		 </div>
    </s:iterator>
    
    <div class="clearh"></div>
    </div>
    </div>
</div>
   
</div>



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
