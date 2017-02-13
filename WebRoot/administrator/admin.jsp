<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dlpu.eva.global.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>本科教学工作审核评估管理系统</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script language="javascript" src="<%=basePath%>js/tool/iframeh.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">

</head>

<body bgcolor="#CCCCCC">
	<table border="0" width="95%" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
		<tr>
			<td>
				<%
					Object adminuser = session.getAttribute("adminuser");
					if (adminuser == null) {
						response.sendRedirect(basePath + "index.jsp");
						return;
					}
				%>
				<h1 align="center" style="color:black">
					<b>本科教学工作审核评估管理系统</b>
					<%
						out.println("<i style=\"font-size:14px;color:black;\">");
						out.println("管理员：" + adminuser.toString());
						out.println("[<a href=\"" + basePath + "logout.do\">注销</a>]");
						out.println("</i>");
					%>
				</h1>
				<div style="width:100%; height:2px; border-top:1px solid #999; clear:both;"></div>
			</td>
		</tr>
		<tr>
			<td>
				<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0" class="table">
					<tr>
						<td align="center" valign="top" width="22%">
							<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0" class="table-bordered">
								<tr>
                                   <td align="center">
                                       	新闻
                                   </td>
                               </tr>
								<tr>
									<td align="center"><a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.T_NEWS);%>&p=1" target="content" class="btn btn-info" style="width:100%;">新闻管理</a></td>
								</tr>
									<tr>
                                        <td align="center">
                                           	 通知：
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_NOTICE1);%>&p=1" target="content" class="btn btn-info" style="width:100%;">工作通知管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_NOTICE2);%>&p=1" target="content" class="btn btn-info" style="width:100%;">会议通知管理</a>
                                        </td>
                                    </tr>    
                                    <tr>
                                        <td align="center">
                                           	 报告、文件
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_POLICY);%>&p=1" target="content" class="btn btn-info" style="width:100%;">政策精神管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_QUA);%>&p=1" target="content" class="btn btn-info" style="width:100%;">质量报告管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_SC_F);%>&p=1" target="content" class="btn btn-info" style="width:100%;">学校文件管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_EVA);%>&p=1" target="content" class="btn btn-info" style="width:100%;">专业评估管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_BULLETIN);%>&p=1" target="content" class="btn btn-info" style="width:100%;">评估简报管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_MYEVA);%>&p=1" target="content" class="btn btn-info" style="width:100%;">自评报告管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                           	 专家工作
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_WORK);%>&p=1" target="content" class="btn btn-info" style="width:100%;">专家工作管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                           	 其他
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_DATASYSTEM);%>&p=1" target="content" class="btn btn-info" style="width:100%;">教学基本状态数据库</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_DOWNFILE);%>&p=1" target="content" class="btn btn-info" style="width:100%;">文件下载管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.L_MATERIAL);%>&p=1" target="content" class="btn btn-info" style="width:100%;">支撑材料管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/upload/uploadtissue.jsp" target="content" class="btn btn-info" style="width:100%;">组织机构管理</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <a href="<%=basePath%>administrator/upload/changepassword.jsp" target="content" class="btn btn-info" style="width:100%;">修改管理员密码</a>
                                        </td>
                                    </tr>
							</table>
						</td>
						<td align="center" valign="top" width="78%"><iframe name="content" frameborder="0" src="<%=basePath%>administrator/showpage.jsp?type=<%out.println(Global.T_NEWS);%>&p=1" width="100%" scrolling="no" marginheight="0" marginwidth="0" id="showpage" onload="javascript:IFrameReSize('showpage');"></iframe></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
