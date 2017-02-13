<%@page import="com.dlpu.eva.global.Global"%>
<%@page import="com.dlpu.eva.service.NoticeService"%>
<%@page import="hibernate.Noticefile"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

	<title>Notice file Change</title>
	<%
		Object adminuser = session.getAttribute("adminuser");
		if (adminuser == null) {//防止非法入侵
			response.sendRedirect(basePath + "index.jsp");
			return;
		}
	%>
	<script language="javascript" src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/mycss/showpage.css">

</head>

<body>
	<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="400px">
		<%
			Object getnoticeid = request.getSession().getAttribute("noticeid");
			if (getnoticeid == null) {
				response.sendRedirect(basePath + "index.jsp");
				return;
			} else {
				String noticeid = getnoticeid.toString();
				NoticeService ns = new NoticeService();
				ArrayList<Noticefile> nfs = ns.getOneNotice(noticeid).getNoticefiles();
				for (Noticefile nf : nfs) {
					out.println("<tr>");
					out.println("<td>");
					out.println("<a href=\"" + basePath + "evafile/" + Global.NOTICEFILE_STRING + "/" + nf.getNoticeurl() + "\">" + nf.getNoticetitle() + "</a>");
					out.println("</td>");
					out.println("<td align=\"center\">");
					out.println("<a href=\"" + basePath + "noticefiledel.do?id=" + nf.getNoticefileid() + "\" class=\"btn btn-danger\">删除</a>");
					out.println("</td>");
					out.println("</tr>");
				}
			}
		%>
		<tr>
			<td>
				<a href="<%=basePath %>administrator/upload/noticefileupload.jsp" class="btn btn-info">返回</a>
			</td>
		</tr>
	</table>
</body>
</html>
