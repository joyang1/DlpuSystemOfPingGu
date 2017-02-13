<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Change Admin Password</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<%
	Object adminuser = session.getAttribute("adminuser");
	if (adminuser == null) {//防止非法入侵
		response.sendRedirect(basePath + "index.jsp");
		return;
	}
	String admin = adminuser.toString();
%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/mycss/showpage.css">

</head>
<body>
	<form action="changepassword.do" method="post">
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="200px">
			<%
				String type = request.getParameter("type");
				if (type != null) {
					if (type.equals("pwd")) {
						out.println("<tr><td align=\"center\" style=\"font-color:red;\">两次密码不匹配</td></tr>");
					}
				}
			%>
			<tr>
				<td align="left">
					<button class="btn-primary" disabled="disabled">修改管理员密码：</button>
				</td>
			</tr>
			<tr>
				<td align="center">请输入原密码:</td>
			</tr>
			<tr>
				<td align="center"><input type="password" class="form-control" name="orgpwd" size="20"></td>
			</tr>
			<tr>
				<td align="center">请输入新密码:</td>
			</tr>
			<tr>
				<td align="center"><input type="password" class="form-control" name="pwd1" size="20"></td>
			</tr>
			<tr>
				<td align="center">请确认新密码:</td>
			</tr>
			<tr>
				<td align="center"><input type="password" class="form-control" name="pwd2" size="20"></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="确认发布" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
