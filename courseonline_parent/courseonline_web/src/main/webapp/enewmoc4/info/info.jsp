<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户信息</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/enewmoc4/info/css/demo.css" />

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/enewmoc4/info/css/style.css" />

</head>
<body>

	
	<div class="af-wrapper">
		<h3>个人信息</h3>
		
		
		<form class="af-form" id="af-form" action=""  method="post" novalidate>
			
		
			<div class="af-outer af-required">
				<div class="af-inner">
					<label for="input-name">姓名</label>
					<input type="text" name="name" id="input-name"  value="<s:property value="#session.studentInfo.name"/>" required>
				</div>
			</div>
			<div class="af-outer af-required">
				<div class="af-inner">
					<label for="input-profession">专业</label>
					<input type="text" name="profession" id="input-profession" value="<s:property value="#session.studentInfo.profession"/>"  required>
				</div>
			</div>
			<div class="af-outer af-required">
				<div class="af-inner">
					<label for="input-sex">性别</label>
					<input type="text" name="sex" id="input-sex" value="<s:property value="#session.studentInfo.sex"/>" readonly="true"  required>
				</div>
			</div>
			
			<div class="af-outer">
				<div class="af-inner">
					<label for="input-bdate">出生日期</label>
					<input type="date" name="birthday" id="input-bdate" placeholder="YYYY-MM-DD" value="<s:property value="#session.studentInfo.birthday"/>">
				</div>
			</div>
			
			<div class="af-outer af-required">
				<div class="af-inner">
				  <label for="input-country">城市</label>
				  <input type="email" name="address" id="input-country" value="<s:property value="#session.studentInfo.address"/>" required>
				</div>
			</div>
			<div class="af-outer af-required">
				<div class="af-inner">
				  <label for="input-email">邮箱:</label>
				  <input type="email" name="email" id="input-email" value="<s:property value="#session.studentInfo.email"/>" required>
				</div>
			</div>
			
			
			<div class="af-outer">
				<div class="af-inner">
				  <label for="input-phone">手机</label>
				  <input type="email" name="tel" id="input-phone" value="<s:property value="#session.studentInfo.tel"/>">
				</div>
			</div>
			
			
			
		</form>
	</div>

</body>
</html>