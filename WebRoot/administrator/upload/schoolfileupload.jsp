<%@page import="com.dlpu.eva.service.SchoolfileService"%>
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
    
    <title>Schoolfile Upload</title>
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
	<script src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>

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
            SchoolfileService ss = new SchoolfileService();
            Schoolfile s = new Schoolfile();
            String id;
            if (type.equals("n")) {
                action = basePath + "schoolfileupload.do";
            } else if (type.equals("c")) {
                id = request.getParameter("id");
                if (id == null) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                } else if (id.equals("")) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                }
                s = ss.GetSchoolfileById(id);
                action = basePath + "schoolfilechange.do?id=" + id;
            }

        %>
	<form action="<%out.println(action);%>" method="post" enctype="multipart/form-data">
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="1100px">
		
			
			<tr>
				<td align="left">
					<button class="btn-primary" disabled="disabled">发布学校文件：</button>
				</td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="thenumber" class="form-control" placeholder="请输入学校文件的编号" value="<%if (type.equals("c")){out.println(s.getFilenumber());}%>" required="true" /></td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="thetitle" class="form-control" placeholder="请输入学校文件的标题" value="<%if (type.equals("c")){out.println(s.getFiletitle());}%>" required="true" /></td>
			</tr>
			<tr>
				<td>
					<div style="width:100%; height:2px; border-top:1px solid #999; clear:both;"></div>
					<br /> <input type="text" size="20" name="filetitle" id=""filetitle" required="true" class="form-control" placeholder="请输入文件的标题" value="<%if (type.equals("c")) {out.println(s.getFilename());}%>" />
				</td>
			</tr>
			<tr>
				<td>日期:<input class="Wdate" name="thedate" type="text" onClick="WdatePicker()" value="<%if (type.equals("c")){out.println(s.getFiledate());}%>"></td>
				
			</tr>
			<tr>
				<td align="center"><textarea id="mytext" name="mytext">
                            <%
                                if (type.equals("c")) {
                                    out.println(s.getFilecontent());
                                } else {
                                    out.println("请输入新闻内容");
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
				<td align="center"><b class="text-info">上传附件:</b> <input type="file" class="btn btn-primary" id="thefile" name="thefile"/></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="确认发布" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
