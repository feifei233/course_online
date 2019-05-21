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
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/register-login.css"/>
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery-1.8.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/tab.css" media="screen">
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery.tabs.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/mine.js"></script>
<script type="text/javascript">
$(function(){

	$('.demo2').Tabs({
		event:'click'
	});
	$('.demo3').Tabs({
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
            <!-- <li><a href="${pageContext.request.contextPath }/enewmoc4/articlelist.jsp" class="link1">资讯</a></li>
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


<div class="coursecont">
<div class="coursepic1">
   <div class="coursetitle1">
  	 <s:iterator value="#pageBean.list" var="lesson">
    	<h2 class="courseh21"><s:property value="#lesson.cname"/></h2>
		<div  style="margin-top:-40px;margin-right:25px;float:right;">
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
   <s:iterator value="#pageBean.list" var="lesson">
   <div class="course_img1">
	   <img src="${pageContext.request.contextPath }/uploadimage/<s:property value='#lesson.imagename'/>" height="140">	   
   </div>
   <div class="course_xq">
       <span class="courstime1"><p>课时<br/><span class="coursxq_num"><s:property value="#lesson.ctime"/>课时</span></p></span>
	   <span class="courstime1"><p>学习人数<br/><span class="coursxq_num"><s:property value="#lesson.count"/>人</span></p></span>
   </div>
   <div class="course_xq2">
      <a class="course_learn" href="${pageContext.request.contextPath }/vedioAction_frontlist.action?cid=<s:property value="#lesson.cid"/>">开始学习</a>
   </div> 
    <div class="clearh"></div>
    </s:iterator>
</div>
<!--<span class="mulu_zd">+</span>-->
<div class="clearh"></div>
<div class="coursetext">
	<div class="box demo2" style="position:relative">
			<ul class="tab_menu">
				<li class="current course1">章节</li>
				<li class="course1">评价</li>
                <li class="course1">资料区</li>
			</ul>
			<!--<a class="fombtn" style=" position:absolute; z-index:3; top:-10px; width:80px; text-align:center;right:0px;" href="#">下载资料包</a>-->
			<div class="tab_box">
				<div>
					<dl class="mulu noo">
					<s:iterator value="vedio" var="list">
					<div>
                        <dt class="mulu_title"><span class="mulu_img"></span><a href="${pageContext.request.contextPath }/vedioAction_vediopaly.action?vid=<s:property value="#list.vid"/>"><s:property value="#list.vname"/></a>
						</dt>
					</div>
					</s:iterator>
                   </dl>                   
				</div>
				<div class="hide">
					<div>
                    <div id="star">
                        <span class="startitle">请打分</span>
                        <ul id="tests">
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                            <li>5</li>
                        </ul>
                        <span></span>
                        <p></p>
	                  </div>
                    <div class="c_eform">    
             
                      <form action="${pageContext.request.contextPath }/lessonScoreAction_frontadd.action?sname=<s:property value="#session.studentInfo.name"/>&cid=<s:property value="#lesson.cid"/>" method="post"> 
                        <input type="hidden" name="score" id="score"/>  
                        <script>
      
                    	
                    		$("#tests li").click(function(){//点击事件  

                    			//测试直接获取值
                    			//var v=$(this).text(); //alert(v);        
                                
	                                var count=$(this).index();//获取li的下标  
	                                var Tresult=Uarry.eq(count).text();  
	                            
	                         		$("#score").val(Tresult); 
                    		  //  alert(s)

                    		});
                    
                    		
                    
                    	</script>   
                        <textarea  id="content"  name="content" rows="7" class="pingjia_con" onblur="if (this.value =='') this.value='评价详细内容';this.className='pingjia_con'" onclick="if (this.value=='评价详细内容') this.value='';this.className='pingjia_con_on'">评价详细内容</textarea>
                       <!--  <a href="#" class="fombtn">发布评论</a>-->
                         <input type="submit" value="发布评论" class="fombtn" style="width：104">
                      </form>        
                       
                       <div class="clearh"></div>
                    </div>
					<ul class="evalucourse">
					
						<s:iterator value="#lessonScore" var="list">				
	                    	<li>
	                        	<span class="pephead"><img src="${pageContext.request.contextPath }/enewmoc4/images/0-0.JPG" width="50" title="候候">
	                            <p class="pepname"><s:property value="#list.sname" /></p>                           
	                            </span>
	                             
	                            <span class="pepcont">
	                            <!--<s:if test="#request.lessonScore.score=='1'">
	                            	<p>
	                               	       课程评价：很差！完全不懂在讲什么
	                            	</p>
	                            </s:if>
	                            <s:elseif test="#request.lessonScore.score'=='2'">
	                            	<p>
	                               	       课程评价：较差！不喜欢
	                            	</p>
	                            </s:elseif>
	                            <s:elseif test="#request.lessonScore.score=='3'">
	                            	<p>
	                               	       课程评价：还行！勉强可以听
	                            	</p>
	                            </s:elseif>
	                            <s:elseif test="#request.lessonScore.score=='4'">
	                            	<p>
	                               	       课程评价：推荐！不错，内容比较受用
	                            	</p>
	                            </s:elseif>
	                            <s:elseif test="#request.lessonScore.score=='5'">
	                            	<p>
	                               	       课程评价：力荐！非常棒，强力推荐！
	                            	</p>
	                            </s:elseif>-->
	                           
	                            <!--  <p>
	                               	课程评分：<s:property value='#list.score' />分
	                            </p>-->
	                            <p><s:property value="#list.content" /></p>
	                            <p class="peptime pswer"><s:property value="#list.time" /></p></span>
	                        </li>
						</s:iterator>

                    </ul>
				</div>
				</div>
                <%-- <div class="hide">
					<div>
                     <h3 class="pingjia">提问题</h3>
                    <div class="c_eform">
                        <input type="text" class="pingjia_con" value="请输入问题标题" onblur="if (this.value =='') this.value='请输入问题标题';this.className='pingjia_con'" onclick="if (this.value=='请输入问题标题') this.value='';this.className='pingjia_con_on'"/><br/>
                        <textarea rows="7" class="pingjia_con" onblur="if (this.value =='') this.value='请输入问题的详细内容';this.className='pingjia_con'" onclick="if (this.value=='请输入问题的详细内容') this.value='';this.className='pingjia_con_on'">请输入问题的详细内容</textarea>
                       <a href="#" class="fombtn">发布</a>
                       <div class="clearh"></div>
                    </div>
					<ul class="evalucourse">
                    	<li>
                        	<span class="pephead"><img src="images/0-0.JPG" width="50" title="候候">
							<p class="pepname">张三</p>                             
                            </span>
                            <span class="pepcont">
                            <p><a href="#" class="peptitle" target="_blank">面向对象是什么意思？</a></p>
                            <p class="peptime pswer"><span class="pepask">回答(<strong><a class="bluelink" href="#">10</a></strong>)&nbsp;&nbsp;&nbsp;&nbsp;浏览(<strong><a class="bluelink" href="#">10</a></strong>)</span>2015-01-02</p>                        
                            </span>
                        </li>
                        <li>
                        	<span class="pephead"><img src="images/0-0.JPG" width="50" title="候候">
							<p class="pepname">李四</p>                             
                            </span>
                            <span class="pepcont">
							<p><a href="#" class="peptitle" target="_blank">string，stringbuffer,stringbuilder的区别是什么</a></p>
                            <p class="peptime pswer"><span class="pepask">回答(<strong><a class="bluelink" href="#">10</a></strong>)&nbsp;&nbsp;&nbsp;&nbsp;浏览(<strong><a class="bluelink" href="#">10</a></strong>)</span>2015-01-02</p>                              
                            </span>
                        </li>                                 
                    </ul>
                    
				</div>
				</div> --%>
				<div class="hide">
					<div>
					<ul class="notelist" >
					<s:iterator value="#materia" var="list">
				       <li>
					   <p class="mbm mem_not"><a href="${pageContext.request.contextPath }/materiaAction_downloadFile.action?ids=<s:property value="#list.mid"/>" class="peptitle"><s:property value="#list.mname"/></a></p>
				       		<p class="gray"><b class="cotime">上传时间：<b class="coclass" ><s:property value="#list.mtime"/></b></b></p>
				            
				       </li>  
         			</s:iterator>                   
 					 </ul>
                    
				</div>
				</div>
				
			</div>
		</div>
   
</div>

<div class="courightext">
<div class="ctext">
    <div class="cr1">
    <h3 class="righttit">授课讲师</h3>
    <div class="teacher">
    <div class="teapic ppi">
    <a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/teacher.png" width="80" class="teapicy" title="张民智"></a>
     <h3 class="tname"><a href="${pageContext.request.contextPath }/enewmoc4/teacher.jsp" class="peptitle" target="_blank">张民智</a><p style="font-size:14px;color:#666">会计讲师</p></h3>
    </div>
    <div class="clearh"></div>
    <p>十年以上Linux从业经验， 培训经验超过八年。在各 个知名培训机构做过金牌 讲师、学科负责人，培训 学员过万人。曾获红帽认 证讲师，微软认证讲师等 资质认证。教学以逻辑性 强、教学细致、知识点准 确著称。</p>
    </div>
    </div>
</div>

<div class="ctext">
    <div class="cr1">
    <h3 class="righttit" onclick="reglog_open();">最新学员</h3>
        <div class="teacher zxxy">
        <ul class="stuul">
        <s:iterator value="#newstudent" var="list">
            <li><img src="${pageContext.request.contextPath }/enewmoc4/images/0-0.JPG" width="60" title="张三李四"><p class="stuname"><s:property value="#list.name"/></p></li>
        </s:iterator>
        </ul>
        <div class="clearh"></div>
        </div>
    </div>
</div>

<div class="ctext">
    <div class="cr1">
    <h3 class="righttit">相关课程</h3>
    <div class="teacher">
     <s:iterator value="#listlesson" var="list">
   		<div class="teapic"><a href="${pageContext.request.contextPath }/lessonAction_frontlist1.action?cid=<s:property value="#list.cid"/>"  target="_blank"><img src="${pageContext.request.contextPath }/enewmoc4/images/c1.jpg" height="60" title="<s:property value="#list.cname"/>"></a><h3 class="courh3"><a href="#" class="peptitle" target="_blank"><s:property value="#list.cname"/></a></h3> 
   		 </div>
    </s:iterator>
    <div class="clearh"></div>

    </div>
    </div>
</div>
   
</div>

<div id="reglog">
<span class="close"  onclick="reglog_close();">×</span>
<div class="loginbox">
    <div class="demo3 rlog">
			<ul class="tab_menu rlog">
				<li class="current">登录</li>
				<li>注册</li>
			</ul>
			<div class="tab_box">
				<div>
                <form class="loginform pop">
                <div>
                    <p class="formrow">
                    <label class="control-label pop" for="register_email">帐号</label>
                    <input type="text" class="popinput">
                    </p>
                    <span class="text-danger">请输入Email地址 / 用户昵称</span>
                </div>
                
                <div>
                    <p class="formrow">
                    <label class="control-label pop" for="register_email">密码</label>
                    <input type="password" class="popinput">
                    </p>
                    <p class="help-block"><span class="text-danger">密码错误</span></p>
                </div>
                <div class="clearh"></div>
                <div class="popbtn">
                    <label><input type="checkbox" checked="checked"> <span class="jzmm">记住密码</span> </label>&nbsp;&nbsp;
                    <button type="submit" class="uploadbtn ub1">登录</button>
                    
                </div>
                <div class="popbtn lb">
                   <a href="#" class="link-muted">还没有账号？立即免费注册</a>
                   <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>   
                   <a href="forgetpassword.html" class="link-muted">找回密码</a>
                </div>
              
                        
                        <div class="popbtn hezuologo">
                        <span class="hezuo z1">使用合作网站账号登录</span>
                        <div class="hezuoimg z1">
                        <img src="images/hezuoqq.png" class="hzqq" title="QQ" width="40" height="40">
                        <img src="images/hezuowb.png" class="hzwb" title="微博" width="40" height="40">
                        </div>
                        </div>
                </form>
				</div>
				<div class="hide">
					<div>
					<form class="loginform pop">
                     <div>
                        <p class="formrow">
                        <label class="control-label pop" for="register_email">邮箱地址</label>
                        <input type="text" class="popinput">
                        </p>
                        <span class="text-danger">请输入Email地址 / 用户昵称</span>
                    </div>
                	<div>
                        <p class="formrow">
                        <label class="control-label pop" for="register_email">昵称</label>
                        <input type="text" class="popinput">
                        </p>
                        <span class="text-danger">请输入Email地址 / 用户昵称</span>
                    </div>
                    <div>
                        <p class="formrow">
                        <label class="control-label pop" for="register_email">密码</label>
                        <input type="password" class="popinput">
                        </p>
                        <p class="help-block"><span class="text-danger">密码错误</span></p>
                    </div>
                    <div>
                        <p class="formrow">
                        <label class="control-label pop" for="register_email">确认密码</label>
                        <input type="password" class="popinput">
                        </p>
                        <p class="help-block"><span class="text-danger">密码错误</span></p>
                    </div>
                    
                    
                    <button type="submit" class="uploadbtn ub1">注册</button>
                   
                    
                
                </form>
                    
				</div>
				</div>
				
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
