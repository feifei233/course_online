<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Java语言基础在线学习平台</title>
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery-1.8.0.min.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/mine.js"></script>
<script src="${pageContext.request.contextPath }/enewmoc4/js/jquery.tabs.js"></script>
  		<!-- video.js must be in the <head> for older IEs to work. -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/video-js.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/course.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/enewmoc4/css/tab.css" media="screen">
<script src="${pageContext.request.contextPath }/enewmoc4/video.js"></script>
    
      <!-- Unless using the CDN hosted version, update the URL to the Flash SWF -->
      <script>
        videojs.options.flash.swf = "${pageContext.request.contextPath }/enewmoc4/video-js.swf";
		
      </script>
      <script type="text/javascript">
$(function(){

	$('.demo2').Tabs({
		event:'click'
	});

	var a = document.getElementById("filename").value;
	alert(a);
});
</script>
      <style>
      body { overflow:hidden;
	  		 scrollbar-base-color:#fff;
			 scrollbar-arrow-color:#fff; /*三角箭头的颜色*/
			 scrollbar-face-color: #333; /*立体滚动条的颜色（包括箭头部分的背景色）*/
			 scrollbar-3dlight-color: #fff; /*立体滚动条亮边的颜色*/
			 scrollbar-highlight-color: #fff; /*滚动条的高亮颜色（左阴影？）*/
			 scrollbar-shadow-color: #fff; /*立体滚动条阴影的颜色*/
			 scrollbar-darkshadow-color:#fff; /*立体滚动条外阴影的颜色*/
			 scrollbar-track-color: #fff; /*立体滚动条背景颜色*/
			 
			 
			
	  }
	   /* 设置滚动条的样式 */
			::-webkit-scrollbar {
				width: 10px;
			}
			/* 滚动槽 */
			::-webkit-scrollbar-track {
				border-radius:0
			}
			/* 滚动条滑块 */
			::-webkit-scrollbar-thumb {
				background: #333;
				
			}
			::-webkit-scrollbar-thumb:window-inactive {
				background: rgba(255,0,0,0.4);
			}
      </style>
</head>

<body>
   <div class="linevideo" style="overflow-x:hidden">
    	<span class="returnindex"><a class="gray" href="javascript:history.go(-1);" style="font-size:14px;">返回课程</a></span>   
        <span class="taskspan"><span class="ts"></span>&nbsp;&nbsp;<b class="tasktit"></b></span> 
        <div style="width:100%;margin-top:20px;">
			<video width="auto" id="example_video_1" class="video-js vjs-default-skin  vjs-big-play-centered vvi " controls preload="none"  poster="images/c8.jpg" data-setup="{}"><!--poster是视频未播放前的展示图片-->
			<source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4' />
			<source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
			<source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />    
			</video>
			<p class="signp"><span class="sign">学过了</span><span class="nextcourse" title="下一课时">∨</span></p>
        </div>       
    </div>    
  <div class="interact">
   		<span class="ii" title="展开或收起">></span>
        <div class="clearh"></div>
  
          <div class="box1 demo2">
			<ul class="tab_menu vmulu">
				<li class="current">目录</li>
				<li>笔记</li>
            </ul>
			<div class="tab_box tabcard">
				<div style="padding-bottom:30px;">
					<dl class="mulu noo1">
                        <s:iterator value="#vedio" var="list">
                       	 <a href="${pageContext.request.contextPath }/vedio/<s:property value="#list.vfilename"/>.mp4"><dd><i class="forwa nn"></i><strong class="cataloglink"><s:property value="#list.vname"/></strong></dd></a>
                   		<input type="hidden" name="filename" value="<s:property value="#list.vfilename"/>"/>
                   		
                   		</s:iterator>
                   </dl>
				   <div class="clearh"></div>
				</div>
				
				<div class="hide">
					<div style="padding-left:25px;">
                    <div class="c_eform" style="width:200px;margin-left:10px;">
                        <div class="clearh" ></div>
                        <textarea rows="7" class="pingjia_con" style="width:200px;height:500px;" onblur="if (this.value =='') this.value='记下课程笔记';this.className='pingjia_con'" onclick="if (this.value=='记下课程笔记') this.value='';this.className='pingjia_con_on'">记下课程笔记</textarea>
                       <a href="#" class="fombtn">提交</a>
                       <div class="clearh"></div>
                    </div>					
				</div>
				</div>
				</div>
				</div>				
			</div>
		</div> 
    </div>
</body>
</html>
