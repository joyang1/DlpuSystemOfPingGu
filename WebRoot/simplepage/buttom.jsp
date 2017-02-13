<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'buttom.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
a:link {
	color: #666;
	text-decoration: none;
}

a:hover {
	color: #666;
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: #666;
}

a:active {
	text-decoration: none;
	color: #666;
}
</style>

</head>

<body>
	<table align="center">
		<tr>
			<td align="center" style="font-size: 13px;color:66C">
					地址：大连市甘井子区轻工苑１号 邮编：116034<br/>
                                                                   电话：0411-86323602<br/>
                            © 大连工业大学 版权所有 &nbsp;
<a href="<%=basePath%>loging/loginpage.jsp" target="_blank"><b>[管理登录]</b></a>
			</td>
		</tr>
	</table>
</body>
</html>
