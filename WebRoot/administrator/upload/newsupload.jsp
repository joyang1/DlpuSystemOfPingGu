<%@page import="com.dlpu.eva.global.Global"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dlpu.eva.service.*"%>
<%@ page import="hibernate.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>新闻上传</title>

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
<script>
	function checkimg() {
		var t = document.getElementById("imgtitle").value;
		if (t !== "") {//如果填写了图片标题，则需要上传图片
			var f = document.getElementById("imgfile").value;
			if (f === "") {
				alert("请上传图片");
				return false;
			} else {
				if (!/\.(gif|jpg|jpeg|png|bmp|tif|GIF|JPG|PNG|TIF|BMP)$/.test(f)) {
					alert("图片类型必须是.gif,jpeg,jpg,png,tif中的一种");
					return false;
				} else {
					return true;
				}
			}
		} else {
			return true;
		}
	}
</script>

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
            NewsService ns = new NewsService();
            News n = new News();
            String id;
            if (type.equals("n")) {
                action = basePath + "newsupload.do";
            } else if (type.equals("c")) {
                id = request.getParameter("id");
                if (id == null) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                } else if (id.equals("")) {
                    response.sendRedirect(basePath + "administrator/reply.jsp?type=false");
                    return;
                }
                n = ns.GetNewsById(id);
                action = basePath + "newschange.do?id=" + id;
            }

        %>
	<form action="<%out.println(action);%>" method="post" onsubmit="<%if(type.equals("n")){out.println("return checkimg();");}%>" enctype="multipart/form-data">
		<table border="0" width="80%" align="center" cellpadding="0" cellspacing="0" class="table table-hover" height="1000px">
			<tr>
				<td align="left">
					<button class="btn-primary" disabled="disabled">发布新闻：</button>
				</td>
			</tr>
			<tr>
				<td><input type="text" size="20" name="newstitle" class="form-control" placeholder="请输入新闻的标题" value="<%if (type.equals("c")){out.println(n.getNewstitle());}%>" required="true" /></td>
			</tr>
			<tr>
				<td align="center"><textarea id="mytext" name="mytext">
                            <%
                                if (type.equals("c")) {
                                    out.println(n.getNewscontent());
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
				<td>
					<div style="width:100%; height:2px; border-top:1px solid #999; clear:both;"></div>
					<br /> <input type="text" maxlength="20" name="imgtitle" id="imgtitle" class="form-control" placeholder="请输入相片的标题" value="<%if (type.equals("c")) {
                                out.println(n.getNewsfiletitle());
                            }%>" />
				</td>
			</tr>
			<tr>
				<td align="center"><b class="text-info">上传相片:</b> <input type="file" class="btn btn-primary" id="imgfile" name="imgfile" accept="image/*" /></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="确认发布" class="btn btn-warning" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
