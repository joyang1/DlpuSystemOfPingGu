<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>大连工业大学教务处</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
   
  </head>
  
  <body>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
  <br/>
    <table border="0" class="table" align="center">
    <tr>
    	<td class="text-danger" align="center"  style="font-size:20px;">
    		<%
    			String error = request.getParameter("error");
    			if(error == null){
    				out.println("未知错误发生 请返回主页");
    			}else if(error.equals("404")){
    				out.print("<b>404</b><br/>您要访问的页面不存在<br/>可能是已被管理员删除<br/>可能是复制的链接地址不正确，请检查");
    			}else if(error.equals("500")){
    				out.println("<b>500</b><br/>抱歉，当前服务器发生了一点小问题，请稍候再试");
    			}else if(error.equals("no")){
    				out.println("您访问的页面出现了问题，原因可能如下：<br/>1.访问的文章内容不存在或已被删除<br/>2.远程数据库发生故障，请联系管理员<br/>");
    			}
    		 %>
    	</td>
    </tr>
    <tr>
    	<td align="center">
    		<a href="<%=basePath%>index.jsp" target="_parent" class="btn btn-success">返回主页</a>
    	</td>
    </tr>
    </table>
    
  </body>
</html>
