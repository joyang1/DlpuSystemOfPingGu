<%@page import="hibernate.Bulletin"%>
<%@page import="com.dlpu.eva.service.BulletinService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    
    <title>bulletin upload</title>
    <%
		Object adminuser = session.getAttribute("adminuser");
		if (adminuser == null) {//防止非法入侵
			response.sendRedirect(basePath + "index.jsp");
			return;
	}
	%>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/mycss/showpage.css">

  </head>
  
  <body>
	<%
            String type = request.getParameter("type");
            if (type == null) {
                response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                return;
            } else if (type.equals("")) {
                response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                return;
            }
            String action = "";
            BulletinService bs = new BulletinService();
            Bulletin b = new Bulletin();
            String id;
            if (type.equals("n")) {
                action = basePath + "bulletinupload.do";
            } else if (type.equals("c")) {
                id = request.getParameter("id");
                if (id == null) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                } else if (id.equals("")) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                }
                b = bs.GetBulletinById(id);
                action = basePath + "bulletinchange.do?id=" + id;
            }

        %>
	<form action="<%out.println(action);%>" method="post" onsubmit="return checkimg();" enctype="multipart/form-data">
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="200px">
			<tr>
				<td align="left">
					<button class="btn-primary" disabled="disabled">发布评估简报：</button>
				</td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="thetitle" class="form-control" placeholder="请输入评估简报的标题" value="<%if (type.equals("c")){out.println(b.getBulletintitle());}%>" required="true" /></td>
			</tr>
			<tr>
				<td>
					<div style="width:100%; height:2px; border-top:1px solid #999; clear:both;"></div>
					<br /> <input type="text" size="20" name="filetitle" id="filetitle" required="true" class="form-control" placeholder="请输入文件的标题" value="<%if (type.equals("c")) {out.println(b.getBulletinfilename());}%>" />
				</td>
			</tr>
			<tr>
				<td align="center"><b class="text-info">上传附件:</b> <input type="file" class="btn btn-primary" id="thefile" name="thefile" /></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="确认发布" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
