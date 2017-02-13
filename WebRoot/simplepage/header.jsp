<%@page import="com.dlpu.eva.global.Global"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.dlpu.eva.time.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<title>网站顶部</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<link rel="Stylesheet" type="text/css" href="<%=basePath%>jquery-easyui-1.4/themes/icon.css" />
	<link rel="Stylesheet" type="text/css" href="<%=basePath%>jquery-easyui-1.4/themes/default/easyui.css" />
	<script type="text/javascript" src="<%=basePath%>jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<style type="text/css">
	a:link {
		color: #FFF;
		text-decoration: none;
	}
	
	a:hover {
		color: #FFF;
		text-decoration: none;
	}
	
	a:visited {
		text-decoration: none;
		color: #FFF;
	}
	
	a:active {
		text-decoration: none;
		color: #C00;
	}
	
	.navmemu {
	 COLOR: #ffffff;
	}
	.navmemu A {
		 COLOR: #ffffff; FONT-SIZE: 15px; FONT-WEIGHT: bold; TEXT-DECORATION: none;PADDING-LEFT: 20px;PADDING-right: 20px
	}
	.navmemu :hover {
		COLOR: red
	}
	
	</style>

</head>

<body>
	<!-- 嵌入搜索栏、日期和标题图片 -->
	<table border="0" width="100%" align="center" cellpadding="2px" cellspacing="0">
		<tr>
			<td align="center">
				<form action="content/search.jsp" target="_parent" method="post" name="mysearch" style="margin:0px;">
					<b style="font-size:12px">站内搜索：</b>
					<input class="easyui-searchbox" type="text" name="word"/> 
					<input class="easyui-linkbutton" type="submit" value="搜索" id="find" />
				</form>
			</td>
			<td align="center" style="font-size:12px">
				<%
					GetSystemTime gst = new GetSystemTime();
					out.println("<b>当前时间：" + gst.GetDate() + "</b>&nbsp;&nbsp;&nbsp;&nbsp;");
				%>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<!--
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="950px" height="150px">
                        <param name="movie" value="../img/headlogo.swf" />
                        <param name="quality" value="high" />
                        <param name="wmode" value="transparent" />
                        <embed src="../img/headlogo.swf" width="950px" height="150px" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
                    </object>
                    --> <img src="<%=basePath%>img/title.jpg" width="980px" height="150px" />
				<div style="width:100%; height:2px; border-top:1px solid #999; clear:both;"></div>
			</td>
		</tr>
	</table>
	<!-- 嵌入搜索栏、日期和标题图片End -->
	<!-- 嵌入导航菜单 -->
	<table id="leader_menue" width="100%" border="0" cellpadding="0" height="30" cellspacing="0" background="<%=basePath%>img/leaderbg.gif" align="center">
		<tr>
			<td valign="middle" align="center" class="navmemu" style="color: white" >
				<a href="<%=basePath%>index.jsp" target="_parent">首 页</a> 
				|
				<a href="<%=basePath%>content/content.jsp?type=c&c=<%out.println(Global.T_TISSUE); %>&m=<%out.println(Global.L_TISSUE1); %>&id=1" target="_parent">组织机构</a> 
				|
				<a href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_NOTICE); %>&m=<%out.println(Global.L_NOTICE1); %>&p=1" target="_parent">重要通知</a>
				|
				<a href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_POLICY); %>&m=<%out.println(Global.L_POLICY); %>&p=1" target="_parent">政策精神</a> 
				|
				<a href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_EVA); %>&m=<%out.println(Global.L_EVA); %>&p=1" target="_parent">专业评估</a>
				|
				<a href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_DATASYSTEM); %>&m=<%out.println(Global.L_DATASYSTEM); %>&p=1" target="_parent">本科教学状态数据库</a>
				|
				<a href="<%=basePath%>content/content.jsp?type=l&c=<%out.println(Global.T_QUA); %>&m=<%out.println(Global.L_QUA); %>&p=1" target="_parent"> 质量报告 </a>
			</td>
		</tr>
	</table>
	<!-- 嵌入导航菜单End -->
</body>
</html>
