<%@page import="hibernate.Downfile"%>
<%@page import="com.dlpu.eva.service.DownfileService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Downfile upload</title>
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
            DownfileService dfs = new DownfileService();
            Downfile df = new Downfile();
            String id;
            if (type.equals("n")) {
                action = basePath + "downfileupload.do";
            } else if (type.equals("c")) {
                id = request.getParameter("id");
                if (id == null) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                } else if (id.equals("")) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                }
                df = dfs.GetDownfileById(id);
                action = basePath + "downfilechange.do?id=" + id;
            }

        %>
	<form action="<%out.println(action);%>" method="post" onsubmit="return checkimg();" enctype="multipart/form-data">
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="200px">
			<tr>
				<td align="left">
					<button class="btn-primary" disabled="disabled">增加一个文件：</button>
				</td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="thetitle" class="form-control" placeholder="请输入文件的标题" value="<%if (type.equals("c")){out.println(df.getFilename());}%>" required="true" /></td>
			</tr>
			<tr>
				<td align="center"><b class="text-info">上传附件:</b> <input type="file" class="btn btn-primary" id="thefile" name="thefile"/></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="确认发布" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
