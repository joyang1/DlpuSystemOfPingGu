<%@page import="com.dlpu.eva.service.QualityService"%>
<%@page import="hibernate.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Quality upload</title>
<%
	Object adminuser = session.getAttribute("adminuser");
	if (adminuser == null) {//防止非法入侵
		response.sendRedirect(basePath + "index.jsp");
		return;
	}
%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/mycss/showpage.css">

</head>

<body>
	<%
		String type = request.getParameter("type");
		if (type == null) {
			response.sendRedirect(basePath
					+ "administrator/reply.jsp?type=false");
			return;
		} else if (type.equals("")) {
			response.sendRedirect(basePath
					+ "administrator/reply.jsp?type=false");
			return;
		}
		String action = "";
		QualityService qs = new QualityService();
		Quality q = new Quality();
		String id;
		if (type.equals("n")) {
			action = basePath + "qualityupload.do";
		} else if (type.equals("c")) {
			id = request.getParameter("id");
			if (id == null) {
				response.sendRedirect(basePath
						+ "administrator/reply.jsp?type=false");
				return;
			} else if (id.equals("")) {
				response.sendRedirect(basePath
						+ "administrator/reply.jsp?type=false");
				return;
			}
			q = qs.GetQuaById(id);
			action = basePath + "qualitychange.do?id=" + id;
		}
	%>
	<form action="<%out.println(action);%>" method="post"
		enctype="multipart/form-data">
		<table border="0" width="80%" align="center" cellpadding="0"
			cellspacing="0" class="table table-hover" height="200px">
			<tr>
				<td align="left">
					<button class="btn-primary" disabled="disabled">发布质量报告：</button>
				</td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="quatitle"
					class="form-control" placeholder="请输入质量报告的标题"
					value="<%if (type.equals("c")) {
				out.println(q.getQuatitle());
			}%>"
					required="true" /></td>
			</tr>
			<tr>
				<td>
					<div
						style="width:100%; height:2px; border-top:1px solid #999; clear:both;"></div>
					<br /> <input type="text" size="20" name="filetitle" id=""
					filetitle" class="form-control" required="true"
					placeholder="请输入文件的标题"
					value="<%if (type.equals("c")) {
				out.println(q.getQuafilename());
			}%>" />
				</td>
			</tr>
			
			<tr>
				<td><select class="selectpicker" data-style="btn-primary" name="quatype"
					value="<%if (type.equals("c")) {
				out.println(q.getQuatype());
			}%>"
					required="true">
						<option value="0">本科教学质量报告</option>
						<option value="1">就业质量年度报告</option>
						<option value="2">艺术教育年度报告</option>
				</select></td>
			</tr>
			
			<tr>
				<td align="center"><b class="text-info">上传附件:</b> <input
					type="file" class="btn btn-primary" id="quafile" name="quafile" /></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="确认发布"
					class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
