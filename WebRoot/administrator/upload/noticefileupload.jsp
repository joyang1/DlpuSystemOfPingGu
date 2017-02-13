<%@page import="hibernate.Noticefile"%>
<%@page import="com.dlpu.eva.common.OneNotice"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dlpu.eva.service.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>通知附件上传</title>
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
	<%
		String getType = request.getParameter("type");
		boolean f = false;
		if (getType != null) {
			if (getType.equals("true")) {
				f = true;
			}
		}
	%>
	<form action="noticefileup.do" method="post" enctype="multipart/form-data" name="form_upload">
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="200px">
			<tr>
				<td align="left" width="100%">
					<button class="btn-primary" disabled="disabled">上传通知附件：</button>
				</td>
			</tr>
			<%
				if (f) {
					out.println("<tr><td align=\"center\">文件上传成功</td></tr>");
				}
			%>
			<tr>
				<td>
					<div style="width:100%; height:2px; border-top:1px solid #999; clear:both;"></div> <br /> <input type="text" size="20" name="filetitle" id="" filetitle" required="true" class="form-control" placeholder="请输入文件的标题" />
				</td>
			</tr>
			<tr>
				<td align="center"><b class="text-info">上传附件:</b> <input type="file" class="btn btn-primary" id="thefile" name="thefile" required="true" /></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="上传一个" class="btn btn-warning" /></td>
			</tr>
			<tr>
				<td><a href="<%=basePath %>administrator/upload/noticefilechange.jsp" class="btn btn-info">附件管理</a></td>
			</tr>
			<tr>
				<%
					Object nid = request.getSession().getAttribute("noticeid");
					String noticeid = "";
					if(nid != null){
						noticeid = nid.toString();
					}
				 %>
				<td align="right" width="100%"><a href="<%=basePath %>administrator/upload/noticeupload.jsp?type=c&id=<%=noticeid%>&e=2" class="btn btn-warning">下一步</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
