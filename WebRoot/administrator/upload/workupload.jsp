<%@page import="com.dlpu.eva.service.WorkService"%>
<%@page import="hibernate.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Work upload</title>
    <%
	Object adminuser = session.getAttribute("adminuser");
	if (adminuser == null) {//防止非法入侵
		response.sendRedirect(basePath + "index.jsp");
		return;
	}
	%>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/mycss/showpage.css">
	<script src="<%=basePath%>ckeditor/ckeditor.js"></script>

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
            WorkService ws = new WorkService();
            Work w = new Work();
            String id;
            if (type.equals("n")) {
                action = basePath + "workupload.do";
            } else if (type.equals("c")) {
                id = request.getParameter("id");
                if (id == null) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                } else if (id.equals("")) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                }
                w = ws.GetWorkById(id);
                action = basePath + "workchange.do?id=" + id;
            }

        %>
	<form action="<%out.println(action);%>" method="post" onsubmit="return checkimg();" enctype="multipart/form-data">
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="1000px">
			<tr>
				<td align="left">
					<button class="btn-primary" disabled="disabled">发布专家工作：</button>
				</td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="thetitle" class="form-control" placeholder="请输入专家工作的标题" value="<%if (type.equals("c")){out.println(w.getWorktitle());}%>" required="true" /></td>
			</tr>
			<tr>
				<td align="center"><textarea id="mytext" name="mytext">
                            <%
                                if (type.equals("c")) {
                                    out.println(w.getWorkcontent());
                                } else {
                                    out.println("请输入工作内容");
                                }
                            %>
                        </textarea> <script>
                            CKEDITOR.replace("mytext", {
                                height: '400px',
                                width : '800px'
                            });
                        </script></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="确认发布" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
