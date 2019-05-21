<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s2" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>试题添加页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><div align="center"> 
	 
		<strong><font color="#0000ff">录入试题</font><br></strong></div><br><hr>
		<form action="subjectAdd.action" method="post">
				<table border="0" cellspacing="10" cellpadding="0" align="center">
				  <tr>
					<td colspan="2"><FONT color="#ff0000"><s2:actionerror/></FONT></td>
				  </tr>
				  <tr>
					<td>试题题目:</td>
					<td><input type="text" name="subjectTitle" size="80" ></td>
				  </tr>
				  <tr>
					<td>选项A:</td>
					<td><input type="text" name="subjectOptionA" size="20" ></td>
				  </tr>
				   <tr>
					<td>选项B:</td>
					<td><input type="text" name="subjectOptionB" size="20" ></td>
				  </tr>
				   <tr>
					<td>选项C:</td>
					<td><input type="text" name="subjectOptionC" size="20" ></td>
				  </tr>
				   <tr>
					<td>选项D:</td>
					<td><input type="text" name="subjectOptionD" size="20" ></td>
				  </tr>
				   <tr>
					<td>答案:</td>
					<td>
						<input name="subjectAnswer" type="radio" value="A" checked>A
						<input name="subjectAnswer" type="radio" value="B">B
						<input name="subjectAnswer" type="radio" value="C">C
						<input name="subjectAnswer" type="radio" value="D">D
					</td>
				  </tr>
				  <tr>
					<td valign="top">试题解析:</td>
					<td>
						<textarea name="subjectParse" cols="76" rows="10"></textarea>
					</td>
				  </tr>
				  <tr>
				  	<td colspan="2"><div align="center">
				  	  <input type="submit" value="录入">				  	  
				  	  <input type="reset" value="重置">
			  	  </div>
				</td>
				  </tr>
			</table>
			</form>
  </body>
</html>
