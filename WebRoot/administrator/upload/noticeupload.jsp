<%@page import="com.dlpu.eva.global.Global"%>
<%@page import="com.dlpu.eva.common.OneNotice"%>
<%@page import="com.dlpu.eva.service.NoticeService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="hibernate.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通知内容上传</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
            NoticeService ns = new NoticeService();
            Notice n = new Notice();
            ArrayList<Noticefile> nfs = new ArrayList<Noticefile>();
            String id;
            String e;
            String t = request.getParameter("t");
            
            e = request.getParameter("e");
            if(e == null){
            	e = "1";
            }
            
            if (type.equals("n")) {
            	if(t.equals("1")){
            		action = basePath + "noticeupload.do?type=1&e=" + e;
            	}else if(t.equals("2")){
            		action = basePath + "noticeupload.do?type=2&e=" + e;
            	}
                
            } else if (type.equals("c")) {
                id = request.getParameter("id");
                if (id == null) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                } else if (id.equals("")) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                }
                OneNotice on = ns.getOneNotice(id);
                n = on.getNotice();
                nfs = on.getNoticefiles();
                action = basePath + "noticechange.do?id=" + id +"&e=" + e;
            }

        %>
	<form action="<%out.println(action);%>" method="post" >
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="1000px">
			<tr>
				<td align="left">
				<%
					if(e.equals("1")){
						out.println("<button class=\"btn-primary\" disabled=\"disabled\">发布通知：</button>");
					}else if(e.equals("2")){
						out.println("<b class=\"btn-warning\" disabled=\"disabled\">请确认发布的通知、请注意是否将附件粘贴链接粘贴至文章内部</b>");
					}	
				 %>
					
				</td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="noticetitle" class="form-control" placeholder="请输入通知的标题" value="<%if (type.equals("c")){out.println(n.getNoticetitle());}%>" required="true" /></td>
			</tr>
			<tr>
				<td align="center"><textarea id="noticeContent" name="mytext">
                            <%
                                if (type.equals("c")) {
                                    out.println(n.getNoticecontent());
                                } else {
                                    out.println("请输入通知内容");
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
				<td>
					下面是附件的超链接，请将它们复制到文本中：<br/>
					<%
						for(Noticefile nf : nfs){
							out.println("<a href=\"" + basePath + "evafile/" + Global.NOTICEFILE_STRING + "/" + nf.getNoticeurl() + "\">" + nf.getNoticetitle() +"</a>");
							out.println("<br/>");
						}
					%>
				</td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="下一步" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
