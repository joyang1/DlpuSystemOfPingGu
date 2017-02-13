<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dlpu.eva.service.PolicyService"%>
<%@ page import="hibernate.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>政策精神上传</title>
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
                response.sendRedirect(basePath + "administor/reply.jsp?type=false");
                return;
            } else if (type.equals("")) {
                response.sendRedirect(basePath + "administor/reply.jsp?type=false");
                return;
            }
            String action = "";
            PolicyService ps = new PolicyService();
            Policy p = new Policy();
            String id;

            if (type.equals("n")) {
                action = basePath + "policyup.do";//发布处理
            } else if (type.equals("c")) {
                id = request.getParameter("id");
                if (id == null) {
                    response.sendRedirect(basePath + "administor/reply.jsp?type=false");
                    return;
                } else if (id.equals("")) {
                    response.sendRedirect(basePath + "administor/reply.jsp?type=false");
                    return;
                }
                p = ps.GetPolicyById(id);
                action = basePath + "policychange.do?id=" + id;//修改处理
            }
        %>

        <form action="<%out.println(action);%>" method="post" enctype="multipart/form-data">
            <table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="1000px">
                <tr>
                    <td>
                        <button class="btn-primary" disabled="disabled">发布政策精神：</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" size="20" name="policytitle" class="form-control" placeholder="请输入政策精神的标题" value="<%if (type.equals("c")) {out.println(p.getPolicytitle());}%>" required="true"/>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <textarea id="mytext" name="mytext" >
                            <%
                                if (type.equals("c")) {
                                    out.println(p.getPolicycontent());
                                } else {
                                    out.println("请输入通知内容");
                                }
                            %>
                        </textarea>
                        <script>
                            CKEDITOR.replace("mytext", {
                                height: '400px',
                                width : '800px'
                            });
                        </script>
                    </td>
                </tr>
                <tr>
					<td>
						<div style="width:100%; height:2px; border-top:1px solid #999; clear:both;"></div>
						<br /> <input type="text" size="20" name="filetitle" id=""filetitle" class="form-control" placeholder="请输入文件的标题" value="<%if (type.equals("c")) {out.println(p.getPolicyfilename());}%>" />
					</td>
				</tr>
                <tr>
                    <td align="center">
                        <b class="text-info">上传附件:</b>
                        <input type="file" class="btn btn-primary" name="policyfile" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <input type="submit" value="确认发布"  class="btn btn-warning" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
