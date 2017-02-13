<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'reply.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/mycss/showpage.css">

</head>

<body>
	<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table">
		<tr>
			<td align="center" valign="top">
				<%
					String type = request.getParameter("type");
					if (type != null) {
						if (type.equals("true")) {
							out.println("<b class=\"text-success\">操作成功</b>");
						} else if (type.equals("false")) {
							out.println("<b class=\"text-danger\">操作失败 请重试</b>");
						}
					}
				%>
			</td>
		</tr>
	</table>
</body>
</html>
