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
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/member.css"/>
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery-1.8.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/tab.css" media="screen">
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery.tabs.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/mine.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/enewmoc4/info/css/demo.css" />

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/enewmoc4/info/css/style.css" />

<script type="text/javascript">
$(function(){

	
	$('.demo2').Tabs({
		event:'click'
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
<div class="clearh"></div>
<div class="membertab">
<div class="memblist">
	<div class="membhead">
    <div style="text-align:center;"><img src="${pageContext.request.contextPath }/enewmoc4/images/0-0.JPG" width="80" ></div>
    <div style="width:220px;text-align:center;">
    <p class="membUpdate mine"><s:property value="#session.studentInfo.name"/></p> 
    <p class="membUpdate mine"><a href="${pageContext.request.contextPath }/enewmoc4/setstudentinfo.jsp">修改信息</a>&nbsp;|&nbsp;<a href="myrepassword.html">修改密码</a></p>
    <div class="clearh"></div>
    </div>
    </div>
    <div class="memb">
   
    <ul>
    	<li ><a class="mb1" href="${pageContext.request.contextPath }/lessonAction_fronthome?studentId=<s:property value="#session.studentInfo.studentId"/>">我的课程</a></li>
		<li class="currnav"><a class="mb4" href="${pageContext.request.contextPath }/studentAction_myinfo?studentId=<s:property value="#session.studentInfo.studentId"/>">我的信息</a></li>
        <li><a class="mb2" href="http://localhost:8090/SSH2/" target="_blank">我的题库</a></li>
   </ul>
   
    </div>

    
  </div>


	<div class="membcont">
<div class="box demo2" style="width:820px;">
		<div class="af-wrapper">
		<h3>个人信息</h3>
		
		
		<form class="af-form" id="af-form" action=""  method="post" novalidate>
			
		
			<div class="af-outer af-required">
				<div class="af-inner">
					<label for="input-name">姓名</label>
					<input type="text" name="name" id="input-name"  value="<s:property value="#studentInfo.name"/>" readonly="readonly"  required>
				</div>
			</div>
			<div class="af-outer af-required">
				<div class="af-inner">
					<label for="input-profession">专业</label>
					<input type="text" name="profession" id="input-profession" value="<s:property value="#studentInfo.profession"/>"  readonly="readonly"  required>
				</div>
			</div>
			<div class="af-outer af-required">
				<div class="af-inner">
					<label for="input-sex">性别</label>
					<input type="text" name="sex" id="input-sex" value="<s:property value="#studentInfo.sex"/>" readonly="readonly"  required>
				</div>
			</div>
			
			<div class="af-outer">
				<div class="af-inner">
					<label for="input-bdate">出生日期</label>
					<input type="date" name="birthday" id="input-bdate" placeholder="YYYY-MM-DD" value="<s:property value="#studentInfo.birthday"/>" readonly="readonly" >
				</div>
			</div>
			
			<div class="af-outer af-required">
				<div class="af-inner">
				  <label for="input-country">城市</label>
				  <input type="email" name="address" id="input-country" value="<s:property value="#session.studentInfo.address"/>" readonly="readonly"  required>
				</div>
			</div>
			<div class="af-outer af-required">
				<div class="af-inner">
				  <label for="input-email">邮箱:</label>
				  <input type="email" name="email" id="input-email" value="<s:property value="#studentInfo.email"/>" readonly="readonly"  required>
				</div>
			</div>
			
			
			<div class="af-outer">
				<div class="af-inner">
				  <label for="input-phone">手机</label>
				  <input type="email" name="tel" id="input-phone" value="<s:property value="#studentInfo.tel"/>" readonly="readonly" >
				</div>
			</div>
			
			
			
		</form>
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
