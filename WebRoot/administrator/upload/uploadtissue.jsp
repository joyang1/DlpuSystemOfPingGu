<%@page import="hibernate.Tissue"%>
<%@page import="com.dlpu.eva.service.TissueService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Tissue Upload</title>
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
            TissueService ts = new TissueService();
            Tissue t1 = ts.getTissue1();
            Tissue t2 = ts.getTissue2();
            Tissue t3 = ts.getTissue3();
        %>
	<form action="tissuechange.do" method="post" onsubmit="return checkimg();" enctype="multipart/form-data">
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="200px">
			<tr>
				<td align="left">
					<button class="btn-primary" disabled="disabled">修改组织机构：</button>
				</td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="thetitle1" class="form-control" placeholder="请输入标题1" value="<%out.println(t1.getTissuetitle());%>" required="true" /></td>
			</tr>
			<tr>
				<td align="center"><b class="text-info">上传对应照片:</b> <input type="file" class="btn btn-primary" name="thefile1" /></td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="thetitle2" class="form-control" placeholder="请输入标题2" value="<%out.println(t2.getTissuetitle());%>" required="true" /></td>
			</tr>
			<tr>
				<td align="center"><b class="text-info">上传对应照片:</b> <input type="file" class="btn btn-primary" name="thefile2" /></td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="thetitle3" class="form-control" placeholder="请输入标题3" value="<%out.println(t3.getTissuetitle());%>" required="true" /></td>
			</tr>
			<tr>
				<td align="center"><b class="text-info">上传对应照片:</b> <input type="file" class="btn btn-primary" name="thefile3"/></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="确认发布" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
