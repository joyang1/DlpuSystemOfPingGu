<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>大连工业大学 本科教学工作审核评估管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<!-- jquery easyui -->
<link rel="Stylesheet" type="text/css" href="<%=basePath%>jquery-easyui-1.4/themes/icon.css" />
<link rel="Stylesheet" type="text/css" href="<%=basePath%>jquery-easyui-1.4/themes/default/easyui.css" />
<script type="text/javascript" src="<%=basePath%>jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jquery-easyui-1.4/jquery.easyui.min.js"></script>
<!-- jquery easyui End -->
<script language="javascript" src="<%=basePath%>js/tool/adminlogin.js"></script>
</head>

<body>
	<br />
	<br />
	<br />
	<form action="<%=basePath%>login.do" method="post" id="adminform">
		<table border="0" align="center" cellpadding="0" cellspacing="0">
			<%
				String error = request.getParameter("error");
				if (error != null && error.equals("true")) {
					out.println("<tr><td align=\"center\" colspan=\"2\">温馨提示：<b>用户名或密码错误</b></td></tr>");
				}
			%>
			<tr>
				<td align="center" colspan="2" bgcolor="#e0f0f9"><b>本科教学工作审核评估管理系统</b></td>
			</tr>
			<tr>
				<td><img src="<%=basePath%>img/jw.JPG" alt="大连工业大学教务处" /></td>
				<td align="center">
					<table border="0" width="300px" height="125px">
						<tr>
							<td align="center">用户名：<input type="text" name="username" class="easyui-textbox" required="true" maxlength="20">
							</td>
						</tr>
						<tr>
							<td align="center">密码&nbsp;&nbsp;：<input type="password" name="password" class="easyui-textbox" required="true" maxlength="20">
							</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#F4F6FC"><input type="button" value="主页" id="mainpage" class="easyui-linkbutton"> &nbsp;&nbsp; <input type="button" value="重置" id="refesh" class="easyui-linkbutton"> &nbsp;&nbsp; <input type="submit" value="登录" class="easyui-linkbutton" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
